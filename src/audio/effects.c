#include <ultra64.h>
#include <macros.h>

#include "effects.h"
#include "load.h"
#include "data.h"
#include "seqplayer.h"

#ifdef VERSION_JP
#define US_FLOAT2(x) x##.0
#else
#define US_FLOAT2(x) x
#endif

#ifdef VERSION_EU
void sequence_channel_process_sound(struct SequenceChannel *seqChannel, s32 arg1) {
    f32 weight;
    s32 i;

    if (seqChannel->unk1.as_bitfields.unk0b40 || arg1) {
        weight = seqChannel->volume * seqChannel->volumeScale * seqChannel->seqPlayer->unkEu2C;
        if (seqChannel->seqPlayer->muted && (seqChannel->muteBehavior & MUTE_BEHAVIOR_SOFTEN) != 0) {
            weight = seqChannel->seqPlayer->muteVolumeScale * weight;
        }
        seqChannel->panChannelWeight = weight;
    }

    if (seqChannel->unk1.as_bitfields.unk0b20) {
        seqChannel->pan = seqChannel->unk9 * seqChannel->unkA;
    }

    for (i = 0; i < 4; ++i) {
        struct SequenceChannelLayer *layer = seqChannel->layers[i];
        if (layer && layer->enabled && layer->note) {
            if (layer->unkEu0b4) {
                layer->noteFreqScale = layer->freqScale * seqChannel->freqScale;
                layer->noteVelocity = layer->velocitySquare * seqChannel->panChannelWeight;
                layer->notePan = (seqChannel->pan + layer->euUnk5 * (0x80 - seqChannel->unkA)) >> 7;
                layer->unkEu0b4 = 0;
            } else {
                if (seqChannel->unk1.as_bitfields.unk0b80) {
                    layer->noteFreqScale = layer->freqScale * seqChannel->freqScale;
                }
                if (seqChannel->unk1.as_bitfields.unk0b40 || arg1) {
                    layer->noteVelocity = layer->velocitySquare * seqChannel->panChannelWeight;
                }
                if (seqChannel->unk1.as_bitfields.unk0b20) {
                    layer->notePan = (seqChannel->pan + layer->euUnk5 * (0x80 - seqChannel->unkA)) >> 7;
                }
            }
        }
    }
    seqChannel->unk1.as_u8 = 0;
}
#else
void func_80319E70(void) {
}
#endif

void sequence_player_process_sound(struct SequencePlayer *seqPlayer) {
    s32 i;

    if (seqPlayer->fadeTimer != 0) {
        seqPlayer->fadeVolume += seqPlayer->fadeVelocity;
#ifdef VERSION_EU
        seqPlayer->unk_eu = TRUE;
#endif

        if (seqPlayer->fadeVolume > US_FLOAT2(1)) {
            seqPlayer->fadeVolume = US_FLOAT2(1);
        }
        if (seqPlayer->fadeVolume < 0) {
            seqPlayer->fadeVolume = 0;
        }

        if (--seqPlayer->fadeTimer == 0) {
#ifdef VERSION_EU
            if (seqPlayer->state == 2) {
                sequence_player_disable(seqPlayer);
                return;
            }
#else
            switch (seqPlayer->state) {
                case SEQUENCE_PLAYER_STATE_FADE_OUT:
                    sequence_player_disable(seqPlayer);
                    return;

                case SEQUENCE_PLAYER_STATE_2:
                case SEQUENCE_PLAYER_STATE_3:
                    seqPlayer->state = SEQUENCE_PLAYER_STATE_0;
                    break;

                case SEQUENCE_PLAYER_STATE_4:
                    break;
            }
#endif
        }
    }

#ifdef VERSION_EU
    if (seqPlayer->unk_eu) {
        seqPlayer->unkEu2C = seqPlayer->fadeVolume * seqPlayer->unkEu28;
    }
#endif

    // Process channels
    for (i = 0; i < CHANNELS_MAX; i++) {
        if (IS_SEQUENCE_CHANNEL_VALID(seqPlayer->channels[i]) == TRUE
            && seqPlayer->channels[i]->enabled == TRUE) {
#ifdef VERSION_EU
            sequence_channel_process_sound(seqPlayer->channels[i], seqPlayer->unk_eu);
#else
            f32 channelVolume;
            f32 panLayerWeight;
            f32 panFromChannel;
            s32 layerIndex;
            struct SequenceChannel *seqChannel = seqPlayer->channels[i];

            channelVolume =
                seqChannel->seqPlayer->fadeVolume * (seqChannel->volume * seqChannel->volumeScale);
            if (seqChannel->seqPlayer->muted && (seqChannel->muteBehavior & MUTE_BEHAVIOR_SOFTEN) != 0) {
                channelVolume *= seqChannel->seqPlayer->muteVolumeScale;
            }

            panFromChannel = seqChannel->panChannelWeight * seqChannel->pan;
            panLayerWeight = US_FLOAT(1.0) - seqChannel->panChannelWeight;

            for (layerIndex = 0; layerIndex < 4; layerIndex++) {
                struct SequenceChannelLayer *seqLayer = seqChannel->layers[layerIndex];
                if (seqLayer != NULL && seqLayer->enabled && seqLayer->note != NULL) {
                    seqLayer->noteFreqScale = seqChannel->freqScale * seqLayer->freqScale;
                    seqLayer->noteVelocity = seqLayer->velocitySquare * channelVolume;
                    seqLayer->notePan = (seqLayer->pan * panLayerWeight) + panFromChannel;
                }
            }
#endif
        }
    }

#ifdef VERSION_EU
    seqPlayer->unk_eu = FALSE;
#endif
}

