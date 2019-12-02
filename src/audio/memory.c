#include <ultra64.h>
#include <macros.h>

#include "memory.h"
#include "data.h"
#include "load.h"
#include "synthesis.h"
#include "seqplayer.h"
#include "effects.h"

#define ALIGN16(val) (((val) + 0xF) & ~0xF)

struct PoolSplit {
    u32 wantSeq;
    u32 wantBank;
    u32 wantUnused;
    u32 wantCustom;
}; // size = 0x10

struct PoolSplit2 {
    u32 wantPersistent;
    u32 wantTemporary;
}; // size = 0x8

s16 gVolume;
s8 gReverbDownsampleRate;
u8 sReverbDownsampleRateLog; // never read

struct SoundAllocPool gAudioSessionPool;
struct SoundAllocPool gAudioInitPool;
struct SoundAllocPool gNotesAndBuffersPool;
u8 sAudioMemoryPad[0x20]; // probably two unused pools
struct SoundAllocPool gSeqAndBankPool;
struct SoundAllocPool gPersistentCommonPool;
struct SoundAllocPool gTemporaryCommonPool;
struct SoundMultiPool gSeqLoadedPool;
struct SoundMultiPool gBankLoadedPool;
struct SoundMultiPool gUnusedLoadedPool;

struct PoolSplit sSessionPoolSplit;
struct PoolSplit2 sSeqAndBankPoolSplit;
struct PoolSplit sPersistentCommonPoolSplit;
struct PoolSplit sTemporaryCommonPoolSplit;

u8 gBankLoadStatus[0x40];
u8 gSeqLoadStatus[0x100];

u8 gAudioUnusedBuffer[0x1000];

extern s32 gMaxAudioCmds;

void reset_bank_and_seq_load_status(void) {
    s32 i;

    for (i = 0; i < 64; i++) {
        gBankLoadStatus[i] = SOUND_LOAD_STATUS_NOT_LOADED;
    }

    for (i = 0; i < 256; i++) {
        gSeqLoadStatus[i] = SOUND_LOAD_STATUS_NOT_LOADED;
    }
}

void discard_bank(s32 bankId) {
    s32 i;

    for (i = 0; i < gMaxSimultaneousNotes; i++) {
        struct Note *note = &gNotes[i];

        if (note->bankId == bankId) {
            if (note->priority >= NOTE_PRIORITY_MIN) {
                note->parentLayer->enabled = FALSE;
                note->parentLayer->finished = TRUE;
            }
            note_disable(note);
            audio_list_remove(&note->listItem);
            audio_list_push_back(&gNoteFreeLists.disabled, &note->listItem);
        }
    }
}

void discard_sequence(s32 seqId) {
    s32 i;

    for (i = 0; i < SEQUENCE_PLAYERS; i++) {
        if (gSequencePlayers[i].enabled && gSequencePlayers[i].seqId == seqId) {
            sequence_player_disable(gSequencePlayers + i);
        }
    }
}

void *soundAlloc(struct SoundAllocPool *pool, u32 size) {
    s32 last;
    s32 i;
    u8 *start;

    if ((pool->cur + ALIGN16(size) <= pool->size + pool->start)) {
        start = pool->cur;
        pool->cur += ALIGN16(size);
        last = pool->cur - start - 1;
        for (i = 0; i <= last; i++) {
            start[i] = 0;
        }
    } else {
        return NULL;
    }

    return start;
}

void sound_alloc_pool_init(struct SoundAllocPool *pool, void *memAddr, u32 size) {
    pool->cur = pool->start = (u8 *) ALIGN16((uintptr_t) memAddr);
    pool->size = size;
    pool->unused = 0;
}

void persistent_pool_clear(struct PersistentPool *persistent) {
    persistent->pool.unused = 0;
    persistent->pool.cur = persistent->pool.start;
    persistent->numEntries = 0;
}

void temporary_pool_clear(struct TemporaryPool *temporary) {
    temporary->pool.unused = 0;
    temporary->pool.cur = temporary->pool.start;
    temporary->nextSide = 0;
    temporary->entries[0].ptr = temporary->pool.start;
    temporary->entries[1].ptr = temporary->pool.size + temporary->pool.start;
    temporary->entries[0].id = -1;
    temporary->entries[1].id = -1;
}

void unused_803160F8(struct SoundAllocPool *pool) {
    pool->unused = 0;
    pool->cur = pool->start;
}

void sound_init_main_pools(s32 sizeForAudioInitPool) {
    sound_alloc_pool_init(&gAudioInitPool, gAudioHeap, sizeForAudioInitPool);
    sound_alloc_pool_init(&gAudioSessionPool, gAudioHeap + sizeForAudioInitPool, gAudioHeapSize - sizeForAudioInitPool);
}

