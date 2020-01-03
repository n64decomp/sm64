#ifndef OBJECT_HELPERS_H
#define OBJECT_HELPERS_H

#include "types.h"

// used for chain chomp and wiggler
struct ChainSegment
{
    f32 posX;
    f32 posY;
    f32 posZ;
    s16 pitch;
    s16 yaw;
    s16 roll;
};

#define WATER_SPLASH_FLAG_RAND_ANGLE                0x02
#define WATER_SPLASH_FLAG_RAND_OFFSET_XZ            0x04
#define WATER_SPLASH_FLAG_RAND_OFFSET_XYZ           0x08
#define WATER_SPLASH_FLAG_SET_Y_TO_WATER_LEVEL      0x20
#define WATER_SPLASH_FLAG_RAND_ANGLE_INCR_PLUS_8000 0x40
#define WATER_SPLASH_FLAG_RAND_ANGLE_INCR           0x80

// Call spawn_water_splash with this struct to spawn an object.
struct WaterSplashParams
{
    s16 flags; // spawn flags, see WATER_SPLASH_FLAG_* defines above
    s16 model;
    const BehaviorScript *behavior;
    s16 moveAngleRange; // only used for flags 0x40 & 0x80
    s16 moveRange;      // only used for flags 0x04 & 0x08
    f32 randForwardVelOffset;
    f32 randForwardVelScale;
    f32 randYVelOffset;
    f32 randYVelScale;
    f32 randSizeOffset;
    f32 randSizeScale;
};

struct struct802A1230 {
    /*0x00*/ s16 unk00;
    /*0x02*/ s16 unk02;
};

struct Struct802A272C {
    Vec3f vecF;
    Vec3s vecS;
};

// TODO: Field names
struct SpawnParticlesInfo
{
    /*0x00*/ s8 behParam;
    /*0x01*/ s8 count;
    /*0x02*/ u8 model;
    /*0x03*/ s8 offsetY;
    /*0x04*/ s8 forwardVelBase;
    /*0x05*/ s8 forwardVelRange;
    /*0x06*/ s8 velYBase;
    /*0x07*/ s8 velYRange;
    /*0x08*/ s8 gravity;
    /*0x09*/ s8 dragStrength;
    /*0x0C*/ f32 sizeBase;
    /*0x10*/ f32 sizeRange;
};