f32 get_portamento_freq_scale(struct Portamento *p) {
    u32 v0;
    f32 result;
#ifndef VERSION_EU
    if (p->mode == 0) {
        return 1.0f;
    }
#endif

    p->cur += p->speed;
    v0 = (u32) p->cur;

#ifdef VERSION_EU
    if (v0 > 127)
#else
    if (v0 >= 127)
#endif
    {
        v0 = 127;
    }

#ifdef VERSION_EU
    result = US_FLOAT(1.0) + p->extent * (gPitchBendFrequencyScale[v0 + 128] - US_FLOAT(1.0));
#else
    result = US_FLOAT(1.0) + p->extent * (gPitchBendFrequencyScale[v0 + 127] - US_FLOAT(1.0));
#endif
    return result;
}

#ifdef VERSION_EU
s16 get_vibrato_pitch_change(struct VibratoState *vib) {
    s32 index;
    vib->time += (s32) vib->rate;
    index = (vib->time >> 10) & 0x3F;
    return vib->curve[index] >> 8;
}
#else
s8 get_vibrato_pitch_change(struct VibratoState *vib) {
    s32 index;
    vib->time += vib->rate;

    index = (vib->time >> 10) & 0x3F;

    switch (index & 0x30) {
        case 0x10:
            index = 31 - index;

        case 0x00:
            return vib->curve[index];

        case 0x20:
            index -= 0x20;
            break;

        case 0x30:
            index = 63 - index;
            break;
    }

    return -vib->curve[index];
}
#endif

f32 get_vibrato_freq_scale(struct VibratoState *vib) {
    s32 pitchChange;
    f32 extent;
    f32 result;

    if (vib->delay != 0) {
        vib->delay--;
        return 1;
    }

    if (vib->extentChangeTimer) {
        if (vib->extentChangeTimer == 1) {
            vib->extent = (s32) vib->seqChannel->vibratoExtentTarget;
        } else {
            vib->extent +=
                ((s32) vib->seqChannel->vibratoExtentTarget - vib->extent) / (s32) vib->extentChangeTimer;
        }

        vib->extentChangeTimer--;
#ifdef VERSION_EU
    } else if ((s32) vib->extent != (*vib).seqChannel->vibratoExtentTarget) {
        if ((vib->extentChangeTimer = vib->seqChannel->vibratoExtentChangeDelay) == 0) {
            vib->extent = (s32) vib->seqChannel->vibratoExtentTarget;
        }
#else
    } else if ((s32) vib->extent != vib->seqChannel->vibratoExtentTarget) {
        vib->extentChangeTimer = vib->seqChannel->vibratoExtentChangeDelay;
        if (vib->extentChangeTimer == 0) {
            vib->extent = (s32) vib->seqChannel->vibratoExtentTarget;
        }
#endif
    }

    if (vib->rateChangeTimer) {
        if (vib->rateChangeTimer == 1) {
            vib->rate = (s32) vib->seqChannel->vibratoRateTarget;
        } else {
            vib->rate += ((s32) vib->seqChannel->vibratoRateTarget - vib->rate) / (s32) vib->rateChangeTimer;
        }

        vib->rateChangeTimer--;
#ifdef VERSION_EU
    } else if ((s32) vib->rate != (*vib).seqChannel->vibratoRateTarget) {
        if ((vib->rateChangeTimer = vib->seqChannel->vibratoRateChangeDelay) == 0) {
            vib->rate = (s32) vib->seqChannel->vibratoRateTarget;
        }
#else
    } else if ((s32) vib->rate != vib->seqChannel->vibratoRateTarget) {
        vib->rateChangeTimer = vib->seqChannel->vibratoRateChangeDelay;
        if (vib->rateChangeTimer == 0) {
            vib->rate = (s32) vib->seqChannel->vibratoRateTarget;
        }
#endif
    }

    if (vib->extent == 0) {
        return 1.0f;
    }

    pitchChange = get_vibrato_pitch_change(vib);
    extent = (f32) vib->extent / US_FLOAT(4096.0);

#ifdef VERSION_EU
    result = US_FLOAT(1.0) + extent * (gPitchBendFrequencyScale[pitchChange + 128] - US_FLOAT(1.0));
#else
    result = US_FLOAT(1.0) + extent * (gPitchBendFrequencyScale[pitchChange + 127] - US_FLOAT(1.0));
#endif
    return result;
}

