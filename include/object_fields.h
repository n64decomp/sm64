#ifndef _OBJECT_FIELDS_H
#define _OBJECT_FIELDS_H


/**
 * The array [0x88, 0x1C8) in struct Object consists of fields that can vary by
 * object type. These macros provide access to these fields.
 */


#define OBJECT_FIELD_U32(index) rawData.asU32[index]
#define OBJECT_FIELD_S32(index) rawData.asS32[index]
#define OBJECT_FIELD_S16(index, subIndex) rawData.asS16[index][subIndex]
#define OBJECT_FIELD_F32(index) rawData.asF32[index]
#define OBJECT_FIELD_VOIDP(index) rawData.asVoidP[index]
#define OBJECT_FIELD_S16P(index) rawData.asS16P[index]
#define OBJECT_FIELD_S32P(index) rawData.asS32P[index]
#define OBJECT_FIELD_ANIMS(index) rawData.asAnims[index]
#define OBJECT_FIELD_WAYPOINT(index) rawData.asWaypoint[index]
#define OBJECT_FIELD_CHAIN_SEGMENT(index) rawData.asChainSegment[index]
#define OBJECT_FIELD_OBJECT(index) rawData.asObject[index]
#define OBJECT_FIELD_SURFACE(index) rawData.asSurface[index]
#define OBJECT_FIELD_VPTR(index) rawData.asVoidPtr[index]
#define OBJECT_FIELD_OBJ(index) rawData.asObjPtr[index]

// 0x088 (0x00), the first field, is object-specific and defined below the common fields.
/* Common fields */
#define /*0x08C*/ oFlags OBJECT_FIELD_U32(0x01)
#define /*0x090*/ oDialogResponse OBJECT_FIELD_S16(0x02, 0)
#define /*0x092*/ oDialogState OBJECT_FIELD_S16(0x02, 1)
#define /*0x09C*/ oIntangibleTimer OBJECT_FIELD_S32(0x05)
#define /*0x0A0*/ O_POS_INDEX 0x06
#define /*0x0A0*/ oPosX OBJECT_FIELD_F32(O_POS_INDEX + 0)
#define /*0x0A4*/ oPosY OBJECT_FIELD_F32(O_POS_INDEX + 1)
#define /*0x0A8*/ oPosZ OBJECT_FIELD_F32(O_POS_INDEX + 2)
#define /*0x0AC*/ oVelX OBJECT_FIELD_F32(0x09)
#define /*0x0B0*/ oVelY OBJECT_FIELD_F32(0x0A)
#define /*0x0B4*/ oVelZ OBJECT_FIELD_F32(0x0B)
#define /*0x0B8*/ oForwardVel OBJECT_FIELD_F32(0x0C)
#define /*0x0B8*/ oForwardVel2 OBJECT_FIELD_S32(0x0C)
#define /*0x0BC*/ oUnkBC OBJECT_FIELD_F32(0x0D)
#define /*0x0C0*/ oUnkC0 OBJECT_FIELD_F32(0x0E)
#define /*0x0C4*/ O_MOVE_ANGLE_INDEX 0x0F
#define /*0x0C4*/ O_MOVE_ANGLE_PITCH_INDEX (O_MOVE_ANGLE_INDEX + 0)
#define /*0x0C4*/ O_MOVE_ANGLE_YAW_INDEX (O_MOVE_ANGLE_INDEX + 1)
#define /*0x0C4*/ O_MOVE_ANGLE_ROLL_INDEX (O_MOVE_ANGLE_INDEX + 2)
#define /*0x0C4*/ oMoveAnglePitch OBJECT_FIELD_S32(O_MOVE_ANGLE_PITCH_INDEX)
#define /*0x0C8*/ oMoveAngleYaw OBJECT_FIELD_S32(O_MOVE_ANGLE_YAW_INDEX)
#define /*0x0CC*/ oMoveAngleRoll OBJECT_FIELD_S32(O_MOVE_ANGLE_ROLL_INDEX)
#define /*0x0D0*/ O_FACE_ANGLE_INDEX 0x12
#define /*0x0C4*/ O_FACE_ANGLE_PITCH_INDEX (O_FACE_ANGLE_INDEX + 0)
#define /*0x0C4*/ O_FACE_ANGLE_YAW_INDEX (O_FACE_ANGLE_INDEX + 1)
#define /*0x0C4*/ O_FACE_ANGLE_ROLL_INDEX (O_FACE_ANGLE_INDEX + 2)
#define /*0x0D0*/ oFaceAnglePitch OBJECT_FIELD_S32(O_FACE_ANGLE_PITCH_INDEX)
#define /*0x0D4*/ oFaceAngleYaw OBJECT_FIELD_S32(O_FACE_ANGLE_YAW_INDEX)
#define /*0x0D8*/ oFaceAngleRoll OBJECT_FIELD_S32(O_FACE_ANGLE_ROLL_INDEX)
#define /*0x0DC*/ oGraphYOffset OBJECT_FIELD_F32(0x15)
#define /*0x0E0*/ oActiveParticleFlags OBJECT_FIELD_U32(0x16)
#define /*0x0E4*/ oGravity OBJECT_FIELD_F32(0x17)
#define /*0x0E8*/ oFloorHeight OBJECT_FIELD_F32(0x18)
#define /*0x0EC*/ oMoveFlags OBJECT_FIELD_U32(0x19)
#define /*0x0F0*/ oAnimState OBJECT_FIELD_S32(0x1A)
// 0x0F4-0x110 (0x1B-0x22) are object specific and defined below the common fields.
#define /*0x114*/ oAngleVelPitch OBJECT_FIELD_S32(0x23)
#define /*0x118*/ oAngleVelYaw OBJECT_FIELD_S32(0x24)
#define /*0x11C*/ oAngleVelRoll OBJECT_FIELD_S32(0x25)
#define /*0x120*/ oAnimations OBJECT_FIELD_ANIMS(0x26)
#define /*0x124*/ oHeldState OBJECT_FIELD_U32(0x27)
#define /*0x128*/ oWallHitboxRadius OBJECT_FIELD_F32(0x28)
#define /*0x12C*/ oDragStrength OBJECT_FIELD_F32(0x29)
#define /*0x130*/ oInteractType OBJECT_FIELD_U32(0x2A)
#define /*0x134*/ oInteractStatus OBJECT_FIELD_S32(0x2B)
#define /*0x138*/ O_PARENT_RELATIVE_POS_INDEX 0x2C
#define /*0x138*/ oParentRelativePosX OBJECT_FIELD_F32(O_PARENT_RELATIVE_POS_INDEX + 0)
#define /*0x13C*/ oParentRelativePosY OBJECT_FIELD_F32(O_PARENT_RELATIVE_POS_INDEX + 1)
#define /*0x140*/ oParentRelativePosZ OBJECT_FIELD_F32(O_PARENT_RELATIVE_POS_INDEX + 2)
#define /*0x144*/ oBehParams2ndByte OBJECT_FIELD_S32(0x2F)
#define /*0x14C*/ oAction OBJECT_FIELD_S32(0x31)
#define /*0x150*/ oSubAction OBJECT_FIELD_S32(0x32)
#define /*0x154*/ oTimer OBJECT_FIELD_S32(0x33)
#define /*0x158*/ oBounce OBJECT_FIELD_F32(0x34)
#define /*0x15C*/ oDistanceToMario OBJECT_FIELD_F32(0x35)
#define /*0x15C*/ oDistanceToMarioS32 OBJECT_FIELD_S32(0x35)
#define /*0x160*/ oAngleToMario OBJECT_FIELD_S32(0x36)
#define /*0x164*/ oHomeX OBJECT_FIELD_F32(0x37)
#define /*0x168*/ oHomeY OBJECT_FIELD_F32(0x38)
#define /*0x16C*/ oHomeZ OBJECT_FIELD_F32(0x39)
#define /*0x170*/ oFriction OBJECT_FIELD_F32(0x3A)
#define /*0x174*/ oBuoyancy OBJECT_FIELD_F32(0x3B)
#define /*0x178*/ oSoundStateID OBJECT_FIELD_S32(0x3C)
#define /*0x17C*/ oOpacity OBJECT_FIELD_S32(0x3D)
#define /*0x180*/ oDamageOrCoinValue OBJECT_FIELD_S32(0x3E)
#define /*0x184*/ oHealth OBJECT_FIELD_S32(0x3F)
#define /*0x188*/ oBehParams OBJECT_FIELD_S32(0x40)
#define /*0x18C*/ oPrevAction OBJECT_FIELD_S32(0x41)
#define /*0x190*/ oInteractionSubtype OBJECT_FIELD_U32(0x42)
#define /*0x194*/ oCollisionDistance OBJECT_FIELD_F32(0x43)
#define /*0x198*/ oNumLootCoins OBJECT_FIELD_S32(0x44)
#define /*0x19C*/ oDrawingDistance OBJECT_FIELD_F32(0x45)
#define /*0x1A0*/ oRoom OBJECT_FIELD_S32(0x46)
// another object specific range, anim related
#define /*0x1A8*/ oUnk1A8 OBJECT_FIELD_U32(0x48)
#define /*0x1AC*/ oUnk1AC_VPTR OBJECT_FIELD_VPTR(0x49)
#define /*0x1AC*/ oUnk1AC_S32 OBJECT_FIELD_S32(0x49)
#define /*0x1AC*/ oUnk1AC_F32 OBJECT_FIELD_F32(0x49)
#define /*0x1AC*/ oUnk1AC_S16 OBJECT_FIELD_S16(0x49, 0)
#define /*0x1B0*/ oUnk1B0 OBJECT_FIELD_S32(0x4A)
#define /*0x1B0*/ oUnk1B0_S16 OBJECT_FIELD_S16(0x4A, 0)
// more generic fields
#define /*0x1B4*/ oWallAngle OBJECT_FIELD_U32(0x4B)
#define /*0x1B8*/ oFloorType OBJECT_FIELD_S16(0x4C, 0)
#define /*0x1BA*/ oFloorRoom OBJECT_FIELD_S16(0x4C, 1)
#define /*0x1BC*/ oUnk1BC OBJECT_FIELD_S32(0x4D)
#define /*0x1C0*/ oFloor OBJECT_FIELD_SURFACE(0x4E)
#define /*0x1C4*/ oDeathSound OBJECT_FIELD_S32(0x4F)

