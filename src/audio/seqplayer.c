#include <ultra64.h>
#include <macros.h>

#include "memory.h"
#include "data.h"
#include "load.h"
#include "seqplayer.h"
#include "external.h"
#include "effects.h"

#define PORTAMENTO_IS_SPECIAL(x) ((x).mode & 0x80)
#define PORTAMENTO_MODE(x) ((x).mode & ~0x80)
#define PORTAMENTO_MODE_1 1
#define PORTAMENTO_MODE_2 2
#define PORTAMENTO_MODE_3 3
#define PORTAMENTO_MODE_4 4
#define PORTAMENTO_MODE_5 5

void seq_channel_layer_process_script(struct SequenceChannelLayer *layer);
void sequence_channel_process_script(struct SequenceChannel *seqChannel);

void sequence_channel_init(struct SequenceChannel *seqChannel) {
    s32 i;

    seqChannel->enabled = FALSE;
    seqChannel->finished = FALSE;
    seqChannel->stopScript = FALSE;
    seqChannel->stopSomething2 = FALSE;
    seqChannel->hasInstrument = FALSE;
    seqChannel->stereoHeadsetEffects = FALSE;
    seqChannel->transposition = 0;
    seqChannel->largeNotes = FALSE;
    seqChannel->scriptState.depth = 0;
    seqChannel->volume = 1.0f;
    seqChannel->volumeScale = 1.0f;
    seqChannel->freqScale = 1.0f;
    seqChannel->pan = 0.5f;
    seqChannel->panChannelWeight = 1.0f;
    seqChannel->noteUnused = NULL;
    seqChannel->reverb = 0;
    seqChannel->notePriority = NOTE_PRIORITY_DEFAULT;
    seqChannel->delay = 0;
    seqChannel->adsr.envelope = gDefaultEnvelope;
    seqChannel->adsr.releaseRate = 0x20;
    seqChannel->adsr.sustain = 0;
    seqChannel->updatesPerFrameUnused = gAudioUpdatesPerFrame;
    seqChannel->vibratoRateTarget = 0x800;
    seqChannel->vibratoRateStart = 0x800;
    seqChannel->vibratoExtentTarget = 0;
    seqChannel->vibratoExtentStart = 0;
    seqChannel->vibratoRateChangeDelay = 0;
    seqChannel->vibratoExtentChangeDelay = 0;
    seqChannel->vibratoDelay = 0;

    for (i = 0; i < 8; i++) {
        seqChannel->soundScriptIO[i] = -1;
    }

    seqChannel->unused = FALSE;
    init_note_lists(&seqChannel->notePool);
}

s32 seq_channel_set_layer(struct SequenceChannel *seqChannel, s32 layerIndex) {
    struct SequenceChannelLayer *layer;

    if (seqChannel->layers[layerIndex] == NULL) {
        layer = audio_list_pop_back(&gLayerFreeList);
        seqChannel->layers[layerIndex] = layer;
        if (layer == NULL) {
            seqChannel->layers[layerIndex] = NULL;
            return -1;
        }
    } else {
        seq_channel_layer_note_decay(seqChannel->layers[layerIndex]);
    }

    layer = seqChannel->layers[layerIndex];
    layer->seqChannel = seqChannel;
    layer->adsr = seqChannel->adsr;
    layer->adsr.releaseRate = 0;
    layer->enabled = TRUE;
    layer->stopSomething = FALSE;
    layer->continuousNotes = FALSE;
    layer->finished = FALSE;
    layer->portamento.mode = 0;
    layer->scriptState.depth = 0;
    layer->status = SOUND_LOAD_STATUS_NOT_LOADED;
    layer->noteDuration = 0x80;
    layer->transposition = 0;
    layer->delay = 0;
    layer->duration = 0;
    layer->delayUnused = 0;
    layer->note = NULL;
    layer->instrument = NULL;
    layer->velocitySquare = 0.0f;
    layer->pan = 0.5f;
    return 0;
}

void seq_channel_layer_disable(struct SequenceChannelLayer *layer) {
    if (layer != NULL) {
        seq_channel_layer_note_decay(layer);
        layer->enabled = FALSE;
        layer->finished = TRUE;
    }
}

void seq_channel_layer_free(struct SequenceChannel *seqChannel, s32 layerIndex) {
    struct SequenceChannelLayer *layer = seqChannel->layers[layerIndex];
    struct AudioListItem *item;

    if (layer != NULL) {
        // push to end of list
        item = &layer->listItem;
        if (item->prev == NULL) {
            // TODO: probably a macro?
            gLayerFreeList.prev->next = item;
            item->prev = gLayerFreeList.prev;
            item->next = &gLayerFreeList;
            gLayerFreeList.prev = item;
            gLayerFreeList.u.count++;
            item->pool = gLayerFreeList.pool;
        }
        seq_channel_layer_disable(layer);
        seqChannel->layers[layerIndex] = NULL;
    }
}

void sequence_channel_disable(struct SequenceChannel *seqChannel) {
    s32 i;
    for (i = 0; i < LAYERS_MAX; i++) {
        seq_channel_layer_free(seqChannel, i);
    }

    note_pool_clear(&seqChannel->notePool);
    seqChannel->enabled = FALSE;
    seqChannel->finished = TRUE;
}

struct SequenceChannel *allocate_sequence_channel(void) {
    s32 i;
    for (i = 0; i < ARRAY_COUNT(gSequenceChannels); i++) {
        if (gSequenceChannels[i].seqPlayer == NULL) {
            return gSequenceChannels + i;
        }
    }
    return &gSequenceChannelNone;
}

void sequence_player_init_channels(struct SequencePlayer *seqPlayer, u16 channelBits) {
    struct SequenceChannel *seqChannel;
    s32 i;

    for (i = 0; i < CHANNELS_MAX; i++) {
        if (channelBits & 1) {
            seqChannel = seqPlayer->channels[i];
            if (IS_SEQUENCE_CHANNEL_VALID(seqChannel) == TRUE && seqChannel->seqPlayer == seqPlayer) {
                sequence_channel_disable(seqChannel);
                seqChannel->seqPlayer = NULL;
            }
            seqChannel = allocate_sequence_channel();
            if (IS_SEQUENCE_CHANNEL_VALID(seqChannel) == FALSE) {
                gAudioErrorFlags = i + 0x10000;
                seqPlayer->channels[i] = seqChannel;
            } else {
                sequence_channel_init(seqChannel);
                seqPlayer->channels[i] = seqChannel;
                seqChannel->seqPlayer = seqPlayer;
                seqChannel->bankId = seqPlayer->defaultBank[0];
                seqChannel->muteBehavior = seqPlayer->muteBehavior;
                seqChannel->noteAllocPolicy = seqPlayer->noteAllocPolicy;
            }
        }
        channelBits >>= 1;
    }
}

void sequence_player_disable_channels(struct SequencePlayer *seqPlayer, u16 channelBits) {
    struct SequenceChannel *seqChannel;
    s32 i;

    for (i = 0; i < CHANNELS_MAX; i++) {
        if (channelBits & 1) {
            seqChannel = seqPlayer->channels[i];
            if (IS_SEQUENCE_CHANNEL_VALID(seqChannel) == TRUE) {
                if (seqChannel->seqPlayer == seqPlayer) {
                    sequence_channel_disable(seqChannel);
                    seqChannel->seqPlayer = NULL;
                }
                seqPlayer->channels[i] = &gSequenceChannelNone;
            }
        }
        channelBits >>= 1;
    }
}

