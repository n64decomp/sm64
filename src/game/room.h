#ifndef ROOM_H
#define ROOM_H

#include "types.h"

extern s16 gCheckingSurfaceCollisionsForCamera;
extern s16 gFindFloorIncludeSurfaceIntangible;
extern s16 *gEnvironmentRegions;
extern s32 gEnvironmentLevels[20];
extern s8 gDoorAdjacentRooms[60][2];
extern s16 gMarioCurrentRoom;
extern s16 D_8035FEE2;
extern s16 D_8035FEE4;
extern s16 gTHIWaterDrained;
extern s16 gTTCSpeedSetting;
extern s16 gMarioShotFromCannon;
extern s16 gCCMEnteredSlide;
extern s16 gNumRoomedObjectsInMarioRoom;
extern s16 gNumRoomedObjectsNotInMarioRoom;
extern s16 gWDWWaterLevelChanging;
extern s16 gMarioOnMerryGoRound;

#endif /* ROOM_H */