/* All uses of these should be removed as soon as object type is known */
#define /*0x088*/ oUnknownUnk88 OBJECT_FIELD_S32(0x00)
#define /*0x0F4*/ oUnknownUnkF4_S32 OBJECT_FIELD_S32(0x1B)
#define /*0x0F4*/ oUnknownUnkF4_F32 OBJECT_FIELD_F32(0x1B)
#define /*0x0FC*/ oUnknownUnkFC_VPtr OBJECT_FIELD_VPTR(0x1D)
#define /*0x100*/ oUnknownUnk100_VPtr OBJECT_FIELD_VPTR(0x1E)
#define /*0x104*/ oUnknownUnk104_S32 OBJECT_FIELD_S32(0x1F)
#define /*0x0F8*/ oUnknownUnkF8_S32 OBJECT_FIELD_S32(0x1C)
#define /*0x0F8*/ oUnknownUnkF8_F32 OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oUnknownUnkFC_S32 OBJECT_FIELD_S32(0x1D)
#define /*0x0FC*/ oUnknownUnkFC_F32 OBJECT_FIELD_F32(0x1D)
#define /*0x0FC*/ oUnknownUnkFC_VOIDP OBJECT_FIELD_VOIDP(0x1D)
#define /*0x100*/ oUnknownUnk100_S32 OBJECT_FIELD_S32(0x1E)
#define /*0x104*/ oUnknownUnk104_F32 OBJECT_FIELD_F32(0x1F)
#define /*0x108*/ oUnknownUnk108_S32 OBJECT_FIELD_S32(0x20)
#define /*0x108*/ oUnknownUnk108_F32 OBJECT_FIELD_F32(0x20)
#define /*0x10C*/ oUnknownUnk10C_S32 OBJECT_FIELD_S32(0x21)
#define /*0x10C*/ oUnknownUnk10C_F32 OBJECT_FIELD_F32(0x21)
#define /*0x110*/ oUnknownUnk110_S32 OBJECT_FIELD_S32(0x22)
#define /*0x110*/ oUnknownUnk110_F32 OBJECT_FIELD_F32(0x22)
#define /*0x110*/ oUnknownUnk110_S32 OBJECT_FIELD_S32(0x22)

/* Pathed (see obj_follow_path) */
#define /*0x0FC*/ oPathedStartWaypoint OBJECT_FIELD_WAYPOINT(0x1D)
#define /*0x100*/ oPathedPrevWaypoint OBJECT_FIELD_WAYPOINT(0x1E)
#define /*0x104*/ oPathedPrevWaypointFlags OBJECT_FIELD_S32(0x1F)
#define /*0x108*/ oPathedTargetPitch OBJECT_FIELD_S32(0x20)
#define /*0x10C*/ oPathedTargetYaw OBJECT_FIELD_S32(0x21)

/* Mario */
#define /*0x0F4*/ oMarioParticleFlags OBJECT_FIELD_S32(0x1B)
#define /*0x108*/ oMarioPoleUnk108 OBJECT_FIELD_S32(0x20)
#define /*0x108*/ oMarioReadingSignDYaw OBJECT_FIELD_S32(0x20)
#define /*0x10C*/ oMarioPoleYawVel OBJECT_FIELD_S32(0x21)
#define /*0x10C*/ oMarioCannonObjectYaw OBJECT_FIELD_S32(0x21)
#define /*0x10C*/ oMarioTornadoYawVel OBJECT_FIELD_S32(0x21)
#define /*0x10C*/ oMarioReadingSignDPosX OBJECT_FIELD_F32(0x21)
#define /*0x110*/ oMarioPolePos OBJECT_FIELD_F32(0x22)
#define /*0x110*/ oMarioCannonInputYaw OBJECT_FIELD_S32(0x22)
#define /*0x110*/ oMarioTornadoPosY OBJECT_FIELD_F32(0x22)
#define /*0x110*/ oMarioReadingSignDPosZ OBJECT_FIELD_F32(0x22)
#define /*0x110*/ oMarioWhirlpoolPosY OBJECT_FIELD_F32(0x22)
#define /*0x110*/ oMarioBurnTimer OBJECT_FIELD_S32(0x22)
#define /*0x110*/ oMarioLongJumpIsSlow OBJECT_FIELD_S32(0x22)
#define /*0x110*/ oMarioSteepJumpYaw OBJECT_FIELD_S32(0x22)
#define /*0x110*/ oMarioWalkingPitch OBJECT_FIELD_S32(0x22)

/* Star selector */
#define /*0x0F4*/ oStarSelectorType OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oStarSelectorTimer OBJECT_FIELD_S32(0x1C)
#define /*0x108*/ oStarSelectorSize OBJECT_FIELD_F32(0x20)

/* Sound effect */
#define /*0x0F4*/ oSoundEffectUnkF4 OBJECT_FIELD_S32(0x1B)

/* Main menu button */
#define /*0x0F4*/ oMenuButtonState OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oMenuButtonTimer OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oMenuButtonOrigPosX OBJECT_FIELD_F32(0x1D)
#define /*0x100*/ oMenuButtonOrigPosY OBJECT_FIELD_F32(0x1E)
#define /*0x104*/ oMenuButtonOrigPosZ OBJECT_FIELD_F32(0x1F)
#define /*0x108*/ oMenuButtonScale OBJECT_FIELD_F32(0x20)
#define /*0x10C*/ oMenuButtonActionPhase OBJECT_FIELD_S32(0x21)

/* Toad message */
#define /*0x108*/ oToadMessageDialogNum OBJECT_FIELD_U32(0x20)
#define /*0x10C*/ oToadMessageRecentlyTalked OBJECT_FIELD_S32(0x21)
#define /*0x110*/ oToadMessageState OBJECT_FIELD_S32(0x22)

/* Sealed door star */
#define /*0x108*/ oUnlockDoorStarState OBJECT_FIELD_U32(0x20)
#define /*0x10C*/ oUnlockDoorStarTimer OBJECT_FIELD_S32(0x21)
#define /*0x10C*/ oUnlockDoorStarYawVel OBJECT_FIELD_S32(0x22)

/* Bob-omb */
#define /*0x0F4*/ oBobombBlinkTimer OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oBobombFuseLit OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oBobombFuseTimer OBJECT_FIELD_S32(0x1D)

/* Bob-omb Buddy */
#define /*0x0F4*/ oBobombBuddyBlinkTimer OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oBobombBuddyHasTalkedToMario OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oBobombBuddyRole OBJECT_FIELD_S32(0x1D)
#define /*0x100*/ oBobombBuddyCannonStatus OBJECT_FIELD_S32(0x1E)
#define /*0x108*/ oBobombBuddyPosXCopy OBJECT_FIELD_F32(0x20)
#define /*0x10C*/ oBobombBuddyPosYCopy OBJECT_FIELD_F32(0x21)
#define /*0x110*/ oBobombBuddyPosZCopy OBJECT_FIELD_F32(0x22)

/* Whirlpool */
#define /*0x0F4*/ oWhirlpoolInitFacePitch OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oWhirlpoolInitFaceRoll OBJECT_FIELD_S32(0x1C)

/* Homing Amp */
#define /*0x0F4*/ oHomingAmpLockedOn OBJECT_FIELD_S32(0x1B)
#define /*0x0FC*/ oHomingAmpAvgY OBJECT_FIELD_F32(0x1D)

/* Amp */
#define /*0x0F4*/ oAmpRadiusOfRotation OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oAmpYPhase OBJECT_FIELD_S32(0x1C)

/* Butterfly */
#define /*0x0F4*/ oButterflyYPhase OBJECT_FIELD_S32(0x1B)

