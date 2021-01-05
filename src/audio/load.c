#include <ultra64.h>

#include "data.h"
#include "external.h"
#include "heap.h"
#include "load.h"
#include "seqplayer.h"

#define ALIGN16(val) (((val) + 0xF) & ~0xF)

struct SharedDma {
    /*0x0*/ u8 *buffer;       // target, points to pre-allocated buffer
    /*0x4*/ uintptr_t source; // device address
    /*0x8*/ u16 sizeUnused;   // set to bufSize, never read
    /*0xA*/ u16 bufSize;      // size of buffer
    /*0xC*/ u8 unused2;       // set to 0, never read
    /*0xD*/ u8 reuseIndex;    // position in sSampleDmaReuseQueue1/2, if ttl == 0
    /*0xE*/ u8 ttl;           // duration after which the DMA can be discarded
};                            // size = 0x10

// EU only
void port_eu_init(void);
// SH only
#if defined(VERSION_SH)
void func_sh_802f6a9c(void);
void func_sh_802f51d4(struct AudioBankSound *sound, struct AudioBank *memBase, struct PatchStruct *patchInfo);
#endif

struct Note *gNotes;

#if defined(VERSION_EU) || defined(VERSION_SH)
static u8 pad[4];
#endif

struct SequencePlayer gSequencePlayers[SEQUENCE_PLAYERS];
struct SequenceChannel gSequenceChannels[SEQUENCE_CHANNELS];
struct SequenceChannelLayer gSequenceLayers[SEQUENCE_LAYERS];

struct SequenceChannel gSequenceChannelNone;
struct AudioListItem gLayerFreeList;
struct NotePool gNoteFreeLists;

#ifdef VERSION_SH
struct AudioBankSample *D_SH_8034EA88[0x80];
struct UnkStructSH8034EC88 D_SH_8034EC88[0x80];
s32 D_SH_8034F688; // index into D_SH_8034EA88
s32 D_SH_8034F68C; // index or size for D_SH_8034EC88

struct PendingDmaAudioBank {
    s8 inProgress;
    s8 timer;
    s8 medium;
    struct AudioBank *audioBank;
    uintptr_t devAddr;
    void *vAddr;
    u32 remaining;
    u32 transferSize;
    u32 encodedInfo;
    OSMesgQueue *retQueue;
    OSMesgQueue dmaRetQueue;
    OSMesg mesgs[1];
    OSIoMesg ioMesg;
};
struct PendingDmaAudioBank D_SH_8034F690[16];

OSMesgQueue gUnkQueue1;
OSMesg gUnkMesgBufs1[0x10];
OSMesgQueue gUnkQueue2;
OSMesg gUnkMesgBufs2[0x10];
#endif

OSMesgQueue gCurrAudioFrameDmaQueue;
OSMesg gCurrAudioFrameDmaMesgBufs[AUDIO_FRAME_DMA_QUEUE_SIZE];
OSIoMesg gCurrAudioFrameDmaIoMesgBufs[AUDIO_FRAME_DMA_QUEUE_SIZE];

OSMesgQueue gAudioDmaMesgQueue;
OSMesg gAudioDmaMesg;
OSIoMesg gAudioDmaIoMesg;

#ifdef VERSION_SH
struct SharedDma *sSampleDmas; // sh: 0x803503D0
#else
struct SharedDma sSampleDmas[0x60];
#endif
u32 gSampleDmaNumListItems; // sh: 0x803503D4
u32 sSampleDmaListSize1; // sh: 0x803503D8
u32 sUnused80226B40; // set to 0, never read, sh: 0x803503DC

// Circular buffer of DMAs with ttl = 0. tail <= head, wrapping around mod 256.
u8 sSampleDmaReuseQueue1[256];
u8 sSampleDmaReuseQueue2[256];
u8 sSampleDmaReuseQueueTail1;
u8 sSampleDmaReuseQueueTail2;
u8 sSampleDmaReuseQueueHead1; // sh: 0x803505E2
u8 sSampleDmaReuseQueueHead2; // sh: 0x803505E3

// bss correct up to here

ALSeqFile *gSeqFileHeader;
ALSeqFile *gAlCtlHeader;
ALSeqFile *gAlTbl;
u8 *gAlBankSets;
u16 gSequenceCount;

struct CtlEntry *gCtlEntries; // sh: 0x803505F8

#if defined(VERSION_EU)
u32 padEuBss1;
struct AudioBufferParametersEU gAudioBufferParameters;
#elif defined(VERSION_US) || defined(VERSION_JP)
s32 gAiFrequency;
#endif

#ifdef VERSION_SH
struct AudioBufferParametersEU gAudioBufferParameters;
#endif
u32 sDmaBufSize;
s32 gMaxAudioCmds;
s32 gMaxSimultaneousNotes;

#if defined(VERSION_EU) || defined(VERSION_SH)
s16 gTempoInternalToExternal;
#else
s32 gSamplesPerFrameTarget;
s32 gMinAiBufferLength;

s16 gTempoInternalToExternal;

s8 gAudioUpdatesPerFrame;
#endif

s8 gSoundMode;

#if defined(VERSION_EU) || defined(VERSION_SH)
s8 gAudioUpdatesPerFrame;
#endif

extern u64 gAudioGlobalsStartMarker;
extern u64 gAudioGlobalsEndMarker;

extern u8 gSoundDataADSR[]; // sound_data.ctl
extern u8 gSoundDataRaw[];  // sound_data.tbl
extern u8 gMusicData[];     // sequences.s
extern u8 gBankSetsData[];  // bank_sets.s

ALSeqFile *get_audio_file_header(s32 arg0);

#ifdef VERSION_SH
void *func_sh_802f3688(s32 arg0);
void *get_bank_or_seq_wrapper(s32 arg0, s32 arg1);
void func_sh_802f3d78(uintptr_t devAddr, void *vAddr, size_t nbytes, s32 arg3);
void func_sh_802f3c38(uintptr_t devAddr, void *vAddr, size_t nbytes, s32 medium);
void func_sh_802f4a4c(s32 audioResetStatus);
void func_sh_802f4bd8(struct PendingDmaSample *arg0, s32 len);
void func_sh_802f4c5c(uintptr_t devAddr, void *vAddr, size_t nbytes, s32 arg3);
struct PendingDmaAudioBank *func_sh_802f4cb4(uintptr_t devAddr, void *vAddr, s32 size, s32 medium, s32 numChunks, OSMesgQueue *retQueue, s32 encodedInfo);
void func_sh_802f4dcc(s32 audioResetStatus);
void func_sh_802f4e50(struct PendingDmaAudioBank *audioBank, s32 audioResetStatus);
void func_sh_802f50ec(struct PendingDmaAudioBank *arg0, size_t len);
void func_sh_802f517c(uintptr_t devAddr, void *vAddr, size_t nbytes, s32 arg3);
s32 func_sh_802f5310(s32 bankId, struct AudioBank *mem, struct PatchStruct *patchInfo, s32 arg3);
void *func_sh_802F3564(s32 arg0);
#endif

/**
 * Performs an immediate DMA copy
 */
#if !defined(VERSION_SH)
void audio_dma_copy_immediate(uintptr_t devAddr, void *vAddr, size_t nbytes) {
    eu_stubbed_printf_3("Romcopy %x -> %x ,size %x\n", devAddr, vAddr, nbytes);
    osInvalDCache(vAddr, nbytes);
    osPiStartDma(&gAudioDmaIoMesg, OS_MESG_PRI_HIGH, OS_READ, devAddr, vAddr, nbytes,
                 &gAudioDmaMesgQueue);
    osRecvMesg(&gAudioDmaMesgQueue, NULL, OS_MESG_BLOCK);
    eu_stubbed_printf_0("Romcopyend\n");
}
#endif

#ifdef VERSION_EU
u8 audioString34[] = "CAUTION:WAVE CACHE FULL %d";
u8 audioString35[] = "BASE %x %x\n";
u8 audioString36[] = "LOAD %x %x %x\n";
u8 audioString37[] = "INSTTOP    %x\n";
u8 audioString38[] = "INSTMAP[0] %x\n";
u8 audioString39[] = "already flags %d\n";
u8 audioString40[] = "already flags %d\n";
u8 audioString41[] = "ERR:SLOW BANK DMA BUSY\n";
u8 audioString42[] = "ERR:SLOW DMA BUSY\n";
u8 audioString43[] = "Check %d  bank %d\n";
u8 audioString44[] = "Cache Check\n";
u8 audioString45[] = "NO BANK ERROR\n";
u8 audioString46[] = "BANK %d LOADING START\n";
u8 audioString47[] = "BANK %d LOAD MISS (NO MEMORY)!\n";
u8 audioString48[] = "BANK %d ALREADY CACHED\n";
u8 audioString49[] = "BANK LOAD MISS! FOR %d\n";
#endif

/**
 * Performs an asynchronus (normal priority) DMA copy
 */
#if !defined(VERSION_SH)
void audio_dma_copy_async(uintptr_t devAddr, void *vAddr, size_t nbytes, OSMesgQueue *queue, OSIoMesg *mesg) {
    osInvalDCache(vAddr, nbytes);
    osPiStartDma(mesg, OS_MESG_PRI_NORMAL, OS_READ, devAddr, vAddr, nbytes, queue);
}
#endif

/**
 * Performs a partial asynchronous (normal priority) DMA copy. This is limited
 * to 0x1000 bytes transfer at once.
 */
#ifndef VERSION_SH
void audio_dma_partial_copy_async(uintptr_t *devAddr, u8 **vAddr, ssize_t *remaining, OSMesgQueue *queue, OSIoMesg *mesg) {
#if defined(VERSION_EU)
    ssize_t transfer = (*remaining >= 0x1000 ? 0x1000 : *remaining);
#else
    ssize_t transfer = (*remaining < 0x1000 ? *remaining : 0x1000);
#endif
    *remaining -= transfer;
    osInvalDCache(*vAddr, transfer);
    osPiStartDma(mesg, OS_MESG_PRI_NORMAL, OS_READ, *devAddr, *vAddr, transfer, queue);
    *devAddr += transfer;
    *vAddr += transfer;
}
#endif

void decrease_sample_dma_ttls() {
    u32 i;

    for (i = 0; i < sSampleDmaListSize1; i++) {
#if defined(VERSION_EU) || defined(VERSION_SH)
        struct SharedDma *temp = &sSampleDmas[i];
#else
        struct SharedDma *temp = sSampleDmas + i;
#endif
        if (temp->ttl != 0) {
            temp->ttl--;
            if (temp->ttl == 0) {
                temp->reuseIndex = sSampleDmaReuseQueueHead1;
                sSampleDmaReuseQueue1[sSampleDmaReuseQueueHead1++] = (u8) i;
            }
        }
    }

    for (i = sSampleDmaListSize1; i < gSampleDmaNumListItems; i++) {
#if defined(VERSION_EU) || defined(VERSION_SH)
        struct SharedDma *temp = &sSampleDmas[i];
#else
        struct SharedDma *temp = sSampleDmas + i;
#endif
        if (temp->ttl != 0) {
            temp->ttl--;
            if (temp->ttl == 0) {
                temp->reuseIndex = sSampleDmaReuseQueueHead2;
                sSampleDmaReuseQueue2[sSampleDmaReuseQueueHead2++] = (u8) i;
            }
        }
    }

    sUnused80226B40 = 0;
}