void sequence_channel_enable(struct SequencePlayer *seqPlayer, u8 channelIndex, void *arg2) {
    struct SequenceChannel *seqChannel = seqPlayer->channels[channelIndex];
    s32 i;

    if (IS_SEQUENCE_CHANNEL_VALID(seqChannel) != FALSE) {
        seqChannel->enabled = TRUE;
        seqChannel->finished = FALSE;
        seqChannel->scriptState.depth = 0;
        seqChannel->scriptState.pc = arg2;
        seqChannel->delay = 0;
        for (i = 0; i < LAYERS_MAX; i++) {
            if (seqChannel->layers[i] != NULL) {
                seq_channel_layer_free(seqChannel, i);
            }
        }
    }
}

void sequence_player_disable(struct SequencePlayer *seqPlayer) {
    sequence_player_disable_channels(seqPlayer, 0xffff);
    note_pool_clear(&seqPlayer->notePool);
    seqPlayer->finished = TRUE;
    seqPlayer->enabled = FALSE;

    if (IS_SEQ_LOAD_COMPLETE(seqPlayer->seqId)) {
        gSeqLoadStatus[seqPlayer->seqId] = SOUND_LOAD_STATUS_DISCARDABLE;
    }

    if (IS_BANK_LOAD_COMPLETE(seqPlayer->defaultBank[0])) {
        gBankLoadStatus[seqPlayer->defaultBank[0]] = SOUND_LOAD_STATUS_DISCARDABLE;
    }

    // (Note that if this is called from alloc_bank_or_seq, the side will get swapped
    // later in that function. Thus, we signal that we want to load into the slot
    // of the bank that we no longer need.)
    if (gBankLoadedPool.temporary.entries[0].id == seqPlayer->defaultBank[0]) {
        gBankLoadedPool.temporary.nextSide = 1;
    } else if (gBankLoadedPool.temporary.entries[1].id == seqPlayer->defaultBank[0]) {
        gBankLoadedPool.temporary.nextSide = 0;
    }
}

/**
 * Add an item to the end of a list, if it's not already in any list.
 */
void audio_list_push_back(struct AudioListItem *list, struct AudioListItem *item) {
    if (item->prev == NULL) {
        list->prev->next = item;
        item->prev = list->prev;
        item->next = list;
        list->prev = item;
        list->u.count++;
        item->pool = list->pool;
    }
}

/**
 * Remove the last item from a list, and return it (or NULL if empty).
 */
void *audio_list_pop_back(struct AudioListItem *list) {
    struct AudioListItem *item = list->prev;
    if (item == list) {
        return NULL;
    }
    item->prev->next = list;
    list->prev = item->prev;
    item->prev = NULL;
    list->u.count--;
    return item->u.value;
}

void init_layer_freelist(void) {
    s32 i;

    gLayerFreeList.prev = &gLayerFreeList;
    gLayerFreeList.next = &gLayerFreeList;
    gLayerFreeList.u.count = 0;
    gLayerFreeList.pool = NULL;

    for (i = 0; i < ARRAY_COUNT(gSequenceLayers); i++) {
        gSequenceLayers[i].listItem.u.value = gSequenceLayers + i;
        gSequenceLayers[i].listItem.prev = NULL;
        audio_list_push_back(&gLayerFreeList, &gSequenceLayers[i].listItem);
    }
}

u8 m64_read_u8(struct M64ScriptState *state) {
    u8 *midiArg = state->pc++;
    return *midiArg;
}

s16 m64_read_s16(struct M64ScriptState *state) {
    s16 ret = *(state->pc++) << 8;
    ret = *(state->pc++) | ret;
    return ret;
}

u16 m64_read_compressed_u16(struct M64ScriptState *state) {
    u16 ret = *(state->pc++);
    if (ret & 0x80) {
        ret = (ret << 8) & 0x7f00;
        ret = *(state->pc++) | ret;
    }
    return ret;
}