/* Hoot */
#define /*0x0F4*/ oHootAvailability OBJECT_FIELD_S32(0x1B)
#define /*0x110*/ oHootMarioReleaseTime OBJECT_FIELD_S32(0x22)

/* Bob-omb Explosion Bubble */
#define /*0x0FC*/ oBobombExpBubGfxScaleFacX OBJECT_FIELD_S32(0x1D)
#define /*0x100*/ oBobombExpBubGfxScaleFacY OBJECT_FIELD_S32(0x1E)
#define /*0x104*/ oBobombExpBubGfxExpRateX OBJECT_FIELD_S32(0x1F)
#define /*0x108*/ oBobombExpBubGfxExpRateY OBJECT_FIELD_S32(0x20)

/* Object Respawner */
#define /*0x0F4*/ oRespawnerModelToRespawn OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oRespawnerMinSpawnDist OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oRespawnerBehaviorToRespawn OBJECT_FIELD_VPTR(0x1D)

/* Bully (all variants) */
#define /*0x0F4*/ oBullySubtype OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oBullyPrevX OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oBullyPrevY OBJECT_FIELD_F32(0x1D)
#define /*0x100*/ oBullyPrevZ OBJECT_FIELD_F32(0x1E)
#define /*0x104*/ oBullyKBTimerAndMinionKOCounter OBJECT_FIELD_S32(0x1F)
#define /*0x108*/ oBullyMarioCollisionAngle OBJECT_FIELD_S32(0x20)

/* Water Ring (both variants) */
#define /*0x0F4*/ oWaterRingScalePhaseX OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oWaterRingScalePhaseY OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oWaterRingScalePhaseZ OBJECT_FIELD_S32(0x1D)
#define /*0x100*/ oWaterRingNormalX OBJECT_FIELD_F32(0x1E)
#define /*0x104*/ oWaterRingNormalY OBJECT_FIELD_F32(0x1F)
#define /*0x108*/ oWaterRingNormalZ OBJECT_FIELD_F32(0x20)
#define /*0x10C*/ oWaterRingMarioDistInFront OBJECT_FIELD_F32(0x21)
#define /*0x110*/ oWaterRingIndex OBJECT_FIELD_S32(0x22)
#define /*0x1AC*/ oWaterRingAvgScale OBJECT_FIELD_F32(0x49)

/* Water Ring Spawner (Jet Stream Ring Spawner and Manta Ray) */
#define /*0x1AC*/ oWaterRingSpawnerRingsCollected OBJECT_FIELD_S32(0x49)

/* Water Ring Manager (Jet Stream Ring Spawner and Manta Ray Ring Manager) */
#define /*0x0F4*/ oWaterRingMgrNextRingIndex OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oWaterRingMgrLastRingCollected OBJECT_FIELD_S32(0x1C)

/* Celebration Star */
#define /*0x108*/ oCelebStarDiameterOfRotation OBJECT_FIELD_S32(0x20)

/* Bomp (small) */
#define /*0x100*/ oSmallBompInitX OBJECT_FIELD_F32(0x1E)

/* WF Sliding Brick Platform */
#define /*0x0F4*/ oWFSlidBrickPtfmMovVel OBJECT_FIELD_F32(0x1B)

/* Moneybag */
#define /*0x0F4*/ oMoneybagJumpState OBJECT_FIELD_S32(0x1B)

/* Bowling Ball */
#define /*0x0F4*/ oBowlingBallTargetYaw OBJECT_FIELD_S32(0x1B)
#define /*0x0FC*/ oBowlingBallUnkFC OBJECT_FIELD_VPTR(0x1D)
#define /*0x10C*/ oBowlingBallInitYaw OBJECT_FIELD_S32(0x21)

/* Bowling Ball Spawner (Generic) */
#define /*0x0F4*/ oBBallSpwnrMaxSpawnDist OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oBBallSpwnrSpawnOdds OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oBBallSpwnrPeriodMinus1 OBJECT_FIELD_S32(0x1D)

/* RR Cruiser Wing */
#define /*0x0F4*/ oRRCruiserWingUnkF4 OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oRRCruiserWingUnkF8 OBJECT_FIELD_S32(0x1C)

/* MrI */
#define /*0x10C*/ oMrISize OBJECT_FIELD_F32(0x21)

/* Platform */
#define /*0x0F4*/ oPlatformTimer OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oPlatformUnkF8 OBJECT_FIELD_OBJ(0x1C)
#define /*0x0FC*/ oPlatformUnkFC OBJECT_FIELD_S32(0x1D)
#define /*0x10C*/ oPlatformUnk10C OBJECT_FIELD_F32(0x21)
#define /*0x110*/ oPlatformUnk110 OBJECT_FIELD_F32(0x22)

/* MovingFlame */
#define /*0x0F4*/ oMovingFlameTimer OBJECT_FIELD_S32(0x1B)

/* FlameThrowerFlame */
#define /*0x110*/ oFlameThowerFlameUnk110 OBJECT_FIELD_S32(0x22)

/* FlameThrower */
#define /*0x110*/ oFlameThowerUnk110 OBJECT_FIELD_S32(0x22)

/* BouncingFireBall */
#define /*0x0F4*/ oBouncingFireBallUnkF4 OBJECT_FIELD_S32(0x1B)

/* BowserShockWave */
#define /*0x0F4*/ oBowserShockWaveUnkF4 OBJECT_FIELD_F32(0x1B)

/* BlackSmokeBowser */
#define /*0x0F4*/ oBlackSmokeBowserUnkF4 OBJECT_FIELD_F32(0x1B)

/* PlatformSpawner */
#define /*0x0F4*/ oPlatformSpawnerUnkF4 OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oPlatformSpawnerUnkF8 OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oPlatformSpawnerUnkFC OBJECT_FIELD_S32(0x1D)
#define /*0x100*/ oPlatformSpawnerUnk100 OBJECT_FIELD_F32(0x1E)
#define /*0x104*/ oPlatformSpawnerUnk104 OBJECT_FIELD_F32(0x1F)
#define /*0x108*/ oPlatformSpawnerUnk108 OBJECT_FIELD_F32(0x20)

/* TreeSnowOrLeaf */
#define /*0x0F4*/ oTreeSnowOrLeafUnkF4 OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oTreeSnowOrLeafUnkF8 OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oTreeSnowOrLeafUnkFC OBJECT_FIELD_S32(0x1D)

/* HiddenObject */
#define /*0x0F4*/ oHiddenObjectUnkF4 OBJECT_FIELD_OBJ(0x1B)

/* HeaveHo */
#define /*0x0F4*/ oHeaveHoUnkF4 OBJECT_FIELD_F32(0x1B)

/* BetaTrampoline */
#define /*0x110*/ oBetaTrampolineMarioOnTrampoline OBJECT_FIELD_S32(0x22)

/* JumpingBox */
#define /*0x0F4*/ oJumpingBoxUnkF4 OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oJumpingBoxUnkF8 OBJECT_FIELD_S32(0x1C)

/* GrandStar */
#define /*0x108*/ oGrandStarUnk108 OBJECT_FIELD_S32(0x20)

/* BulletBill */
#define /*0x0F8*/ oBulletBillUnkF8 OBJECT_FIELD_S32(0x1C)

/* Bowser */
#define /*0x0F4*/ oBowserUnkF4           OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oBowserUnkF8           OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oBowserDistToCentre    OBJECT_FIELD_F32(0x1D)
#define /*0x106*/ oBowserUnk106          OBJECT_FIELD_S16(0x1F, 1)
#define /*0x108*/ oBowserUnk108          OBJECT_FIELD_S16(0x20, 0)
#define /*0x10A*/ oBowserHeldAnglePitch  OBJECT_FIELD_S16(0x20, 1)
#define /*0x10D*/ oBowserHeldAngleVelYaw OBJECT_FIELD_S16(0x21, 0)
#define /*0x10E*/ oBowserUnk10E          OBJECT_FIELD_S16(0x21, 1)
#define /*0x110*/ oBowserUnk110          OBJECT_FIELD_S16(0x22, 0)
#define /*0x112*/ oBowserAngleToCentre   OBJECT_FIELD_S16(0x22, 1)
#define /*0x1AE*/ oBowserUnk1AE          OBJECT_FIELD_S16(0x49, 1)
#define /*0x1B0*/ oBowserEyesShut        OBJECT_FIELD_S16(0x4A, 0)
#define /*0x1B2*/ oBowserUnk1B2          OBJECT_FIELD_S16(0x4A, 1)

/* Flame */
#define /*0x0F4*/ oFlameUnkF4 OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oFlameUnkF8 OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oFlameUnkFC OBJECT_FIELD_F32(0x1D)
#define /*0x100*/ oFlameUnk100 OBJECT_FIELD_OBJ(0x1E)

/* BlueFlame */
#define /*0x0F8*/ oBlueFlameUnkF8 OBJECT_FIELD_F32(0x1C)

/* BlueFish */
#define /*0x0F4*/ oBlueFishUnkF4 OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oBlueFishUnkF8 OBJECT_FIELD_S32(0x1C)
#define /*0x100*/ oBlueFishUnk100 OBJECT_FIELD_F32(0x1E)