void note_vibrato_update(struct Note *note) {
#ifdef VERSION_EU
    if (note->portamento.mode != 0) {
        note->portamentoFreqScale = get_portamento_freq_scale(&note->portamento);
    }
    if (note->vibratoState.active && note->parentLayer != NO_LAYER) {
        note->vibratoFreqScale = get_vibrato_freq_scale(&note->vibratoState);
    }
#else
    if (note->vibratoState.active) {
        note->portamentoFreqScale = get_portamento_freq_scale(&note->portamento);
        if (note->parentLayer != NO_LAYER) {
            note->vibratoFreqScale = get_vibrato_freq_scale(&note->vibratoState);
        }
    }
#endif
}

void note_vibrato_init(struct Note *note) {
    struct VibratoState *vib;
    UNUSED struct SequenceChannel *seqChannel;
#ifdef VERSION_EU
    struct NotePlaybackState *seqPlayerState = (struct NotePlaybackState *) &note->priority;
#endif

    note->vibratoFreqScale = 1.0f;
    note->portamentoFreqScale = 1.0f;

    vib = &note->vibratoState;

#ifndef VERSION_EU
    if (note->parentLayer->seqChannel->vibratoExtentStart == 0
        && note->parentLayer->seqChannel->vibratoExtentTarget == 0
        && note->parentLayer->portamento.mode == 0) {
        vib->active = FALSE;
        return;
    }
#endif

    vib->active = TRUE;
    vib->time = 0;

#ifdef VERSION_EU
    vib->curve = gWaveSamples[2];
    vib->seqChannel = note->parentLayer->seqChannel;
    if ((vib->extentChangeTimer = vib->seqChannel->vibratoExtentChangeDelay) == 0) {
        vib->extent = FLOAT_CAST(vib->seqChannel->vibratoExtentTarget);
    } else {
        vib->extent = FLOAT_CAST(vib->seqChannel->vibratoExtentStart);
    }

    if ((vib->rateChangeTimer = vib->seqChannel->vibratoRateChangeDelay) == 0) {
        vib->rate = FLOAT_CAST(vib->seqChannel->vibratoRateTarget);
    } else {
        vib->rate = FLOAT_CAST(vib->seqChannel->vibratoRateStart);
    }
    vib->delay = vib->seqChannel->vibratoDelay;

    seqPlayerState->portamento = seqPlayerState->parentLayer->portamento;
#else
    vib->curve = gVibratoCurve;
    vib->seqChannel = note->parentLayer->seqChannel;
    seqChannel = vib->seqChannel;

    vib->extentChangeTimer = seqChannel->vibratoExtentChangeDelay;
    if (vib->extentChangeTimer == 0) {
        vib->extent = seqChannel->vibratoExtentTarget;
    } else {
        vib->extent = seqChannel->vibratoExtentStart;
    }

    vib->rateChangeTimer = seqChannel->vibratoRateChangeDelay;
    if (vib->rateChangeTimer == 0) {
        vib->rate = seqChannel->vibratoRateTarget;
    } else {
        vib->rate = seqChannel->vibratoRateStart;
    }
    vib->delay = seqChannel->vibratoDelay;

    note->portamento = note->parentLayer->portamento;
#endif
}

void adsr_init(struct AdsrState *adsr, struct AdsrEnvelope *envelope, UNUSED s16 *volOut) {
    adsr->action = 0;
    adsr->state = ADSR_STATE_DISABLED;
#ifdef VERSION_EU
    adsr->delay = 0;
    adsr->envelope = envelope;
    adsr->current = 0.0f;
#else
    adsr->initial = 0;
    adsr->delay = 0;
    adsr->velocity = 0;
    adsr->envelope = envelope;
    adsr->volOut = volOut;
#endif
}

