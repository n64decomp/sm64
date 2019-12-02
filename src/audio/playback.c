#include <ultra64.h>
#include <macros.h>

#include "memory.h"
#include "data.h"
#include "load.h"
#include "seqplayer.h"
#include "playback.h"
#include "synthesis.h"
#include "effects.h"

s32 note_init_for_layer(struct Note *note, struct SequenceChannelLayer *seqLayer);

void note_init(struct Note *note) {
    if (note->parentLayer->adsr.releaseRate == 0) {
        adsr_init(&note->adsr, note->parentLayer->seqChannel->adsr.envelope, &note->adsrVolScale);
    } else {
        adsr_init(&note->adsr, note->parentLayer->adsr.envelope, &note->adsrVolScale);
    }
    note->adsr.state = ADSR_STATE_INITIAL;
    note_init_volume(note);
    note_enable(note);
}

void note_disable2(struct Note *note) {
    note_disable(note);
}

void process_notes(void) {
    f32 scale;
    f32 frequency;
    u8 reverb;
    f32 velocity;
    f32 pan;
    f32 cap;
    struct Note *note;
    struct NoteAttributes *attributes;
    struct AudioListItem *it;
    s32 i;

    // Macro versions of audio_list_push_front and audio_list_remove
    // (PREPEND does not actually need to be a macro, but it seems likely.)
#define PREPEND(item, head_arg)                                                                        \
    ((it = (item), it->prev != NULL)                                                                   \
         ? it                                                                                          \
         : (it->prev = (head_arg), it->next = (head_arg)->next, (head_arg)->next->prev = it,           \
            (head_arg)->next = it, (head_arg)->u.count++, it->pool = (head_arg)->pool, it))
#define POP(item)                                                                                      \
    ((it = (item), it->prev == NULL)                                                                   \
         ? it                                                                                          \
         : (it->prev->next = it->next, it->next->prev = it->prev, it->prev = NULL, it))

    for (i = 0; i < gMaxSimultaneousNotes; i++) {
        note = &gNotes[i];
        if (note->priority != NOTE_PRIORITY_DISABLED) {
            if (note->priority == NOTE_PRIORITY_STOPPING || note->finished) {
                if (note->adsrVolScale == 0 || note->finished) {
                    if (note->wantedParentLayer != NO_LAYER) {
                        note_disable2(note);
                        if (note->wantedParentLayer->seqChannel != NULL) {
                            if (note_init_for_layer(note, note->wantedParentLayer) == TRUE) {
                                note_disable2(note);
                                POP(&note->listItem);
                                PREPEND(&note->listItem, &gNoteFreeLists.disabled);
                            } else {
                                note_vibrato_init(note);
                                audio_list_push_back(&note->listItem.pool->active,
                                                     POP(&note->listItem));
                                note->wantedParentLayer = NO_LAYER;
                            }
                        } else {
                            note_disable2(note);
                            audio_list_push_back(&note->listItem.pool->disabled, POP(&note->listItem));
                            note->wantedParentLayer = NO_LAYER;
                            continue;
                        }
                    } else {
                        note_disable2(note);
                        audio_list_push_back(&note->listItem.pool->disabled, POP(&note->listItem));
                        continue;
                    }
                }
            } else {
                if (note->adsr.state == ADSR_STATE_DISABLED) {
                    note_disable2(note);
                    audio_list_push_back(&note->listItem.pool->disabled, POP(&note->listItem));
                    continue;
                }
            }

            adsr_update(&note->adsr);
            note_vibrato_update(note);
            attributes = &note->attributes;
            if (note->priority == NOTE_PRIORITY_STOPPING) {
                frequency = attributes->freqScale;
                velocity = attributes->velocity;
                pan = attributes->pan;
                reverb = attributes->reverb;
            } else {
                frequency = note->parentLayer->noteFreqScale;
                velocity = note->parentLayer->noteVelocity;
                pan = note->parentLayer->notePan;
                reverb = note->parentLayer->seqChannel->reverb;
            }

            scale = note->adsrVolScale;
            frequency *= note->vibratoFreqScale * note->portamentoFreqScale;
            cap = 3.99992f;
            if (gAiFrequency != 32006) {
                frequency *= US_FLOAT(32000.0) / (f32) gAiFrequency;
            }
            frequency = (frequency < cap ? frequency : cap);
            scale *= 4.3498e-5f; // ~1 / 23000
            velocity = velocity * scale * scale;
            note_set_frequency(note, frequency);
            note_set_vel_pan_reverb(note, velocity, pan, reverb);
            continue;
        }
    }
#undef PREPEND
#undef POP
}