/* CheckerboardPlatform */
#define /*0x0F8*/ oCheckerBoardPlatformUnkF8 OBJECT_FIELD_S32(0x1C) // oAction like
#define /*0x0FC*/ oCheckerBoardPlatformUnkFC OBJECT_FIELD_S32(0x1D)

/* WaterLevelPillar */
#define /*0x0F8*/ oWaterLevelPillarUnkF8 OBJECT_FIELD_S32(0x1C) // boolean?

/* BowserKeyUnlockDoor */
#define /*0x0F4*/ oBowserKeyUnlockDoorScale OBJECT_FIELD_F32(0x1B)

/* bhvBowserKeyCourseExit */
#define /*0x0F4*/ oBowserKeyCourseExitScale OBJECT_FIELD_F32(0x1B)

/* Ukiki */
#define /*0x0F4*/ oUkikiTauntCounter   OBJECT_FIELD_S16(0x1B, 0)
#define /*0x0F6*/ oUkikiTauntsToBeDone OBJECT_FIELD_S16(0x1B, 1)
 //TODO change to the actual waypoint form.
#define /*0x0FC*/ oUkikiPath           OBJECT_FIELD_VPTR(0x1D)
#define /*0x110*/ oUkikiChaseFleeRange OBJECT_FIELD_F32(0x22)
#define /*0x1AC*/ oUkikiTextState      OBJECT_FIELD_S16(0x49, 0)
#define /*0x1AE*/ oUkikiTextboxTimer   OBJECT_FIELD_S16(0x49, 1)
#define /*0x1B0*/ oUkikiCageSpinTimer  OBJECT_FIELD_S16(0x4A, 0)
#define /*0x1B2*/ oUkikiHasHat         OBJECT_FIELD_S16(0x4A, 1)

/* Ukiki Cage*/
#define /*0x088*/ oUkikiCageNextAction      OBJECT_FIELD_S32(0x00)

/* HorizontalMovement */
#define /*0x0F4*/ oHorizontalMovementUnkF4 OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oHorizontalMovementUnkF8 OBJECT_FIELD_S32(0x1C)
#define /*0x100*/ oHorizontalMovementUnk100 OBJECT_FIELD_F32(0x1E)
#define /*0x104*/ oHorizontalMovementUnk104 OBJECT_FIELD_S32(0x1F)
#define /*0x108*/ oHorizontalMovementUnk108 OBJECT_FIELD_F32(0x20)

/* SinkWhenSteppedOn */
#define /*0x104*/ oSinkWhenSteppedOnUnk104 OBJECT_FIELD_S32(0x1F)
#define /*0x108*/ oSinkWhenSteppedOnUnk108 OBJECT_FIELD_F32(0x20)

/* BehLllRotatingHexFlame */
#define /*0x0F4*/ oLllRotatingHexFlameUnkF4 OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oLllRotatingHexFlameUnkF8 OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oLllRotatingHexFlameUnkFC OBJECT_FIELD_F32(0x1D)

/* LllWoodPiece */
#define /*0x0F4*/ oLllWoodPieceUnkF4 OBJECT_FIELD_S32(0x1B)

/* TiltingPlatform */
#define /*0x0F4*/ oTiltingPlatformUnkF4 OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oTiltingPlatformUnkF8 OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oTiltingPlatformUnkFC OBJECT_FIELD_F32(0x1D)
#define /*0x10C*/ oTiltingPlatformUnk10C OBJECT_FIELD_S32(0x21)

/* KoopaShellFlame */
#define /*0x0F4*/ oKoopaShellFlameUnkF4 OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oKoopaShellFlameUnkF8 OBJECT_FIELD_F32(0x1C)

/* PiranhaPlant */
#define /*0x0F4*/ oPiranhaPlantSleepMusicState OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oPiranhaPlantScale OBJECT_FIELD_F32(0x1C)

/* BowserPuzzle */
#define /*0x0F4*/ oBowserPuzzleCompletionFlags OBJECT_FIELD_S32(0x1B)

/* BowserPuzzlePiece */
#define /*0x0FC*/ oBowserPuzzlePieceOffsetX OBJECT_FIELD_F32(0x1D)
#define /*0x100*/ oBowserPuzzlePieceOffsetY OBJECT_FIELD_F32(0x1E)
#define /*0x104*/ oBowserPuzzlePieceOffsetZ OBJECT_FIELD_F32(0x1F)
#define /*0x108*/ oBowserPuzzlePieceContinuePerformingAction OBJECT_FIELD_S32(0x20)
#define /*0x10C*/ oBowserPuzzlePieceActionList OBJECT_FIELD_VPTR(0x21)
#define /*0x110*/ oBowserPuzzlePieceNextAction OBJECT_FIELD_VPTR(0x22)

/* SmallPenguin */
#define /*0x100*/ oSmallPenguinUnk100 OBJECT_FIELD_S32(0x1E) // angle?
#define /*0x104*/ oSmallPenguinUnk104 OBJECT_FIELD_F32(0x1F)
#define /*0x108*/ oSmallPenguinUnk108 OBJECT_FIELD_F32(0x20)
#define /*0x110*/ oSmallPenguinUnk110 OBJECT_FIELD_S32(0x22)

/* FishGroup */
#define /*0x0F4*/ oFishGroupUnkF4 OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oFishGroupUnkF8 OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oFishGroupUnkFC OBJECT_FIELD_F32(0x1D)
#define /*0x100*/ oFishGroupUnk100 OBJECT_FIELD_S32(0x1E)
#define /*0x104*/ oFishGroupUnk104 OBJECT_FIELD_F32(0x1F)
#define /*0x108*/ oFishGroupUnk108 OBJECT_FIELD_F32(0x20)
#define /*0x10C*/ oFishGroupUnk10C OBJECT_FIELD_F32(0x21)
#define /*0x110*/ oFishGroupUnk110 OBJECT_FIELD_F32(0x22)

/* BirdChirpChirp */
#define /*0x0F4*/ oBirdChirpChirpUnkF4 OBJECT_FIELD_S32(0x1B)

/* CheepCheep */
#define /*0x0F4*/ oCheepCheepUnkF4 OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oCheepCheepUnkF8 OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oCheepCheepUnkFC OBJECT_FIELD_F32(0x1D)
#define /*0x104*/ oCheepCheepUnk104 OBJECT_FIELD_F32(0x1F)
#define /*0x108*/ oCheepCheepUnk108 OBJECT_FIELD_F32(0x20)

/* ExclamationBox */
#define /*0x0F4*/ oExclamationBoxUnkF4 OBJECT_FIELD_F32(0x1B) // scale?
#define /*0x0F8*/ oExclamationBoxUnkF8 OBJECT_FIELD_F32(0x1C) // scale?
#define /*0x0FC*/ oExclamationBoxUnkFC OBJECT_FIELD_S32(0x1D) // angle?

/* SushiShark */
#define /*0x0F4*/ oSushiSharkUnkF4 OBJECT_FIELD_S32(0x1B) // angle?

/* ShipPart3 */
#define /*0x0F4*/ oShipPart3UnkF4 OBJECT_FIELD_S32(0x1B) // angle?
#define /*0x0F8*/ oShipPart3UnkF8 OBJECT_FIELD_S32(0x1C) // angle?

/* JrbSlidingBox */
#define /*0x0F4*/ oJrbSlidingBoxUnkF4 OBJECT_FIELD_VPTR(0x1B)
#define /*0x0F8*/ oJrbSlidingBoxUnkF8 OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oJrbSlidingBoxUnkFC OBJECT_FIELD_F32(0x1D)

/* HiddenBlueCoin */
#define /*0x0F8*/ oHiddenBlueCoinSwitch OBJECT_FIELD_VPTR(0x1C) // coin switch

/* OpenableGrill */
#define /*0x0F4*/ oOpenableGrillUnkF4 OBJECT_FIELD_VPTR(0x1B)

/* WaterLevelTrigger */
#define /*0x0F4*/ oWaterLevelTriggerUnkF4 OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oWaterLevelTriggerTargetWaterLevel OBJECT_FIELD_S32(0x1C)

/* Tweester */
#define /*0x0F4*/ oTweesterUnkF4 OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oTweesterUnkF8 OBJECT_FIELD_S32(0x1C)

/* HauntedBookshelf */
#define /*0x088*/ oHauntedBookshelfShouldOpen OBJECT_FIELD_S32(0x00)

/* Boo */
#define /*0x088*/ oBooDeathStatus OBJECT_FIELD_S32(0x00)
#define /*0x0F4*/ oBooTargetOpacity OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oBooBaseScale OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oBooOscillationTimer OBJECT_FIELD_S32(0x1D)
#define /*0x100*/ oBooMoveYawAfterHit OBJECT_FIELD_S32(0x1E)
#define /*0x104*/ oBooUnk104 OBJECT_FIELD_F32(0x1F)
#define /*0x108*/ oBooParentBigBoo OBJECT_FIELD_OBJ(0x20)
#define /*0x10C*/ oBooUnk10C OBJECT_FIELD_F32(0x21)
#define /*0x110*/ oBooUnk110 OBJECT_FIELD_S32(0x22)