#ifdef NON_MATCHING
void seq_channel_layer_process_script(struct SequenceChannelLayer *layer) {
    struct SequencePlayer *seqPlayer;   // sp5C, t4
    struct SequenceChannel *seqChannel; // sp58, t5
    struct M64ScriptState *state;       // v0
    struct AdsrSettings *adsr; // v0
    struct Portamento *portamento; // v0
    struct Instrument **instOut;   // a1
    struct Instrument *inst;       // a0
    struct AudioBankSound *sound;  // v0
    struct Instrument *instrument; // v1
    struct Drum *drum;
    u8 sameSound;    // sp3F
    u8 cmd;          // a0
    u8 allocNewNote; // sp3D, t0
    u8 loBits;
    u16 sp3A; // t2, a0, a1
    s32 vel; // sp30, t3
    f32 freqScale; // sp28, f0
    f32 sp24;
    u8 temp8;
    u8 *old;
    u8 *old2;
    u8 semitone; // v0
    u8 usedSemitone; // a1
    f32 temp_f12;
    f32 temp_f2;
    s32 temp_a0_5;
    u8 drumIndex; // t0
    s32 cmdBase; // t1
    u8 temp_a0_6;
    u8 portamentoTargetNote; // t7
    s32 bankId; // a3
    u8 instId; // v0
    s32 cmdSemitone; // v1
    f32 tuning; // f0

    sameSound = TRUE;
    if (layer->enabled == FALSE) {
        return;
    }

    if (layer->delay > 1) {
        layer->delay--;
        if (!layer->stopSomething && layer->delay <= layer->duration) {
            seq_channel_layer_note_decay(layer);
            layer->stopSomething = TRUE;
        }
        return;
    }

    if (!layer->continuousNotes) {
        seq_channel_layer_note_decay(layer);
    }

    if (PORTAMENTO_MODE(layer->portamento) == PORTAMENTO_MODE_1 ||
        PORTAMENTO_MODE(layer->portamento) == PORTAMENTO_MODE_2) {
        layer->portamento.mode = 0;
    }

    seqChannel = layer->seqChannel;
    seqPlayer = seqChannel->seqPlayer;

    for (;;) {
        // (Moving state outside the loop improves initial regalloc, but is wrong)
        state = &layer->scriptState;
        old2 = state->pc++;
        cmd = *old2;
        if (cmd <= 0xc0) {
            break;
        }

        switch (cmd) {
            case 0xff: // layer_end; function return or end of script
                if (state->depth == 0) {
                    // N.B. this function call is *not* inlined even though it's
                    // within the same file, unlike in the rest of this function.
                    seq_channel_layer_disable(layer);
                    return;
                }
                state->depth--, state->pc = state->stack[state->depth];
                break;

            case 0xfc: // layer_call
                // Something is wrong with the codegen here... It almost looks like
                // it's inlining m64_read_s16, but it lacks a s16 cast.
                // Maybe they did macro-based inlining since there are more layers
                // than channels or sequences, making the code hotter.
                sp3A = *(state->pc++) << 8;
                sp3A = *(state->pc++) | sp3A;
                state->depth++;
                state->stack[state->depth - 1] = state->pc;
                state->pc = seqPlayer->seqData + sp3A;
                break;

            case 0xf8: // layer_loop; loop start, N iterations (or 256 if N = 0)
                old = state->pc++;
                state->remLoopIters[state->depth] = *old;
                state->depth++;
                state->stack[state->depth - 1] = state->pc;
                break;

            case 0xf7: // layer_loopend
                state->remLoopIters[state->depth - 1]--;
                if (state->remLoopIters[state->depth - 1] != 0) {
                    state->pc = state->stack[state->depth - 1];
                } else {
                    state->depth--;
                }
                break;

            case 0xfb: // layer_jump
                sp3A = *(state->pc++) << 8;
                sp3A = *(state->pc++) | sp3A;
                state->pc = seqPlayer->seqData + sp3A;
                break;

            case 0xc1: // layer_setshortnotevelocity
            case 0xca: // layer_setpan
                temp_a0_5 = *(state->pc++);
                if (cmd == 0xc1) {
                    layer->velocitySquare = (f32)(temp_a0_5 * temp_a0_5);
                } else {
                    layer->pan = (f32) temp_a0_5 / US_FLOAT(128.0);
                }
                break;

            case 0xc2: // layer_transpose; set transposition in semitones
            case 0xc9: // layer_setshortnoteduration
                temp_a0_6 = *(state->pc++);
                if (cmd == 0xc9) {
                    layer->noteDuration = temp_a0_6;
                } else {
                    layer->transposition = temp_a0_6;
                }
                break;

            case 0xc4: // layer_somethingon
            case 0xc5: // layer_somethingoff
                if (cmd == 0xc4) {
                    temp8 = TRUE;
                } else {
                    temp8 = FALSE;
                }
                layer->continuousNotes = temp8;
                seq_channel_layer_note_decay(layer);
                break;

            case 0xc3: // layer_setshortnotedefaultplaypercentage
                // This doesn't match very well... sp3A is definitely set here
                // (it's falsely preserved until after the loop), but maybe there's
                // also inlining going on, with sp3A as a temp variable being used
                // for no good reason? Or it could just be a macro.
                sp3A = *(state->pc++);
                if (sp3A & 0x80) {
                    sp3A = (sp3A << 8) & 0x7f00;
                    sp3A = *(state->pc++) | sp3A;
                }
                layer->shortNoteDefaultPlayPercentage = sp3A;
                break;

            case 0xc6: // layer_setinstr
                old = state->pc++;
                instId = *old;
                // The rest of this case is identical to
                // if (instId < 0x7f) {
                //     get_instrument(seqChannel, instId, &layer->instrument, &layer->adsr);
                // }
                // except without seqChannelCpy...
                // interestingly, get_instrument comes just *after* this function,
                // which I think wouldn't be the case with __inline (maybe if they
                // both inline a common helper?)
                if (instId >= 0x7f) {
                    break;
                }

                bankId = seqChannel->bankId; // maybe a temp, to match get_instrument
                if (instId >= gCtlEntries[bankId].numInstruments) {
                    instId = gCtlEntries[bankId].numInstruments;
                    if (instId == 0) {
                        break;
                    }
                    instId--;
                }

                instOut = &layer->instrument;
                inst = gCtlEntries[bankId].instruments[instId];
                if (inst == NULL) {
                    while (instId != 0xff) {
                        inst = gCtlEntries[bankId].instruments[instId];
                        if (inst != NULL) {
                            break;
                        }
                        instId--;
                    }
                }

                adsr = &layer->adsr;
                if (((uintptr_t) gBankLoadedPool.persistent.pool.start <= (uintptr_t) inst
                     && (uintptr_t) inst <= (uintptr_t)(gBankLoadedPool.persistent.pool.start
                                            + gBankLoadedPool.persistent.pool.size))
                    || ((uintptr_t) gBankLoadedPool.temporary.pool.start <= (uintptr_t) inst
                        && (uintptr_t) inst <= (uintptr_t)(gBankLoadedPool.temporary.pool.start
                                               + gBankLoadedPool.temporary.pool.size))) {
                    adsr->envelope = inst->envelope;
                    adsr->releaseRate = inst->releaseRate;
                    *instOut = inst;
                    // instId++;
                } else {
                    gAudioErrorFlags = instId + 0x20000;
                    *instOut = NULL;
                }
                break;

            case 0xc7: // layer_portamento
                old = state->pc++;
                layer->portamento.mode = *old;
                old = state->pc++;
                portamentoTargetNote = *old + seqChannel->transposition +
                    layer->transposition + seqPlayer->transposition;
                if (portamentoTargetNote >= 0x80) {
                    portamentoTargetNote = 0;
                }
                layer->portamentoTargetNote = portamentoTargetNote;

                // If special, the next param is u8 instead of var
                if (PORTAMENTO_IS_SPECIAL(layer->portamento)) {
                    layer->portamentoTime = *(state->pc++);
                    break;
                }

                sp3A = *(state->pc++);
                if (sp3A & 0x80) {
                    sp3A = (sp3A << 8) & 0x7f00;
                    sp3A = *(state->pc++) | sp3A;
                }
                layer->portamentoTime = sp3A;
                break;

            case 0xc8: // layer_disableportamento
                layer->portamento.mode = 0;
                break;

            default:
                loBits = cmd & 0xf;
                switch (cmd & 0xf0) {
                    case 0xd0: // layer_setshortnotevelocityfromtable
                        sp3A = seqPlayer->shortNoteVelocityTable[loBits];
                        layer->velocitySquare = (f32)(sp3A * sp3A);
                        break;
                    case 0xe0: // layer_setshortnotedurationfromtable
                        layer->noteDuration = seqPlayer->shortNoteDurationTable[loBits];
                        break;
                }
        }
    }

    state = &layer->scriptState;
    if (cmd == 0xc0) // layer_delay
    {
        sp3A = *(state->pc++);
        if (sp3A & 0x80) {
            sp3A = (sp3A << 8) & 0x7f00;
            sp3A = *(state->pc++) | sp3A;
        }
        layer->delay = sp3A;
        layer->stopSomething = TRUE;
    } else {
        layer->stopSomething = FALSE;

        if (seqChannel->largeNotes == TRUE) {
            cmdBase = cmd & 0xc0;

            // phi_a0_3 = sp3A; // real assignment, or same vars?
            state = &layer->scriptState;
            switch (cmdBase) {
                case 0x00: // layer_note0 (play percentage, velocity, duration)
                    sp3A = *(state->pc++);
                    if (sp3A & 0x80) {
                        sp3A = (sp3A << 8) & 0x7f00;
                        sp3A = *(state->pc++) | sp3A;
                    }
                    vel = *(state->pc++);
                    layer->noteDuration = *(state->pc++);
                    layer->playPercentage = sp3A;
                    break;

                case 0x40: // layer_note1 (play percentage, velocity)
                    sp3A = *(state->pc++);
                    if (sp3A & 0x80) {
                        sp3A = (sp3A << 8) & 0x7f00;
                        sp3A = *(state->pc++) | sp3A;
                    }
                    vel = *(state->pc++);
                    layer->noteDuration = 0;
                    layer->playPercentage = sp3A;
                    break;

                case 0x80: // layer_note2 (velocity, duration; uses last play percentage)
                    vel = *(state->pc++);
                    layer->noteDuration = *(state->pc++);
                    sp3A = layer->playPercentage;
                    break;
            }

            layer->velocitySquare = vel * vel;
            cmdSemitone = cmd - cmdBase;
        } else {
            cmdBase = cmd & 0xc0;

            state = &layer->scriptState;

            // phi_a0_3 = sp3A;
            switch (cmdBase) {
                case 0x00: // play note, type 0 (play percentage)
                    sp3A = *(state->pc++);
                    if (sp3A & 0x80) {
                        sp3A = (sp3A << 8) & 0x7f00;
                        sp3A = *(state->pc++) | sp3A;
                    }
                    layer->playPercentage = sp3A;
                    break;

                case 0x40: // play note, type 1 (uses default play percentage)
                    sp3A = layer->shortNoteDefaultPlayPercentage;
                    break;

                case 0x80: // play note, type 2 (uses last play percentage)
                    sp3A = layer->playPercentage;
                    break;
            }

            cmdSemitone = cmd - cmdBase;
        }

        layer->delay = sp3A;
        layer->duration = layer->noteDuration * sp3A / 256;
        if ((seqPlayer->muted && (seqChannel->muteBehavior & MUTE_BEHAVIOR_STOP_NOTES) != 0)
            || seqChannel->stopSomething2 || !seqChannel->hasInstrument) {
            layer->stopSomething = TRUE;
        } else {
            if (seqChannel->instOrWave == 0) { // drum
                drumIndex = cmdSemitone + seqChannel->transposition + layer->transposition;
                if (drumIndex >= gCtlEntries[seqChannel->bankId].numDrums) {
                    drumIndex = gCtlEntries[seqChannel->bankId].numDrums;
                    if (drumIndex == 0) {
                        // this goto looks a bit like a function return...
                        layer->stopSomething = TRUE;
                        goto skip;
                    }
                    drumIndex--;
                }

                drum = gCtlEntries[seqChannel->bankId].drums[drumIndex];
                if (drum == NULL) {
                    layer->stopSomething = TRUE;
                } else {
                    layer->adsr.envelope = drum->envelope;
                    layer->adsr.releaseRate = drum->releaseRate;

                    layer->pan = FLOAT_CAST(drum->pan) / US_FLOAT(128.0);
                    layer->sound = &drum->sound;
                    layer->freqScale = layer->sound->tuning;
                }
            skip:;
            } else { // instrument
                semitone = cmdSemitone + seqPlayer->transposition + seqChannel->transposition
                             + layer->transposition;
                if (semitone >= 0x80) {
                    layer->stopSomething = TRUE;
                } else {
                    instrument = layer->instrument;
                    if (layer->instrument == NULL) {
                        instrument = seqChannel->instrument;
                    }

                    if (layer->portamento.mode != 0) {
                        usedSemitone = layer->portamentoTargetNote;
                        if (usedSemitone < semitone) {
                            usedSemitone = semitone;
                        }
                        if (instrument != NULL) {
                            if (usedSemitone < instrument->normalRangeLo) {
                                sound = &instrument->lowNotesSound;
                            } else if (usedSemitone <= instrument->normalRangeHi) {
                                sound = &instrument->normalNotesSound;
                            } else {
                                sound = &instrument->highNotesSound;
                            }
                            sameSound = (sound == layer->sound);
                            layer->sound = sound;
                            tuning = sound->tuning;
                        } else {
                            layer->sound = NULL;
                            tuning = 1.0f;
                        }

                        temp_f2 = gNoteFrequencies[semitone] * tuning;
                        temp_f12 = gNoteFrequencies[layer->portamentoTargetNote] * tuning;

                        portamento = &layer->portamento;
                        switch (PORTAMENTO_MODE(layer->portamento)) {
                            case PORTAMENTO_MODE_1:
                            case PORTAMENTO_MODE_3:
                            case PORTAMENTO_MODE_5:
                                sp24 = temp_f2;
                                freqScale = temp_f12;
                                break;
                            case PORTAMENTO_MODE_2:
                            case PORTAMENTO_MODE_4:
                                sp24 = temp_f12;
                                freqScale = temp_f2;
                                break;
                        }

                        portamento->extent = sp24 / freqScale - US_FLOAT(1.0);
                        if (PORTAMENTO_IS_SPECIAL(layer->portamento)) {
                            portamento->speed = US_FLOAT(32512.0) * FLOAT_CAST(seqPlayer->tempo)
                                                / ((f32) layer->delay * (f32) gTempoInternalToExternal
                                                   * FLOAT_CAST(layer->portamentoTime));
                        } else {
                            portamento->speed = US_FLOAT(127.0) / FLOAT_CAST(layer->portamentoTime);
                        }
                        portamento->cur = 0.0f;
                        layer->freqScale = freqScale;
                        if (PORTAMENTO_MODE(layer->portamento) == PORTAMENTO_MODE_5) {
                            layer->portamentoTargetNote = semitone;
                        }
                    } else if (instrument != NULL) {
                        if (semitone < instrument->normalRangeLo) {
                            sound = &instrument->lowNotesSound;
                        } else if (semitone <= instrument->normalRangeHi) {
                            sound = &instrument->normalNotesSound;
                        } else {
                            sound = &instrument->highNotesSound;
                        }
                        sameSound = (sound == layer->sound);
                        layer->sound = sound;
                        layer->freqScale = sound->tuning * gNoteFrequencies[semitone];
                    } else {
                        layer->sound = NULL;
                        layer->freqScale = gNoteFrequencies[semitone];
                    }
                }
            }
            layer->delayUnused = layer->delay;
        }
    }

    if (layer->stopSomething == TRUE) {
        if (layer->note != NULL || layer->continuousNotes) {
            seq_channel_layer_note_decay(layer);
        }
        return;
    }

    if (!layer->continuousNotes) {
        allocNewNote = TRUE;
    } else if (layer->note == NULL || layer->status == SOUND_LOAD_STATUS_NOT_LOADED) {
        allocNewNote = TRUE;
    } else if (sameSound == FALSE) {
        seq_channel_layer_note_decay(layer);
        allocNewNote = TRUE;
    } else {
        allocNewNote = FALSE;
        if (layer->sound == NULL) {
            init_synthetic_wave(layer->note, layer);
        }
    }

    if (allocNewNote != FALSE) {
        layer->note = alloc_note(layer);
    }

    if (layer->note != NULL && layer->note->parentLayer == layer) {
        note_vibrato_init(layer->note);
    }
}

