#include <ultra64.h>

#include "buffers.h"

u8 gDecompressionHeap[0xD000];

u8 gAudioHeap[0x31200];

// Yield buffer for audio, 0x400 bytes. Stubbed out post-JP since the audio
// task never yields.
#ifdef VERSION_JP
u8 gAudioSPTaskYieldBuffer[OS_YIELD_AUDIO_SIZE];
#endif

// Probably Thread 2 stack space. Unreferenced, and stubbed out with f3dex to
// avoid an overflowing .buffers segment.
#ifndef F3DEX_GBI_SHARED
u8 gUnusedThread2Stack[0x1400];
#endif

u8 gIdleThreadStack[0x800];
u8 gThread3Stack[0x2000];
u8 gThread4Stack[0x2000];
u8 gThread5Stack[0x2000];

// 0xc00 bytes for f3dex, 0x900 otherwise
u8 gGfxSPTaskYieldBuffer[OS_YIELD_DATA_SIZE];

// 0x200 bytes
struct SaveBuffer gSaveBuffer;

// 0x400 bytes
u8 gGfxSPTaskStack[SP_DRAM_STACK_SIZE8];

// 0x190a0 bytes
struct GfxPool gGfxPools[2];