/* BigBoo */
#define /*0x1AC*/ oBigBooNumMinionBoosKilled OBJECT_FIELD_S32(0x49)

/* MerryGoRound */
#define /*0x088*/ oMerryGoRoundStopped OBJECT_FIELD_S32(0x00)
#define /*0x0F8*/ oMerryGoRoundMusicShouldPlay OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oMerryGoRoundMarioIsOutside OBJECT_FIELD_S32(0x1D)

/* MerryGoRoundBooManager */
#define /*0x088*/ oMerryGoRoundBooManagerNumMinionBoosKilled OBJECT_FIELD_S32(0x00)

/* Scuttlebug */
#define /*0x0F4*/ oScuttlebugUnkF4 OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oScuttlebugUnkF8 OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oScuttlebugUnkFC OBJECT_FIELD_S32(0x1D)

/* ScuttlebugSpawner */
#define /*0x0F4*/ oScuttlebugSpawnerUnkF4 OBJECT_FIELD_S32(0x1B)

/* Whomp */
#define /*0x0F8*/ oWhompUnkF8 OBJECT_FIELD_S32(0x1C)

/* WaveTrail */
#define /*0x0F8*/ oWaveTrailUnkF8 OBJECT_FIELD_F32(0x1C)

/* WhiteWindParticle */
#define /*0x0F4*/ oWhiteWindParticleUnkF4 OBJECT_FIELD_VPTR(0x1B)

/* WalkingPenguin */
#define /*0x100*/ oWalkingPenguinUnk100 OBJECT_FIELD_F32(0x1E)
#define /*0x104*/ oWalkingPenguinUnk104 OBJECT_FIELD_F32(0x1F)
#define /*0x10C*/ oWalkingPenguinUnk10C OBJECT_FIELD_S32(0x21)
#define /*0x110*/ oWalkingPenguinUnk110 OBJECT_FIELD_S32(0x22)

/* SnowmanWindBlowing */
#define /*0x0F4*/ oSnowmanWindBlowingUnkF4 OBJECT_FIELD_S32(0x1B)

/* Koopa */
#define /*0x0F4*/ oKoopaAgility OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oKoopaMovementType OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oKoopaTargetYaw OBJECT_FIELD_S32(0x1D)
#define /*0x100*/ oKoopaUnshelledTimeUntilTurn OBJECT_FIELD_S32(0x1E)
#define /*0x104*/ oKoopaTurningAwayFromWall OBJECT_FIELD_S32(0x1F)
#define /*0x108*/ oKoopaDistanceToMario OBJECT_FIELD_F32(0x20)
#define /*0x10C*/ oKoopaAngleToMario OBJECT_FIELD_S32(0x21)
#define /*0x110*/ oKoopaBlinkTimer OBJECT_FIELD_S32(0x22)
#define /*0x1AC*/ oKoopaCountdown OBJECT_FIELD_S16(0x49, 0)
#define /*0x1AE*/ oKoopaTheQuickRaceIndex OBJECT_FIELD_S16(0x49, 1)
#define /*0x1B0*/ oKoopaTheQuickInitTextboxCooldown OBJECT_FIELD_S16(0x4A, 0)
// 0x1D-0x21 for koopa the quick reserved for pathing

/* Koopa race endpoint */
#define /*0x0F4*/ oKoopaRaceEndpointRaceBegun OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oKoopaRaceEndpointKoopaFinished OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oKoopaRaceEndpointRaceStatus OBJECT_FIELD_S32(0x1D)
#define /*0x100*/ oKoopaRaceEndpointUnk100 OBJECT_FIELD_S32(0x1E)
#define /*0x104*/ oKoopaRaceEndpointRaceEnded OBJECT_FIELD_S32(0x1F)

/* Pokey body part */
#define /*0x0F8*/ oPokeyBodyPartDeathDelayAfterHeadKilled OBJECT_FIELD_S32(0x1C)
#define /*0x110*/ oPokeyBodyPartBlinkTimer OBJECT_FIELD_S32(0x22)

/* Pokey */
#define /*0x0F4*/ oPokeyAliveBodyPartFlags OBJECT_FIELD_U32(0x1B)
#define /*0x0F8*/ oPokeyNumAliveBodyParts OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oPokeyBottomBodyPartSize OBJECT_FIELD_F32(0x1D)
#define /*0x100*/ oPokeyHeadWasKilled OBJECT_FIELD_S32(0x1E)
#define /*0x104*/ oPokeyTargetYaw OBJECT_FIELD_S32(0x1F)
#define /*0x108*/ oPokeyChangeTargetTimer OBJECT_FIELD_S32(0x20)
#define /*0x10C*/ oPokeyTurningAwayFromWall OBJECT_FIELD_S32(0x21)

/* Swoop */
#define /*0x0F4*/ oSwoopBonkCountdown OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oSwoopTargetPitch OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oSwoopTargetYaw OBJECT_FIELD_S32(0x1D)

/* Fly guy */
#define /*0x0F4*/ oFlyGuyIdleTimer OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oFlyGuyOscTimer OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oFlyGuyUnusedJitter OBJECT_FIELD_S32(0x1D)
#define /*0x100*/ oFlyGuyLungeYDecel OBJECT_FIELD_F32(0x1E)
#define /*0x104*/ oFlyGuyLungeTargetPitch OBJECT_FIELD_S32(0x1F)
#define /*0x108*/ oFlyGuyTargetRoll OBJECT_FIELD_S32(0x20)
#define /*0x10C*/ oFlyGuyScaleVel OBJECT_FIELD_F32(0x21)

/* Goomba */
#define /*0x0F4*/ oGoombaSize OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oGoombaScale OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oGoombaWalkTimer OBJECT_FIELD_S32(0x1D)
#define /*0x100*/ oGoombaTargetYaw OBJECT_FIELD_S32(0x1E)
#define /*0x104*/ oGoombaBlinkTimer OBJECT_FIELD_S32(0x1F)
#define /*0x108*/ oGoombaTurningAwayFromWall OBJECT_FIELD_S32(0x20)
#define /*0x10C*/ oGoombaRelativeSpeed OBJECT_FIELD_F32(0x21)

/* Chain chomp */
#define /*0x0F4*/ oChainChompSegments OBJECT_FIELD_CHAIN_SEGMENT(0x1B)
#define /*0x0F8*/ oChainChompMaxDistFromPivotPerChainPart OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oChainChompMaxDistBetweenChainParts OBJECT_FIELD_F32(0x1D)
#define /*0x100*/ oChainChompDistToPivot OBJECT_FIELD_F32(0x1E)
#define /*0x104*/ oChainChompUnk104 OBJECT_FIELD_F32(0x1F)
#define /*0x108*/ oChainChompRestrictedByChain OBJECT_FIELD_S32(0x20)
#define /*0x10C*/ oChainChompTargetPitch OBJECT_FIELD_S32(0x21)
#define /*0x110*/ oChainChompNumLunges OBJECT_FIELD_S32(0x22)
#define /*0x1AC*/ oChainChompReleaseStatus OBJECT_FIELD_S32(0x49)
#define /*0x1B0*/ oChainChompHitGate OBJECT_FIELD_S32(0x4A)

/* Wooden post */
#define /*0x0F4*/ oWoodenPostTotalMarioAngle OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oWoodenPostPrevAngleToMario OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oWoodenPostSpeedY OBJECT_FIELD_F32(0x1D)
#define /*0x100*/ oWoodenPostMarioPounding OBJECT_FIELD_S32(0x1E)
#define /*0x104*/ oWoodenPostOffsetY OBJECT_FIELD_F32(0x1F)

/* Wiggler */
#define /*0x0F4*/ oWigglerFallThroughFloorsHeight OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oWigglerSegments OBJECT_FIELD_CHAIN_SEGMENT(0x1C)
#define /*0x0FC*/ oWigglerWalkAnimSpeed OBJECT_FIELD_F32(0x1D)
#define /*0x104*/ oWigglerSquishSpeed OBJECT_FIELD_F32(0x1F)
#define /*0x108*/ oWigglerTimeUntilRandomTurn OBJECT_FIELD_S32(0x20)
#define /*0x10C*/ oWigglerTargetYaw OBJECT_FIELD_S32(0x21)
#define /*0x110*/ oWigglerWalkAwayFromWallTimer OBJECT_FIELD_S32(0x22)
#define /*0x1AC*/ oWigglerUnk1AC OBJECT_FIELD_S16(0x49, 0)
#define /*0x1AE*/ oWigglerTextStatus OBJECT_FIELD_S16(0x49, + 1)

/* Spiny */
#define /*0x0F4*/ oSpinyTimeUntilTurn OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oSpinyTargetYaw OBJECT_FIELD_S32(0x1C)
#define /*0x100*/ oSpinyTurningAwayFromWall OBJECT_FIELD_S32(0x1E)