#elif defined(VERSION_JP)
GLOBAL_ASM("asm/non_matchings/seq_channel_layer_process_script_jp.s")
#else
GLOBAL_ASM("asm/non_matchings/seq_channel_layer_process_script_us.s")
#endif

u8 get_instrument(struct SequenceChannel *seqChannel, u8 instId, struct Instrument **instOut,
                  struct AdsrSettings *adsr) {
    struct Instrument *inst;
    UNUSED u32 pad;

    if (instId >= gCtlEntries[seqChannel->bankId].numInstruments) {
        instId = gCtlEntries[seqChannel->bankId].numInstruments;
        if (instId == 0) {
            return 0;
        }
        instId--;
    }

    inst = gCtlEntries[seqChannel->bankId].instruments[instId];
    if (inst == NULL) {
        struct SequenceChannel seqChannelCpy = *seqChannel;

        while (instId != 0xff) {
            inst = gCtlEntries[seqChannelCpy.bankId].instruments[instId];
            if (inst != NULL) {
                break;
            }
            instId--;
        }
    }

    if (((uintptr_t) gBankLoadedPool.persistent.pool.start <= (uintptr_t) inst
         && (uintptr_t) inst <= (uintptr_t)(gBankLoadedPool.persistent.pool.start
                    + gBankLoadedPool.persistent.pool.size))
        || ((uintptr_t) gBankLoadedPool.temporary.pool.start <= (uintptr_t) inst
            && (uintptr_t) inst <= (uintptr_t)(gBankLoadedPool.temporary.pool.start
                                   + gBankLoadedPool.temporary.pool.size))) {
        adsr->envelope = inst->envelope;
        adsr->releaseRate = inst->releaseRate;
        *instOut = inst;
        instId++;
        return instId;
    }

    gAudioErrorFlags = instId + 0x20000;
    *instOut = NULL;
    return 0;
}

