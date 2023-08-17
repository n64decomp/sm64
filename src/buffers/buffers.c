#include <ultra64.h>

#include "buffers.h"

ALIGNED8 u8 gDecompressionHeap[0xD000];

#if defined(VERSION_EU)
ALIGNED16 u8 gAudioHeap[DOUBLE_SIZE_ON_64_BIT(0x31200) - 0x3800];
#elif defined(VERSION_SH)
ALIGNED16 u8 gAudioHeap[DOUBLE_SIZE_ON_64_BIT(0x31200) - 0x4800];
#elif defined(VERSION_CN)
ALIGNED16 u8 gAudioHeap[DOUBLE_SIZE_ON_64_BIT(0x31200) - 0x4C00];
#else
ALIGNED16 u8 gAudioHeap[DOUBLE_SIZE_ON_64_BIT(0x31200)];
#endif

#ifdef VERSION_CN

// iQue BSS reordering

// 0x200 bytes
ALIGNED8 struct SaveBuffer gSaveBuffer;
// 0x190a0 bytes
struct GfxPool gGfxPools[2];
ALIGNED8 u8 gThread4Stack[STACKSIZE];
#if ENABLE_RUMBLE
ALIGNED8 u8 gThread6Stack[STACKSIZE];
#endif
ALIGNED8 u8 gThread5Stack[STACKSIZE];
// 0x400 bytes
ALIGNED8 u8 gGfxSPTaskStack[SP_DRAM_STACK_SIZE8];
// 0xc00 bytes for f3dex, 0x900 otherwise
ALIGNED8 u8 gGfxSPTaskYieldBuffer[OS_YIELD_DATA_SIZE];
ALIGNED8 u8 gThread3Stack[STACKSIZE + 0x400];
ALIGNED8 u8 gIdleThreadStack[IDLE_STACKSIZE];

#else

ALIGNED8 u8 gIdleThreadStack[IDLE_STACKSIZE];
ALIGNED8 u8 gThread3Stack[STACKSIZE];
ALIGNED8 u8 gThread4Stack[STACKSIZE];
ALIGNED8 u8 gThread5Stack[STACKSIZE];
#if ENABLE_RUMBLE
ALIGNED8 u8 gThread6Stack[STACKSIZE];
#endif
// 0x400 bytes
ALIGNED8 u8 gGfxSPTaskStack[SP_DRAM_STACK_SIZE8];
// 0xc00 bytes for f3dex, 0x900 otherwise
ALIGNED8 u8 gGfxSPTaskYieldBuffer[OS_YIELD_DATA_SIZE];
// 0x200 bytes
ALIGNED8 struct SaveBuffer gSaveBuffer;
// 0x190a0 bytes
struct GfxPool gGfxPools[2];

#endif

// Yield buffer for audio, 0x400 bytes. Stubbed out post-JP since the audio
// task never yields.
#ifdef VERSION_JP
ALIGNED8 u8 gAudioSPTaskYieldBuffer[OS_YIELD_AUDIO_SIZE];
#endif

// Probably Thread 2 stack space. Unreferenced, and stubbed out with f3dex to
// avoid an overflowing .buffers segment.
#if !defined(F3DEX_GBI_SHARED) && !defined(VERSION_EU)
ALIGNED8 u8 gUnusedThread2Stack[UNUSED_STACKSIZE];
#endif