/* Evil lakitu */
#define /*0x0F4*/ oEnemyLakituNumSpinies OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oEnemyLakituBlinkTimer OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oEnemyLakituSpinyCooldown OBJECT_FIELD_S32(0x1D)
#define /*0x100*/ oEnemyLakituFaceForwardCountdown OBJECT_FIELD_S32(0x1E)

/* Cloud */
#define /*0x0F4*/ oCloudCenterX OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oCloudCenterY OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oCloudBlowing OBJECT_FIELD_S32(0x1D)
#define /*0x100*/ oCloudGrowSpeed OBJECT_FIELD_F32(0x1E)
#define /*0x1AC*/ oCloudFwooshMovementRadius OBJECT_FIELD_S16(0x49, 0)

/* Camera lakitu */
#define /*0x0F4*/ oCameraLakituBlinkTimer OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oCameraLakituSpeed OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oCameraLakituCircleRadius OBJECT_FIELD_F32(0x1D)
#define /*0x100*/ oCameraLakituFinishedDialog OBJECT_FIELD_S32(0x1E)
#ifndef VERSION_JP
#define /*0x104*/ oCameraLakituUnk104 OBJECT_FIELD_S32(0x1F)
#endif
#define /*0x1AC*/ oCameraLakituPitchVel OBJECT_FIELD_S16(0x49, 0)
#define /*0x1AE*/ oCameraLakituYawVel OBJECT_FIELD_S16(0x49, + 1)

/* Monty mole hole */
#define /*0x0F4*/ oMontyMoleHoleCooldown OBJECT_FIELD_S32(0x1B)

/* Monty mole */
#define /*0x0F4*/ oMontyMoleCurrentHole OBJECT_FIELD_OBJECT(0x1B)
#define /*0x0F8*/ oMontyMoleHeightRelativeToFloor OBJECT_FIELD_F32(0x1C)

/* Platform on tracks */
#define /*0x088*/ oPlatformOnTrackBaseBallIndex OBJECT_FIELD_S32(0x00)
#define /*0x0F4*/ oPlatformOnTrackDistMovedSinceLastBall OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oPlatformOnTrackSkiLiftRollVel OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oPlatformOnTrackStartWaypoint OBJECT_FIELD_WAYPOINT(0x1D)
#define /*0x100*/ oPlatformOnTrackPrevWaypoint OBJECT_FIELD_WAYPOINT(0x1E)
#define /*0x104*/ oPlatformOnTrackPrevWaypointFlags OBJECT_FIELD_S32(0x1F)
#define /*0x108*/ oPlatformOnTrackPitch OBJECT_FIELD_S32(0x20)
#define /*0x10C*/ oPlatformOnTrackYaw OBJECT_FIELD_S32(0x21)
#define /*0x110*/ oPlatformOnTrackOffsetY OBJECT_FIELD_F32(0x22)
#define /*0x1AC*/ oPlatformOnTrackIsNotSkiLift OBJECT_FIELD_S16(0x49, 0)
#define /*0x1AE*/ oPlatformOnTrackIsNotHMC OBJECT_FIELD_S16(0x49, + 1)
#define /*0x1B0*/ oPlatformOnTrackType OBJECT_FIELD_S16(0x4A, 0)
#define /*0x1B2*/ oPlatformOnTrackWasStoodOn OBJECT_FIELD_S16(0x4A, + 1)

/* Seesaw platform */
#define /*0x0F4*/ oSeesawPlatformPitchVel OBJECT_FIELD_F32(0x1B)

/* Water bomb spawner */
#define /*0x0F4*/ oWaterBombSpawnerBombActive OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oWaterBombSpawnerTimeToSpawn OBJECT_FIELD_S32(0x1C)

/* Water bomb */
#define /*0x0F8*/ oWaterBombVerticalStretch OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oWaterBombStretchSpeed OBJECT_FIELD_F32(0x1D)
#define /*0x100*/ oWaterBombOnGround OBJECT_FIELD_S32(0x1E)
#define /*0x104*/ oWaterBombNumBounces OBJECT_FIELD_F32(0x1F)

/* TTC rotating solid */
#define /*0x0F4*/ oTTCRotatingSolidNumTurns OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oTTCRotatingSolidNumSides OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oTTCRotatingSolidRotationDelay OBJECT_FIELD_S32(0x1D)
#define /*0x100*/ oTTCRotatingSolidVelY OBJECT_FIELD_F32(0x1E)
#define /*0x104*/ oTTCRotatingSolidSoundTimer OBJECT_FIELD_S32(0x1F)

/* TTC pendulum */
#define /*0x0F4*/ oTTCPendulumAccelDir OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oTTCPendulumAngle OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oTTCPendulumAngleVel OBJECT_FIELD_F32(0x1D)
#define /*0x100*/ oTTCPendulumAngleAccel OBJECT_FIELD_F32(0x1E)
#define /*0x104*/ oTTCPendulumDelay OBJECT_FIELD_S32(0x1F)
#define /*0x108*/ oTTCPendulumSoundTimer OBJECT_FIELD_S32(0x20)

/* TTC treadmill */
#define /*0x0F4*/ oTTCTreadmillBigSurface OBJECT_FIELD_S16P(0x1B)
#define /*0x0F8*/ oTTCTreadmillSmallSurface OBJECT_FIELD_S16P(0x1C)
#define /*0x0FC*/ oTTCTreadmillSpeed OBJECT_FIELD_F32(0x1D)
#define /*0x100*/ oTTCTreadmillTargetSpeed OBJECT_FIELD_F32(0x1E)
#define /*0x104*/ oTTCTreadmillTimeUntilSwitch OBJECT_FIELD_S32(0x1F)

/* TTC moving bar */
#define /*0x0F4*/ oTTCMovingBarDelay OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oTTCMovingBarStoppedTimer OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oTTCMovingBarOffset OBJECT_FIELD_F32(0x1D)
#define /*0x100*/ oTTCMovingBarSpeed OBJECT_FIELD_F32(0x1E)
#define /*0x104*/ oTTCMovingBarStartOffset OBJECT_FIELD_F32(0x1F)

/* TTC cog */
#define /*0x0F4*/ oTTCCogDir OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oTTCCogSpeed OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oTTCCogTargetVel OBJECT_FIELD_F32(0x1D)

/* TTC pit block */
#define /*0x0F4*/ oTTCPitBlockPeakY OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oTTCPitBlockDir OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oTTCPitBlockWaitTime OBJECT_FIELD_S32(0x1D)

/* TTC elevator */
#define /*0x0F4*/ oTTCElevatorDir OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oTTCElevatorPeakY OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oTTCElevatorMoveTime OBJECT_FIELD_S32(0x1D)

/* TTC 2D rotator */
#define /*0x0F4*/ oTTC2DRotatorMinTimeUntilNextTurn OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oTTC2DRotatorTargetYaw OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oTTC2DRotatorIncrement OBJECT_FIELD_S32(0x1D)
#define /*0x104*/ oTTC2DRotatorRandomDirTimer OBJECT_FIELD_S32(0x1F)
#define /*0x108*/ oTTC2DRotatorSpeed OBJECT_FIELD_S32(0x20)

/* TTC spinner */
#define /*0x0F4*/ oTTCSpinnerDir OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oTTCChangeDirTimer OBJECT_FIELD_S32(0x1C)

/* Mr. Blizzard */
#define /*0x0F4*/ oMrBlizzardUnkF4 OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oMrBlizzardUnkF8 OBJECT_FIELD_OBJECT(0x1C)
#define /*0x0FC*/ oMrBlizzardUnkFC OBJECT_FIELD_F32(0x1D)
#define /*0x100*/ oMrBlizzardUnk100 OBJECT_FIELD_S32(0x1E)
#define /*0x104*/ oMrBlizzardUnk104 OBJECT_FIELD_F32(0x1F)
#define /*0x108*/ oMrBlizzardUnk108 OBJECT_FIELD_F32(0x20)
#define /*0x10C*/ oMrBlizzardUnk10C OBJECT_FIELD_F32(0x21)
#define /*0x110*/ oMrBlizzardUnk110 OBJECT_FIELD_S32(0x22)
#define /*0x1AC*/ oMrBlizzardUnk1AC OBJECT_FIELD_S32(0x49)

/* Back-and-forth platform */
#define /*0x0F4*/ oBackAndForthPlatformUnkF4 OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oBackAndForthPlatformUnkF8 OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oBackAndForthPlatformUnkFC OBJECT_FIELD_F32(0x1D)
#define /*0x100*/ oBackAndForthPlatformUnk100 OBJECT_FIELD_F32(0x1E)

// rename
/* Floor switch press animation */
#define /*0x0F4*/ oFloorSwitchPressAnimationUnkF4 OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oFloorSwitchPressAnimationUnkF8 OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oFloorSwitchPressAnimationUnkFC OBJECT_FIELD_S32(0x1D)
#define /*0x100*/ oFloorSwitchPressAnimationUnk100 OBJECT_FIELD_S32(0x1E)