#ifdef VERSION_EU
f32 adsr_update(struct AdsrState *adsr) {
#else
s32 adsr_update(struct AdsrState *adsr) {
#endif
    u8 action = adsr->action;
#ifdef VERSION_EU
    u8 state = adsr->state;
    switch (state) {
#else
    switch (adsr->state) {
#endif
        case ADSR_STATE_DISABLED:
            return 0;

        case ADSR_STATE_INITIAL: {
#ifndef VERSION_EU
            adsr->current = adsr->initial;
            adsr->target = adsr->initial;
#endif
            if (action & ADSR_ACTION_HANG) {
                adsr->state = ADSR_STATE_HANG;
#ifdef VERSION_EU
                break;
#else
                goto CONT;
#endif
            }
            // fallthrough
        }

        case ADSR_STATE_START_LOOP:
            adsr->envIndex = 0;
#ifndef VERSION_EU
            adsr->currentHiRes = adsr->current << 0x10;
#endif
            adsr->state = ADSR_STATE_LOOP;
            // fallthrough

        case ADSR_STATE_LOOP:
            adsr->delay = BSWAP16(adsr->envelope[adsr->envIndex].delay);
            switch (adsr->delay) {
                case ADSR_DISABLE:
                    adsr->state = ADSR_STATE_DISABLED;
                    break;
                case ADSR_HANG:
                    adsr->state = ADSR_STATE_HANG;
                    break;
                case ADSR_GOTO:
                    adsr->envIndex = BSWAP16(adsr->envelope[adsr->envIndex].arg);
                    break;
                case ADSR_RESTART:
                    adsr->state = ADSR_STATE_INITIAL;
                    break;

                default:
#ifdef VERSION_EU
                    if (adsr->delay >= 4) {
                        adsr->delay = adsr->delay * gAudioBufferParameters.updatesPerFrame / 4;
                    }
                    adsr->target = (f32) BSWAP16(adsr->envelope[adsr->envIndex].arg) / 32767.0;
                    adsr->target = adsr->target * adsr->target;
                    adsr->velocity = (adsr->target - adsr->current) / adsr->delay;
#else
                    adsr->target = BSWAP16(adsr->envelope[adsr->envIndex].arg);
                    adsr->velocity = ((adsr->target - adsr->current) << 0x10) / adsr->delay;
#endif
                    adsr->state = ADSR_STATE_FADE;
                    adsr->envIndex++;
                    break;
            }
            if (adsr->state != ADSR_STATE_FADE) {
#ifdef VERSION_EU
                break;
#else
                goto CONT;
#endif
            }
            // fallthrough

        case ADSR_STATE_FADE:
#ifdef VERSION_EU
            adsr->current += adsr->velocity;
#else
            adsr->currentHiRes += adsr->velocity;
            adsr->current = adsr->currentHiRes >> 0x10;
#endif
            if (--adsr->delay <= 0) {
                adsr->state = ADSR_STATE_LOOP;
            }
            // fallthrough

        case ADSR_STATE_HANG:
#ifdef VERSION_EU
            break;
#else
            goto CONT;
#endif

        case ADSR_STATE_DECAY:
        case ADSR_STATE_RELEASE: {
            adsr->current -= adsr->fadeOutVel;
#ifdef VERSION_EU
            if (adsr->sustain != 0.0f && state == ADSR_STATE_DECAY) {
#else
            if (adsr->sustain != 0 && adsr->state == ADSR_STATE_DECAY) {
#endif
                if (adsr->current < adsr->sustain) {
                    adsr->current = adsr->sustain;
#ifdef VERSION_EU
                    adsr->delay = 128;
#else
                    adsr->delay = adsr->sustain / 16;
#endif
                    adsr->state = ADSR_STATE_SUSTAIN;
                }
#ifdef VERSION_EU
                break;
#else
                goto CONT;
#endif
            }

#ifdef VERSION_EU
            if (adsr->current < 0) {
                adsr->current = 0.0f;
                adsr->state = ADSR_STATE_DISABLED;
            }
#else
            if (adsr->current < 100) {
                adsr->current = 0;
                adsr->state = ADSR_STATE_DISABLED;
            }
#endif
#ifdef VERSION_EU
            break;
#else
            goto CONT;
#endif
        }

        case ADSR_STATE_SUSTAIN:
            adsr->delay -= 1;
            if (adsr->delay == 0) {
                adsr->state = ADSR_STATE_RELEASE;
            }
#ifdef VERSION_EU
            break;
#else
            goto CONT;
#endif
    }

#ifndef VERSION_EU
CONT:
#endif

    if ((action & ADSR_ACTION_DECAY)) {
        adsr->state = ADSR_STATE_DECAY;
        adsr->action = action & ~ADSR_ACTION_DECAY;
    }

    if ((action & ADSR_ACTION_RELEASE)) {
        adsr->state = ADSR_STATE_RELEASE;
#ifdef VERSION_EU
        adsr->action = action & ~ADSR_ACTION_RELEASE;
#else
        adsr->action = action & ~(ADSR_ACTION_RELEASE | ADSR_ACTION_DECAY);
#endif
    }

#ifdef VERSION_EU
    if (adsr->current < 0.0f) {
        return 0.0f;
    }
    if (adsr->current > 1.0f) {
        return 1.0f;
    }
    return adsr->current;
#else
    *adsr->volOut = adsr->current;
    return 0;
#endif
}