void set_instrument(struct SequenceChannel *seqChannel, u8 instId) {
    if (instId >= 0x80) {
        seqChannel->instOrWave = instId;
        seqChannel->instrument = NULL;
    } else if (instId == 0x7f) {
        seqChannel->instOrWave = 0;
        seqChannel->instrument = (struct Instrument *) 1;
    } else {
        seqChannel->instOrWave =
            get_instrument(seqChannel, instId, &seqChannel->instrument, &seqChannel->adsr);
        if (seqChannel->instOrWave == 0) {
            seqChannel->hasInstrument = FALSE;
            return;
        }
    }
    seqChannel->hasInstrument = TRUE;
}

void sequence_channel_set_volume(struct SequenceChannel *seqChannel, u8 volume) {
    seqChannel->volume = FLOAT_CAST(volume) / US_FLOAT(127.0);
}

#ifdef NON_MATCHING
void sequence_channel_process_script(struct SequenceChannel *seqChannel) {
    u16 sp5A;
    s8 value; // sp53
    u8 sp38;
    u8 cmd;    // v1, s1
    u8 loBits; // t0, a0
    struct M64ScriptState *state;
    struct SequencePlayer *seqPlayer;
    u8 temp;
    s8 tempSigned;
    s32 offset;
    s32 i;
    u8 temp2;

    if (!seqChannel->enabled) {
        return;
    }

    if (seqChannel->stopScript) {
        for (i = 0; i < LAYERS_MAX; i++) {
            if (seqChannel->layers[i] != NULL) {
                seq_channel_layer_process_script(seqChannel->layers[i]);
            }
        }
        return;
    }

    seqPlayer = seqChannel->seqPlayer;
    if (seqPlayer->muted && (seqChannel->muteBehavior & MUTE_BEHAVIOR_STOP_SCRIPT) != 0) {
        return;
    }

    if (seqChannel->delay != 0) {
        seqChannel->delay--;
    }

    state = &seqChannel->scriptState;
    if (seqChannel->delay == 0) {
        for (;;) {
            cmd = m64_read_u8(state);
            if (cmd == 0xff) // chan_end
            {
                // This fixes a reordering in 'case 0x90', somehow
                sp5A = state->depth;
                if (sp5A == 0) {
                    sequence_channel_disable(seqChannel);
                    break;
                }
                state->depth--, state->pc = state->stack[state->depth];
            }
            if (cmd == 0xfe) // chan_delay1
            {
                break;
            }
            if (cmd == 0xfd) // chan_delay
            {
                seqChannel->delay = m64_read_compressed_u16(state);
                break;
            }
            if (cmd == 0xf3) // chan_hang
            {
                seqChannel->stopScript = TRUE;
                break;
            }

            // (new_var = cmd fixes order of s1/s2, but causes a reordering
            // towards the bottom of the function)
            if (cmd > 0xc0) {
                switch (cmd) {
                    case 0xfc: // chan_call
                        sp5A = m64_read_s16(state);
                        state->depth++, state->stack[state->depth - 1] = state->pc;
                        state->pc = seqPlayer->seqData + sp5A;
                        break;

                    case 0xf8: // chan_loop; loop start, N iterations (or 256 if N = 0)
                        state->remLoopIters[state->depth] = m64_read_u8(state);
                        state->depth++, state->stack[state->depth - 1] = state->pc;
                        break;

                    case 0xf7: // chan_loopend
                        state->remLoopIters[state->depth - 1]--;
                        if (state->remLoopIters[state->depth - 1] != 0) {
                            state->pc = state->stack[state->depth - 1];
                        } else {
                            state->depth--;
                        }
                        break;

                    case 0xf6: // chan_break; break loop, if combined with jump
                        state->depth--;
                        break;

                    case 0xfb: // chan_jump
                    case 0xfa: // chan_beqz
                    case 0xf9: // chan_bltz
                    case 0xf5: // chan_bgez
                        sp5A = m64_read_s16(state);
                        if (cmd == 0xfa && value != 0)
                            break;
                        if (cmd == 0xf9 && value >= 0)
                            break;
                        if (cmd == 0xf5 && value < 0)
                            break;
                        state->pc = seqPlayer->seqData + sp5A;
                        break;

                    case 0xf2: // chan_reservenotes
                        // seqChannel->notePool should live in a saved register
                        note_pool_clear(&seqChannel->notePool);
                        temp = m64_read_u8(state);
                        note_pool_fill(&seqChannel->notePool, temp);
                        break;

                    case 0xf1: // chan_unreservenotes
                        note_pool_clear(&seqChannel->notePool);
                        break;

                    case 0xc2: // chan_setdyntable
                        sp5A = m64_read_s16(state);
                        seqChannel->dynTable = (void *) (seqPlayer->seqData + sp5A);
                        break;

                    case 0xc5: // chan_dynsetdyntable
                        if (value != -1) {
                            sp5A = (*seqChannel->dynTable)[value][1]
                                   + ((*seqChannel->dynTable)[value][0] << 8);
                            seqChannel->dynTable = (void *) (seqPlayer->seqData + sp5A);
                        }
                        break;

                    case 0xc1: // chan_setinstr ("set program"?)
                        set_instrument(seqChannel, m64_read_u8(state));
                        break;

                    case 0xc3: // chan_largenotesoff
                        seqChannel->largeNotes = FALSE;
                        break;

                    case 0xc4: // chan_largenoteson
                        seqChannel->largeNotes = TRUE;
                        break;

                    case 0xdf: // chan_setvol
                        sequence_channel_set_volume(seqChannel, m64_read_u8(state));
                        break;

                    case 0xe0: // chan_setvolscale
                        seqChannel->volumeScale = FLOAT_CAST(m64_read_u8(state)) / US_FLOAT(128.0);
                        break;

                    case 0xde: // chan_freqscale; pitch bend using raw frequency multiplier N/2^15 (N is u16)
                        sp5A = m64_read_s16(state);
                        seqChannel->freqScale = FLOAT_CAST(sp5A) / US_FLOAT(32768.0);
                        break;

                    case 0xd3: // chan_pitchbend; pitch bend by <= 1 octave in either direction (-127..127)
                        // (m64_read_u8(state) is really s8 here)
                        temp = m64_read_u8(state) + 127;
                        seqChannel->freqScale = gPitchBendFrequencyScale[temp];
                        break;

                    case 0xdd: // chan_setpan
                        seqChannel->pan = FLOAT_CAST(m64_read_u8(state)) / US_FLOAT(128.0);
                        break;

                    case 0xdc: // chan_setpanmix; set proportion of pan to come from channel (0..128)
                        seqChannel->panChannelWeight = FLOAT_CAST(m64_read_u8(state)) / US_FLOAT(128.0);
                        break;

                    case 0xdb: // chan_transpose; set transposition in semitones
                        tempSigned = *state->pc;
                        state->pc++;
                        seqChannel->transposition = tempSigned;
                        break;

                    case 0xda: // chan_setenvelope
                        sp5A = m64_read_s16(state);
                        seqChannel->adsr.envelope = (struct AdsrEnvelope *) (seqPlayer->seqData + sp5A);
                        break;

                    case 0xd9: // chan_setdecayrelease
                        seqChannel->adsr.releaseRate = m64_read_u8(state);
                        break;

                    case 0xd8: // chan_setvibratoextent
                        seqChannel->vibratoExtentTarget = m64_read_u8(state) * 8;
                        seqChannel->vibratoExtentStart = 0;
                        seqChannel->vibratoExtentChangeDelay = 0;
                        break;

                    case 0xd7: // chan_setvibratorate
                        seqChannel->vibratoRateStart = seqChannel->vibratoRateTarget =
                            m64_read_u8(state) * 32;
                        seqChannel->vibratoRateChangeDelay = 0;
                        break;

                    case 0xe2: // chan_setvibratoextentlinear
                        seqChannel->vibratoExtentStart = m64_read_u8(state) * 8;
                        seqChannel->vibratoExtentTarget = m64_read_u8(state) * 8;
                        seqChannel->vibratoExtentChangeDelay = m64_read_u8(state) * 16;
                        break;

                    case 0xe1: // chan_setvibratoratelinear
                        seqChannel->vibratoRateStart = m64_read_u8(state) * 32;
                        seqChannel->vibratoRateTarget = m64_read_u8(state) * 32;
                        seqChannel->vibratoRateChangeDelay = m64_read_u8(state) * 16;
                        break;

                    case 0xe3: // chan_setvibratodelay
                        seqChannel->vibratoDelay = m64_read_u8(state) * 16;
                        break;

                    case 0xd6: // chan_setupdatesperframe_unimplemented
                        temp = m64_read_u8(state);
                        if (temp == 0) {
                            temp = gAudioUpdatesPerFrame;
                        }
                        seqChannel->updatesPerFrameUnused = temp;
                        break;

                    case 0xd4: // chan_setreverb
                        seqChannel->reverb = m64_read_u8(state);
                        break;

                    case 0xc6: // chan_setbank; switch bank within set
                        temp = m64_read_u8(state);
                        // Switch to the temp's (0-indexed) bank in this sequence's
                        // bank set. Note that in the binary format (not in the JSON!)
                        // the banks are listed backwards, so we counts from the back.
                        // (gAlBankSets[offset] is number of banks)
                        offset = ((u16 *) gAlBankSets)[seqPlayer->seqId];
                        temp = gAlBankSets[offset + gAlBankSets[offset] - temp];
                        // temp should be in a saved register across this call
                        if (get_bank_or_seq(&gBankLoadedPool, 2, temp) != NULL) {
                            seqChannel->bankId = temp;
                        }
                        break;

                    case 0xc7: // chan_writeseq; write to sequence data (!)
                        // sp38 doesn't go on the stack
                        sp38 = value;
                        temp2 = m64_read_u8(state);
                        sp5A = m64_read_s16(state);
                        seqPlayer->seqData[sp5A] = sp38 + temp2;
                        break;

                    case 0xc8: // chan_subtract
                    case 0xc9: // chan_bitand
                    case 0xcc: // chan_setval
                        temp = m64_read_u8(state);
                        if (cmd == 0xc8) {
                            value -= temp;
                        } else if (cmd == 0xcc) {
                            value = temp;
                        } else {
                            value &= temp;
                        }
                        break;

                    case 0xca: // chan_setmutebhv
                        seqChannel->muteBehavior = m64_read_u8(state);
                        break;

                    case 0xcb: // chan_readseq
                        sp5A = m64_read_s16(state);
                        value = seqPlayer->seqData[sp5A + value];
                        break;

                    case 0xd0: // chan_stereoheadseteffects
                        seqChannel->stereoHeadsetEffects = m64_read_u8(state);
                        break;

                    case 0xd1: // chan_setnoteallocationpolicy
                        seqChannel->noteAllocPolicy = m64_read_u8(state);
                        break;

                    case 0xd2: // chan_setsustain
                        seqChannel->adsr.sustain = m64_read_u8(state) << 8;
                        break;

                    case 0xe4: // chan_dyncall
                        if (value != -1) {
                            u8(*thingy)[2] = *seqChannel->dynTable;
                            state->depth++, state->stack[state->depth - 1] = state->pc;
                            sp5A = thingy[value][1] + (thingy[value][0] << 8);
                            state->pc = seqPlayer->seqData + sp5A;
                        }
                        break;
                }
            } else {
                // loBits is recomputed a lot
                loBits = cmd & 0xf;
                // #define loBits (cmd & 0xf)
                switch (cmd & 0xf0) {
                    case 0x00: // chan_testlayerfinished
                        if (seqChannel->layers[loBits] != NULL) {
                            value = seqChannel->layers[loBits]->finished;
                        }
                        break;

                    case 0x70: // chan_iowriteval; write data back to audio lib
                        seqChannel->soundScriptIO[loBits] = value;
                        break;

                    case 0x80: // chan_ioreadval; read data from audio lib
                        value = seqChannel->soundScriptIO[loBits];
                        if (loBits < 4) {
                            seqChannel->soundScriptIO[loBits] = -1;
                        }
                        break;

                    case 0x50: // chan_ioreadvalsub; subtract with read data from audio lib
                        value -= seqChannel->soundScriptIO[loBits];
                        break;

                    case 0x90: // chan_setlayer
                        sp5A = m64_read_s16(state);
                        if (seq_channel_set_layer(seqChannel, loBits) == 0) {
                            seqChannel->layers[loBits]->scriptState.pc = seqPlayer->seqData + sp5A;
                        }
                        break;

                    case 0xa0: // chan_freelayer
                        seq_channel_layer_free(seqChannel, loBits);
                        break;

                    case 0xb0: // chan_dynsetlayer
                        if (value != -1 && seq_channel_set_layer(seqChannel, loBits) != -1) {
                            temp = (*seqChannel->dynTable)[value][0]
                                   + ((*seqChannel->dynTable)[value][1] << 8);
                            seqChannel->layers[loBits]->scriptState.pc = seqPlayer->seqData + temp;
                        }
                        break;

                    case 0x60: // chan_setnotepriority (arg must be >= 2)
                        seqChannel->notePriority = loBits;
                        break;

                    case 0x10: // chan_startchannel
                        sp5A = m64_read_s16(state);
                        sequence_channel_enable(seqPlayer, loBits, seqPlayer->seqData + sp5A);
                        break;

                    case 0x20: // chan_disablechannel
                        sequence_channel_disable(seqPlayer->channels[loBits]);
                        break;

                    case 0x30: // chan_iowriteval2; write data back to audio lib for another channel
                        seqPlayer->channels[loBits]->soundScriptIO[m64_read_u8(state)] = value;
                        break;

                    case 0x40: // chan_ioreadval2; read data from audio lib from another channel
                        value = seqPlayer->channels[loBits]->soundScriptIO[m64_read_u8(state)];
                        break;
                }
            }
        }
    }

    for (i = 0; i < LAYERS_MAX; i++) {
        if (seqChannel->layers[i] != 0) {
            seq_channel_layer_process_script(seqChannel->layers[i]);
        }
    }
}

