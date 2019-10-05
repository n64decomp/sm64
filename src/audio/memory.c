#include <ultra64.h>
#include <macros.h>

#include "memory.h"
#include "data.h"
#include "load.h"
#include "synthesis.h"
#include "seqplayer.h"
#include "effects.h"

#define ALIGN16(val) (((val) + 0xF) & ~0xF)

struct Struct803161E0 {
    u32 wantSeq;
    u32 wantBank;
    u32 wantUnused;
    u32 wantCustom;
}; // size = 0x10

struct U32Pair {
    u32 wantPersistent;
    u32 wantTemporary;
}; // size = 0x8

s16 D_802212A0;
s8 D_802212A2;
u8 D_802212A3;

struct SoundAllocPool D_802212A8;
struct SoundAllocPool gSoundPool;
struct SoundAllocPool D_802212C8;
u8 sAudioMemoryPad[0x20]; // probably two unused pools
struct SoundAllocPool D_802212F8;
struct SoundAllocPool D_80221308;
struct SoundAllocPool D_80221318;
struct SoundMultiPool gSeqLoadedPool;
struct SoundMultiPool gBankLoadedPool;
struct SoundMultiPool gUnusedLoadedPool;

struct Struct803161E0 D_80221898;
struct U32Pair D_802218A8;
struct Struct803161E0 D_802218B0;
struct Struct803161E0 D_802218C0;

u8 gBankLoadStatus[0x40];
u8 gSeqLoadStatus[0x100];

u8 gAudioUnusedBuffer[0x1000];

extern s32 D_80226D6C;

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

void func_80316094(struct SoundAllocPool *pool, void *arg1, u32 arg2) {
    pool->cur = pool->start = (u8 *) (((uintptr_t) arg1 + 0xf) & -0x10);
    pool->size = arg2;
    pool->unused = 0;
}

void func_803160B4(struct PersistentPool *persistent) {
    persistent->pool.unused = 0;
    persistent->pool.cur = persistent->pool.start;
    persistent->numEntries = 0;
}

