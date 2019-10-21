#ifndef _OBJ_BEHAVIORS_H
#define _OBJ_BEHAVIORS_H

#include "types.h"
#include "object_helpers2.h"
#include "engine/surface_collision.h"

extern struct Surface *D_803600E0;

extern s8 D_80331500;
extern s16 D_80331504;
extern s8 D_80331508;
extern s8 D_8033150C;
extern s8 D_80331510;

extern u8 bob_seg7_metal_ball_path0[];
extern u8 ttm_seg7_trajectory_070170A0[];
extern u8 bob_seg7_metal_ball_path1[];

void func_802E2F40(void);
Gfx *func_802E2F58(s32 arg0, struct Object *arg1, UNUSED s32 arg2); /* unused */
f32 absf_2(f32 f);
void TurnObjAwayFromSurface(f32 objVelX, f32 objVelZ, f32 nX, UNUSED f32 nY, f32 nZ, f32 *objYawX, f32 *objYawZ);
s32 ObjFindWall(f32 objNewX, f32 objY, f32 objNewZ, f32 objVelX, f32 objVelZ);
s32 TurnObjAwayFromAwkwardFloor(struct Surface *objFloor, f32 floorY, f32 objVelX, f32 objVelZ);
void ObjOrientGraph(struct Object *obj, f32 normalX, f32 normalY, f32 normalZ);
void CalcObjFriction(f32 *objFriction, f32 floor_nY);
void CalcNewObjVelAndPosY(struct Surface* objFloor, f32 objFloorY, f32 objVelX, f32 arg3);
void CalcNewObjVelAndPosYUnderwater(struct Surface* objFloor, f32 floorY, f32 objVelX, f32 objVelZ, f32 waterY);
void ObjUpdatePosVelXZ(void);
void ObjSplash(s32 waterY, s32 objY);
s32 ObjectStep(void);
s32 func_802E4204(void);
void obj_move_xyz_using_fvel_and_yaw(struct Object* obj);
s32 is_point_within_radius_of_mario(f32 x, f32 y, f32 z, s32 dist);
s32 IsPointCloseToObject(struct Object* obj, f32 x, f32 y, f32 z, s32 dist);
void SetObjectVisibility(struct Object* obj, s32 arg1);
s32 ObjLeaveIfMarioIsNearHome(struct Object* obj, f32 arg1, f32 arg2, f32 arg3, s32 arg4);
void ObjDisplaceHome(struct Object* obj, f32 homeX, UNUSED f32 homeY, f32 homeZ, s32 baseDisp);
s32 func_802E46C0(u32 arg0, u32 arg1, s16 arg2);
s32 func_802E478C(Vec3f dist, f32 x, f32 y, f32 z, f32 arg4);
void ObjSpawnYellowCoins(struct Object *obj, s8 nCoins);
s32 ObjFlickerAndDisappear(struct Object *obj, s16 arg1);
s8 func_802E49A4(s16 arg0);
s16 func_802E4A38(s32 *arg0, s16 arg1, f32 arg2, s32 arg3);
void ObjCheckFloorDeath(s16 collisionFlags, struct Surface *floor);
s32 ObjLavaDeath(void);
void SpawnOrangeNumber(s8 arg0, s16 arg1, s16 arg2, s16 arg3);
s32 Unknown802E4DF4(s16 *arg0); /* unused */
s32 CoinStep(s16 *collisionFlagsPtr);
void MovingCoinFlickerLoop(void);
void CoinCollected(void);
void bhv_moving_yellow_coin_init(void);
void bhv_moving_yellow_coin_loop(void);
void bhv_moving_blue_coin_init(void);
void bhv_moving_blue_coin_loop(void);
void bhv_blue_coin_sliding_jumping_init(void);
void func_802E540C(void); /* likely unused */
void func_802E54DC(void); /* likely unused */
void bhv_blue_coin_sliding_loop(void); /* likely unused */
void bhv_blue_coin_jumping_loop(void); /* likely unused */
void bhv_seaweed_init(void);
void bhv_seaweed_bundle_init(void);
void bhv_bobomb_init(void);
void func_802E5B7C(void);
void BobombExplodeLoop(void);
void CheckBobombInteractions(void);
void BobombPatrolLoop(void);
void BobombChaseMarioLoop(void);
void BobombLaunchedLoop(void);
void GenericBobombFreeLoop(void);
void StationaryBobombFreeLoop(void);
void BobombFreeLoop(void);
void BobombHeldLoop(void);
void BobombDroppedLoop(void);
void BobombThrownLoop(void);
void ObjRandomBlink(s32 *blinkTimer);
void bhv_bobomb_loop(void);
void bhv_bobomb_fuse_smoke_init(void);
void bhv_bobomb_buddy_init(void);
void BobombBuddyIdleLoop(void);
void BobombBuddyCannonLoop(s16 arg0, s16 arg1);
void BobombBuddyTalkLoop(void);
void BobombBuddyTurnToTalkLoop(void);
void BobombBuddyActionLoop(void);
void bhv_bobomb_buddy_loop(void);
void bhv_cannon_closed_init(void);
void CannonTrapDoorOpeningLoop(void);
void bhv_cannon_closed_loop(void);
void bhv_whirlpool_init(void);
void func_802E70A8(void);
void WhirlpoolOrientGraph(void);
void bhv_whirlpool_loop(void);
void bhv_jet_stream_loop(void);
void bhv_homing_amp_init(void);
//void check_amp_attack(void);
//void homing_amp_appear_loop(void);
//void homing_amp_chase_loop(void);
//void homing_amp_give_up_loop(void);
//void amp_attack_cooldown_loop(void);
void bhv_homing_amp_loop(void);
void bhv_circling_amp_init(void);
//void fixed_circling_amp_idle_loop(void);
//void circling_amp_idle_loop(void);
void bhv_circling_amp_loop(void);
void bhv_butterfly_init(void);
void ButterflyStep(s32 speed);
void CalculateButterflyAngle(void);
void ButterflyRestingLoop(void);
void ButterflyFollowMarioLoop(void);
void ButterflyReturnHomeLoop(void);
void bhv_butterfly_loop(void);
void bhv_hoot_init(void);
f32 HootFindNextFloor(struct FloorGeometry **arg0, f32 arg1);
void HootFloorBounce(void);
void HootFreeStep(s16 arg0, s32 arg1);
void PlayerSetHootYaw(void);
void HootCarryStep(s32 arg0, UNUSED f32 arg1, UNUSED f32 arg2);
void HootSurfaceCollision(f32 arg0, UNUSED f32 arg1, f32 arg2);
void HootAscentLoop(f32 arg0, f32 arg1);
void HootActionLoop(void);
void HootTurnToHome(void);
void HootAwakeLoop(void);
void bhv_hoot_loop(void);
void bhv_beta_holdable_object_init(void); /* unused */
//void beta_holdable_object_drop(void); /* unused */
//void beta_holdable_object_throw(void); /* unused */
void bhv_beta_holdable_object_loop(void); /* unused */
void bhv_object_bubble_init(void);
void bhv_object_bubble_loop(void);
void bhv_object_water_wave_init(void);
void bhv_object_water_wave_loop(void);
void bhv_explosion_init(void);
void bhv_explosion_loop(void);
void bhv_bobomb_bully_death_smoke_init(void);
void bhv_bobomb_explosion_bubble_init(void);
void bhv_bobomb_explosion_bubble_loop(void);
void bhv_respawner_loop(void);
void create_respawner(s32 arg0, void *behToSpawn, s32 minSpawnDist);
void bhv_small_bully_init(void);
void bhv_big_bully_init(void);
void BullyCheckMarioCollision(void);
void BullyChaseMarioLoop(void);
void BullyKnockbackLoop(void);
void BullyBackUpLoop(void);
void BullyBackUpCheck(s16 arg0);
void PlayBullyStompingSound(void);
void BullyStep(void);
void BullySpawnCoin(void);
void BullyLavaDeath(void);
void bhv_bully_loop(void);
void BigBullySpawnMinion(s32 arg0, s32 arg1, s32 arg2, s16 arg3);
void bhv_big_bully_with_minions_init(void);
void BigBullyWithMinionsLavaDeath(void);
void bhv_big_bully_with_minions_loop(void);
f32 WaterRingCalcMarioDistInFront(void);
void WaterRingInit(void);
void bhv_jet_stream_water_ring_init(void);
void CheckWaterRingCollection(f32 avgScale, struct Object* ringManager);
void SetWaterRingScale(f32 avgScale);
void WaterRingCollectedLoop(void);
void JetStreamWaterRingNotCollectedLoop(void);
void bhv_jet_stream_water_ring_loop(void);
void Unknown802EB8A4(void); /* unused */
void JetStreamRingSpawnerActiveLoop(void);
void bhv_jet_stream_ring_spawner_loop(void);
void bhv_manta_ray_water_ring_init(void);
void MantaRayWaterRingNotCollectedLoop(void);
void bhv_manta_ray_water_ring_loop(void);
void bhv_bowser_bomb_loop(void);
void bhv_bowser_bomb_explosion_loop(void);
void bhv_bowser_bomb_smoke_loop(void);
void bhv_celebration_star_init(void);
void CelebrationStarSpinAroundMarioLoop(void);
void CelebrationStarFaceCameraLoop(void);
void bhv_celebration_star_loop(void);
void bhv_celebration_star_sparkle_loop(void);
void bhv_star_key_collection_puff_spawner_loop(void);
void bhv_lll_drawbridge_spawner_loop(void);
void bhv_lll_drawbridge_loop(void);
void bhv_small_bomp_init(void);
void bhv_small_bomp_loop(void);
void bhv_large_bomp_init(void);
void bhv_large_bomp_loop(void);
void bhv_wf_sliding_platform_init(void);
void bhv_wf_sliding_platform_loop(void);
void bhv_moneybag_init(void);
void MoneybagCheckMarioCollision(void);
void MoneybagJump(s8 collisionFlags);
void MoneybagMoveAroundLoop(void);
void MoneybagReturnHomeLoop(void);
void MoneybagDisappearLoop(void);
void MoneybagDeathLoop(void);
void bhv_moneybag_loop(void);
void bhv_moneybag_hidden_loop(void);
void bhv_bowling_ball_init(void);
void func_802EDA14(void);
void func_802EDA6C(void);
void bhv_bowling_ball_roll_loop(void);
void bhv_bowling_ball_initializeLoop(void);
void bhv_bowling_ball_loop(void);
void bhv_generic_bowling_ball_spawner_init(void);
void bhv_generic_bowling_ball_spawner_loop(void);
void bhv_thi_bowling_ball_spawner_loop(void);
void bhv_bob_pit_bowling_ball_init(void);
void bhv_bob_pit_bowling_ball_loop(void);
void bhv_free_bowling_ball_init(void); /* likely unused */
void bhv_free_bowling_ball_roll_loop(void); /* likely unused */
void bhv_free_bowling_ball_loop(void); /* likely unused */
void bhv_rr_cruiser_wing_init(void);
void bhv_rr_cruiser_wing_loop(void);
extern void create_star(f32, f32, f32);

#endif /* _OBJ_BEHAVIORS_H */