void seq_channel_layer_decay_release_internal(struct SequenceChannelLayer *seqLayer, s32 target) {
    struct Note *note;
    struct NoteAttributes *attributes;

    if (seqLayer == NO_LAYER || seqLayer->note == NULL) {
        return;
    }

    note = seqLayer->note;
    attributes = &note->attributes;

    if (seqLayer->seqChannel != NULL && seqLayer->seqChannel->noteAllocPolicy == 0) {
        seqLayer->note = NULL;
    }

    if (note->wantedParentLayer == seqLayer) {
        note->wantedParentLayer = NO_LAYER;
    }

    if (note->parentLayer != seqLayer) {
        return;
    }

    seqLayer->status = SOUND_LOAD_STATUS_NOT_LOADED;
    if (note->adsr.state != ADSR_STATE_DECAY) {
        attributes->freqScale = seqLayer->noteFreqScale;
        attributes->velocity = seqLayer->noteVelocity;
        attributes->pan = seqLayer->notePan;
        if (seqLayer->seqChannel != NULL) {
            attributes->reverb = seqLayer->seqChannel->reverb;
        }
        note->priority = NOTE_PRIORITY_STOPPING;
        note->prevParentLayer = note->parentLayer;
        note->parentLayer = NO_LAYER;
        if (target == ADSR_STATE_RELEASE) {
            note->adsr.fadeOutVel = 0x8000 / gAudioUpdatesPerFrame;
            note->adsr.action |= ADSR_ACTION_RELEASE;
        } else {
            note->adsr.action |= ADSR_ACTION_DECAY;
            if (seqLayer->adsr.releaseRate == 0) {
                note->adsr.fadeOutVel = seqLayer->seqChannel->adsr.releaseRate * 24;
            } else {
                note->adsr.fadeOutVel = seqLayer->adsr.releaseRate * 24;
            }
            note->adsr.sustain = (note->adsr.current * seqLayer->seqChannel->adsr.sustain) / 0x10000;
        }
    }

    if (target == ADSR_STATE_DECAY) {
        audio_list_remove(&note->listItem);
        audio_list_push_front(&note->listItem.pool->decaying, &note->listItem);
    }
}

void seq_channel_layer_note_decay(struct SequenceChannelLayer *seqLayer) {
    seq_channel_layer_decay_release_internal(seqLayer, ADSR_STATE_DECAY);
}

void seq_channel_layer_note_release(struct SequenceChannelLayer *seqLayer) {
    seq_channel_layer_decay_release_internal(seqLayer, ADSR_STATE_RELEASE);
}

void build_synthetic_wave(struct Note *note, struct SequenceChannelLayer *seqLayer) {
    s32 i;
    s32 j;
    s32 pos;
    s32 stepSize;
    s32 offset;
    u8 lim;
    u8 origSampleCount = note->sampleCount;

    if (seqLayer->freqScale < US_FLOAT(1.0)) {
        note->sampleCount = 64;
        seqLayer->freqScale *= US_FLOAT(1.0465);
        stepSize = 1;
    } else if (seqLayer->freqScale < US_FLOAT(2.0)) {
        note->sampleCount = 32;
        seqLayer->freqScale *= US_FLOAT(0.52325);
        stepSize = 2;
    } else if (seqLayer->freqScale < US_FLOAT(4.0)) {
        note->sampleCount = 16;
        seqLayer->freqScale *= US_FLOAT(0.26263);
        stepSize = 4;
    } else {
        note->sampleCount = 8;
        seqLayer->freqScale *= US_FLOAT(0.13081);
        stepSize = 8;
    }

    if (note->sampleCount == origSampleCount && seqLayer->seqChannel->instOrWave == note->instOrWave) {
        return;
    }

    // Load wave sample
    note->instOrWave = (u8) seqLayer->seqChannel->instOrWave;
    for (i = -1, pos = 0; pos < 0x40; pos += stepSize) {
        i++;
        note->synthesisBuffers->samples[i] = gWaveSamples[seqLayer->seqChannel->instOrWave - 0x80][pos];
    }

    // Repeat sample
    for (offset = note->sampleCount; offset < 0x40; offset += note->sampleCount) {
        lim = note->sampleCount;
        if (offset < 0 || offset > 0) {
            for (j = 0; j < lim; j++) {
                note->synthesisBuffers->samples[offset + j] = note->synthesisBuffers->samples[j];
            }
        } else {
            for (j = 0; j < lim; j++) {
                note->synthesisBuffers->samples[offset + j] = note->synthesisBuffers->samples[j];
            }
        }
    }

    osWritebackDCache(note->synthesisBuffers->samples, sizeof(note->synthesisBuffers->samples));
}

