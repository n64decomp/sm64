#include <ultra64.h>

#include "sm64.h"
#include "room.h"

s16 gCheckingSurfaceCollisionsForCamera;
s16 gFindFloorIncludeSurfaceIntangible;
s16 *gEnvironmentRegions;
s32 gEnvironmentLevels[20];
s8 gDoorAdjacentRooms[60][2];
s16 gMarioCurrentRoom;
s16 D_8035FEE2;
s16 D_8035FEE4;
s16 gTHIWaterDrained;
s16 gTTCSpeedSetting;
s16 gMarioShotFromCannon;
s16 gCCMEnteredSlide;
s16 gNumRoomedObjectsInMarioRoom;
s16 gNumRoomedObjectsNotInMarioRoom;
s16 gWDWWaterLevelChanging;
s16 gMarioOnMerryGoRound;