/* Activated back and forth platform */
#define /*0x0F4*/ oActivatedBackAndForthPlatformMaxOffset OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oActivatedBackAndForthPlatformOffset OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oActivatedBackAndForthPlatformVel OBJECT_FIELD_F32(0x1D)
#define /*0x100*/ oActivatedBackAndForthPlatformCountdown OBJECT_FIELD_S32(0x1E)
#define /*0x104*/ oActivatedBackAndForthPlatformStartYaw OBJECT_FIELD_S32(0x1F)
#define /*0x108*/ oActivatedBackAndForthPlatformVertical OBJECT_FIELD_S32(0x20)
#define /*0x10C*/ oActivatedBackAndForthPlatformFlipRotation OBJECT_FIELD_S32(0x21)

/* Spinning heart */
#define /*0x0F4*/ oSpinningHeartTotalSpin OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oSpinningHeartPlayedSound OBJECT_FIELD_S32(0x1C)

// check name
/* Cannon barrel bubbles */
#define /*0x0F4*/ oCannonBarrelBubblesUnkF4 OBJECT_FIELD_F32(0x1B)

/* Cannon */
#define /*0x0F4*/ oCannonUnkF4 OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oCannonUnkF8 OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oCannonUnkFC OBJECT_FIELD_S32(0x1D)
#define /*0x100*/ oCannonUnk100 OBJECT_FIELD_S32(0x1E)

/* Eel */
#define /*0x0F4*/ oUnagiUnkF4 OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oUnagiUnkF8 OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oUnagiUnkFC OBJECT_FIELD_S16P(0x1D)
#define /*0x100*/ oUnagiUnk100 OBJECT_FIELD_S16P(0x1E)
#define /*0x104*/ oUnagiUnk104 OBJECT_FIELD_S32(0x1F)
#define /*0x108*/ oUnagiUnk108 OBJECT_FIELD_S32(0x20)
#define /*0x10C*/ oUnagiUnk10C OBJECT_FIELD_S32(0x21)
#define /*0x110*/ oUnagiUnk110 OBJECT_FIELD_F32(0x22)
#define /*0x1B0*/ oUnagiUnk1AC OBJECT_FIELD_F32(0x49)
#define /*0x1B0*/ oUnagiUnk1B0 OBJECT_FIELD_S16(0x4A, 0)
#define /*0x1B2*/ oUnagiUnk1B2 OBJECT_FIELD_S16(0x4A, + 1)

/* Dorrie */
#define /*0x0F4*/ oDorrieDistToHome OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oDorrieOffsetY OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oDorrieVelY OBJECT_FIELD_F32(0x1D)
#define /*0x100*/ oDorrieForwardDistToMario OBJECT_FIELD_F32(0x1E)
#define /*0x104*/ oDorrieYawVel OBJECT_FIELD_S32(0x1F)
#define /*0x10C*/ oDorrieLiftingMario OBJECT_FIELD_S32(0x21)
#define /*0x1AC*/ oDorrieGroundPounded OBJECT_FIELD_S16(0x49, 0)
#define /*0x1AE*/ oDorrieAngleToHome OBJECT_FIELD_S16(0x49, + 1)
#define /*0x1B0*/ oDorrieNeckAngle OBJECT_FIELD_S16(0x4A, 0)
#define /*0x1B2*/ oDorrieHeadRaiseSpeed OBJECT_FIELD_S16(0x4A, + 1)

/* Haunted chair */
#define /*0x0F4*/ oHauntedChairUnkF4 OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oHauntedChairUnkF8 OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oHauntedChairUnkFC OBJECT_FIELD_F32(0x1D)
#define /*0x100*/ oHauntedChairUnk100 OBJECT_FIELD_S32P(0x1E)
#define /*0x104*/ oHauntedChairUnk104 OBJECT_FIELD_S32(0x1F)

/* Bookend */
#define /*0x0F4*/ oBookendUnkF4 OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oBookendUnkF8 OBJECT_FIELD_S32(0x1C)

/* Book switch manager */
#define /*0x0F4*/ oBookSwitchManagerUnkF4 OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oBookSwitchManagerUnkF8 OBJECT_FIELD_S32(0x1C)

/* Book switch */
#define /*0x0F4*/ oBookSwitchUnkF4 OBJECT_FIELD_F32(0x1B)

/* Fire piranha plant */
#define /*0x0F4*/ oFirePiranhaPlantNeutralScale OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oFirePiranhaPlantScale OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oFirePiranhaPlantActive OBJECT_FIELD_S32(0x1D)
#define /*0x100*/ oFirePiranhaPlantDeathSpinTimer OBJECT_FIELD_S32(0x1E)
#define /*0x104*/ oFirePiranhaPlantDeathSpinVel OBJECT_FIELD_F32(0x1F)

// Rename
/* Small piranha flame */
#define /*0x0F4*/ oSmallPiranhaFlameUnkF4 OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oSmallPiranhaFlameUnkF8 OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oSmallPiranhaFlameUnkFC OBJECT_FIELD_S32(0x1D)
#define /*0x100*/ oSmallPiranhaFlameUnk100 OBJECT_FIELD_S32(0x1E)
#define /*0x104*/ oSmallPiranhaFlameUnk104 OBJECT_FIELD_F32(0x1F)

/* Fire spitter */
#define /*0x0F4*/ oFireSpitterScaleVel OBJECT_FIELD_F32(0x1B)

/* Snufit */
#define /*0x0F4*/ oSnufitUnkF4 OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oSnufitUnkF8 OBJECT_FIELD_F32(0x1C)
#define /*0x100*/ oSnufitUnk100 OBJECT_FIELD_S32(0x1E)
#define /*0x104*/ oSnufitUnk104 OBJECT_FIELD_S32(0x1F)
#define /*0x108*/ oSnufitUnk108 OBJECT_FIELD_S32(0x20)
#define /*0x10C*/ oSnufitUnk10C OBJECT_FIELD_S32(0x21)
#define /*0x1AE*/ oSnufitUnk1AE OBJECT_FIELD_S16(0x49, + 1)
#define /*0x1B0*/ oSnufitUnk1B0 OBJECT_FIELD_S16(0x4A, 0)
#define /*0x1B2*/ oSnufitUnk1B2 OBJECT_FIELD_S16(0x4A, + 1)

/* Horizontal grindel */
#define /*0x0F4*/ oHorizontalGrindelTargetYaw OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oHorizontalGrindelDistToHome OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oHorizontalGrindelOnGround OBJECT_FIELD_S32(0x1D)

/* Eyerok boss */
#define /*0x0F8*/ oEyerokBossNumHands OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oEyerokBossUnkFC OBJECT_FIELD_S32(0x1D)
#define /*0x100*/ oEyerokBossActiveHand OBJECT_FIELD_S32(0x1E)
#define /*0x104*/ oEyerokBossUnk104 OBJECT_FIELD_S32(0x1F)
#define /*0x108*/ oEyerokBossUnk108 OBJECT_FIELD_F32(0x20)
#define /*0x10C*/ oEyerokBossUnk10C OBJECT_FIELD_F32(0x21)
#define /*0x110*/ oEyerokBossUnk110 OBJECT_FIELD_F32(0x22)
#define /*0x1AC*/ oEyerokBossUnk1AC OBJECT_FIELD_S32(0x49)

/* Eyerok hand */
#define /*0x0F4*/ oEyerokHandWakeUpTimer OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oEyerokReceivedAttack OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oEyerokHandUnkFC OBJECT_FIELD_S32(0x1D)
#define /*0x100*/ oEyerokHandUnk100 OBJECT_FIELD_S32(0x1E)

/* Klepto */
#define /*0x0F4*/ oKleptoDistanceToTarget OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oKleptoUnkF8 OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oKleptoUnkFC OBJECT_FIELD_F32(0x1D)
#define /*0x100*/ oKleptoSpeed OBJECT_FIELD_F32(0x1E)
#define /*0x104*/ oKleptoStartPosX OBJECT_FIELD_F32(0x1F)
#define /*0x108*/ oKleptoStartPosY OBJECT_FIELD_F32(0x20)
#define /*0x10C*/ oKleptoStartPosZ OBJECT_FIELD_F32(0x21)
#define /*0x110*/ oKleptoTimeUntilTargetChange OBJECT_FIELD_S32(0x22)
#define /*0x1AC*/ oKleptoTargetNumber OBJECT_FIELD_S16(0x49, 0)
#define /*0x1AE*/ oKleptoUnk1AE OBJECT_FIELD_S16(0x49, + 1)
#define /*0x1B0*/ oKleptoUnk1B0 OBJECT_FIELD_S16(0x4A, 0)
#define /*0x1B2*/ oKleptoYawToTarget OBJECT_FIELD_S16(0x4A, + 1)

/* Bird */
#define /*0x0F4*/ oBirdSpeed OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oBirdTargetPitch OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oBirdTargetYaw OBJECT_FIELD_S32(0x1D)