#elif defined(VERSION_JP)
GLOBAL_ASM("asm/non_matchings/sequence_channel_process_script_jp.s")
#else
GLOBAL_ASM("asm/non_matchings/sequence_channel_process_script_us.s")
#endif

void sequence_player_process_sequence(struct SequencePlayer *seqPlayer) {
    u8 cmd;
    u8 loBits;
    u8 temp;
    s8 tempSigned;
    s32 value;
    s32 i;
    u16 u16v;
    u8 *tempPtr;
    struct M64ScriptState *state;

    if (seqPlayer->enabled == FALSE) {
        return;
    }

    if (seqPlayer->bankDmaInProgress == TRUE) {
        if (seqPlayer->bankDmaMesg == NULL) {
            return;
        }
        if (seqPlayer->bankDmaRemaining == 0) {
            seqPlayer->bankDmaInProgress = FALSE;
            patch_audio_bank(seqPlayer->loadingBank, gAlTbl->seqArray[seqPlayer->loadingBankId].offset,
                          seqPlayer->loadingBankNumInstruments, seqPlayer->loadingBankNumDrums);
            gCtlEntries[seqPlayer->loadingBankId].numInstruments = seqPlayer->loadingBankNumInstruments;
            gCtlEntries[seqPlayer->loadingBankId].numDrums = seqPlayer->loadingBankNumDrums;
            gCtlEntries[seqPlayer->loadingBankId].instruments = seqPlayer->loadingBank->instruments;
            gCtlEntries[seqPlayer->loadingBankId].drums = seqPlayer->loadingBank->drums;
            gBankLoadStatus[seqPlayer->loadingBankId] = SOUND_LOAD_STATUS_COMPLETE;
        } else {
            osCreateMesgQueue(&seqPlayer->bankDmaMesgQueue, &seqPlayer->bankDmaMesg, 1);
            seqPlayer->bankDmaMesg = NULL;
            audio_dma_partial_copy_async(&seqPlayer->bankDmaCurrDevAddr, &seqPlayer->bankDmaCurrMemAddr,
                                         &seqPlayer->bankDmaRemaining, &seqPlayer->bankDmaMesgQueue,
                                         &seqPlayer->bankDmaIoMesg);
        }
        return;
    }

    if (seqPlayer->seqDmaInProgress == TRUE) {
        if (seqPlayer->seqDmaMesg == NULL) {
            return;
        }
        seqPlayer->seqDmaInProgress = FALSE;
        gSeqLoadStatus[seqPlayer->seqId] = SOUND_LOAD_STATUS_COMPLETE;
    }

    // If discarded, bail out.
    if (IS_SEQ_LOAD_COMPLETE(seqPlayer->seqId) == FALSE
        || IS_BANK_LOAD_COMPLETE(seqPlayer->defaultBank[0]) == FALSE) {
        sequence_player_disable(seqPlayer);
        return;
    }

    // Remove possible SOUND_LOAD_STATUS_DISCARDABLE marks.
    gSeqLoadStatus[seqPlayer->seqId] = SOUND_LOAD_STATUS_COMPLETE;
    gBankLoadStatus[seqPlayer->defaultBank[0]] = SOUND_LOAD_STATUS_COMPLETE;

    if (seqPlayer->muted && (seqPlayer->muteBehavior & MUTE_BEHAVIOR_STOP_SCRIPT) != 0) {
        return;
    }

    // Check if we surpass the number of ticks needed for a tatum, else stop.
    seqPlayer->tempoAcc += seqPlayer->tempo;
    if (seqPlayer->tempoAcc < gTempoInternalToExternal) {
        return;
    }
    seqPlayer->tempoAcc -= (u16) gTempoInternalToExternal;

    state = &seqPlayer->scriptState;
    if (seqPlayer->delay > 1) {
        seqPlayer->delay--;
    } else {
        for (;;) {
            cmd = m64_read_u8(state);
            if (cmd == 0xff) // seq_end
            {
                if (state->depth == 0) {
                    sequence_player_disable(seqPlayer);
                    break;
                }
                state->depth--, state->pc = state->stack[state->depth];
            }

            if (cmd == 0xfd) // seq_delay
            {
                seqPlayer->delay = m64_read_compressed_u16(state);
                break;
            }

            if (cmd == 0xfe) // seq_delay1
            {
                seqPlayer->delay = 1;
                break;
            }

            if (cmd >= 0xc0) {
                switch (cmd) {
                    case 0xff: // seq_end
                        break;

                    case 0xfc: // seq_call
                        u16v = m64_read_s16(state);
                        state->depth++, state->stack[state->depth - 1] = state->pc;
                        state->pc = seqPlayer->seqData + u16v;
                        break;

                    case 0xf8: // seq_loop; loop start, N iterations (or 256 if N = 0)
                        state->remLoopIters[state->depth] = m64_read_u8(state);
                        state->depth++, state->stack[state->depth - 1] = state->pc;
                        break;

                    case 0xf7: // seq_loopend
                        state->remLoopIters[state->depth - 1]--;
                        if (state->remLoopIters[state->depth - 1] != 0) {
                            state->pc = state->stack[state->depth - 1];
                        } else {
                            state->depth--;
                        }
                        break;

                    case 0xfb: // seq_jump
                    case 0xfa: // seq_beqz; jump if == 0
                    case 0xf9: // seq_bltz; jump if < 0
                    case 0xf5: // seq_bgez; jump if >= 0
                        u16v = m64_read_s16(state);
                        if (cmd == 0xfa && value != 0) {
                            break;
                        }
                        if (cmd == 0xf9 && value >= 0) {
                            break;
                        }
                        if (cmd == 0xf5 && value < 0) {
                            break;
                        }
                        state->pc = seqPlayer->seqData + u16v;
                        break;

                    case 0xf2: // seq_reservenotes
                        note_pool_clear(&seqPlayer->notePool);
                        note_pool_fill(&seqPlayer->notePool, m64_read_u8(state));
                        break;

                    case 0xf1: // seq_unreservenotes
                        note_pool_clear(&seqPlayer->notePool);
                        break;

                    case 0xdf: // seq_transpose; set transposition in semitones
                        seqPlayer->transposition = 0;
                        // fallthrough

                    case 0xde: // seq_transposerel; add transposition
                        seqPlayer->transposition += (s8) m64_read_u8(state);
                        break;

                    case 0xdd: // seq_settempo (bpm)
                    case 0xdc: // seq_addtempo (bpm)
                        temp = m64_read_u8(state);
                        if (cmd == 0xdd) {
                            seqPlayer->tempo = temp * TEMPO_SCALE;
                        } else {
                            seqPlayer->tempo += (s8) temp * TEMPO_SCALE;
                        }

                        if (seqPlayer->tempo > gTempoInternalToExternal) {
                            seqPlayer->tempo = gTempoInternalToExternal;
                        }

                        if ((s16) seqPlayer->tempo <= 0) {
                            seqPlayer->tempo = 1;
                        }
                        break;

                    case 0xdb: // seq_setvol
                        temp = m64_read_u8(state);
                        switch (seqPlayer->state) {
                            case SEQUENCE_PLAYER_STATE_2:
                                if (seqPlayer->fadeTimer != 0) {
                                    f32 targetVolume = FLOAT_CAST(temp) / US_FLOAT(127.0);
                                    seqPlayer->fadeVelocity = (targetVolume - seqPlayer->fadeVolume)
                                                              / FLOAT_CAST(seqPlayer->fadeTimer);
                                    break;
                                }
                                // fallthrough
                            case SEQUENCE_PLAYER_STATE_0:
                                seqPlayer->fadeVolume = FLOAT_CAST(temp) / US_FLOAT(127.0);
                                break;
                            case SEQUENCE_PLAYER_STATE_FADE_OUT:
                            case SEQUENCE_PLAYER_STATE_4:
                                seqPlayer->volume = FLOAT_CAST(temp) / US_FLOAT(127.0);
                                break;
                        }
                        break;

                    case 0xda: // seq_changevol
                        tempSigned = m64_read_u8(state);
                        seqPlayer->fadeVolume =
                            seqPlayer->fadeVolume + (f32) tempSigned / US_FLOAT(127.0);
                        break;

                    case 0xd7: // seq_initchannels
                        u16v = m64_read_s16(state);
                        sequence_player_init_channels(seqPlayer, u16v);
                        break;

                    case 0xd6: // seq_disablechannels
                        u16v = m64_read_s16(state);
                        sequence_player_disable_channels(seqPlayer, u16v);
                        break;

                    case 0xd5: // seq_setmutescale
                        tempSigned = m64_read_u8(state);
                        seqPlayer->muteVolumeScale = (f32) tempSigned / US_FLOAT(127.0);
                        break;

                    case 0xd4: // seq_mute
                        seqPlayer->muted = TRUE;
                        break;

                    case 0xd3: // seq_setmutebhv
                        seqPlayer->muteBehavior = m64_read_u8(state);
                        break;

                    case 0xd2: // seq_setshortnotevelocitytable
                    case 0xd1: // seq_setshortnotedurationtable
                        u16v = m64_read_s16(state);
                        tempPtr = seqPlayer->seqData + u16v;
                        if (cmd == 0xd2) {
                            seqPlayer->shortNoteVelocityTable = tempPtr;
                        } else {
                            seqPlayer->shortNoteDurationTable = tempPtr;
                        }
                        break;

                    case 0xd0: // seq_setnoteallocationpolicy
                        seqPlayer->noteAllocPolicy = m64_read_u8(state);
                        break;

                    case 0xcc: // seq_setval
                        value = m64_read_u8(state);
                        break;

                    case 0xc9: // seq_bitand
                        value = m64_read_u8(state) & value;
                        break;

                    case 0xc8: // seq_subtract
                        value = value - m64_read_u8(state);
                        break;
                }
            } else {
                loBits = cmd & 0xf;
                switch (cmd & 0xf0) {
                    case 0x00: // seq_testchdisabled
                        if (IS_SEQUENCE_CHANNEL_VALID(seqPlayer->channels[loBits]) == TRUE) {
                            value = seqPlayer->channels[loBits]->finished;
                        }
                        break;
                    case 0x10:
                        break;
                    case 0x20:
                        break;
                    case 0x40:
                        break;
                    case 0x50: // seq_subvariation
                        value -= seqPlayer->seqVariation;
                        break;
                    case 0x60:
                        break;
                    case 0x70: // seq_setvariation
                        seqPlayer->seqVariation = value;
                        break;
                    case 0x80: // seq_getvariation
                        value = seqPlayer->seqVariation;
                        break;
                    case 0x90: // seq_startchannel
                        u16v = m64_read_s16(state);
                        sequence_channel_enable(seqPlayer, loBits, seqPlayer->seqData + u16v);
                        break;
                    case 0xa0:
                        break;
                    case 0xd8: // (this makes no sense)
                        break;
                    case 0xd9:
                        break;
                }
            }
        }
    }

    for (i = 0; i < CHANNELS_MAX; i++) {
        if (seqPlayer->channels[i] != &gSequenceChannelNone) {
            sequence_channel_process_script(seqPlayer->channels[i]);
        }
    }
}

