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

void func_80319E70(void) {
}

void sequence_player_process_sound(struct SequencePlayer *seqPlayer) {
    s32 i;

    if (seqPlayer->fadeTimer != 0) {
        seqPlayer->fadeVolume += seqPlayer->fadeVelocity;

        if (seqPlayer->fadeVolume > US_FLOAT2(1)) {
            seqPlayer->fadeVolume = US_FLOAT2(1);
        }
        if (seqPlayer->fadeVolume < 0) {
            seqPlayer->fadeVolume = 0;
        }

        if (--seqPlayer->fadeTimer == 0) {
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
        }
    }

    // Process channels
    for (i = 0; i < CHANNELS_MAX; i++) {
        if (IS_SEQUENCE_CHANNEL_VALID(seqPlayer->channels[i]) == TRUE
            && seqPlayer->channels[i]->enabled == TRUE) {
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
        }
    }
}

f32 get_portamento_freq_scale(struct Portamento *p) {
    u32 v0;
    f32 result;
    if (p->mode == 0) {
        return 1.0f;
    }

    p->cur += p->speed;
    v0 = (u32) p->cur;

    if (v0 >= 127) {
        v0 = 127;
    }

    result = US_FLOAT(1.0) + p->extent * (gPitchBendFrequencyScale[v0 + 127] - US_FLOAT(1.0));
    return result;
}

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

f32 get_vibrato_freq_scale(struct VibratoState *vib) {
    s8 pitchChange;
    f32 extent;
    f32 result;

    if (vib->delay != 0) {
        vib->delay--;
        return 1;
    }

    if (vib->extentChangeTimer) {
        if (vib->extentChangeTimer == 1) {
            vib->extent = vib->seqChannel->vibratoExtentTarget;
        } else {
            vib->extent +=
                (vib->seqChannel->vibratoExtentTarget - vib->extent) / vib->extentChangeTimer;
        }

        vib->extentChangeTimer--;
    } else {
        if (vib->extent != vib->seqChannel->vibratoExtentTarget) {
            vib->extentChangeTimer = vib->seqChannel->vibratoExtentChangeDelay;
            if (vib->extentChangeTimer == 0) {
                vib->extent = vib->seqChannel->vibratoExtentTarget;
            }
        }
    }

    if (vib->rateChangeTimer) {
        if (vib->rateChangeTimer == 1) {
            vib->rate = vib->seqChannel->vibratoRateTarget;
        } else {
            vib->rate += (vib->seqChannel->vibratoRateTarget - vib->rate) / vib->rateChangeTimer;
        }

        vib->rateChangeTimer--;
    } else {
        if (vib->rate != vib->seqChannel->vibratoRateTarget) {
            vib->rateChangeTimer = vib->seqChannel->vibratoRateChangeDelay;
            if (vib->rateChangeTimer == 0) {
                vib->rate = vib->seqChannel->vibratoRateTarget;
            }
        }
    }

    if (vib->extent == 0) {
        return 1.0f;
    }

    pitchChange = get_vibrato_pitch_change(vib);
    extent = (f32) vib->extent / US_FLOAT(4096.0);

    result = US_FLOAT(1.0) + extent * (gPitchBendFrequencyScale[pitchChange + 127] - US_FLOAT(1.0));
    return result;
}

void note_vibrato_update(struct Note *note) {
    if (note->vibratoState.active) {
        note->portamentoFreqScale = get_portamento_freq_scale(&note->portamento);
        if (note->parentLayer != NO_LAYER) {
            note->vibratoFreqScale = get_vibrato_freq_scale(&note->vibratoState);
        }
    }
}

void note_vibrato_init(struct Note *note) {
    struct VibratoState *vib;
    struct SequenceChannel *seqChannel;
    note->vibratoFreqScale = 1.0f;
    note->portamentoFreqScale = 1.0f;

    vib = &note->vibratoState;

    if (note->parentLayer->seqChannel->vibratoExtentStart == 0
        && note->parentLayer->seqChannel->vibratoExtentTarget == 0
        && note->parentLayer->portamento.mode == 0) {
        vib->active = FALSE;
        return;
    }

    vib->active = TRUE;
    vib->time = 0;
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
}

void adsr_init(struct AdsrState *adsr, struct AdsrEnvelope *envelope, s16 *volOut) {
    adsr->action = 0;
    adsr->state = ADSR_STATE_DISABLED;
    adsr->initial = 0;
    adsr->delay = 0;
    adsr->velocity = 0;
    adsr->envelope = envelope;
    adsr->volOut = volOut;
}

s32 adsr_update(struct AdsrState *adsr) {
    u8 action = adsr->action;
    switch (adsr->state) {
        case ADSR_STATE_DISABLED:
            return 0;

        case ADSR_STATE_INITIAL: {
            adsr->current = adsr->initial;
            adsr->target = adsr->initial;
            if (action & ADSR_ACTION_HANG) {
                adsr->state = ADSR_STATE_HANG;
                goto CONT;
            }
            // fallthrough
        }

        case ADSR_STATE_START_LOOP:
            adsr->envIndex = 0;
            adsr->currentHiRes = adsr->current << 0x10;
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
                    adsr->target = BSWAP16(adsr->envelope[adsr->envIndex].arg);
                    adsr->velocity = ((adsr->target - adsr->current) << 0x10) / adsr->delay;
                    adsr->state = ADSR_STATE_FADE;
                    adsr->envIndex++;
                    break;
            }
            if (adsr->state != ADSR_STATE_FADE) {
                goto CONT;
            }
            // fallthrough

        case ADSR_STATE_FADE:
            adsr->currentHiRes += adsr->velocity;
            adsr->current = adsr->currentHiRes >> 0x10;
            if (--adsr->delay <= 0) {
                adsr->state = ADSR_STATE_LOOP;
            }
            // fallthrough

        case ADSR_STATE_HANG:
            goto CONT;

        case ADSR_STATE_DECAY:
        case ADSR_STATE_RELEASE: {
            adsr->current -= adsr->fadeOutVel;
            if (adsr->sustain != 0 && adsr->state == ADSR_STATE_DECAY) {
                if (adsr->current < adsr->sustain) {
                    adsr->current = adsr->sustain;
                    adsr->delay = adsr->sustain / 16;
                    adsr->state = ADSR_STATE_SUSTAIN;
                }
                goto CONT;
            }

            if (adsr->current < 100) {
                adsr->current = 0;
                adsr->state = ADSR_STATE_DISABLED;
            }
            goto CONT;
        }

        case ADSR_STATE_SUSTAIN:
            adsr->delay -= 1;
            if (adsr->delay == 0) {
                adsr->state = ADSR_STATE_RELEASE;
            }
            goto CONT;
    }

CONT:

    if ((action & ADSR_ACTION_DECAY)) {
        adsr->state = ADSR_STATE_DECAY;
        adsr->action = action & ~ADSR_ACTION_DECAY;
    }

    if ((action & ADSR_ACTION_RELEASE)) {
        adsr->state = ADSR_STATE_RELEASE;
        adsr->action = action & ~(ADSR_ACTION_RELEASE | ADSR_ACTION_DECAY);
    }

    *adsr->volOut = adsr->current;
    return 0;
}