void func_803160C8(struct TemporaryPool *temporary) {
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

void func_80316108(s32 arg0) {
    func_80316094(&gSoundPool, gAudioHeap, arg0);
    func_80316094(&D_802212A8, gAudioHeap + arg0, gAudioHeapSize - arg0);
}

void func_80316164(struct Struct803161E0 *a) {
    D_802212A8.cur = D_802212A8.start;
    func_80316094(&D_802212C8, soundAlloc(&D_802212A8, a->wantSeq), a->wantSeq);
    func_80316094(&D_802212F8, soundAlloc(&D_802212A8, a->wantCustom), a->wantCustom);
}

void func_803161E0(struct U32Pair *a) {
    D_802212F8.cur = D_802212F8.start;
    func_80316094(&D_80221308, soundAlloc(&D_802212F8, a->wantPersistent), a->wantPersistent);
    func_80316094(&D_80221318, soundAlloc(&D_802212F8, a->wantTemporary), a->wantTemporary);
}

void func_8031625C(struct Struct803161E0 *a) {
    D_80221308.cur = D_80221308.start;
    func_80316094(&gSeqLoadedPool.persistent.pool, soundAlloc(&D_80221308, a->wantSeq), a->wantSeq);
    func_80316094(&gBankLoadedPool.persistent.pool, soundAlloc(&D_80221308, a->wantBank), a->wantBank);
    func_80316094(&gUnusedLoadedPool.persistent.pool, soundAlloc(&D_80221308, a->wantUnused),
                  a->wantUnused);
    func_803160B4(&gSeqLoadedPool.persistent);
    func_803160B4(&gBankLoadedPool.persistent);
    func_803160B4(&gUnusedLoadedPool.persistent);
}

void func_80316318(struct Struct803161E0 *a) {
    D_80221318.cur = D_80221318.start;
    func_80316094(&gSeqLoadedPool.temporary.pool, soundAlloc(&D_80221318, a->wantSeq), a->wantSeq);
    func_80316094(&gBankLoadedPool.temporary.pool, soundAlloc(&D_80221318, a->wantBank), a->wantBank);
    func_80316094(&gUnusedLoadedPool.temporary.pool, soundAlloc(&D_80221318, a->wantUnused),
                  a->wantUnused);
    func_803160C8(&gSeqLoadedPool.temporary);
    func_803160C8(&gBankLoadedPool.temporary);
    func_803160C8(&gUnusedLoadedPool.temporary);
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

void func_803168CC(void) {
    D_802211B0.unk4 -= D_802211B0.unk4 / 4;
}

/**
 * Waits until a specified number of audio frames have been created
 */
void wait_for_audio_frames(s32 frames) {
    gActiveAudioFrames = 0;
    // Sound thread will update gActiveAudioFrames
    while (gActiveAudioFrames < frames) {
        // spin
    }
}

void func_80316928(struct Struct80332190 *arg0) {
    s8 updatesPerFrame;
    s16 *mem;
    s32 sp2C;
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
        func_803168CC();
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

        func_803168CC();
        wait_for_audio_frames(3);
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
    sp2C = arg0->unk6;
    gAiFrequency = osAiSetFrequency(arg0->frequency);
    gMaxSimultaneousNotes = arg0->maxSimultaneousNotes;
    D_80226D74 = ALIGN16(gAiFrequency / 60);
    D_802212A2 = arg0->unk5;

    switch (D_802212A2) {
        case 1:
            D_802212A3 = 0;
            break;
        case 2:
            D_802212A3 = 1;
            break;
        case 4:
            D_802212A3 = 2;
            break;
        case 8:
            D_802212A3 = 3;
            break;
        case 16:
            D_802212A3 = 4;
            break;
        default:
            D_802212A3 = 0;
    }

    D_802212A2 = arg0->unk5;
    D_802212A0 = arg0->volume;
    gMinAiBufferLength = D_80226D74 - 0x10;
    updatesPerFrame = D_80226D74 / 160 + 1;
    gAudioUpdatesPerFrame = D_80226D74 / 160 + 1;

    // Compute conversion ratio from the internal unit tatums/tick to the
    // external beats/minute (JP) or tatums/minute (US). In practice this is
    // 300 on JP and 14360 on US.
#ifdef VERSION_JP
    gTempoInternalToExternal = updatesPerFrame * 3600 / gTatumsPerBeat;
#else
    gTempoInternalToExternal = (u32)(updatesPerFrame * 2880000.0f / gTatumsPerBeat / 16.713f);
#endif

    D_80226D6C = gMaxSimultaneousNotes * 20 * updatesPerFrame + 320;
    persistentMem = arg0->persistentBankMem + arg0->persistentSeqMem;
    temporaryMem = arg0->temporaryBankMem + arg0->temporarySeqMem;
    totalMem = persistentMem + temporaryMem;
    wantMisc = D_802212A8.size - totalMem - 0x100;
    D_80221898.wantSeq = wantMisc;
    D_80221898.wantCustom = totalMem;
    func_80316164(&D_80221898);
    D_802218A8.wantPersistent = persistentMem;
    D_802218A8.wantTemporary = temporaryMem;
    func_803161E0(&D_802218A8);
    D_802218B0.wantSeq = arg0->persistentSeqMem;
    D_802218B0.wantBank = arg0->persistentBankMem;
    D_802218B0.wantUnused = 0;
    func_8031625C(&D_802218B0);
    D_802218C0.wantSeq = arg0->temporarySeqMem;
    D_802218C0.wantBank = arg0->temporaryBankMem;
    D_802218C0.wantUnused = 0;
    func_80316318(&D_802218C0);
    reset_bank_and_seq_load_status();

    for (j = 0; j < 2; j++) {
        gAudioCmdBuffers[j] = soundAlloc(&D_802212C8, D_80226D6C * 8);
    }

    gNotes = soundAlloc(&D_802212C8, gMaxSimultaneousNotes * sizeof(struct Note));
    note_init_all();
    init_note_free_list();

    if (sp2C == 0) {
        D_802211B0.unk1 = 0;
    } else {
        D_802211B0.unk1 = 8;
        D_802211B0.unk14.unk00 = soundAlloc(&D_802212C8, sp2C * 2);
        D_802211B0.unk14.unk04 = soundAlloc(&D_802212C8, sp2C * 2);
        D_802211B0.unk8 = 0;
        D_802211B0.unkC = 0;
        D_802211B0.unk3 = 0;
        D_802211B0.unk10 = sp2C;
        D_802211B0.unk4 = arg0->unk8;
        D_802211B0.unk2 = 2;
        if (D_802212A2 != 1) {
            D_802211B0.unk0 = 1;
            D_802211B0.unk6 = 0x8000 / D_802212A2;
            D_802211B0.unk1C = soundAlloc(&D_802212C8, 32);
            D_802211B0.unk20 = soundAlloc(&D_802212C8, 32);
            D_802211B0.unk24 = soundAlloc(&D_802212C8, 32);
            D_802211B0.unk28 = soundAlloc(&D_802212C8, 32);
            for (i = 0; i < gAudioUpdatesPerFrame; i++) {
                mem = soundAlloc(&D_802212C8, 0x280);
                D_802211B0.unk2C[0][i].unk4 = mem;
                D_802211B0.unk2C[0][i].unk8 = mem + 0xA0;
                mem = soundAlloc(&D_802212C8, 0x280);
                D_802211B0.unk2C[1][i].unk4 = mem;
                D_802211B0.unk2C[1][i].unk8 = mem + 0xA0;
            }
        }
    }

    func_8031758C(gMaxSimultaneousNotes);
    osWritebackDCacheAll();
    if (gAudioLoadLock != AUDIO_LOCK_UNINITIALIZED) {
        gAudioLoadLock = AUDIO_LOCK_NOT_LOADING;
    }
}