void session_pools_init(struct PoolSplit *a) {
    gAudioSessionPool.cur = gAudioSessionPool.start;
    sound_alloc_pool_init(&gNotesAndBuffersPool, soundAlloc(&gAudioSessionPool, a->wantSeq), a->wantSeq);
    sound_alloc_pool_init(&gSeqAndBankPool, soundAlloc(&gAudioSessionPool, a->wantCustom), a->wantCustom);
}

void seq_and_bank_pool_init(struct PoolSplit2 *a) {
    gSeqAndBankPool.cur = gSeqAndBankPool.start;
    sound_alloc_pool_init(&gPersistentCommonPool, soundAlloc(&gSeqAndBankPool, a->wantPersistent), a->wantPersistent);
    sound_alloc_pool_init(&gTemporaryCommonPool, soundAlloc(&gSeqAndBankPool, a->wantTemporary), a->wantTemporary);
}

void persistent_pools_init(struct PoolSplit *a) {
    gPersistentCommonPool.cur = gPersistentCommonPool.start;
    sound_alloc_pool_init(&gSeqLoadedPool.persistent.pool, soundAlloc(&gPersistentCommonPool, a->wantSeq), a->wantSeq);
    sound_alloc_pool_init(&gBankLoadedPool.persistent.pool, soundAlloc(&gPersistentCommonPool, a->wantBank), a->wantBank);
    sound_alloc_pool_init(&gUnusedLoadedPool.persistent.pool, soundAlloc(&gPersistentCommonPool, a->wantUnused),
                  a->wantUnused);
    persistent_pool_clear(&gSeqLoadedPool.persistent);
    persistent_pool_clear(&gBankLoadedPool.persistent);
    persistent_pool_clear(&gUnusedLoadedPool.persistent);
}

void temporary_pools_init(struct PoolSplit *a) {
    gTemporaryCommonPool.cur = gTemporaryCommonPool.start;
    sound_alloc_pool_init(&gSeqLoadedPool.temporary.pool, soundAlloc(&gTemporaryCommonPool, a->wantSeq), a->wantSeq);
    sound_alloc_pool_init(&gBankLoadedPool.temporary.pool, soundAlloc(&gTemporaryCommonPool, a->wantBank), a->wantBank);
    sound_alloc_pool_init(&gUnusedLoadedPool.temporary.pool, soundAlloc(&gTemporaryCommonPool, a->wantUnused),
                  a->wantUnused);
    temporary_pool_clear(&gSeqLoadedPool.temporary);
    temporary_pool_clear(&gBankLoadedPool.temporary);
    temporary_pool_clear(&gUnusedLoadedPool.temporary);
}

static void unused_803163D4() {
}

