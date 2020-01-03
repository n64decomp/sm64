#ifndef OBJECT_HELPERS2_H
#define OBJECT_HELPERS2_H

#include "types.h"

// TODO: join this together with object_helpers.h

#define WAYPOINT_FLAGS_END -1
#define WAYPOINT_FLAGS_INITIALIZED 0x8000
#define WAYPOINT_MASK_00FF 0x00FF
#define WAYPOINT_FLAGS_PLATFORM_ON_TRACK_PAUSE 3

#define PATH_NONE 0
#define PATH_REACHED_END -1
#define PATH_REACHED_WAYPOINT 1

struct GraphNode_802A45E4 {
    /*0x00*/ s8 filler0[0x18 - 0x00];
    /*0x18*/ s16 unk18;
    /*0x1A*/ s16 unk1A;
    /*0x1C*/ s16 unk1C;
    /*0x1E*/ s16 unk1E;
    /*0x20*/ s16 unk20;
    /*0x22*/ s16 unk22;
};

extern void set_object_hitbox(struct Object* obj, struct ObjectHitbox *arg1);
s32 signum_positive(s32);
extern f32 absf(f32);
extern s32 absi(s32 a0);
s32 obj_wait_then_blink(s32 a0, s32 a1);
s32 obj_is_mario_ground_pounding_platform(void);
extern void func_802A3004(void);
extern void func_802A3034(s32 sp18);
void obj_push_mario_away(f32);
void obj_push_mario_away_from_cylinder(f32 sp20, f32 sp24);
// extern ? BehDustSmokeLoop(?);
s32 func_802A32A4(s8*);
s32 func_802A32E0(void);
// extern ? nop_802A3380(?);
extern void func_802A3398(s32,s32,f32,f32);
void func_802A3470(void);
extern s32 obj_is_mario_on_platform(void);
// extern ? obj_shake_y_until(?);
s32 func_802A362C(s32);
void obj_call_action_function(void(*[])(void));
// extern ? func_802A36D8(?);
// extern ? Unknown802A3750(?);
s32 func_802A377C(s32);
s32 obj_mario_far_away(void);
s32 obj_is_mario_moving_fast_or_in_air(s32);
s32 item_in_array(s8,s8*);
extern void bhv_init_room(void); // 802A3978
extern void obj_enable_rendering_if_mario_in_room(void);
s32 obj_set_hitbox_and_die_if_attacked(struct ObjectHitbox*,s32,s32);
void func_802A3C98(f32 sp18, s32 sp1C);
void set_object_collision_data(struct Object*, const void*);
void obj_if_hit_wall_bounce_away(void);
s32 obj_hide_if_mario_far_away_y(f32);
extern Gfx *Geo18_802A45E4(s32 run, struct GraphNode *node, UNUSED f32 mtx[4][4]);
// extern ? Unknown802A3E84(?);
s32 obj_is_hidden(struct Object*);
extern void enable_time_stop(void);
extern void disable_time_stop(void);
void set_time_stop_flags(s32);
void clear_time_stop_flags(s32);
s32 func_802A3FF8(f32,f32,s32);
extern s32 obj_is_mario_in_range_and_ready_to_speak(f32 sp18, f32 sp1C);
// extern ? obj_end_dialog(?);
s32 obj_update_dialog(s32 arg0, s32 dialogFlags, s32 dialogID, s32 unused);
s32 obj_update_dialog_with_cutscene(s32 arg0, s32 dialogFlags, s32 cutsceneTable, s32 dialogID);
s32 obj_has_model(u16);
extern void obj_align_gfx_with_floor(void);
// extern ? mario_is_within_rectangle(?);
void ShakeScreen(s32 shake);
extern s32 attack_collided_non_mario_object(struct Object *obj);
s32 obj_was_attacked_or_ground_pounded(void);
void copy_object_behavior_params(struct Object*,struct Object*);
void func_802A4A70(s32,s32);
s32 func_802A4AB0(s32);
void func_802A4AEC(s32);
s32 obj_check_grabbed_mario(void);
s32 player_performed_grab_escape_action(void);
// extern ? obj_unused_play_footstep_sound(?);
// extern ? enable_time_stop_including_mario(?);
extern void disable_time_stop_including_mario(void);
s32 obj_check_interacted(void);
void obj_spawn_loot_blue_coin(void);

#ifndef VERSION_JP
void obj_spawn_star_at_y_offset(f32 f12, f32 f14, f32 a2, f32 a3);
#endif

#endif /* OBJECT_HELPERS2_H */