void init_synthetic_wave(struct Note *note, struct SequenceChannelLayer *seqLayer) {
    s32 sampleCount = note->sampleCount;
    build_synthetic_wave(note, seqLayer);
    if (sampleCount != 0) {
        note->samplePosInt *= note->sampleCount / sampleCount;
    } else {
        note->samplePosInt = 0;
    }
}

void init_note_list(struct AudioListItem *list) {
    list->prev = list;
    list->next = list;
    list->u.count = 0;
}

void init_note_lists(struct NotePool *pool) {
    init_note_list(&pool->disabled);
    init_note_list(&pool->decaying);
    init_note_list(&pool->releasing);
    init_note_list(&pool->active);
    pool->disabled.pool = pool;
    pool->decaying.pool = pool;
    pool->releasing.pool = pool;
    pool->active.pool = pool;
}

void init_note_free_list(void) {
    s32 i;

    init_note_lists(&gNoteFreeLists);
    for (i = 0; i < gMaxSimultaneousNotes; i++) {
        gNotes[i].listItem.u.value = &gNotes[i];
        gNotes[i].listItem.prev = NULL;
        audio_list_push_back(&gNoteFreeLists.disabled, &gNotes[i].listItem);
    }
}

void note_pool_clear(struct NotePool *pool) {
    s32 i;
    struct AudioListItem *source;
    struct AudioListItem *cur;
    struct AudioListItem *dest;
    s32 j;

    for (i = 0; i < 4; i++) {
        switch (i) {
            case 0:
                source = &pool->disabled;
                dest = &gNoteFreeLists.disabled;
                break;

            case 1:
                source = &pool->decaying;
                dest = &gNoteFreeLists.decaying;
                break;

            case 2:
                source = &pool->releasing;
                dest = &gNoteFreeLists.releasing;
                break;

            case 3:
                source = &pool->active;
                dest = &gNoteFreeLists.active;
                break;
        }

        j = 0;
        do {
            cur = source->next;
            if (cur == source) {
                break;
            }
            audio_list_remove(cur);
            audio_list_push_back(dest, cur);
            j++;
        } while (j <= gMaxSimultaneousNotes);
    }
}

void note_pool_fill(struct NotePool *pool, s32 count) {
    s32 i;
    s32 j;
    struct Note *note;
    struct AudioListItem *source;
    struct AudioListItem *dest;

    note_pool_clear(pool);

    for (i = 0, j = 0; j < count; i++) {
        if (i == 4) {
            return;
        }

        switch (i) {
            case 0:
                source = &gNoteFreeLists.disabled;
                dest = &pool->disabled;
                break;

            case 1:
                source = &gNoteFreeLists.decaying;
                dest = &pool->decaying;
                break;

            case 2:
                source = &gNoteFreeLists.releasing;
                dest = &pool->releasing;
                break;

            case 3:
                source = &gNoteFreeLists.active;
                dest = &pool->active;
                break;
        }

        while (j < count) {
            note = audio_list_pop_back(source);
            if (note == NULL) {
                break;
            }
            audio_list_push_back(dest, &note->listItem);
            j++;
        }
    }
}

void audio_list_push_front(struct AudioListItem *list, struct AudioListItem *item) {
    // add 'item' to the front of the list given by 'list', if it's not in any list
    if (item->prev == NULL) {
        item->prev = list;
        item->next = list->next;
        list->next->prev = item;
        list->next = item;
        list->u.count++;
        item->pool = list->pool;
    }
}

void audio_list_remove(struct AudioListItem *item) {
    // remove 'item' from the list it's in, if any
    if (item->prev != NULL) {
        item->prev->next = item->next;
        item->next->prev = item->prev;
        item->prev = NULL;
    }
}

struct Note *pop_node_with_value_less_equal(struct AudioListItem *list, s32 limit) {
    struct AudioListItem *cur = list->next;
    struct AudioListItem *best;

    if (cur == list) {
        return NULL;
    }

    best = cur;
    for (; cur != list; cur = cur->next) {
        if (((struct Note *) best->u.value)->priority >= ((struct Note *) cur->u.value)->priority) {
            best = cur;
        }
    }

    if (limit < ((struct Note *) best->u.value)->priority) {
        return NULL;
    }

    audio_list_remove(best);
    return best->u.value;
}