// This runs 240 times per second.
void process_sequences(UNUSED s32 iterationsRemaining) {
    s32 i;
    for (i = 0; i < SEQUENCE_PLAYERS; i++) {
        if (gSequencePlayers[i].enabled == TRUE) {
            sequence_player_process_sequence(gSequencePlayers + i);
            sequence_player_process_sound(gSequencePlayers + i);
        }
    }
    reclaim_notes();
    process_notes();
}

void init_sequence_player(u32 player) {
    struct SequencePlayer *seqPlayer = &gSequencePlayers[player];
    seqPlayer->muted = FALSE;
    seqPlayer->delay = 0;
    seqPlayer->state = SEQUENCE_PLAYER_STATE_0;
    seqPlayer->fadeTimer = 0;
    seqPlayer->tempoAcc = 0;
    seqPlayer->tempo = 120 * TEMPO_SCALE; // 120 BPM
    seqPlayer->transposition = 0;
    seqPlayer->muteBehavior = MUTE_BEHAVIOR_STOP_SCRIPT | MUTE_BEHAVIOR_STOP_NOTES | MUTE_BEHAVIOR_SOFTEN;
    seqPlayer->noteAllocPolicy = 0;
    seqPlayer->shortNoteVelocityTable = gDefaultShortNoteVelocityTable;
    seqPlayer->shortNoteDurationTable = gDefaultShortNoteDurationTable;
    seqPlayer->fadeVolume = 1.0f;
    seqPlayer->fadeVelocity = 0.0f;
    seqPlayer->volume = 0.0f;
    seqPlayer->muteVolumeScale = 0.5f;
}

