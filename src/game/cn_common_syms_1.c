#include <ultra64.h>

#include "macros.h"

// This file is used to place iQue COMMON/.scommon symbols in the right locations.

#ifdef VERSION_CN
FORCE_BSS u32 __osBaseCounter;
FORCE_BSS s16 gSaveOptSelectIndex;
FORCE_BSS s32 sNumCountOverflows;
FORCE_BSS s32 sLastHighestCount;
FORCE_BSS u32 __osViIntrCount;
FORCE_BSS s16 gCurrActNum;
FORCE_BSS u8 __osMaxControllers;
FORCE_BSS OSTime __osCurrentTime;
FORCE_BSS s16 gMenuOptSelectIndex;
FORCE_BSS s32 sLastHighestCount2;
FORCE_BSS u8 __osContLastCmd;
FORCE_BSS OSMesg __osEepromTimerMsg;
FORCE_BSS u32 __osTimerCounter;
FORCE_BSS s16 gCurrAreaIndex;
FORCE_BSS s32 sNumCountOverflows2;
FORCE_BSS struct MemoryPool *gEffectsMemoryPool;
FORCE_BSS s8 gNeverEnteredCastle;
FORCE_BSS s8 gRedCoinsCollected;
FORCE_BSS s16 gSavedCourseNum;
FORCE_BSS u32 __osFinalrom;
FORCE_BSS s16 gCurrCourseNum;
#endif