s32 note_init_for_layer(struct Note *note, struct SequenceChannelLayer *seqLayer) {
    note->prevParentLayer = NO_LAYER;
    note->parentLayer = seqLayer;
    note->priority = seqLayer->seqChannel->notePriority;
    if (IS_BANK_LOAD_COMPLETE(seqLayer->seqChannel->bankId) == FALSE) {
        return TRUE;
    }

    note->bankId = seqLayer->seqChannel->bankId;
    note->stereoHeadsetEffects = seqLayer->seqChannel->stereoHeadsetEffects;
    note->sound = seqLayer->sound;
    seqLayer->status = SOUND_LOAD_STATUS_DISCARDABLE; // "loaded"
    seqLayer->note = note;
    seqLayer->seqChannel->noteUnused = note;
    seqLayer->seqChannel->layerUnused = seqLayer;
    if (note->sound == NULL) {
        build_synthetic_wave(note, seqLayer);
    }
    note_init(note);
    return FALSE;
}

void func_80319728(struct Note *note, struct SequenceChannelLayer *seqLayer) {
    seq_channel_layer_note_release(note->parentLayer);
    note->wantedParentLayer = seqLayer;
}

void note_release_and_take_ownership(struct Note *note, struct SequenceChannelLayer *seqLayer) {
    note->wantedParentLayer = seqLayer;
    note->priority = NOTE_PRIORITY_STOPPING;
    note->adsr.fadeOutVel = 0x8000 / gAudioUpdatesPerFrame;
    note->adsr.action |= ADSR_ACTION_RELEASE;
}

struct Note *alloc_note_from_disabled(struct NotePool *pool, struct SequenceChannelLayer *seqLayer) {
    struct Note *note = audio_list_pop_back(&pool->disabled);
    if (note != NULL) {
        if (note_init_for_layer(note, seqLayer) == TRUE) {
            audio_list_push_front(&gNoteFreeLists.disabled, &note->listItem);
            return NULL;
        }

        audio_list_push_front(&pool->active, &note->listItem);
    }
    return note;
}

struct Note *alloc_note_from_decaying(struct NotePool *pool, struct SequenceChannelLayer *seqLayer) {
    struct Note *note = audio_list_pop_back(&pool->decaying);
    if (note != NULL) {
        note_release_and_take_ownership(note, seqLayer);
        audio_list_push_back(&pool->releasing, &note->listItem);
    }
    return note;
}

struct Note *alloc_note_from_active(struct NotePool *pool, struct SequenceChannelLayer *seqLayer) {
    struct Note *note =
        pop_node_with_value_less_equal(&pool->active, seqLayer->seqChannel->notePriority);
    if (note != NULL) {
        func_80319728(note, seqLayer);
        audio_list_push_back(&pool->releasing, &note->listItem);
    }
    return note;
}

struct Note *alloc_note(struct SequenceChannelLayer *seqLayer) {
    struct Note *ret;
    u32 policy = seqLayer->seqChannel->noteAllocPolicy;

    if (policy & NOTE_ALLOC_LAYER) {
        ret = seqLayer->note;
        if (ret != NULL && ret->prevParentLayer == seqLayer) {
            note_release_and_take_ownership(ret, seqLayer);
            audio_list_remove(&ret->listItem);
            audio_list_push_back(&gNoteFreeLists.releasing, &ret->listItem);
            return ret;
        }
    }

    if (policy & NOTE_ALLOC_CHANNEL) {
        if (!(ret = alloc_note_from_disabled(&seqLayer->seqChannel->notePool, seqLayer))
            && !(ret = alloc_note_from_decaying(&seqLayer->seqChannel->notePool, seqLayer))
            && !(ret = alloc_note_from_active(&seqLayer->seqChannel->notePool, seqLayer))) {
            seqLayer->status = SOUND_LOAD_STATUS_NOT_LOADED;
            return NULL;
        }
        return ret;
    }

    if (policy & NOTE_ALLOC_SEQ) {
        if (!(ret = alloc_note_from_disabled(&seqLayer->seqChannel->notePool, seqLayer))
            && !(ret = alloc_note_from_disabled(&seqLayer->seqChannel->seqPlayer->notePool, seqLayer))
            && !(ret = alloc_note_from_decaying(&seqLayer->seqChannel->notePool, seqLayer))
            && !(ret = alloc_note_from_decaying(&seqLayer->seqChannel->seqPlayer->notePool, seqLayer))
            && !(ret = alloc_note_from_active(&seqLayer->seqChannel->notePool, seqLayer))
            && !(ret = alloc_note_from_active(&seqLayer->seqChannel->seqPlayer->notePool, seqLayer))) {
            seqLayer->status = SOUND_LOAD_STATUS_NOT_LOADED;
            return NULL;
        }
        return ret;
    }