// extern ? D_80336610;
extern struct GraphNode **gLoadedGraphNodes;
// extern ? sLevelsWithRooms;
// extern ? sGrabReleaseState;
// extern ? sMrIParticleActions;
// extern ? D_8032F124;
// extern ? sMrIActions;
// extern ? D_8032F134;
// extern const char* D_803366B0;
// extern ? sKingBobombActions;
extern s16 gMarioShotFromCannon;
// extern ? sOpenedCannonActions;
// extern ? D_803366B4;
// extern ? D_803366BC;
// extern ? D_803366C4;
// extern ? sChuckyaActions;
// extern ? D_803366C8;
// extern ? D_8032F260;
// extern ? D_8032F273;
// extern ? D_8032F271;
// extern ? D_8032F270;
// extern ? D_8032F284;
// extern ? D_8032F294;
// extern ? sCoinInsideBooActions;
extern s16 D_8035FEE4;
// extern ? sGrindelThwompActions;
// extern ? sTumblingBridgeParams;
// extern ? sTumblingBridgeActions;
// extern ? sElevatorActions;
// extern ? D_8032F3CC;
// extern ? D_8032F3E0;
// extern ? D_8032F3F4;
// extern ? D_8032F3FC;
// extern ? sUkikiCageActions;
// extern ? D_8032F420;
// extern ? D_8032F430;
// extern ? D_8032F440;
// extern ? D_8032F450;
// extern ? sHeaveHoActions;
// extern ? D_8032F498;
// extern ? sJumpingBoxActions;
// extern ? D_8032F4B0;
// extern ? D_8035FF10;
// extern ? sBetaBooKeyActions;
// extern ? D_8032F4CC;
// extern ? sBulletBillActions;
// extern ? sBowserTailAnchorActions;
extern void* D_060576FC;
// extern ? D_8032F50C;
// extern ? D_8032F510;
// extern ? sBowserActions;
// extern ? D_8032F5B8;
// extern ? sFallingBowserPlatformActions;
// extern ? D_8032F738;
// extern ? D_8032F728;
// extern ? D_8032F754;
extern s8 dddStatus;
// extern ? D_8035FEE8;
// extern ? sCageUkikiPath;
// extern ? sUkikiActions;
// extern ? sUkikiSoundStates;
// extern ? D_803366D8;
// extern ? D_803366E4;
// extern ? D_803366F0;
// extern ? sRotatingCwFireBarsActions;
// extern ? D_8032F8E0;
// extern ? sToxBoxActions;
// extern ? sPiranhaPlantActions;
// extern ? D_8032FB4C;
// extern ? sBowserPuzzlePieceActions;
// extern ? sTuxiesMotherActions;
// extern ? sSmallPenguinActions;
// extern ? D_0301C2B0;
// extern ? D_0600E264;
// extern ? sFishActions;
// extern ? sFishGroupActions;
// extern ? sBirdChirpChirpActions;
// extern ? sCheepCheepActions;
// extern ? D_8032FC30;
// extern ? sExclamationBoxContents;
// extern ? sExclamationBoxActions;
// extern ? D_8032FCD8;
// extern ? D_8032FCE8;
// extern ? D_803366FC;
// extern ? D_8032FCF8;
// extern ? sTweesterActions;
// extern ? sCourtyardBooTripletPositions;
// extern ? sBooActions;
// extern ? D_8032FD14;
// extern ? sBooGivingStarActions;
// extern ? sBooWithCageActions;
// extern ? D_8032FD74;
// extern ? sWhompActions;
// extern ? D_8032FDAC;
// extern ? D_8032FDF4;
// extern ? D_8032FE3C;
// extern ? D_8032FE4C;
// extern ? D_80336704;
// extern ? D_8033670C;