#ifdef NON_MATCHING
void *alloc_bank_or_seq(struct SoundMultiPool *arg0, s32 arg1, s32 size, s32 arg3, s32 id) {
    // arg3 = 0, 1 or 2?

    u8 *table;  // sp5C
    u8 isSound; // sp5B
    struct SoundAllocPool *pool;
    void *ret;
    u32 firstVal;
    u32 secondVal;
    u32 bothDiscardable;
    u32 leftDiscardable, rightDiscardable;
    u32 leftNotLoaded, rightNotLoaded;
    u32 leftAvail, rightAvail;
    UNUSED s32 temp;
    struct TemporaryPool *v1; // sp30
    struct PersistentPool *persistent = &arg0->persistent;

    if (arg3 == 0) {
        v1 = &arg0->temporary;
        if (arg0 == &gSeqLoadedPool) {
            table = gSeqLoadStatus;
            isSound = FALSE;
        } else if (arg0 == &gBankLoadedPool) {
            table = gBankLoadStatus;
            isSound = TRUE;
        }

        firstVal = (v1->entries[0].id == -1 ? SOUND_LOAD_STATUS_NOT_LOADED
                                            : table[v1->entries[0].id]); // a3, a2
        secondVal =
            (v1->entries[1].id == -1 ? SOUND_LOAD_STATUS_NOT_LOADED : table[v1->entries[1].id]); // a1
        leftNotLoaded = (firstVal == SOUND_LOAD_STATUS_NOT_LOADED);
        leftDiscardable = (firstVal == SOUND_LOAD_STATUS_DISCARDABLE); // t0
        leftAvail = (firstVal != SOUND_LOAD_STATUS_IN_PROGRESS);
        rightNotLoaded = (secondVal == SOUND_LOAD_STATUS_NOT_LOADED);
        rightDiscardable = (secondVal == SOUND_LOAD_STATUS_DISCARDABLE);
        rightAvail = (secondVal != SOUND_LOAD_STATUS_IN_PROGRESS);
        bothDiscardable = (leftDiscardable && rightDiscardable); // a0

        if (leftNotLoaded) {
            v1->nextSide = 0;
        } else if (rightNotLoaded) {
            v1->nextSide = 1;
        } else if (bothDiscardable) {
            // Use the opposite side from last time.
        } else if (leftDiscardable) {
            v1->nextSide = 0;
        } else if (rightDiscardable) {
            v1->nextSide = 1;
        } else if (leftAvail) {
            v1->nextSide = 0;
        } else if (rightAvail) {
            v1->nextSide = 1;
        } else {
            // Both left and right sides are being loaded into.
            return NULL;
        }

        if (v1->entries[v1->nextSide].id != -1) {
            table[v1->entries[v1->nextSide].id] = SOUND_LOAD_STATUS_NOT_LOADED;
            if (isSound == TRUE) {
                discard_bank(v1->entries[v1->nextSide].id);
            }
        }

        pool = &arg0->temporary.pool; // a1
        switch (v1->nextSide) {
            case 0:
                v1->entries[0].ptr = pool->start;
                v1->entries[0].id = id;
                v1->entries[0].size = size;

                pool->cur = pool->start + size;

                if (v1->entries[1].ptr < pool->cur) {
                    // Throw out the entry on the other side if it doesn't fit.
                    // (possible @bug: what if it's currently being loaded?)
                    table[v1->entries[1].id] = SOUND_LOAD_STATUS_NOT_LOADED;

                    switch (isSound) {
                        case FALSE:
                            discard_sequence(v1->entries[1].id);
                            break;
                        case TRUE:
                            discard_bank(v1->entries[1].id);
                            break;
                    }

                    v1->entries[1].id = -1;
                    v1->entries[1].ptr = pool->size + pool->start;
                }

                ret = v1->entries[0].ptr;
                break;

            case 1:
                v1->entries[1].ptr = pool->size + pool->start - size - 0x10;
                v1->entries[1].id = id;
                v1->entries[1].size = size;

                if (v1->entries[1].ptr < pool->cur) {
                    table[v1->entries[0].id] = SOUND_LOAD_STATUS_NOT_LOADED;

                    switch (isSound) {
                        case FALSE:
                            discard_sequence(v1->entries[0].id);
                            break;
                        case TRUE:
                            discard_bank(v1->entries[0].id);
                            break;
                    }

                    v1->entries[0].id = -1;
                    pool->cur = pool->start;
                }

                ret = v1->entries[1].ptr;
                break;

            default:
                return NULL;
        }

        // Switch sides for next time in case both entries are
        // SOUND_LOAD_STATUS_DISCARDABLE.
        v1->nextSide ^= 1;

        return ret;
    }

    persistent->entries[persistent->numEntries].ptr = soundAlloc(&persistent->pool, arg1 * size);

    if (persistent->entries[persistent->numEntries].ptr == NULL) {
        switch (arg3) {
            case 2:
                // Prevent tail call optimization.
                ret = alloc_bank_or_seq(arg0, arg1, size, 0, id);
                return ret;
            case 1:
                return NULL;
        }
    }

    // TODO: why is this guaranteed to write <= 32 entries...?
    // Because the buffer is small enough that more don't fit?
    persistent->entries[persistent->numEntries].id = id;
    persistent->entries[persistent->numEntries].size = size;
    persistent->numEntries++;
    return persistent->entries[persistent->numEntries - 1].ptr;
}

#else
GLOBAL_ASM("asm/non_matchings/alloc_bank_or_seq.s")
#endif

void *get_bank_or_seq(struct SoundMultiPool *arg0, s32 arg1, s32 id) {
    u32 i;
    void *ret;
    struct TemporaryPool *temporary = &arg0->temporary;

    if (arg1 == 0) {
        // Try not to overwrite sound that we have just accessed, by setting nextSide appropriately.
        if (temporary->entries[0].id == id) {
            temporary->nextSide = 1;
            return temporary->entries[0].ptr;
        } else if (temporary->entries[1].id == id) {
            temporary->nextSide = 0;
            return temporary->entries[1].ptr;
        }
        return NULL;
    } else {
        struct PersistentPool *persistent = &arg0->persistent;
        for (i = 0; i < persistent->numEntries; i++) {
            if (id == persistent->entries[i].id) {
                return persistent->entries[i].ptr;
            }
        }

        if (arg1 == 2) {
            // Prevent tail call optimization by using a temporary.
            // (Did they compile with -Wo,-notail?)
            ret = get_bank_or_seq(arg0, 0, id);
            return ret;
        }
        return NULL;
    }
}