/* Racing penguin */
#define /*0x0F4*/ oRacingPenguinInitTextCooldown OBJECT_FIELD_S32(0x1B)
// 0x1D-0x21 reserved for pathing
#define /*0x110*/ oRacingPenguinWeightedNewTargetSpeed OBJECT_FIELD_F32(0x22)
#define /*0x1AC*/ oRacingPenguinFinalTextbox OBJECT_FIELD_S16(0x49, 0)
#define /*0x1AE*/ oRacingPenguinMarioWon OBJECT_FIELD_S16(0x49, + 1)
#define /*0x1B0*/ oRacingPenguinReachedBottom OBJECT_FIELD_S16(0x4A, 0)
#define /*0x1B2*/ oRacingPenguinMarioCheated OBJECT_FIELD_S16(0x4A, + 1)

/* Clam */
#define /*0x0F4*/ oClamUnkF4 OBJECT_FIELD_S32(0x1B)

/* Skeeter */
#define /*0x0F4*/ oSkeeterTargetAngle OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oSkeeterUnkF8 OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oSkeeterUnkFC OBJECT_FIELD_F32(0x1D)
#define /*0x100*/ oSkeeterWaitTime OBJECT_FIELD_S32(0x1E)
#define /*0x1AC*/ oSkeeterUnk1AC OBJECT_FIELD_S16(0x49, 0)

/* Swing platform */
#define /*0x0F4*/ oSwingPlatformAngle OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oSwingPlatformSpeed OBJECT_FIELD_F32(0x1C)

/* Donut platform spawner */
#define /*0x0F4*/ oDonutPlatformSpawnerSpawnedPlatforms OBJECT_FIELD_S32(0x1B)

/* DDD pole */
#define /*0x0F4*/ oDDDPoleVel OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oDDDPoleMaxOffset OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oDDDPoleOffset OBJECT_FIELD_F32(0x1D)

/* Triplet butterfly */
#define /*0x0F4*/ oTripletButterflyScale OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oTripletButterflySpeed OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oTripletButterflyBaseYaw OBJECT_FIELD_F32(0x1D)
#define /*0x100*/ oTripletButterflyTargetPitch OBJECT_FIELD_S32(0x1E)
#define /*0x104*/ oTripletButterflyTargetYaw OBJECT_FIELD_S32(0x1F)
#define /*0x108*/ oTripletButterflyType OBJECT_FIELD_S32(0x20)
#define /*0x10C*/ oTripletButterflyModel OBJECT_FIELD_S32(0x21)
#define /*0x110*/ oTripletButterflySelectedButterfly OBJECT_FIELD_S32(0x22)
#define /*0x1AC*/ oTripletButterflyScalePhase OBJECT_FIELD_S32(0x49)

/* Bubba */
#define /*0x0F4*/ oBubbaUnkF4 OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oBubbaUnkF8 OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oBubbaUnkFC OBJECT_FIELD_S32(0x1D)
#define /*0x100*/ oBubbaUnk100 OBJECT_FIELD_S32(0x1E)
#define /*0x104*/ oBubbaUnk104 OBJECT_FIELD_S32(0x1F)
#define /*0x108*/ oBubbaUnk108 OBJECT_FIELD_F32(0x20)
#define /*0x10C*/ oBubbaUnk10C OBJECT_FIELD_F32(0x21)
#define /*0x1AC*/ oBubbaUnk1AC OBJECT_FIELD_S16(0x49, 0)
#define /*0x1AE*/ oBubbaUnk1AE OBJECT_FIELD_S16(0x49, + 1)
#define /*0x1B0*/ oBubbaUnk1B0 OBJECT_FIELD_S16(0x4A, 0)
#define /*0x1B2*/ oBubbaUnk1B2 OBJECT_FIELD_S16(0x4A, + 1)

/* PyramidTop */
#define /*0x0F4*/ oPyramidTopPillarsTouched OBJECT_FIELD_S32(0x1B)

/* PyramidTopExplosion */
#define /*0x0F4*/ oPyramidTopFragmentsScale OBJECT_FIELD_F32(0x1B)

/* SnowmansBottom */
#define /*0x0F4*/ oSnowmansBottomUnkF4 OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oSnowmansBottomUnkF8 OBJECT_FIELD_S32(0x1C)
#define /*0x0FC*/ oSnowmansBottomUnkFC OBJECT_FIELD_VOIDP(0x1D)
#define /*0x10C*/ oSnowmansBottomUnk10C OBJECT_FIELD_S32(0x21)

/* SnowmansHead */
#define /*0x0F4*/ oSnowmansHeadUnkF4 OBJECT_FIELD_S32(0x1B)

/* StarSpawn */
#define /*0x0F4*/ oStarSpawnDisFromHome OBJECT_FIELD_F32(0x1B)
#define /*0x0FC*/ oStarSpawnUnkFC OBJECT_FIELD_F32(0x1D)

/* HiddenRedCoinStar */
#define /*0x0F4*/ oHiddenRedCoinStarCoinsCollected OBJECT_FIELD_S32(0x1B)

/* HiddenStar */
#define /*0x0F4*/ oHiddenStarSecretsCollected OBJECT_FIELD_S32(0x1B)

/* BowserCourseRedCoinStar */
#define /*0x0F4*/ oBowserCourseRedCoinStarCoinsCollected OBJECT_FIELD_S32(0x1B)

/* Pitoune */
#define /*0x0F4*/ oPitouneUnkF4 OBJECT_FIELD_F32(0x1B)
#define /*0x0F8*/ oPitouneUnkF8 OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oPitouneUnkFC OBJECT_FIELD_F32(0x1D)

/* 1UpHidden */
#define /*0x0F4*/ o1UpHiddenUnkF4 OBJECT_FIELD_S32(0x1B)

/* ControllablePlatform */
#define /*0x0FC*/ oControllablePlatformUnkFC OBJECT_FIELD_F32(0x1D)
#define /*0x100*/ oControllablePlatformUnk100 OBJECT_FIELD_S32(0x1E)

/* BreakableBoxSmall */
#define /*0x0F4*/ oBreakableBoxSmallReleased OBJECT_FIELD_S32(0x1B)
#define /*0x0FC*/ oBreakableBoxSmallFramesSinceReleased OBJECT_FIELD_S32(0x1D)

/* FloatingPlatform */
#define /*0x0F4*/ oFloatingPlatformUnkFC OBJECT_FIELD_S32(0x1B)

/* ArrowLift */
#define /*0x0F4*/ oArrowLiftDisplacement OBJECT_FIELD_F32(0x1B)

/* FallingPillar */
#define /*0x0F4*/ oFallingPillarPitchAcceleration OBJECT_FIELD_F32(0x1B)

/* TreasureChestJrb */
#define /*0x0F4*/ oTreasureChestJrbUnkF4 OBJECT_FIELD_S32(0x1B)
#define /*0x0FC*/ oTreasureChestJrbUnkFC OBJECT_FIELD_S32(0x1D)

/* TreasureChest */
#define /*0x0F4*/ oTreasureChestUnkF4 OBJECT_FIELD_S32(0x1B)
#define /*0x0FC*/ oTreasureChestUnkFC OBJECT_FIELD_S32(0x1D)

/* Mips */
#define /*0x0F4*/ oMipsStarStatus         OBJECT_FIELD_S32(0x1B)
#define /*0x0F8*/ oMipsStartWaypointIndex OBJECT_FIELD_S32(0x1C)
#define /*0x1AC*/ oMipsForwardVelocity    OBJECT_FIELD_F32(0x49)

/* Yoshi */
#define /*0x0F4*/ oYoshiUnkF4 OBJECT_FIELD_S32(0x1B)
#define /*0x0FC*/ oYoshiChosenHome OBJECT_FIELD_S32(0x1D)
#define /*0x100*/ oYoshiTargetYaw OBJECT_FIELD_S32(0x1E)

/* End birds */
#define /*0x104*/ oEndBirdUnk104 OBJECT_FIELD_F32(0x1F)

/* Intro cutscene lakitu */
#define /*0x0F8*/ oIntroLakituUnkF8 OBJECT_FIELD_F32(0x1C)
#define /*0x0FC*/ oIntroLakituUnkFC OBJECT_FIELD_F32(0x1D)
#define /*0x100*/ oIntroLakituUnk100 OBJECT_FIELD_F32(0x1E)
#define /*0x104*/ oIntroLakituUnk104 OBJECT_FIELD_F32(0x1F)
#define /*0x108*/ oIntroLakituUnk108 OBJECT_FIELD_F32(0x20)
#define /*0x10C*/ oIntroLakituUnk10C OBJECT_FIELD_F32(0x21)
#define /*0x110*/ oIntroLakituUnk110 OBJECT_FIELD_F32(0x22)

/* Intro cutscene Peach */
#define /*0x108*/ oIntroPeachUnk108 OBJECT_FIELD_F32(0x20)
#define /*0x10C*/ oIntroPeachUnk10C OBJECT_FIELD_F32(0x21)
#define /*0x110*/ oIntroPeachUnk110 OBJECT_FIELD_F32(0x22)

#endif