    if (policy & NOTE_ALLOC_GLOBAL_FREELIST) {
        if (!(ret = alloc_note_from_disabled(&gNoteFreeLists, seqLayer))
            && !(ret = alloc_note_from_decaying(&gNoteFreeLists, seqLayer))
            && !(ret = alloc_note_from_active(&gNoteFreeLists, seqLayer))) {
            seqLayer->status = SOUND_LOAD_STATUS_NOT_LOADED;
            return NULL;
        }
        return ret;
    }

    if (!(ret = alloc_note_from_disabled(&seqLayer->seqChannel->notePool, seqLayer))
        && !(ret = alloc_note_from_disabled(&seqLayer->seqChannel->seqPlayer->notePool, seqLayer))
        && !(ret = alloc_note_from_disabled(&gNoteFreeLists, seqLayer))
        && !(ret = alloc_note_from_decaying(&seqLayer->seqChannel->notePool, seqLayer))
        && !(ret = alloc_note_from_decaying(&seqLayer->seqChannel->seqPlayer->notePool, seqLayer))
        && !(ret = alloc_note_from_decaying(&gNoteFreeLists, seqLayer))
        && !(ret = alloc_note_from_active(&seqLayer->seqChannel->notePool, seqLayer))
        && !(ret = alloc_note_from_active(&seqLayer->seqChannel->seqPlayer->notePool, seqLayer))
        && !(ret = alloc_note_from_active(&gNoteFreeLists, seqLayer))) {
        seqLayer->status = SOUND_LOAD_STATUS_NOT_LOADED;
        return NULL;
    }
    return ret;
}

void reclaim_notes(void) {
    struct Note *note;
    s32 i;
    s32 cond;

    for (i = 0; i < gMaxSimultaneousNotes; i++) {
        note = &gNotes[i];
        if (note->parentLayer != NO_LAYER) {
            cond = FALSE;
            if (!note->parentLayer->enabled && note->priority >= NOTE_PRIORITY_MIN) {
                cond = TRUE;
            } else if (note->parentLayer->seqChannel == NULL) {
                audio_list_push_back(&gLayerFreeList, &note->parentLayer->listItem);
                seq_channel_layer_disable(note->parentLayer);
                note->priority = NOTE_PRIORITY_STOPPING;
            } else if (note->parentLayer->seqChannel->seqPlayer == NULL) {
                sequence_channel_disable(note->parentLayer->seqChannel);
                note->priority = NOTE_PRIORITY_STOPPING;
            } else if (note->parentLayer->seqChannel->seqPlayer->muted) {
                if (note->parentLayer->seqChannel->muteBehavior
                    & (MUTE_BEHAVIOR_STOP_SCRIPT | MUTE_BEHAVIOR_STOP_NOTES)) {
                    cond = TRUE;
                }
            } else {
                cond = FALSE;
            }

            if (cond) {
                seq_channel_layer_note_release(note->parentLayer);
                audio_list_remove(&note->listItem);
                audio_list_push_front(&note->listItem.pool->disabled, &note->listItem);
                note->priority = NOTE_PRIORITY_STOPPING;
            }
        }
    }
}

void note_init_all(void) {
    struct Note *note;
    s32 i;

    for (i = 0; i < gMaxSimultaneousNotes; i++) {
        note = &gNotes[i];
        note->enabled = FALSE;
        note->stereoStrongRight = FALSE;
        note->stereoStrongLeft = FALSE;
        note->stereoHeadsetEffects = FALSE;
        note->priority = NOTE_PRIORITY_DISABLED;
        note->parentLayer = NO_LAYER;
        note->wantedParentLayer = NO_LAYER;
        note->prevParentLayer = NO_LAYER;
        note->reverb = 0;
        note->usesHeadsetPanEffects = FALSE;
        note->sampleCount = 0;
        note->instOrWave = 0;
        note->targetVolLeft = 0;
        note->targetVolRight = 0;
        note->frequency = 0.0f;
        note->unused1 = 0x3f;
        note->attributes.velocity = 0.0f;
        note->adsrVolScale = 0;
        note->adsr.state = ADSR_STATE_DISABLED;
        note->adsr.action = 0;
        note->vibratoState.active = FALSE;
        note->portamento.cur = 0.0f;
        note->portamento.speed = 0.0f;
        note->synthesisBuffers = soundAlloc(&gNotesAndBuffersPool, sizeof(struct NoteSynthesisBuffers));
    }
}