void decrease_reverb_gain(void) {
    gSynthesisReverb.reverbGain -= gSynthesisReverb.reverbGain / 4;
}

/**
 * Waits until a specified number of audio frames have been created
 */
void wait_for_audio_frames(s32 frames) {
    gAudioFrameCount = 0;
    // Sound thread will update gAudioFrameCount
    while (gAudioFrameCount < frames) {
        // spin
    }
}

void audio_reset_session(struct AudioSessionSettings *preset) {
    s8 updatesPerFrame;
    s16 *mem;
    s32 reverbWindowSize;
    s32 i;
    s32 j;
    s32 k;
    s32 persistentMem;
    s32 temporaryMem;
    s32 totalMem;
    s32 wantMisc;
    s32 frames;
    s32 remainingDmas;

    if (gAudioLoadLock != AUDIO_LOCK_UNINITIALIZED) {
        decrease_reverb_gain();
        for (i = 0; i < gMaxSimultaneousNotes; i++) {
            if (gNotes[i].enabled && gNotes[i].adsr.state != ADSR_STATE_DISABLED) {
                gNotes[i].adsr.fadeOutVel = 0x8000 / gAudioUpdatesPerFrame;
                gNotes[i].adsr.action |= ADSR_ACTION_RELEASE;
            }
        }

        // Wait for all notes to stop playing
        frames = 0;
        for (;;) {
            wait_for_audio_frames(1);
            frames++;
            if (frames > 4 * 60) {
                // Break after 4 seconds
                break;
            }

            for (i = 0; i < gMaxSimultaneousNotes; i++) {
                if (gNotes[i].enabled)
                    break;
            }

            if (i == gMaxSimultaneousNotes) {
                // All zero, break early
                break;
            }
        }

        // Wait for the reverb to finish as well
        decrease_reverb_gain();
        wait_for_audio_frames(3);

        // The audio interface is double buffered; thus, we have to take the
        // load lock for 2 frames for the buffers to free up before we can
        // repurpose memory. Make that 3 frames, just in case.
        gAudioLoadLock = AUDIO_LOCK_LOADING;
        wait_for_audio_frames(3);

        remainingDmas = gCurrAudioFrameDmaCount;
        while (remainingDmas > 0) {
            for (i = 0; i < gCurrAudioFrameDmaCount; i++) {
                if (osRecvMesg(&gCurrAudioFrameDmaQueue, NULL, OS_MESG_NOBLOCK) == 0)
                    remainingDmas--;
            }
        }
        gCurrAudioFrameDmaCount = 0;

        for (j = 0; j < NUMAIBUFFERS; j++) {
            for (k = 0; k < 0x500; k++) {
                gAiBuffers[j][k] = 0;
            }
        }
    }

    gSampleDmaNumListItems = 0;
    reverbWindowSize = preset->reverbWindowSize;
    gAiFrequency = osAiSetFrequency(preset->frequency);
    gMaxSimultaneousNotes = preset->maxSimultaneousNotes;
    gSamplesPerFrameTarget = ALIGN16(gAiFrequency / 60);
    gReverbDownsampleRate = preset->reverbDownsampleRate;

    switch (gReverbDownsampleRate) {
        case 1:
            sReverbDownsampleRateLog = 0;
            break;
        case 2:
            sReverbDownsampleRateLog = 1;
            break;
        case 4:
            sReverbDownsampleRateLog = 2;
            break;
        case 8:
            sReverbDownsampleRateLog = 3;
            break;
        case 16:
            sReverbDownsampleRateLog = 4;
            break;
        default:
            sReverbDownsampleRateLog = 0;
    }

    gReverbDownsampleRate = preset->reverbDownsampleRate;
    gVolume = preset->volume;
    gMinAiBufferLength = gSamplesPerFrameTarget - 0x10;
    updatesPerFrame = gSamplesPerFrameTarget / 160 + 1;
    gAudioUpdatesPerFrame = gSamplesPerFrameTarget / 160 + 1;

    // Compute conversion ratio from the internal unit tatums/tick to the
    // external beats/minute (JP) or tatums/minute (US). In practice this is
    // 300 on JP and 14360 on US.
#ifdef VERSION_JP
    gTempoInternalToExternal = updatesPerFrame * 3600 / gTatumsPerBeat;
#else
    gTempoInternalToExternal = (u32)(updatesPerFrame * 2880000.0f / gTatumsPerBeat / 16.713f);
#endif

    gMaxAudioCmds = gMaxSimultaneousNotes * 20 * updatesPerFrame + 320;
    persistentMem = DOUBLE_SIZE_ON_64_BIT(preset->persistentBankMem + preset->persistentSeqMem);
    temporaryMem = DOUBLE_SIZE_ON_64_BIT(preset->temporaryBankMem + preset->temporarySeqMem);
    totalMem = persistentMem + temporaryMem;
    wantMisc = gAudioSessionPool.size - totalMem - 0x100;
    sSessionPoolSplit.wantSeq = wantMisc;
    sSessionPoolSplit.wantCustom = totalMem;
    session_pools_init(&sSessionPoolSplit);
    sSeqAndBankPoolSplit.wantPersistent = persistentMem;
    sSeqAndBankPoolSplit.wantTemporary = temporaryMem;
    seq_and_bank_pool_init(&sSeqAndBankPoolSplit);
    sPersistentCommonPoolSplit.wantSeq = DOUBLE_SIZE_ON_64_BIT(preset->persistentSeqMem);
    sPersistentCommonPoolSplit.wantBank = DOUBLE_SIZE_ON_64_BIT(preset->persistentBankMem);
    sPersistentCommonPoolSplit.wantUnused = 0;
    persistent_pools_init(&sPersistentCommonPoolSplit);
    sTemporaryCommonPoolSplit.wantSeq = DOUBLE_SIZE_ON_64_BIT(preset->temporarySeqMem);
    sTemporaryCommonPoolSplit.wantBank = DOUBLE_SIZE_ON_64_BIT(preset->temporaryBankMem);
    sTemporaryCommonPoolSplit.wantUnused = 0;
    temporary_pools_init(&sTemporaryCommonPoolSplit);
    reset_bank_and_seq_load_status();

    for (j = 0; j < 2; j++) {
        gAudioCmdBuffers[j] = soundAlloc(&gNotesAndBuffersPool, gMaxAudioCmds * sizeof(u64));
    }

    gNotes = soundAlloc(&gNotesAndBuffersPool, gMaxSimultaneousNotes * sizeof(struct Note));
    note_init_all();
    init_note_free_list();

    if (reverbWindowSize == 0) {
        gSynthesisReverb.useReverb = 0;
    } else {
        gSynthesisReverb.useReverb = 8;
        gSynthesisReverb.ringBuffer.left = soundAlloc(&gNotesAndBuffersPool, reverbWindowSize * 2);
        gSynthesisReverb.ringBuffer.right = soundAlloc(&gNotesAndBuffersPool, reverbWindowSize * 2);
        gSynthesisReverb.nextRingBufferPos = 0;
        gSynthesisReverb.unkC = 0;
        gSynthesisReverb.curFrame = 0;
        gSynthesisReverb.bufSizePerChannel = reverbWindowSize;
        gSynthesisReverb.reverbGain = preset->reverbGain;
        gSynthesisReverb.framesLeftToIgnore = 2;
        if (gReverbDownsampleRate != 1) {
            gSynthesisReverb.resampleFlags = A_INIT;
            gSynthesisReverb.resampleRate = 0x8000 / gReverbDownsampleRate;
            gSynthesisReverb.resampleStateLeft = soundAlloc(&gNotesAndBuffersPool, 16 * sizeof(s16));
            gSynthesisReverb.resampleStateRight = soundAlloc(&gNotesAndBuffersPool, 16 * sizeof(s16));
            gSynthesisReverb.unk24 = soundAlloc(&gNotesAndBuffersPool, 16 * sizeof(s16));
            gSynthesisReverb.unk28 = soundAlloc(&gNotesAndBuffersPool, 16 * sizeof(s16));
            for (i = 0; i < gAudioUpdatesPerFrame; i++) {
                mem = soundAlloc(&gNotesAndBuffersPool, DEFAULT_LEN_2CH);
                gSynthesisReverb.items[0][i].toDownsampleLeft = mem;
                gSynthesisReverb.items[0][i].toDownsampleRight = mem + 0xA0;
                mem = soundAlloc(&gNotesAndBuffersPool, DEFAULT_LEN_2CH);
                gSynthesisReverb.items[1][i].toDownsampleLeft = mem;
                gSynthesisReverb.items[1][i].toDownsampleRight = mem + 0xA0;
            }
        }
    }

    init_sample_dma_buffers(gMaxSimultaneousNotes);
    osWritebackDCacheAll();
    if (gAudioLoadLock != AUDIO_LOCK_UNINITIALIZED) {
        gAudioLoadLock = AUDIO_LOCK_NOT_LOADING;
    }
}