extern char shindouDebugPrint62[];
#ifdef VERSION_SH
void *dma_sample_data(uintptr_t devAddr, u32 size, s32 arg2, u8 *dmaIndexRef, s32 medium) {
    UNUSED s32 sp60;
#else
void *dma_sample_data(uintptr_t devAddr, u32 size, s32 arg2, u8 *dmaIndexRef) {
#endif
#ifdef VERSION_SH
    struct SharedDma *dma;
    s32 hasDma = FALSE;
#else
    s32 hasDma = FALSE;
    struct SharedDma *dma;
#endif
    uintptr_t dmaDevAddr;
#ifdef VERSION_SH
    UNUSED u32 pad;
    u32 dmaIndex;
    u32 transfer;
#else
    u32 transfer;
    u32 i;
    u32 dmaIndex;
#endif
    ssize_t bufferPos;
#ifdef VERSION_SH
    u32 i;
#else
    UNUSED u32 pad;
#endif

    if (arg2 != 0 || *dmaIndexRef >= sSampleDmaListSize1) {
        for (i = sSampleDmaListSize1; i < gSampleDmaNumListItems; i++) {
#if defined(VERSION_EU) || defined(VERSION_SH)
            dma = &sSampleDmas[i];
#else
            dma = sSampleDmas + i;
#endif
            bufferPos = devAddr - dma->source;
            if (0 <= bufferPos && (size_t) bufferPos <= dma->bufSize - size) {
                // We already have a DMA request for this memory range.
                if (dma->ttl == 0 && sSampleDmaReuseQueueTail2 != sSampleDmaReuseQueueHead2) {
                    // Move the DMA out of the reuse queue, by swapping it with the
                    // tail, and then incrementing the tail.
                    if (dma->reuseIndex != sSampleDmaReuseQueueTail2) {
                        sSampleDmaReuseQueue2[dma->reuseIndex] =
                            sSampleDmaReuseQueue2[sSampleDmaReuseQueueTail2];
                        sSampleDmas[sSampleDmaReuseQueue2[sSampleDmaReuseQueueTail2]].reuseIndex =
                            dma->reuseIndex;
                    }
                    sSampleDmaReuseQueueTail2++;
                }
                dma->ttl = 60;
                *dmaIndexRef = (u8) i;
#if defined(VERSION_EU) || defined(VERSION_SH)
                return &dma->buffer[(devAddr - dma->source)];
#else
                return (devAddr - dma->source) + dma->buffer;
#endif
            }
        }

        if (sSampleDmaReuseQueueTail2 != sSampleDmaReuseQueueHead2 && arg2 != 0) {
            // Allocate a DMA from reuse queue 2. This queue can be empty, since
            // TTL 60 is pretty large.
            dmaIndex = sSampleDmaReuseQueue2[sSampleDmaReuseQueueTail2];
            sSampleDmaReuseQueueTail2++;
            dma = sSampleDmas + dmaIndex;
            hasDma = TRUE;
        }
    } else {
#if defined(VERSION_EU)
        dma = sSampleDmas;
        dma += *dmaIndexRef;
#else
        dma = sSampleDmas + *dmaIndexRef;
#endif
        bufferPos = devAddr - dma->source;
        if (0 <= bufferPos && (size_t) bufferPos <= dma->bufSize - size) {
            // We already have DMA for this memory range.
            if (dma->ttl == 0) {
                // Move the DMA out of the reuse queue, by swapping it with the
                // tail, and then incrementing the tail.
                if (dma->reuseIndex != sSampleDmaReuseQueueTail1) {
#if defined(VERSION_EU)
                    if (1) {
                    }
#endif
                    sSampleDmaReuseQueue1[dma->reuseIndex] =
                        sSampleDmaReuseQueue1[sSampleDmaReuseQueueTail1];
                    sSampleDmas[sSampleDmaReuseQueue1[sSampleDmaReuseQueueTail1]].reuseIndex =
                        dma->reuseIndex;
                }
                sSampleDmaReuseQueueTail1++;
            }
            dma->ttl = 2;
#if defined(VERSION_EU) || defined(VERSION_SH)
            return dma->buffer + (devAddr - dma->source);
#else
            return (devAddr - dma->source) + dma->buffer;
#endif
        }
    }

    if (!hasDma) {
#ifdef VERSION_SH
        if (1) {}
#endif
        // Allocate a DMA from reuse queue 1. This queue will hopefully never
        // be empty, since TTL 2 is so small.
        dmaIndex = sSampleDmaReuseQueue1[sSampleDmaReuseQueueTail1++];
        dma = sSampleDmas + dmaIndex;
        hasDma = TRUE;
    }

    transfer = dma->bufSize;
    dmaDevAddr = devAddr & ~0xF;
    dma->ttl = 2;
    dma->source = dmaDevAddr;
    dma->sizeUnused = transfer;
#ifdef VERSION_US
    osInvalDCache(dma->buffer, transfer);
#endif
#if defined(VERSION_EU)
    osPiStartDma(&gCurrAudioFrameDmaIoMesgBufs[gCurrAudioFrameDmaCount++], OS_MESG_PRI_NORMAL,
                     OS_READ, dmaDevAddr, dma->buffer, transfer, &gCurrAudioFrameDmaQueue);
    *dmaIndexRef = dmaIndex;
    return (devAddr - dmaDevAddr) + dma->buffer;
#elif defined (VERSION_SH)
    func_sh_802f3dd0(&gCurrAudioFrameDmaIoMesgBufs[gCurrAudioFrameDmaCount++], OS_MESG_PRI_NORMAL, OS_READ,
         dmaDevAddr, dma->buffer, transfer, &gCurrAudioFrameDmaQueue, medium, shindouDebugPrint62);
    *dmaIndexRef = dmaIndex;
    return (devAddr - dmaDevAddr) + dma->buffer;
#else
    gCurrAudioFrameDmaCount++;
    osPiStartDma(&gCurrAudioFrameDmaIoMesgBufs[gCurrAudioFrameDmaCount - 1], OS_MESG_PRI_NORMAL,
                 OS_READ, dmaDevAddr, dma->buffer, transfer, &gCurrAudioFrameDmaQueue);
    *dmaIndexRef = dmaIndex;
    return dma->buffer + (devAddr - dmaDevAddr);
#endif
}


void init_sample_dma_buffers(UNUSED s32 arg0) {
    s32 i;
#if defined(VERSION_EU) || defined(VERSION_SH)
#define j i
#else
    s32 j;
#endif

#if defined(VERSION_EU)
    sDmaBufSize = 0x400;
#elif defined(VERSION_SH)
    sDmaBufSize = 0x2D0;
    sSampleDmas = sound_alloc_uninitialized(&gNotesAndBuffersPool,
            gMaxSimultaneousNotes * 4 * sizeof(struct SharedDma) * gAudioBufferParameters.presetUnk4);
#else
    sDmaBufSize = 144 * 9;
#endif

#if defined(VERSION_EU) || defined(VERSION_SH)
    for (i = 0; i < gMaxSimultaneousNotes * 3 * gAudioBufferParameters.presetUnk4; i++)
#else
    for (i = 0; i < gMaxSimultaneousNotes * 3; i++)
#endif
    {
#if defined(VERSION_SH)
        if ((sSampleDmas[gSampleDmaNumListItems].buffer = sound_alloc_uninitialized(&gNotesAndBuffersPool, sDmaBufSize)) == NULL) {
            break;
        }
#else
        sSampleDmas[gSampleDmaNumListItems].buffer = soundAlloc(&gNotesAndBuffersPool, sDmaBufSize);
        if (sSampleDmas[gSampleDmaNumListItems].buffer == NULL) {
#if defined(VERSION_EU)
            break;
#else
            goto out1;
#endif
        }
#endif
        sSampleDmas[gSampleDmaNumListItems].bufSize = sDmaBufSize;
        sSampleDmas[gSampleDmaNumListItems].source = 0;
        sSampleDmas[gSampleDmaNumListItems].sizeUnused = 0;
        sSampleDmas[gSampleDmaNumListItems].unused2 = 0;
        sSampleDmas[gSampleDmaNumListItems].ttl = 0;
        gSampleDmaNumListItems++;
    }
#if defined(VERSION_JP) || defined(VERSION_US)
out1:
#endif

    for (i = 0; (u32) i < gSampleDmaNumListItems; i++) {
        sSampleDmaReuseQueue1[i] = (u8) i;
        sSampleDmas[i].reuseIndex = (u8) i;
    }

    for (j = gSampleDmaNumListItems; j < 0x100; j++) {
        sSampleDmaReuseQueue1[j] = 0;
    }

    sSampleDmaReuseQueueTail1 = 0;
    sSampleDmaReuseQueueHead1 = (u8) gSampleDmaNumListItems;
    sSampleDmaListSize1 = gSampleDmaNumListItems;

#if defined(VERSION_SH)
    sDmaBufSize = 0x2D0;
#elif defined(VERSION_EU)
    sDmaBufSize = 0x200;
#else
    sDmaBufSize = 160 * 9;
#endif
    for (i = 0; i < gMaxSimultaneousNotes; i++) {
#if defined(VERSION_SH)
        if ((sSampleDmas[gSampleDmaNumListItems].buffer = sound_alloc_uninitialized(&gNotesAndBuffersPool, sDmaBufSize)) == NULL) {
            break;
        }
#else
        sSampleDmas[gSampleDmaNumListItems].buffer = soundAlloc(&gNotesAndBuffersPool, sDmaBufSize);
        if (sSampleDmas[gSampleDmaNumListItems].buffer == NULL) {
#if defined(VERSION_EU)
            break;
#else
            goto out2;
#endif
        }
#endif
#if defined(VERSION_SH)
        sSampleDmas[gSampleDmaNumListItems].bufSize = sDmaBufSize;
#endif
        sSampleDmas[gSampleDmaNumListItems].source = 0;
        sSampleDmas[gSampleDmaNumListItems].sizeUnused = 0;
        sSampleDmas[gSampleDmaNumListItems].unused2 = 0;
        sSampleDmas[gSampleDmaNumListItems].ttl = 0;
#ifndef VERSION_SH
        sSampleDmas[gSampleDmaNumListItems].bufSize = sDmaBufSize;
#endif
        gSampleDmaNumListItems++;
    }
#if defined(VERSION_JP) || defined(VERSION_US)
out2:
#endif

    for (i = sSampleDmaListSize1; (u32) i < gSampleDmaNumListItems; i++) {
        sSampleDmaReuseQueue2[i - sSampleDmaListSize1] = (u8) i;
        sSampleDmas[i].reuseIndex = (u8)(i - sSampleDmaListSize1);
    }

    // This probably meant to touch the range size1..size2 as well... but it
    // doesn't matter, since these values are never read anyway.
    for (j = gSampleDmaNumListItems; j < 0x100; j++) {
        sSampleDmaReuseQueue2[j] = sSampleDmaListSize1;
    }

    sSampleDmaReuseQueueTail2 = 0;
    sSampleDmaReuseQueueHead2 = gSampleDmaNumListItems - sSampleDmaListSize1;
#if defined(VERSION_EU) || defined(VERSION_SH)
#undef j
#endif
}

#ifndef static
// Keep supporting the good old "#define static" hack.
#undef static
#endif

#if defined(VERSION_SH)
void patch_seq_file(ALSeqFile *seqFile, u8 *data, u16 arg2) {
    ALSeqFile *phi_a2;
    s32 i;

    seqFile->unk2 = arg2;
    seqFile->data = data;
    for (i = 0; i < seqFile->seqCount; i++) {
        if (seqFile->seqArray[i].len != 0 && seqFile->seqArray[i].magic[0] == 2) {
            seqFile->seqArray[i].offset += (uintptr_t)data;
        }
    }
}

void *func_sh_802f2e24(s32 arg0, s32 *arg1) {
    s32 phi_s2;
    s32 phi_s0;
    s32 phi_s1;
    void *sp28;

    phi_s0 = ((u16 *)gAlBankSets)[func_sh_802f39a0(0, arg0)];
    phi_s1 = gAlBankSets[phi_s0++];
    phi_s2 = 0xFF;
    while (phi_s1 > 0) {
        phi_s2 = gAlBankSets[phi_s0++];
        phi_s2 = (s32) phi_s2;
        sp28 = func_sh_802f3688(phi_s2);
        phi_s1--;
    }
    *arg1 = phi_s2;
    return sp28;
}
#endif

#if defined(VERSION_JP) || defined(VERSION_US)
// This function gets optimized out on US due to being static and never called
static
#endif
#if defined(VERSION_SH)
void preload_sequence(s32 arg0, s32 arg1) {
    UNUSED s32 pad;
    s32 sp18;

    arg0 = func_sh_802f39a0(0, arg0);
    if (arg1 & PRELOAD_BANKS) {
        func_sh_802f2e24(arg0, &sp18);
    }
    if (arg1 & PRELOAD_SEQUENCE) {
        func_sh_802F3564(arg0);
    }
}
#else
void patch_sound(UNUSED struct AudioBankSound *sound, UNUSED u8 *memBase, UNUSED u8 *offsetBase) {
    struct AudioBankSample *sample;
    void *patched;
    UNUSED u8 *mem; // unused on US

#define PATCH(x, base) (patched = (void *)((uintptr_t) (x) + (uintptr_t) base))

    if (sound->sample != NULL) {
        sample = sound->sample = PATCH(sound->sample, memBase);
        if (sample->loaded == 0) {
            sample->sampleAddr = PATCH(sample->sampleAddr, offsetBase);
            sample->loop = PATCH(sample->loop, memBase);
            sample->book = PATCH(sample->book, memBase);
            sample->loaded = 1;
        }
#if defined(VERSION_EU)
        else if (sample->loaded == 0x80) {
            PATCH(sample->sampleAddr, offsetBase);
            mem = soundAlloc(&gNotesAndBuffersPool, sample->sampleSize);
            if (mem == NULL) {
                sample->sampleAddr = patched;
                sample->loaded = 1;
            } else {
                audio_dma_copy_immediate((uintptr_t) patched, mem, sample->sampleSize);
                sample->loaded = 0x81;
                sample->sampleAddr = mem;
            }
            sample->loop = PATCH(sample->loop, memBase);
            sample->book = PATCH(sample->book, memBase);
        }
#endif
    }

#undef PATCH
}
#endif

#if defined(VERSION_JP) || defined(VERSION_US)
#define PATCH_SOUND(_sound, mem, offset)                                                  \
{                                                                                         \
    struct AudioBankSound *sound = _sound;                                                \
    struct AudioBankSample *sample;                                                       \
    void *patched;                                                                        \
    if ((*sound).sample != (void *) 0)                                                    \
    {                                                                                     \
        patched = (void *)(((uintptr_t)(*sound).sample) + ((uintptr_t)((u8 *) mem)));     \
        (*sound).sample = patched;                                                        \
        sample = (*sound).sample;                                                         \
        if ((*sample).loaded == 0)                                                        \
        {                                                                                 \
            patched = (void *)(((uintptr_t)(*sample).sampleAddr) + ((uintptr_t) offset)); \
            (*sample).sampleAddr = patched;                                               \
            patched = (void *)(((uintptr_t)(*sample).loop) + ((uintptr_t)((u8 *) mem)));  \
            (*sample).loop = patched;                                                     \
            patched = (void *)(((uintptr_t)(*sample).book) + ((uintptr_t)((u8 *) mem)));  \
            (*sample).book = patched;                                                     \
            (*sample).loaded = 1;                                                         \
        }                                                                                 \
    }                                                                                     \
}
#endif

#if defined(VERSION_SH)
s32 func_sh_802f2f38(struct AudioBankSample *sample, s32 bankId) {
    u8 *sp24;

    if (sample->isPatched == TRUE && sample->medium != 0) {
        sp24 = func_sh_802f1d90(sample->size, bankId, sample->sampleAddr, sample->medium);
        if (sp24 == NULL) {
            return -1;
        }
        if (sample->medium == 1) {
            func_sh_802f3d78(sample->sampleAddr, sp24, sample->size, gAlTbl->unk2);
        } else {
            func_sh_802f3c38(sample->sampleAddr, sp24, sample->size, sample->medium);
        }
        sample->medium = 0;
        sample->sampleAddr = sp24;
    }
}

s32 func_sh_802f3024(s32 bankId, s32 instId, s32 arg2) {
    struct Instrument *instr;
    struct Drum *drum;

    if (instId < 0x7F) {
        instr = get_instrument_inner(bankId, instId);
        if (instr == NULL) {
            return -1;
        }
        if (instr->normalRangeLo != 0) {
            func_sh_802f2f38(instr->lowNotesSound.sample, bankId);
        }
        func_sh_802f2f38(instr->normalNotesSound.sample, bankId);
        if (instr->normalRangeHi != 0x7F) {
            func_sh_802f2f38(instr->highNotesSound.sample, bankId);
        }
        //! missing return
    } else if (instId == 0x7F) {
        drum = get_drum(bankId, arg2);
        if (drum == NULL) {
            return -1;
        }
        func_sh_802f2f38(drum->sound.sample, bankId);
        return 0;
    }
}

void func_sh_802f30f4(s32 arg0, s32 arg1, s32 arg2, OSMesgQueue *arg3) {
    if (func_802f3f08(2, func_sh_802f39a0(2, arg0), arg1, arg2, arg3) == 0) {
        osSendMesg(arg3, 0, 0);
    }
}

void func_sh_802f3158(s32 index, s32 numChunks, s32 arg2, OSMesgQueue *retQueue) {
    s32 val;
    s32 v;

    val = ((u16 *) gAlBankSets)[func_sh_802f39a0(0, index)];
    v = gAlBankSets[val++];

    while (v > 0) {
        func_802f3f08(1, func_sh_802f39a0(1, gAlBankSets[val++]), numChunks, arg2, retQueue);
        v--;
    }
}

u8 *func_sh_802f3220(u32 index, u32 *a1) {
    s32 val;

    val = ((u16 *) gAlBankSets)[func_sh_802f39a0(0, index)];
    *a1 = gAlBankSets[val++];
    if (*a1 == 0) {
        return NULL;
    }
    return &gAlBankSets[val];
}

void func_sh_802f3288(s32 idx) {
    s32 s0;
    s32 s2;

    idx = ((u16*)gAlBankSets)[func_sh_802f39a0(0, idx)];
    s2 = gAlBankSets[idx++];
    while (s2 > 0) {
        s2--;
        s0 = func_sh_802f39a0(1, gAlBankSets[idx++]);

        if (unk_pool1_lookup(1, s0) == 0) {
            func_sh_802f3368(s0);
            if (gBankLoadStatus[s0] != 5) {
                gBankLoadStatus[s0] = 0;
            }

            continue;
        }

    }
}

s32 func_sh_802f3368(s32 arg0) {
    struct SoundMultiPool *pool = &gBankLoadedPool;
    struct TemporaryPool *temporary = &pool->temporary;
    struct PersistentPool *persistent;
    u32 i;

    if (temporary->entries[0].id == arg0) {
        temporary->entries[0].id = -1;
    } else if (arg0 == temporary->entries[1].id) {
        temporary->entries[1].id = -1;
    }

    persistent = &pool->persistent;
    for (i = 0; i < persistent->numEntries; i++) {
        if (persistent->entries[i].id == arg0) {
            persistent->entries[i].id = -1;
        }

    }

    discard_bank(arg0);
}


void func_sh_802F3430(s32 arg0, s32 arg1, s32 arg2);
void func_sh_802F3410(s32 arg0, s32 arg1, s32 arg2) {
    func_sh_802F3430(arg0, arg1, arg2);
}

void func_sh_802F3430(s32 arg0, s32 arg1, s32 arg2) {
    struct SequencePlayer *seqPlayer;
    u8 *seqData;
    u32 temp;
    u32 s0;
    s32 s1;
    u8 bank;
    u32 id;

    seqPlayer = &gSequencePlayers[arg0];

    temp = func_sh_802f39a0(0, arg1);
    sequence_player_disable(seqPlayer);
    id = temp;

    s0 = ((u16 *) gAlBankSets)[id];
    s1 = gAlBankSets[s0++];
    bank = 0xff;

    while (s1 > 0) {
        bank = gAlBankSets[s0++];
        func_sh_802f3688(bank);
        s1--;
    }

    seqData = func_sh_802F3564(id);
    init_sequence_player(arg0);
    seqPlayer->seqId = id;
    seqPlayer->defaultBank[0] = bank;
    seqPlayer->enabled = 1;
    seqPlayer->seqData = seqData;
    seqPlayer->scriptState.pc = seqData;
    seqPlayer->scriptState.depth = 0;
    seqPlayer->delay = 0;
    seqPlayer->finished = 0;

    if (id) {
    }

    for (id = 0; id < 0x10; id++) {
    }

}

void *func_sh_802F3564(s32 arg0) {
    void *a = func_sh_802f39a0(0, arg0);
    s32 b;
    return func_sh_802f3764(0, a, &b);
}

extern u8 gUnkLoadStatus[0x40];

void *func_sh_802f3598(s32 idx, s32 *medium) {
    void *ret;
    ALSeqFile *f;
    s32 temp;
    s32 sp28;

    f = get_audio_file_header(2);
    idx = func_sh_802f39a0(2, idx);
    ret = get_bank_or_seq_wrapper(2, idx);
    if (ret != NULL) {
        if (gUnkLoadStatus[idx] != SOUND_LOAD_STATUS_5) {
            gUnkLoadStatus[idx] = SOUND_LOAD_STATUS_COMPLETE;
        }

        *medium = 0;
        return ret;
    }

    temp = f->seqArray[idx].magic[1];
    if (temp == 4) {
        *medium = f->seqArray[idx].magic[0];
        return f->seqArray[idx].offset;
    } else {
        ret = func_sh_802f3764(2, idx, &sp28);
        if (ret != 0) {
            *medium = 0;
            return ret;
        }

        *medium = f->seqArray[idx].magic[0];
    }
    return f->seqArray[idx].offset;

}

void *func_sh_802f3688(s32 idx) {
    void *ret;
    s32 bankId1;
    s32 bankId2;
    s32 sp38;
    struct PatchStruct patchInfo;

    idx = func_sh_802f39a0(1, idx);
    bankId1 = gCtlEntries[idx].bankId1;
    bankId2 = gCtlEntries[idx].bankId2;

    patchInfo.bankId1 = bankId1;
    patchInfo.bankId2 = bankId2;

    if (patchInfo.bankId1 != 0xFF) {
        patchInfo.baseAddr1 = func_sh_802f3598(patchInfo.bankId1, &patchInfo.medium1);
    } else {
        patchInfo.baseAddr1 = NULL;
    }

    if (bankId2 != 0xFF) {
        patchInfo.baseAddr2 = func_sh_802f3598(bankId2, &patchInfo.medium2);
    } else {
        patchInfo.baseAddr2 = NULL;
    }

    if ((ret = func_sh_802f3764(1, idx, &sp38)) == NULL) {
        return NULL;
    }

    if (sp38 == 1) {
        func_sh_802f5310(idx, ret, &patchInfo, 0);
    }

    return ret;
}

void *func_sh_802f3764(s32 poolIdx, s32 idx, s32 *arg2) {
    s32 size;
    ALSeqFile *f;
    void *vAddr;
    s32 sp30;
    UNUSED u32 pad2;
    u8 *devAddr;
    s8 loadStatus;
    s32 sp18;

    vAddr = get_bank_or_seq_wrapper(poolIdx, idx);
    if (vAddr != NULL) {
        *arg2 = 0;
        loadStatus = SOUND_LOAD_STATUS_COMPLETE;
    } else {
        f = get_audio_file_header(poolIdx);
        size = f->seqArray[idx].len;
        size = ALIGN16(size);
        sp30 = f->seqArray[idx].magic[0];
        sp18 = f->seqArray[idx].magic[1];
        devAddr = f->seqArray[idx].offset;


        switch (sp18)
        {
            case 0:
                vAddr = unk_pool1_alloc(poolIdx, idx, size);
                if (vAddr == NULL) {
                    return vAddr;
                }
                break;
            case 1:
                vAddr = alloc_bank_or_seq(poolIdx, size, 1, idx);
                if (vAddr == NULL) {
                    return vAddr;
                }
                break;
            case 2:
                vAddr = alloc_bank_or_seq(poolIdx, size, 0, idx);
                if (vAddr == NULL) {
                    return vAddr;
                }
                break;

            case 3:
            case 4:
                vAddr = alloc_bank_or_seq(poolIdx, size, 2, idx);
                if (vAddr == NULL) {
                    return vAddr;
                }
                break;
        }

        *arg2 = 1;
        if (sp30 == 1) {
            func_sh_802f3d78((uintptr_t) devAddr, vAddr, size, f->unk2);
        } else {
            func_sh_802f3c38((uintptr_t) devAddr, vAddr, size, sp30);
        }

        switch (sp18)
        {
            case 0:
                loadStatus = SOUND_LOAD_STATUS_5;
                break;

            default:
                loadStatus = SOUND_LOAD_STATUS_COMPLETE;
                break;
        }
    }

    switch (poolIdx)
    {
        case 0:
            if (gSeqLoadStatus[idx] != SOUND_LOAD_STATUS_5) {
                gSeqLoadStatus[idx] = loadStatus;
            }
            break;

        case 1:
            if (gBankLoadStatus[idx] != SOUND_LOAD_STATUS_5) {
                gBankLoadStatus[idx] = loadStatus;
            }
            break;

        case 2:
            if (gUnkLoadStatus[idx] != SOUND_LOAD_STATUS_5) {
                gUnkLoadStatus[idx] = loadStatus;
            }
            break;
    }

    return vAddr;
}

s32 func_sh_802f39a0(s32 arg0, s32 idx) {
    ALSeqFile *f;

    f = get_audio_file_header(arg0);
    if (f->seqArray[idx].len == 0) {
        idx = (s32) f->seqArray[idx].offset; // TODO: something doesn't seem right here...
    }
    return idx;
}

void *get_bank_or_seq_wrapper(s32 poolIdx, s32 id) {
    void *ret;

    ret = unk_pool1_lookup(poolIdx, id);
    if (ret != NULL) {
        return ret;
    }
    ret = get_bank_or_seq(poolIdx, 2, id);
    if (ret != 0) {
        return ret;
    }
    return NULL;
}

ALSeqFile *get_audio_file_header(s32 index) {
    ALSeqFile *ret;
    switch(index) {
        default:
            ret = NULL;
            break;
        case 0:
            ret = gSeqFileHeader;
            break;
        case 1:
            ret = gAlCtlHeader;
            break;
        case 2:
            ret = gAlTbl;
            break;
    }
    return ret;
}
#endif

// on US/JP this inlines patch_sound, using some -sopt compiler flag
#if defined(VERSION_SH)
void patch_audio_bank(s32 bankId, struct AudioBank *mem, struct PatchStruct *patchInfo) {
#else
void patch_audio_bank(struct AudioBank *mem, u8 *offset, u32 numInstruments, u32 numDrums) {
#endif
    struct Instrument *instrument;
#if defined(VERSION_SH)
    void **itInstrs;
#else
    struct Instrument **itInstrs;
#endif
    struct Instrument **end;
#if defined(VERSION_SH)
    s32 i;
#else
    struct AudioBank *temp; // Maybe Shindou also has this; I'm not sure.
    u32 i;
#endif
    void *patched;
    struct Drum *drum;
#ifndef VERSION_SH
    struct Drum **drums;
#endif
#if defined(VERSION_EU)
    u32 numDrums2;
#elif defined(VERSION_SH)
    s32 numDrums2;
    s32 numInstruments2;
#endif

#define BASE_OFFSET(x, base) (void *)((uintptr_t) (x) + (uintptr_t) base)
#define PATCH(x, base) (patched = BASE_OFFSET(x, base))
#define PATCH_MEM(x) x = PATCH(x, mem)

#if defined(VERSION_SH)
    numDrums2 = gCtlEntries[bankId].numDrums;
    numInstruments2 = gCtlEntries[bankId].numInstruments;
    itInstrs = mem->drums;
    if (mem->drums) {
    }
#else
    drums = mem->drums;
#endif
#if defined(VERSION_JP) || defined(VERSION_US)
    if (drums != NULL && numDrums > 0) {
        mem->drums = (void *)((uintptr_t) drums + (uintptr_t) mem);
        if (numDrums > 0) //! unneeded when -sopt is enabled
        for (i = 0; i < numDrums; i++) {
#else
#if defined(VERSION_EU)
    numDrums2 = numDrums;
    if (drums != NULL && numDrums2 > 0) {
        mem->drums = PATCH(drums, mem);
#elif defined(VERSION_SH)
    if (itInstrs != NULL && numDrums2 != 0) {
        if (1) {
            mem->drums = PATCH(itInstrs, mem);
        }
#endif
        for (i = 0; i < numDrums2; i++) {
#endif
            patched = mem->drums[i];
            if (patched != NULL) {
                drum = PATCH(patched, mem);
                mem->drums[i] = drum;
                if (drum->loaded == 0) {
#if defined(VERSION_JP) || defined(VERSION_US)
                    //! copt replaces drum with 'patched' for these two lines
                    PATCH_SOUND(&(*(struct Drum *)patched).sound, mem, offset);
                    patched = (*(struct Drum *)patched).envelope;
                    drum->envelope = BASE_OFFSET(mem, patched);
#else
#if defined(VERSION_EU)
                    patch_sound(&drum->sound, (u8 *) mem, offset);
#elif defined(VERSION_SH)
                    func_sh_802f51d4(&drum->sound, mem, patchInfo);
#endif
                    patched = drum->envelope;
                    drum->envelope = BASE_OFFSET(patched, mem);
#endif
                    drum->loaded = 1;
                }

            }
        }
    }

#ifndef VERSION_SH
    //! Doesn't affect EU, but required for US/JP
    temp = &*mem;
#endif
#if defined(VERSION_JP) || defined(VERSION_US)
    if (numInstruments >= 1)
#endif
#if defined(VERSION_SH)
    if (numInstruments2 > 0) {
        itInstrs = mem->instruments;
        end = numInstruments2 + (struct Instrument **) itInstrs;
#else
    if (numInstruments > 0) {
        //! Doesn't affect EU, but required for US/JP
        struct Instrument **tempInst;
        itInstrs = temp->instruments;
        tempInst = temp->instruments;
        end = numInstruments + tempInst;
#endif

#if defined(VERSION_JP) || defined(VERSION_US)
l2:
#else
        do {
#endif
            if (*itInstrs != NULL) {
#ifdef VERSION_SH
                *itInstrs = BASE_OFFSET(mem, *itInstrs);
#else
                *itInstrs = BASE_OFFSET(*itInstrs, mem);
#endif
                instrument = *itInstrs;

                if (instrument->loaded == 0) {
#if defined(VERSION_JP) || defined(VERSION_US)
                    PATCH_SOUND(&instrument->lowNotesSound, (u8 *) mem, offset);
                    PATCH_SOUND(&instrument->normalNotesSound, (u8 *) mem, offset);
                    PATCH_SOUND(&instrument->highNotesSound, (u8 *) mem, offset);
#elif defined(VERSION_EU)
                    patch_sound(&instrument->lowNotesSound, (u8 *) mem, offset);
                    patch_sound(&instrument->normalNotesSound, (u8 *) mem, offset);
                    patch_sound(&instrument->highNotesSound, (u8 *) mem, offset);
#elif defined(VERSION_SH)
                    if (instrument->normalRangeLo != 0) {
                        func_sh_802f51d4(&instrument->lowNotesSound, mem, patchInfo);
                    }
                    func_sh_802f51d4(&instrument->normalNotesSound, mem, patchInfo);
                    if (instrument->normalRangeHi != 0x7F) {
                        func_sh_802f51d4(&instrument->highNotesSound, mem, patchInfo);
                    }
#endif
                    patched = instrument->envelope;

#if defined(VERSION_JP) || defined(VERSION_US)
                    instrument->envelope = BASE_OFFSET(mem, patched);
                    instrument->loaded = 1;
#else
                    instrument->envelope = BASE_OFFSET(patched, mem);
                    instrument->loaded = 1;
#endif
                }
            }
#ifndef VERSION_SH
            itInstrs++;
#else
            itInstrs = ((struct Instrument **) itInstrs) + 1;
#endif
#if defined(VERSION_JP) || defined(VERSION_US)
            //! goto generated by copt, required to match US/JP
            if (end != itInstrs) {
                goto l2;
            }
#else
#ifdef VERSION_EU
        } while (end != itInstrs);
#else
        } while ((struct Instrument **) itInstrs != (0, end)); //! This is definitely fake
#endif
#endif
    }
#if defined(VERSION_SH)
    gCtlEntries[bankId].drums = mem->drums;
    gCtlEntries[bankId].instruments = mem->instruments;
#endif
#undef PATCH_MEM
#undef PATCH
#undef BASE_OFFSET
#undef PATCH_SOUND
}

#if defined(VERSION_SH)
void func_sh_802f3ed4(UNUSED s32 arg0, UNUSED s32 arg1, UNUSED void *vAddr, UNUSED size_t nbytes);

extern char shindouDebugPrint81[];
extern char shindouDebugPrint82[];
void func_sh_802f3c38(uintptr_t devAddr, void *vAddr, size_t nbytes, s32 medium) {
    nbytes = ALIGN16(nbytes);
    osInvalDCache(vAddr, nbytes);

lock:
    if (gAudioLoadLockSH != 0) {
        goto lock;
    }

    if (nbytes >= 0x400U) {
        func_sh_802f3dd0(&gAudioDmaIoMesg, 1, 0, devAddr, vAddr, 0x400, &gAudioDmaMesgQueue, medium, shindouDebugPrint81);
        osRecvMesg(&gAudioDmaMesgQueue, NULL, 1);
        nbytes = nbytes - 0x400;
        devAddr = devAddr + 0x400;
        vAddr = (u8*)vAddr + 0x400;
        goto lock;
    }

    if (nbytes != 0) {
        func_sh_802f3dd0(&gAudioDmaIoMesg, 1, 0, devAddr, vAddr, nbytes, &gAudioDmaMesgQueue, medium, shindouDebugPrint82);
        osRecvMesg(&gAudioDmaMesgQueue, NULL, 1);
    }
}

void func_sh_802f3d78(uintptr_t devAddr, void *vAddr, size_t nbytes, s32 arg3) {
    uintptr_t sp1C;

    sp1C = devAddr;
    osInvalDCache(vAddr, nbytes);
    func_sh_802f3ed4(func_sh_802f3ec4(arg3, &sp1C), sp1C, vAddr, nbytes);
}

s32 func_sh_802f3dd0(OSIoMesg *m, s32 pri, s32 direction, uintptr_t devAddr, void *dramAddr, s32 size, OSMesgQueue *retQueue, s32 medium, const char *arg8) {
    OSPiHandle *handle;
    if (gAudioLoadLockSH >= 0x11U) {
        return -1;
    }
    switch (medium) {
        case 2:
            handle = osCartRomInit();
            break;
        case 3:
            handle = osDriveRomInit();
            break;
        default:
            return 0;
    }
    if ((size & 0xf) != 0) {
        size = ALIGN16(size);
    }
    m->hdr.pri = pri;
    m->hdr.retQueue = retQueue;
    m->dramAddr = dramAddr;
    m->devAddr = devAddr;
    m->size = size;
    handle->transferInfo.cmdType = 2;
    osEPiStartDma(handle, m, direction);
    return 0;
}

s32 func_sh_802f3ec4(UNUSED s32 arg0, UNUSED uintptr_t *arg1) {
    return 0;
}

void func_sh_802f3ed4(UNUSED s32 arg0, UNUSED s32 arg1, UNUSED void *vAddr, UNUSED size_t nbytes) {
}
#endif

#ifndef VERSION_SH
struct AudioBank *bank_load_immediate(s32 bankId, s32 arg1) {
    UNUSED u32 pad1[4];
    u32 buf[4];
    u32 numInstruments, numDrums;
    struct AudioBank *ret;
    u8 *ctlData;
    s32 alloc;

    // (This is broken if the length is 1 (mod 16), but that never happens --
    // it's always divisible by 4.)
    alloc = gAlCtlHeader->seqArray[bankId].len + 0xf;
    alloc = ALIGN16(alloc);
    alloc -= 0x10;
    ctlData = gAlCtlHeader->seqArray[bankId].offset;
    ret = alloc_bank_or_seq(&gBankLoadedPool, 1, alloc, arg1, bankId);
    if (ret == NULL) {
        return NULL;
    }

    audio_dma_copy_immediate((uintptr_t) ctlData, buf, 0x10);
    numInstruments = buf[0];
    numDrums = buf[1];
    audio_dma_copy_immediate((uintptr_t)(ctlData + 0x10), ret, alloc);
    patch_audio_bank(ret, gAlTbl->seqArray[bankId].offset, numInstruments, numDrums);
    gCtlEntries[bankId].numInstruments = (u8) numInstruments;
    gCtlEntries[bankId].numDrums = (u8) numDrums;
    gCtlEntries[bankId].instruments = ret->instruments;
    gCtlEntries[bankId].drums = ret->drums;
    gBankLoadStatus[bankId] = SOUND_LOAD_STATUS_COMPLETE;
    return ret;
}
#endif

#ifndef VERSION_SH
struct AudioBank *bank_load_async(s32 bankId, s32 arg1, struct SequencePlayer *seqPlayer) {
    u32 numInstruments, numDrums;
    UNUSED u32 pad1[2];
    u32 buf[4];
    UNUSED u32 pad2;
    size_t alloc;
    struct AudioBank *ret;
    u8 *ctlData;
    OSMesgQueue *mesgQueue;
#if defined(VERSION_EU)
    UNUSED u32 pad3;
#endif

    alloc = gAlCtlHeader->seqArray[bankId].len + 0xf;
    alloc = ALIGN16(alloc);
    alloc -= 0x10;
    ctlData = gAlCtlHeader->seqArray[bankId].offset;
    ret = alloc_bank_or_seq(&gBankLoadedPool, 1, alloc, arg1, bankId);
    if (ret == NULL) {
        return NULL;
    }

    audio_dma_copy_immediate((uintptr_t) ctlData, buf, 0x10);
    numInstruments = buf[0];
    numDrums = buf[1];
    seqPlayer->loadingBankId = (u8) bankId;
#if defined(VERSION_EU)
    gCtlEntries[bankId].numInstruments = numInstruments;
    gCtlEntries[bankId].numDrums = numDrums;
    gCtlEntries[bankId].instruments = ret->instruments;
    gCtlEntries[bankId].drums = 0;
    seqPlayer->bankDmaCurrMemAddr = (u8 *) ret;
    seqPlayer->bankDmaCurrDevAddr = (uintptr_t)(ctlData + 0x10);
    seqPlayer->bankDmaRemaining = alloc;
    if (1) {
    }
#else
    seqPlayer->loadingBankNumInstruments = numInstruments;
    seqPlayer->loadingBankNumDrums = numDrums;
    seqPlayer->bankDmaCurrMemAddr = (u8 *) ret;
    seqPlayer->loadingBank = ret;
    seqPlayer->bankDmaCurrDevAddr = (uintptr_t)(ctlData + 0x10);
    seqPlayer->bankDmaRemaining = alloc;
#endif
    mesgQueue = &seqPlayer->bankDmaMesgQueue;
    osCreateMesgQueue(mesgQueue, &seqPlayer->bankDmaMesg, 1);
#if defined(VERSION_JP) || defined(VERSION_US)
    seqPlayer->bankDmaMesg = NULL;
#endif
    seqPlayer->bankDmaInProgress = TRUE;
    audio_dma_partial_copy_async(&seqPlayer->bankDmaCurrDevAddr, &seqPlayer->bankDmaCurrMemAddr,
                                 &seqPlayer->bankDmaRemaining, mesgQueue, &seqPlayer->bankDmaIoMesg);
    gBankLoadStatus[bankId] = SOUND_LOAD_STATUS_IN_PROGRESS;
    return ret;
}
#endif

#ifndef VERSION_SH
void *sequence_dma_immediate(s32 seqId, s32 arg1) {
    s32 seqLength;
    void *ptr;
    u8 *seqData;

    seqLength = gSeqFileHeader->seqArray[seqId].len + 0xf;
    seqLength = ALIGN16(seqLength);
    seqData = gSeqFileHeader->seqArray[seqId].offset;
    ptr = alloc_bank_or_seq(&gSeqLoadedPool, 1, seqLength, arg1, seqId);
    if (ptr == NULL) {
        return NULL;
    }

    audio_dma_copy_immediate((uintptr_t) seqData, ptr, seqLength);
    gSeqLoadStatus[seqId] = SOUND_LOAD_STATUS_COMPLETE;
    return ptr;
}
#endif

#ifndef VERSION_SH
void *sequence_dma_async(s32 seqId, s32 arg1, struct SequencePlayer *seqPlayer) {
    s32 seqLength;
    void *ptr;
    u8 *seqData;
    OSMesgQueue *mesgQueue;

    eu_stubbed_printf_1("Seq %d Loading Start\n", seqId);
    seqLength = gSeqFileHeader->seqArray[seqId].len + 0xf;
    seqLength = ALIGN16(seqLength);
    seqData = gSeqFileHeader->seqArray[seqId].offset;
    ptr = alloc_bank_or_seq(&gSeqLoadedPool, 1, seqLength, arg1, seqId);
    if (ptr == NULL) {
        eu_stubbed_printf_0("Heap Overflow Error\n");
        return NULL;
    }

    if (seqLength <= 0x40) {
        // Immediately load short sequenece
        audio_dma_copy_immediate((uintptr_t) seqData, ptr, seqLength);
        if (1) {
        }
        gSeqLoadStatus[seqId] = SOUND_LOAD_STATUS_COMPLETE;
    } else {
        audio_dma_copy_immediate((uintptr_t) seqData, ptr, 0x40);
        mesgQueue = &seqPlayer->seqDmaMesgQueue;
        osCreateMesgQueue(mesgQueue, &seqPlayer->seqDmaMesg, 1);
#if defined(VERSION_JP) || defined(VERSION_US)
        seqPlayer->seqDmaMesg = NULL;
#endif
        seqPlayer->seqDmaInProgress = TRUE;
        audio_dma_copy_async((uintptr_t)(seqData + 0x40), (u8 *) ptr + 0x40, seqLength - 0x40, mesgQueue,
                             &seqPlayer->seqDmaIoMesg);
        gSeqLoadStatus[seqId] = SOUND_LOAD_STATUS_IN_PROGRESS;
    }
    return ptr;
}
#endif

#ifndef VERSION_SH
u8 get_missing_bank(u32 seqId, s32 *nonNullCount, s32 *nullCount) {
    void *temp;
    u32 bankId;
    u16 offset;
    u8 i;
    u8 ret;

    *nullCount = 0;
    *nonNullCount = 0;
#if defined(VERSION_EU) || defined(VERSION_SH)
    offset = ((u16 *) gAlBankSets)[seqId];
    for (i = gAlBankSets[offset++], ret = 0; i != 0; i--) {
        bankId = gAlBankSets[offset++];
#else
    offset = ((u16 *) gAlBankSets)[seqId] + 1;
    for (i = gAlBankSets[offset - 1], ret = 0; i != 0; i--) {
        offset++;
        bankId = gAlBankSets[offset - 1];
#endif

        if (IS_BANK_LOAD_COMPLETE(bankId) == TRUE) {
#ifndef VERSION_SH
#if defined(VERSION_EU) || defined(VERSION_SH)
            temp = get_bank_or_seq(&gBankLoadedPool, 2, bankId);
#else
            temp = get_bank_or_seq(&gBankLoadedPool, 2, gAlBankSets[offset - 1]);
#endif
#endif
        } else {
            temp = NULL;
        }

        if (temp == NULL) {
            (*nullCount)++;
            ret = bankId;
        } else {
            (*nonNullCount)++;
        }
    }

    return ret;
}
#endif

#ifndef VERSION_SH
struct AudioBank *load_banks_immediate(s32 seqId, u8 *arg1) {
    void *ret;
    u32 bankId;
    u16 offset;
    u8 i;

    offset = ((u16 *) gAlBankSets)[seqId];
#ifdef VERSION_EU
    for (i = gAlBankSets[offset++]; i != 0; i--) {
        bankId = gAlBankSets[offset++];
#else
    offset++;
    for (i = gAlBankSets[offset - 1]; i != 0; i--) {
        offset++;
        bankId = gAlBankSets[offset - 1];
#endif

        if (IS_BANK_LOAD_COMPLETE(bankId) == TRUE) {
#ifdef VERSION_EU
            ret = get_bank_or_seq(&gBankLoadedPool, 2, bankId);
#else
            ret = get_bank_or_seq(&gBankLoadedPool, 2, gAlBankSets[offset - 1]);
#endif
        } else {
            ret = NULL;
        }

        if (ret == NULL) {
            ret = bank_load_immediate(bankId, 2);
        }
    }
    *arg1 = bankId;
    return ret;
}
#endif

#ifndef VERSION_SH
void preload_sequence(u32 seqId, u8 preloadMask) {
    void *sequenceData;
    u8 temp;

    if (seqId >= gSequenceCount) {
        return;
    }

    gAudioLoadLock = AUDIO_LOCK_LOADING;
    if (preloadMask & PRELOAD_BANKS) {
        load_banks_immediate(seqId, &temp);
    }

    if (preloadMask & PRELOAD_SEQUENCE) {
        // @bug should be IS_SEQ_LOAD_COMPLETE
        if (IS_BANK_LOAD_COMPLETE(seqId) == TRUE) {
            eu_stubbed_printf_1("SEQ  %d ALREADY CACHED\n", seqId);
            sequenceData = get_bank_or_seq(&gSeqLoadedPool, 2, seqId);
        } else {
            sequenceData = NULL;
        }
        if (sequenceData == NULL && sequence_dma_immediate(seqId, 2) == NULL) {
            gAudioLoadLock = AUDIO_LOCK_NOT_LOADING;
            return;
        }
    }

    gAudioLoadLock = AUDIO_LOCK_NOT_LOADING;
}
#endif

#ifndef VERSION_SH
void load_sequence_internal(u32 player, u32 seqId, s32 loadAsync);

void load_sequence(u32 player, u32 seqId, s32 loadAsync) {
    if (!loadAsync) {
        gAudioLoadLock = AUDIO_LOCK_LOADING;
    }
    load_sequence_internal(player, seqId, loadAsync);
    if (!loadAsync) {
        gAudioLoadLock = AUDIO_LOCK_NOT_LOADING;
    }
}
#endif

#ifndef VERSION_SH
void load_sequence_internal(u32 player, u32 seqId, s32 loadAsync) {
    void *sequenceData;
    struct SequencePlayer *seqPlayer = &gSequencePlayers[player];
    UNUSED u32 padding[2];

    if (seqId >= gSequenceCount) {
        return;
    }

    sequence_player_disable(seqPlayer);
    if (loadAsync) {
        s32 numMissingBanks = 0;
        s32 dummy = 0;
#ifdef VERSION_SH
        s32 bankId = 0xBA17; // dummy code to avoid problems
#else
        s32 bankId = get_missing_bank(seqId, &dummy, &numMissingBanks);
#endif
        if (numMissingBanks == 1) {
#ifndef VERSION_SH
            eu_stubbed_printf_0("Ok,one bank slow load Start \n");
            if (bank_load_async(bankId, 2, seqPlayer) == NULL) {
                return;
            }
#endif
            // @bug This should set the last bank (i.e. the first in the JSON)
            // as default, not the missing one. This code path never gets
            // taken, though -- all sequence loading is synchronous.
            seqPlayer->defaultBank[0] = bankId;
#ifdef VERSION_SH
        }
    }
#else
        } else {
            eu_stubbed_printf_1("Sorry,too many %d bank is none.fast load Start \n", numMissingBanks);
            if (load_banks_immediate(seqId, &seqPlayer->defaultBank[0]) == NULL) {
                return;
            }
        }
    } else if (load_banks_immediate(seqId, &seqPlayer->defaultBank[0]) == NULL) {
        return;
    }
#endif

    eu_stubbed_printf_2("Seq %d:Default Load Id is %d\n", seqId, seqPlayer->defaultBank[0]);
    eu_stubbed_printf_0("Seq Loading Start\n");

    seqPlayer->seqId = seqId;
#ifndef VERSION_SH
    sequenceData = get_bank_or_seq(&gSeqLoadedPool, 2, seqId);
#endif
    if (sequenceData == NULL) {
        if (seqPlayer->seqDmaInProgress) {
            eu_stubbed_printf_0("Error:Before Sequence-SlowDma remain.\n");
            eu_stubbed_printf_0("      Cancel Seq Start.\n");
            return;
        }
#ifndef VERSION_SH
        if (loadAsync) {
            sequenceData = sequence_dma_async(seqId, 2, seqPlayer);
        } else {

            sequenceData = sequence_dma_immediate(seqId, 2);
        }
#endif

        if (sequenceData == NULL) {
            return;
        }
    }

    eu_stubbed_printf_1("SEQ  %d ALREADY CACHED\n", seqId);
    init_sequence_player(player);
    seqPlayer->scriptState.depth = 0;
    seqPlayer->delay = 0;
    seqPlayer->enabled = TRUE;
    seqPlayer->seqData = sequenceData;
    seqPlayer->scriptState.pc = sequenceData;
}
#endif

#if defined(VERSION_SH)
void *func_sh_802f3ee8(uintptr_t devAddr, void *vAddr) {
    s32 b;
    return func_sh_802f3764(devAddr, vAddr, &b);
}

void *func_802f3f08(s32 poolIdx, s32 idx, s32 numChunks, s32 arg3, OSMesgQueue *retQueue) {
    s32 size;
    ALSeqFile *f;
    void *vAddr;
    s32 medium;
    s32 sp18;
    uintptr_t devAddr;
    s32 loadStatus;

    switch (poolIdx) {
        case 0:
            if (gSeqLoadStatus[idx] == SOUND_LOAD_STATUS_IN_PROGRESS) {
                return 0;
            }
            break;
        case 1:
            if (gBankLoadStatus[idx] == SOUND_LOAD_STATUS_IN_PROGRESS) {
                return 0;
            }
            break;
        case 2:
            if (gUnkLoadStatus[idx] == SOUND_LOAD_STATUS_IN_PROGRESS) {
                return 0;
            }
            break;

    }
    vAddr = get_bank_or_seq_wrapper(poolIdx, idx);
    if (vAddr != NULL) {
        loadStatus = 2;
        osSendMesg(retQueue, (OSMesg) (arg3 << 0x18), 0);
    } else {
        f = get_audio_file_header(poolIdx);
        size = f->seqArray[idx].len;
        size = ALIGN16(size);
        medium = f->seqArray[idx].magic[0];
        sp18 = f->seqArray[idx].magic[1];
        devAddr = (uintptr_t) f->seqArray[idx].offset;
        loadStatus = 2;

        switch (sp18) {
            case 0:
                vAddr = unk_pool1_alloc(poolIdx, idx, size);
                if (vAddr == NULL) {
                    return vAddr;
                }
                loadStatus = 5;
                break;
            case 1:
                vAddr = alloc_bank_or_seq(poolIdx, size, 1, idx);
                if (vAddr == NULL) {
                    return vAddr;
                }
                break;
            case 2:
                vAddr = alloc_bank_or_seq(poolIdx, size, 0, idx);
                if (vAddr == NULL) {
                    return vAddr;
                }
                break;

            case 4:
            case 3:
                vAddr = alloc_bank_or_seq(poolIdx, size, 2, idx);
                if (vAddr == NULL) {
                    return vAddr;
                }
                break;
        }

        func_sh_802f4cb4(devAddr, vAddr, size, medium, numChunks, retQueue, (arg3 << 0x18) | (poolIdx << 0x10) | (idx << 8) | loadStatus);
        loadStatus = SOUND_LOAD_STATUS_IN_PROGRESS;
    }

    switch (poolIdx) {
        case 0:
            if (gSeqLoadStatus[idx] != 5) {
                gSeqLoadStatus[idx] = loadStatus;
            }
            break;

        case 1:
            if (gBankLoadStatus[idx] != 5) {
                gBankLoadStatus[idx] = loadStatus;
            }
            break;

        case 2:
            if (gUnkLoadStatus[idx] != 5) {
                gUnkLoadStatus[idx] = loadStatus;
            }
            break;
    }

    return vAddr;
}

void func_802f41e4(s32 audioResetStatus) {
    func_sh_802f4a4c(audioResetStatus);
    func_sh_802f573c(audioResetStatus);
    func_sh_802f4dcc(audioResetStatus);
}
#endif

#if defined(VERSION_SH)
u8 gShindouSoundBanksHeader[] = {
#include "sound/ctl_header.inc.c"
};

u8 gBankSetsData[] = {
#include "sound/bank_sets.inc.c"
};

u8 gShindouSampleBanksHeader[] = {
#include "sound/tbl_header.inc.c"
};

u8 gShindouSequencesHeader[] = {
#include "sound/sequences_header.inc.c"
};
#endif

// (void) must be omitted from parameters
void audio_init() {
#if defined(VERSION_EU)
    UNUSED s8 pad[16];
#elif defined(VERSION_SH)
    UNUSED s8 pad[24];
#else
    UNUSED s8 pad[32];
#endif
#if defined(VERSION_JP) || defined(VERSION_US)
    u8 buf[0x10];
#endif
    s32 i, j, k;
    UNUSED s32 lim1; // lim1 unused in EU
#if defined(VERSION_EU) || defined(VERSION_SH)
    UNUSED u8 buf[0x10];
    s32 UNUSED lim2, lim3;
#else
    s32 lim2, lim3;
#endif
    UNUSED u32 size;
    UNUSED u64 *ptr64;
    void *data;
    UNUSED s32 pad2;
#ifdef VERSION_SH
    s32 seqCount;
#endif

#ifdef VERSION_SH
    gAudioLoadLockSH = 0;
#else
    gAudioLoadLock = AUDIO_LOCK_UNINITIALIZED;
#endif

#if defined(VERSION_JP) || defined(VERSION_US)
    lim1 = gUnusedCount80333EE8;
    for (i = 0; i < lim1; i++) {
        gUnused80226E58[i] = 0;
        gUnused80226E98[i] = 0;
    }

    lim2 = gAudioHeapSize;
    for (i = 0; i <= lim2 / 8 - 1; i++) {
        ((u64 *) gAudioHeap)[i] = 0;
    }

#ifdef TARGET_N64
    // It seems boot.s doesn't clear the .bss area for audio, so do it here.
    i = 0;
    lim3 = ((uintptr_t) &gAudioGlobalsEndMarker - (uintptr_t) &gAudioGlobalsStartMarker) / 8;
    ptr64 = &gAudioGlobalsStartMarker - 1;
    for (k = lim3; k >= 0; k--) {
        i++;
        ptr64[i] = 0;
    }
#endif

#else
    for (i = 0; i < gAudioHeapSize / 8; i++) {
        ((u64 *) gAudioHeap)[i] = 0;
    }

#ifdef TARGET_N64
    // It seems boot.s doesn't clear the .bss area for audio, so do it here.
    lim3 = ((uintptr_t) &gAudioGlobalsEndMarker - (uintptr_t) &gAudioGlobalsStartMarker) / 8;
    ptr64 = &gAudioGlobalsStartMarker;
    for (k = lim3; k >= 0; k--) {
        *ptr64++ = 0;
    }
#endif

#ifdef VERSION_EU
    D_EU_802298D0 = 20.03042f;
    gRefreshRate = 50;
    port_eu_init();
    if (k) {
    }
#else
    D_EU_802298D0 = 16.713f;
    gRefreshRate = 60;
    func_sh_802f6a9c();
#endif
#endif

#ifdef TARGET_N64
    eu_stubbed_printf_3("Clear Workarea %x -%x size %x \n",
        (uintptr_t) &gAudioGlobalsStartMarker,
        (uintptr_t) &gAudioGlobalsEndMarker,
        (uintptr_t) &gAudioGlobalsEndMarker - (uintptr_t) &gAudioGlobalsStartMarker
    );
#endif

    eu_stubbed_printf_1("AudioHeap is %x\n", gAudioHeapSize);

    for (i = 0; i < NUMAIBUFFERS; i++) {
        gAiBufferLengths[i] = 0xa0;
    }

    gAudioFrameCount = 0;
    gAudioTaskIndex = 0;
    gCurrAiBufferIndex = 0;
    gSoundMode = 0;
    gAudioTask = NULL;
    gAudioTasks[0].task.t.data_size = 0;
    gAudioTasks[1].task.t.data_size = 0;
    osCreateMesgQueue(&gAudioDmaMesgQueue, &gAudioDmaMesg, 1);
    osCreateMesgQueue(&gCurrAudioFrameDmaQueue, gCurrAudioFrameDmaMesgBufs,
                      ARRAY_COUNT(gCurrAudioFrameDmaMesgBufs));
#ifdef VERSION_SH
    osCreateMesgQueue(&gUnkQueue1, gUnkMesgBufs1, 0x10);
    osCreateMesgQueue(&gUnkQueue2, gUnkMesgBufs2, 0x10);
#endif
    gCurrAudioFrameDmaCount = 0;
    gSampleDmaNumListItems = 0;

    sound_init_main_pools(gAudioInitPoolSize);

    for (i = 0; i < NUMAIBUFFERS; i++) {
#ifdef VERSION_SH
        gAiBuffers[i] = sound_alloc_uninitialized(&gAudioInitPool, AIBUFFER_LEN);
#else
        gAiBuffers[i] = soundAlloc(&gAudioInitPool, AIBUFFER_LEN);
#endif

        for (j = 0; j < (s32) (AIBUFFER_LEN / sizeof(s16)); j++) {
            gAiBuffers[i][j] = 0;
        }
    }

#if defined(VERSION_EU) || defined(VERSION_SH)
    gAudioResetPresetIdToLoad = 0;
    gAudioResetStatus = 1;
    audio_shut_down_and_reset_step();
#else
    audio_reset_session(&gAudioSessionPresets[0]);
#endif

    // Not sure about these prints
    eu_stubbed_printf_1("Heap reset.Synth Change %x \n", 0);
    eu_stubbed_printf_3("Heap %x %x %x\n", 0, 0, 0);
    eu_stubbed_printf_0("Main Heap Initialize.\n");

    // Load header for sequence data (assets/music_data.sbk.s)
#ifdef VERSION_SH
    gSeqFileHeader = (ALSeqFile *) gShindouSequencesHeader;
    gAlCtlHeader = (ALSeqFile *) gShindouSoundBanksHeader;
    gAlTbl = (ALSeqFile *) gShindouSampleBanksHeader;
    gAlBankSets = gBankSetsData;
    gSequenceCount = (s16) gSeqFileHeader->seqCount;
    patch_seq_file(gSeqFileHeader, gMusicData, D_SH_80315EF4);
    patch_seq_file(gAlCtlHeader, gSoundDataADSR, D_SH_80315EF8);
    patch_seq_file(gAlTbl, gSoundDataRaw, D_SH_80315EFC);
    seqCount = gAlCtlHeader->seqCount;
    gCtlEntries = sound_alloc_uninitialized(&gAudioInitPool, seqCount * sizeof(struct CtlEntry));
    for (i = 0; i < seqCount; i++) {
        gCtlEntries[i].bankId1 = (u8) ((gAlCtlHeader->seqArray[i].ctl.as_s16.bankAndFf >> 8) & 0xff);
        gCtlEntries[i].bankId2 = (u8) (gAlCtlHeader->seqArray[i].ctl.as_s16.bankAndFf & 0xff);
        gCtlEntries[i].numInstruments = (u8) ((gAlCtlHeader->seqArray[i].ctl.as_s16.numInstrumentsAndDrums >> 8) & 0xff);
        gCtlEntries[i].numDrums = (u8) (gAlCtlHeader->seqArray[i].ctl.as_s16.numInstrumentsAndDrums & 0xff);
    }
    data = sound_alloc_uninitialized(&gAudioInitPool, D_SH_80315EF0);
    if (data == NULL) {
        D_SH_80315EF0 = 0;
    }
    sound_alloc_pool_init(&gUnkPool1.pool, data, D_SH_80315EF0);
    init_sequence_players();
#else
    gSeqFileHeader = (ALSeqFile *) buf;
    data = gMusicData;
    audio_dma_copy_immediate((uintptr_t) data, gSeqFileHeader, 0x10);
    gSequenceCount = gSeqFileHeader->seqCount;
#if defined(VERSION_EU)
    size = gSequenceCount * sizeof(ALSeqData) + 4;
    size = ALIGN16(size);
#else
    size = ALIGN16(gSequenceCount * sizeof(ALSeqData) + 4);
#endif
    gSeqFileHeader = soundAlloc(&gAudioInitPool, size);
    audio_dma_copy_immediate((uintptr_t) data, gSeqFileHeader, size);
    alSeqFileNew(gSeqFileHeader, data);

    // Load header for CTL (assets/sound_data.ctl.s, i.e. ADSR)
    gAlCtlHeader = (ALSeqFile *) buf;
    data = gSoundDataADSR;
    audio_dma_copy_immediate((uintptr_t) data, gAlCtlHeader, 0x10);
    size = gAlCtlHeader->seqCount * sizeof(ALSeqData) + 4;
    size = ALIGN16(size);
    gCtlEntries = soundAlloc(&gAudioInitPool, gAlCtlHeader->seqCount * sizeof(struct CtlEntry));
    gAlCtlHeader = soundAlloc(&gAudioInitPool, size);
    audio_dma_copy_immediate((uintptr_t) data, gAlCtlHeader, size);
    alSeqFileNew(gAlCtlHeader, data);

    // Load header for TBL (assets/sound_data.tbl.s, i.e. raw data)
    gAlTbl = (ALSeqFile *) buf;
    audio_dma_copy_immediate((uintptr_t) data, gAlTbl, 0x10);
    size = gAlTbl->seqCount * sizeof(ALSeqData) + 4;
    size = ALIGN16(size);
    gAlTbl = soundAlloc(&gAudioInitPool, size);
    audio_dma_copy_immediate((uintptr_t) gSoundDataRaw, gAlTbl, size);
    alSeqFileNew(gAlTbl, gSoundDataRaw);

    // Load bank sets for each sequence (assets/bank_sets.s)
    gAlBankSets = soundAlloc(&gAudioInitPool, 0x100);
    audio_dma_copy_immediate((uintptr_t) gBankSetsData, gAlBankSets, 0x100);

    init_sequence_players();
    gAudioLoadLock = AUDIO_LOCK_NOT_LOADING;
    // Should probably contain the sizes of the data banks, but those aren't
    // easily accessible from here.
    eu_stubbed_printf_0("---------- Init Completed. ------------\n");
    eu_stubbed_printf_1(" Syndrv    :[%6d]\n", 0); // gSoundDataADSR
    eu_stubbed_printf_1(" Seqdrv    :[%6d]\n", 0); // gMusicData
    eu_stubbed_printf_1(" audiodata :[%6d]\n", 0); // gSoundDataRaw
    eu_stubbed_printf_0("---------------------------------------\n");
#endif
}

#if defined(VERSION_SH)
s32 func_802f47c8(s32 bankId, u8 idx, s8 *io) {
    struct AudioBankSample *sample = func_sh_802f4978(bankId, idx);
    struct PendingDmaSample *temp;
    if (sample == NULL) {
        *io = 0;
        return -1;
    }
    if (sample->medium == 0) {
        *io = 2;
        return 0;
    }
    temp = &D_SH_80343D00.arr[D_SH_80343D00.someIndex];
    if (temp->state == 3) {
        temp->state = 0;
    }
    temp->sample = *sample;
    temp->io = io;
    temp->vAddr = func_sh_802f1d40(sample->size, bankId, sample->sampleAddr, sample->medium);
    if (temp->vAddr == NULL) {
        if (sample->medium == 1 || sample->codec == 2) {
            *io = 0;
            return -1;
        } else {
            *io = 3;
            return -1;
        }
    }
    temp->state = 1;
    temp->remaining = ALIGN16(sample->size);
    temp->resultSampleAddr = (u8 *) temp->vAddr;
    temp->devAddr = (uintptr_t) sample->sampleAddr;
    temp->medium = sample->medium;
    temp->bankId = bankId;
    temp->idx = idx;
    D_SH_80343D00.someIndex ^= 1;
    return 0;
}

struct AudioBankSample *func_sh_802f4978(s32 bankId, s32 idx) {
    struct Drum *drum;
    struct Instrument *inst;
    struct AudioBankSample *ret;

    if (idx < 128) {
        inst = get_instrument_inner(bankId, idx);
        if (inst == 0) {
            return NULL;
        }
        ret = inst->normalNotesSound.sample;
    } else {
        drum = get_drum(bankId, idx - 128);
        if (drum == 0) {
            return NULL;
        }
        ret = drum->sound.sample;
    }
    return ret;
}
void stub_sh_802f49dc(void) {

}

void func_sh_802f49e4(struct PendingDmaSample *arg0) {
    struct AudioBankSample *sample = func_sh_802f4978(arg0->bankId, arg0->idx);
    if (sample != NULL) {
        arg0->sample = *sample;
        sample->sampleAddr = arg0->resultSampleAddr;
        sample->medium = 0;
    }
}

void func_sh_802f4a4c(s32 audioResetStatus) {
    ALSeqFile *alTbl;
    struct PendingDmaSample *entry;

    s32 i;

    alTbl = gAlTbl;

    for (i = 0; i < 2; i++) {
        entry = &D_SH_80343D00.arr[i];
        switch (entry->state) {
            case 2:
                osRecvMesg(&entry->queue, NULL, 1);
                if (audioResetStatus != 0) {
                    entry->state = 3;
                    break;
                }
                // fallthrough
            case 1:
                entry->state = 2;
                if (entry->remaining == 0) {
                    func_sh_802f49e4(entry);
                    entry->state = 3;
                    *entry->io = 1;
                } else if (entry->remaining < 0x1000) {
                    if (1 == entry->medium) {
                        func_sh_802f4c5c(entry->devAddr, entry->vAddr, entry->remaining, alTbl->unk2);
                    } else {
                        func_sh_802f4bd8(entry, entry->remaining);
                    }
                    entry->remaining = 0;
                } else {
                    if (1 == entry->medium) {
                        func_sh_802f4c5c(entry->devAddr, entry->vAddr, 0x1000, alTbl->unk2);
                    } else {
                        func_sh_802f4bd8(entry, 0x1000);
                    }
                    entry->remaining = (s32) (entry->remaining - 0x1000);
                    entry->vAddr = (u8 *) entry->vAddr + 0x1000;
                    entry->devAddr = entry->devAddr + 0x1000;
                }
                break;
        }
    }
}

extern char shindouDebugPrint102[];
void func_sh_802f4bd8(struct PendingDmaSample *arg0, s32 len) { // len must be signed
    osInvalDCache(arg0->vAddr, len);
    osCreateMesgQueue(&arg0->queue, arg0->mesgs, 1);
    func_sh_802f3dd0(&arg0->ioMesg, 0, 0, arg0->devAddr, arg0->vAddr, len, &arg0->queue, arg0->medium, shindouDebugPrint102);
}

void func_sh_802f4c5c(uintptr_t devAddr, void *vAddr, size_t nbytes, s32 arg3) {
    uintptr_t sp1C;

    sp1C = devAddr;
    osInvalDCache(vAddr, nbytes);
    func_sh_802f3ed4(func_sh_802f3ec4(arg3, &sp1C), sp1C, vAddr, nbytes);
}

struct PendingDmaAudioBank *func_sh_802f4cb4(uintptr_t devAddr, void *vAddr, s32 size, s32 medium, s32 numChunks, OSMesgQueue *retQueue, s32 encodedInfo) {
    struct PendingDmaAudioBank *item;
    s32 i;

    for (i = 0; i < ARRAY_COUNT(D_SH_8034F690); i++) {
        if (D_SH_8034F690[i].inProgress == 0) {
            item = &D_SH_8034F690[i];
            break;
        }
    }
    if (i == ARRAY_COUNT(D_SH_8034F690)) {
        return NULL;
    }

    item->inProgress = 1;
    item->devAddr = devAddr;
    item->audioBank = vAddr;
    item->vAddr = vAddr;
    item->remaining = size;
    if (numChunks == 0) {
        item->transferSize = 0x1000;
    } else {
        item->transferSize = ((size / numChunks) + 0xFF) & ~0xFF;
        if (item->transferSize < 0x100) {
            item->transferSize = 0x100;
        }
    }
    item->retQueue = retQueue;
    item->timer = 3;
    item->medium = medium;
    item->encodedInfo = encodedInfo;
    osCreateMesgQueue(&item->dmaRetQueue, item->mesgs, 1);
    return item;
}

void func_sh_802f4dcc(s32 audioResetStatus) {
    s32 i;

    if (gAudioLoadLockSH != 1) {
        for (i = 0; i < ARRAY_COUNT(D_SH_8034F690); i++) {
            if (D_SH_8034F690[i].inProgress == 1) {
                func_sh_802f4e50(&D_SH_8034F690[i], audioResetStatus);
            }
        }
    }
}

void func_sh_802f4e50(struct PendingDmaAudioBank *audioBank, s32 audioResetStatus) {
    ALSeqFile *alSeqFile;
    u32 *encodedInfo;
    OSMesg mesg;
    u32 temp;
    u32 seqId;
    s32 bankId1;
    s32 bankId2;
    struct PatchStruct patchStruct;
    alSeqFile = gAlTbl;
    if (audioBank->timer >= 2) {
        audioBank->timer--;
        return;
    }
    if (audioBank->timer == 1) {
        audioBank->timer = 0;
    } else {
        if (audioResetStatus != 0) {
            osRecvMesg(&audioBank->dmaRetQueue, NULL, OS_MESG_BLOCK);
            audioBank->inProgress = 0;
            return;
        }
        if (osRecvMesg(&audioBank->dmaRetQueue, NULL, OS_MESG_NOBLOCK) == -1) {
            return;
        }
    }

    encodedInfo = &audioBank->encodedInfo;
    if (audioBank->remaining == 0) {
        mesg = (OSMesg) audioBank->encodedInfo;
        mesg = mesg;    //! needs an extra read from mesg here to match...
        temp = *encodedInfo;
        seqId = (temp >> 8) & 0xFF;
        switch ((u8) (temp >> 0x10)) {
            case 0:
                if (gSeqLoadStatus[seqId] != 5) {
                    gSeqLoadStatus[seqId] = (u8) (temp & 0xFF);
                }
                break;
            case 2:
                if (gUnkLoadStatus[seqId] != 5) {
                    gUnkLoadStatus[seqId] = (u8) (temp & 0xFF);
                }
                break;
            case 1:
                if (gBankLoadStatus[seqId] != 5) {
                    gBankLoadStatus[seqId] = (u8) (temp & 0xFF);
                }
                bankId1 = gCtlEntries[seqId].bankId1;
                bankId2 = gCtlEntries[seqId].bankId2;
                patchStruct.bankId1 = bankId1;
                patchStruct.bankId2 = bankId2;
                if (bankId1 != 0xFF) {
                    patchStruct.baseAddr1 = func_sh_802f3598(bankId1, &patchStruct.medium1);
                } else {
                    patchStruct.baseAddr1 = NULL;
                }
                if (bankId2 != 0xFF) {
                    patchStruct.baseAddr2 = func_sh_802f3598(bankId2, &patchStruct.medium2);
                } else {
                    patchStruct.baseAddr2 = NULL;
                }

                func_sh_802f5310(seqId, audioBank->audioBank, &patchStruct, 1);
                break;
        }
        mesg = (OSMesg) audioBank->encodedInfo;
        audioBank->inProgress = 0;
        osSendMesg(audioBank->retQueue, mesg, OS_MESG_NOBLOCK);
    } else if (audioBank->remaining < audioBank->transferSize) {
        if (audioBank->medium == 1) {
            func_sh_802f517c(audioBank->devAddr, audioBank->vAddr, audioBank->remaining, alSeqFile->unk2);
        } else {
            func_sh_802f50ec(audioBank, audioBank->remaining);
        }

        audioBank->remaining = 0;
    } else {
        if (audioBank->medium == 1) {
            func_sh_802f517c(audioBank->devAddr, audioBank->vAddr, audioBank->transferSize, alSeqFile->unk2);
        } else {
            func_sh_802f50ec(audioBank, audioBank->transferSize);
        }

        audioBank->remaining -= audioBank->transferSize;
        audioBank->devAddr   += audioBank->transferSize;
        audioBank->vAddr = ((u8 *) audioBank->vAddr) + audioBank->transferSize;
    }
}

extern char shindouDebugPrint110[];
void func_sh_802f50ec(struct PendingDmaAudioBank *arg0, size_t len) {
    len += 0xf;
    len &= ~0xf;
    osInvalDCache(arg0->vAddr, len);
    osCreateMesgQueue(&arg0->dmaRetQueue, arg0->mesgs, 1);
    func_sh_802f3dd0(&arg0->ioMesg, 0, 0, arg0->devAddr, arg0->vAddr, len, &arg0->dmaRetQueue, arg0->medium, shindouDebugPrint110);
}


void func_sh_802f517c(uintptr_t devAddr, void *vAddr, size_t nbytes, s32 arg3) {
    uintptr_t sp1C;

    sp1C = devAddr;
    osInvalDCache(vAddr, nbytes);
    func_sh_802f3ed4(func_sh_802f3ec4(arg3, &sp1C), sp1C, vAddr, nbytes);
}

void func_sh_802f51d4(struct AudioBankSound *sound, struct AudioBank *memBase, struct PatchStruct *patchInfo) {
    struct AudioBankSample *sample;
    void *patched;

#define PATCH(x, base) (patched = (void *)((uintptr_t) (x) + (uintptr_t) base))

    if ((uintptr_t) sound->sample <= 0x80000000) {
        sample = sound->sample = PATCH(sound->sample, memBase);
        if (sample->size != 0 && sample->isPatched != TRUE) {
            sample->loop = PATCH(sample->loop, memBase);
            sample->book = PATCH(sample->book, memBase);
            switch (sample->medium) {
                case 0:
                    sample->sampleAddr = PATCH(sample->sampleAddr, patchInfo->baseAddr1);
                    sample->medium = patchInfo->medium1;
                    break;
                case 1:
                    sample->sampleAddr = PATCH(sample->sampleAddr, patchInfo->baseAddr2);
                    sample->medium = patchInfo->medium2;
                    break;

                case 2:
                case 3:
                    break;
            }
            sample->isPatched = TRUE;
            if (sample->bit1 && sample->medium != 0) {
                D_SH_8034EA88[D_SH_8034F688++] = sample;
            }
        }
    }
#undef PATCH
}

s32 func_sh_802f5310(s32 bankId, struct AudioBank *mem, struct PatchStruct *patchInfo, s32 arg3) {
    UNUSED u32 pad[2];
    u8 *addr;
    UNUSED u32 pad1[3];
    s32 sp4C;
    struct AudioBankSample *temp_s0;
    s32 i;
    s32 count;
    s32 temp;

    sp4C = 0;
    if (D_SH_8034F68C != 0) {
        sp4C = 1;
    } else {
        D_SH_80343CF0 = 0;
    }
    D_SH_8034F688 = 0;
    patch_audio_bank(bankId, mem, patchInfo);

    count = 0;
    for (i = 0; i < D_SH_8034F688; i++) {
        count += ALIGN16(D_SH_8034EA88[i]->size);
    }

    for (i = 0; i < D_SH_8034F688; i++) {
        if (D_SH_8034F68C != 0x78) {
            temp_s0 = D_SH_8034EA88[i];
            switch (arg3) {
                case 0:
                    temp = temp_s0->medium = patchInfo->medium1;
                    if (temp != 0) {
                        if (temp_s0->size) {
                        }
                        addr = func_sh_802f1d90(temp_s0->size, patchInfo->bankId1, temp_s0->sampleAddr, temp_s0->medium);
                    } else {
                        temp = temp_s0->medium = patchInfo->medium2;
                        if (temp != 0) {
                            addr = func_sh_802f1d90(temp_s0->size, patchInfo->bankId2, temp_s0->sampleAddr, temp_s0->medium);
                        }
                    }
                    break;

                case 1:
                    temp = temp_s0->medium = patchInfo->medium1;
                    if (temp != 0) {
                        addr = func_sh_802f1d40(temp_s0->size, patchInfo->bankId1, temp_s0->sampleAddr, temp_s0->medium);
                    } else {
                        temp = temp_s0->medium = patchInfo->medium2;
                        if (temp != 0) {
                            addr = func_sh_802f1d40(temp_s0->size, patchInfo->bankId2, temp_s0->sampleAddr, temp_s0->medium);
                        }
                    }
                    break;
            }
            switch ((uintptr_t) addr) {
                case 0:
                    break;
                default:
                switch (arg3) {
                    case 0:
                        if (temp_s0->medium == 1) {
                            func_sh_802f3d78((uintptr_t) temp_s0->sampleAddr, addr, temp_s0->size, gAlTbl->unk2);
                            temp_s0->sampleAddr = addr;
                            temp_s0->medium = 0;
                        } else {
                            func_sh_802f3c38((uintptr_t) temp_s0->sampleAddr, addr, temp_s0->size, temp_s0->medium);
                            temp_s0->sampleAddr = addr;
                            temp_s0->medium = 0;
                        }
                        break;

                    case 1:
                        D_SH_8034EC88[D_SH_8034F68C].sample = temp_s0;
                        D_SH_8034EC88[D_SH_8034F68C].ramAddr = addr;
                        D_SH_8034EC88[D_SH_8034F68C].encodedInfo = (D_SH_8034F68C << 24) | 0xffffff;
                        D_SH_8034EC88[D_SH_8034F68C].isFree = FALSE;
                        D_SH_8034EC88[D_SH_8034F68C].endAndMediumIdentification = temp_s0->sampleAddr + temp_s0->size + temp_s0->medium;
                        D_SH_8034F68C++;
                        break;
                }
            }
            continue;
        }
        break;
    }

    D_SH_8034F688 = 0;
    if (D_SH_8034F68C != 0 && sp4C == 0) {
        temp_s0 = D_SH_8034EC88[D_SH_8034F68C - 1].sample;
        temp = (temp_s0->size >> 12);
        temp += 1;
        count = (uintptr_t) temp_s0->sampleAddr;
        func_sh_802f4cb4(
            count,
            D_SH_8034EC88[D_SH_8034F68C - 1].ramAddr,
            temp_s0->size,
            temp_s0->medium,
            temp,
            &gUnkQueue2,
            D_SH_8034EC88[D_SH_8034F68C - 1].encodedInfo);
    }
}

s32 func_sh_802f573c(s32 audioResetStatus) {
    struct AudioBankSample *sample;
    u32 idx;
    u8 *sampleAddr;
    u32 size;
    s32 unk;
    u8 *added;

    if (D_SH_8034F68C > 0) {
        if (audioResetStatus != 0) {
            if (osRecvMesg(&gUnkQueue2, (OSMesg *) &idx, OS_MESG_NOBLOCK)){
            }
            D_SH_8034F68C = 0;
            return 0;
        }
        if (osRecvMesg(&gUnkQueue2, (OSMesg *) &idx, OS_MESG_NOBLOCK) == -1) {
            return 0;
        }
        idx >>= 0x18;
        if (D_SH_8034EC88[idx].isFree == FALSE) {
            sample = D_SH_8034EC88[idx].sample;
            added = (sample->sampleAddr + sample->size + sample->medium);
            if (added == D_SH_8034EC88[idx].endAndMediumIdentification) {
                sample->sampleAddr = D_SH_8034EC88[idx].ramAddr;
                sample->medium = 0;
            }
            D_SH_8034EC88[idx].isFree = TRUE;
        }

    next:
        if (D_SH_8034F68C > 0) {
            if (D_SH_8034EC88[D_SH_8034F68C - 1].isFree == TRUE) {
                D_SH_8034F68C--;
                goto next;
            }
            sample = D_SH_8034EC88[D_SH_8034F68C - 1].sample;
            sampleAddr = sample->sampleAddr;
            size = sample->size;
            unk = size >> 0xC;
            unk += 1;
            added = ((sampleAddr + size) + sample->medium);
            if (added != D_SH_8034EC88[D_SH_8034F68C - 1].endAndMediumIdentification) {
                D_SH_8034EC88[D_SH_8034F68C - 1].isFree = TRUE;
                D_SH_8034F68C--;
                goto next;
            }
            size = sample->size;
            func_sh_802f4cb4(sampleAddr, D_SH_8034EC88[D_SH_8034F68C - 1].ramAddr, size, sample->medium,
                             unk, &gUnkQueue2, D_SH_8034EC88[D_SH_8034F68C - 1].encodedInfo);
        }
    }
    return 1;
}

s32 func_sh_802f5900(struct AudioBankSample *sample, s32 numLoaded, struct AudioBankSample *arg2[]) {
    s32 i;

    for (i = 0; i < numLoaded; i++) {
        if (sample->sampleAddr == arg2[i]->sampleAddr) {
            break;
        }
    }
    if (i == numLoaded) {
        arg2[numLoaded++] = sample;
    }
    return numLoaded;
}

s32 func_sh_802f5948(s32 bankId, struct AudioBankSample *list[]) {
    s32 i;
    struct Drum *drum;
    struct Instrument *inst;
    s32 numLoaded;
    s32 numDrums;
    s32 numInstruments;

    numLoaded = 0;
    numDrums = gCtlEntries[bankId].numDrums;
    numInstruments = gCtlEntries[bankId].numInstruments;

    for (i = 0; i < numDrums; i++) {
        drum = get_drum(bankId, i);
        if (drum == NULL) {
            continue;
        }
        numLoaded = func_sh_802f5900(drum->sound.sample, numLoaded, list);
    }
    for (i = 0; i < numInstruments; i++) {
        inst = get_instrument_inner(bankId, i);
        if (inst == NULL) {
            continue;

        }
        if (inst->normalRangeLo != 0) {
            numLoaded = func_sh_802f5900(inst->lowNotesSound.sample, numLoaded, list);
        }
        if (inst->normalRangeHi != 127) {
            numLoaded = func_sh_802f5900(inst->highNotesSound.sample, numLoaded, list);
        }
        numLoaded = func_sh_802f5900(inst->normalNotesSound.sample, numLoaded, list);
    }
    return numLoaded;
}
#endif