extern Gfx *Geo18_8029D890(s32 run, UNUSED struct GraphNode *node, f32 mtx[4][4]);
extern Gfx *Geo18_8029D924(s32 run, struct GraphNode *node, UNUSED void *context);
#ifdef AVOID_UB
extern Gfx *geo_switch_anim_state(s32 run, struct GraphNode *node, void *context);
extern Gfx *geo_switch_area(s32 run, struct GraphNode *node, void *context);
#else
extern Gfx *geo_switch_anim_state(s32 run, struct GraphNode *node);
extern Gfx *geo_switch_area(s32 run, struct GraphNode *node);
#endif
extern void func_8029D558(Mat4, struct Object *);
void apply_object_scale_to_matrix(struct Object *, Mat4, Mat4);
extern void func_8029D704(Mat4,Mat4,Mat4);
void set_object_held_state(struct Object *, const BehaviorScript *);
extern f32 lateral_dist_between_objects(struct Object *, struct Object *);
extern f32 dist_between_objects(struct Object *, struct Object *);
extern void obj_forward_vel_approach_upward(f32,f32);
extern s32 approach_f32_signed(f32*,f32,f32);
extern f32 approach_f32_symmetric(f32,f32,f32);
extern s16 approach_s16_symmetric(s16 arg0, s16 arg1, s16 arg2);
extern s32 obj_rotate_yaw_toward(s16,s16);
extern s16 angle_to_object(struct Object *, struct Object *);
extern s16 obj_turn_toward_object(struct Object *, struct Object *, s16, s16);
extern void set_object_parent_relative_pos(struct Object*,s16,s16,s16);
extern void set_object_pos(struct Object*,s16,s16,s16);
extern void set_object_angle(struct Object*,s16,s16,s16);
extern struct Object *spawn_object_abs_with_rot(struct Object *, s16, u32, const BehaviorScript *, s16, s16, s16, s16, s16, s16);
extern struct Object *spawn_object_rel_with_rot(struct Object *sp20, u32 sp24, const BehaviorScript *sp28, s16 sp2E, s16 sp32, s16 sp36, s16 sp3A, s16 sp3E, s16 sp42);
// extern ? Unknown8029E330(?);
extern struct Object *spawn_water_splash(struct Object *, struct WaterSplashParams *);
extern struct Object *spawn_object_at_origin(struct Object *, s32, u32, const BehaviorScript *);
extern struct Object *spawn_object(struct Object *, s32, const BehaviorScript *);
extern struct Object* try_to_spawn_object(s16,f32,struct Object*,s32,const BehaviorScript *);
extern struct Object* spawn_object_with_scale(struct Object*,s32,const BehaviorScript *,f32);
// extern ? build_relative_object_transform(?);
extern struct Object* spawn_object_relative(s16, s16, s16, s16, struct Object *, s32, const BehaviorScript *);
extern struct Object* spawn_object_relative_with_scale(s16,s16,s16,s16,f32,struct Object *,s32,const BehaviorScript *);
// extern ? obj_move_using_vel(?);
extern void copy_object_graph_y_offset(struct Object*,struct Object*);
extern void copy_object_pos_and_angle(struct Object *, struct Object *);
extern void copy_object_pos(struct Object*,struct Object*);
// extern ? copy_object_angle(?);
extern void func_8029EA0C(struct Object*);
// extern ? Unknown8029EA34(?);
extern void linear_mtxf_mul_vec3f(f32 [4][4], Vec3f, Vec3f);
extern void linear_mtxf_transpose_mul_vec3f(f32 [4][4], Vec3f, Vec3f);
// extern ? apply_scale_to_object_transform(?);
void copy_object_scale(struct Object *toObj, struct Object *fromObj);
extern void scale_object_xyz(struct Object* obj, f32 xScale, f32 yScale, f32 zScale);
extern void scale_object(struct Object *, f32);
extern void obj_scale(f32);
extern void set_obj_animation_and_sound_state(s32);
extern void func_8029ED98(u32, f32);
extern void SetObjAnimation(s32 arg0);
void func_8029EE20(struct Object *a0, struct Animation **a1, u32 a2);
// extern ? obj_enable_rendering_and_become_tangible(?);
extern void obj_enable_rendering(void);
// extern ? obj_disable_rendering_and_become_intangible(?);
extern void obj_disable_rendering(void);
extern void obj_unhide(void);
extern void obj_hide(void);
extern void obj_set_pos_relative(struct Object *MarioObj, f32, f32, f32);
// extern ? obj_set_pos_relative_to_parent(?);
extern void obj_enable_rendering_2(void);
// extern ? obj_unused_init_on_floor(?);
extern void obj_set_facing_to_move_angles(struct Object *);
u32 get_object_list_from_behavior(const BehaviorScript *behavior);
extern struct Object *obj_nearest_object_with_behavior(const BehaviorScript *);
f32 obj_dist_to_nearest_object_with_behavior(const BehaviorScript*);
extern struct Object *obj_find_nearest_object_with_behavior(const BehaviorScript *, f32 *);
extern struct Object *find_unimportant_object(void);
// extern ? count_unimportant_objects(?);
extern s32 count_objects_with_behavior(const BehaviorScript *behavior);
struct Object* obj_find_nearby_held_actor(const BehaviorScript *,f32);
// extern ? obj_reset_timer_and_subaction(?);
void obj_change_action(s32);
void func_8029F684(f32,f32);
void func_8029F6F0(void);
extern void func_8029F728(void);
extern s32 func_8029F788(void);
extern s32 func_8029F828(void);
extern s32 obj_check_anim_frame(s32);
extern s32 obj_check_anim_frame_in_range(s32, s32);
// extern ? Unknown8029F930(?);
s32 mario_is_in_air_action(void);
s32 mario_is_dive_sliding(void);
void func_8029FA1C(f32,s32);
void func_8029FA5C(s32,s32);
// extern ? obj_move_after_thrown_or_dropped(?);
void obj_get_thrown_or_placed(f32,f32,s32);
extern void obj_get_dropped(void);
extern void obj_set_model(s32);
// extern ? mario_set_flag(?);
s32 obj_clear_interact_status_flag(s32);
extern void mark_object_for_deletion(struct Object *);
void obj_disable(void);
extern void obj_become_intangible(void);
extern void obj_become_tangible(void);
void make_object_tangible(struct Object*);
void obj_update_floor_height(void);
struct Surface* obj_update_floor_height_and_get_floor(void);
// extern ? apply_drag_to_value(?);
void obj_apply_drag_xz(f32);
// extern ? obj_move_xz(?);
// extern ? obj_move_update_underwater_flags(?);
// extern ? obj_move_update_ground_air_flags(?);
// extern ? obj_move_y_and_get_water_level(?);
void obj_move_y(f32,f32,f32);
// extern ? clear_move_flag(?);
// extern ? obj_unused_resolve_wall_collisions(?);
extern s16 abs_angle_diff(s16, s16);
extern void obj_move_xz_using_fvel_and_yaw(void);
extern void obj_move_y_with_terminal_vel(void);
void obj_compute_vel_xz(void);
f32 func_802A0BF4(f32,f32,f32,f32);
extern s32 are_objects_collided(struct Object *, struct Object *);
void obj_set_behavior(const BehaviorScript *);
void set_object_behavior(struct Object *, const BehaviorScript *);
extern s32 obj_has_behavior(const BehaviorScript *);
s32 object_has_behavior(struct Object *, const BehaviorScript *);
f32 obj_lateral_dist_from_mario_to_home(void);
extern f32 obj_lateral_dist_to_home(void);
// extern ? obj_outside_home_square(?);
// extern ? obj_outside_home_rectangle(?);
extern void obj_set_pos_to_home(void);
void obj_set_pos_to_home_and_stop(void);
extern void obj_shake_y(f32);
void obj_start_cam_event(struct Object *obj, s32 cameraEvent);
// extern ? Unknown802A11E4(?);
void obj_set_billboard(struct Object *a0);
void obj_set_hitbox_radius_and_height(f32,f32);
void obj_set_hurtbox_radius_and_height(f32,f32);
// extern ? spawn_object_loot_coins(?);
// extern ? spawn_object_loot_blue_coins(?);
extern void spawn_object_loot_yellow_coins(struct Object *, s32, f32);
void obj_spawn_loot_coin_at_mario_pos(void);
// extern ? obj_abs_y_dist_to_home(?);
// extern ? Unknown802A1548(?);
// extern ? obj_detect_steep_floor(?);
s32 obj_resolve_wall_collisions(void);
// extern ? obj_update_floor(?);
// extern ? obj_update_floor_and_resolve_wall_collisions(?);
extern void obj_update_floor_and_walls(void);
extern void obj_move_standard(s16);
// extern ? obj_within_12k_bounds(?);
void obj_move_using_vel_and_gravity(void);
void obj_move_using_fvel_and_gravity(void);
// extern ? set_object_pos_relative(?);
s16 obj_angle_to_home(void);
void func_802A2008(struct Object*,struct Object*);
extern void translate_object_local(struct Object*,s16,s16);
extern void build_object_transform_from_pos_and_angle(struct Object *, s16, s16);
extern void func_802A2270(struct Object *);
extern void build_object_transform_relative_to_parent(struct Object *);
// extern ? Unknown802A2380(?);
// extern ? obj_rotate_move_angle_using_vel(?);
void obj_rotate_face_angle_using_vel(void);
// extern ? obj_set_face_angle_to_move_angle(?);
extern s32 obj_follow_path(UNUSED s32);
extern void chain_segment_init(struct ChainSegment *);
extern f32 random_f32_around_zero(f32);
void scale_object_random(struct Object*,f32,f32);
extern void translate_object_xyz_random(struct Object *, f32);
extern void translate_object_xz_random(struct Object *, f32);
// extern ? func_802A297C(?);
void func_802A2A38(void);
void obj_spawn_particles(struct SpawnParticlesInfo *sp28);
extern s16 obj_reflect_move_angle_off_wall(void);

#endif /* OBJECT_HELPERS_H */