void init_sequence_players(void) {
    // Initialization function, called from audio_init
    s32 i, j;

    for (i = 0; i < ARRAY_COUNT(gSequenceChannels); i++) {
        gSequenceChannels[i].seqPlayer = NULL;
        gSequenceChannels[i].enabled = FALSE;
    }

    for (i = 0; i < ARRAY_COUNT(gSequenceChannels); i++) {
        // @bug Size of wrong array. Zeroes out second half of gSequenceChannels[0],
        // all of gSequenceChannels[1..31], and part of gSequenceLayers[0].
        // However, this is only called at startup, so it's harmless.
#ifdef AVOID_UB
#define LAYERS_SIZE LAYERS_MAX
#else
#define LAYERS_SIZE ARRAY_COUNT(gSequenceLayers)
#endif
        for (j = 0; j < LAYERS_SIZE; j++) {
            gSequenceChannels[i].layers[j] = NULL;
        }
    }

    init_layer_freelist();

    for (i = 0; i < ARRAY_COUNT(gSequenceLayers); i++) {
        gSequenceLayers[i].seqChannel = NULL;
        gSequenceLayers[i].enabled = FALSE;
    }

    for (i = 0; i < SEQUENCE_PLAYERS; i++) {
        for (j = 0; j < CHANNELS_MAX; j++) {
            gSequencePlayers[i].channels[j] = &gSequenceChannelNone;
        }

        gSequencePlayers[i].seqVariation = -1;
        gSequencePlayers[i].bankDmaInProgress = FALSE;
        gSequencePlayers[i].seqDmaInProgress = FALSE;
        init_note_lists(&gSequencePlayers[i].notePool);
        init_sequence_player(i);
    }
}
