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

extern void obj_set_hitbox(struct Object* obj, struct ObjectHitbox *arg1);
s32 signum_positive(s32);
extern f32 absf(f32);
extern s32 absi(s32 a0);
s32 cur_obj_wait_then_blink(s32 a0, s32 a1);
s32 cur_obj_is_mario_ground_pounding_platform(void);
extern void spawn_mist_particles(void);
extern void spawn_mist_particles_with_sound(s32 sp18);
void cur_obj_push_mario_away(f32);
void cur_obj_push_mario_away_from_cylinder(f32 sp20, f32 sp24);
// extern ? bhv_dust_smoke_loop(?);
s32 cur_obj_set_direction_table(s8*);
s32 cur_obj_progress_direction_table(void);
// extern ? stub_obj_helpers_3(?);
extern void cur_obj_scale_over_time(s32,s32,f32,f32);
void cur_obj_set_pos_to_home_with_debug(void);
extern s32 cur_obj_is_mario_on_platform(void);
// extern ? obj_shake_y_until(?);
s32 cur_obj_move_up_and_down(s32);
void cur_obj_call_action_function(void(*[])(void));
// extern ? spawn_star_with_no_lvl_exit(?);
// extern ? spawn_base_star_with_no_lvl_exit(?);
s32 bit_shift_left(s32);
s32 cur_obj_mario_far_away(void);
s32 is_mario_moving_fast_or_in_air(s32);
s32 is_item_in_array(s8,s8*);
extern void bhv_init_room(void); // 802A3978
extern void cur_obj_enable_rendering_if_mario_in_room(void);
s32 cur_obj_set_hitbox_and_die_if_attacked(struct ObjectHitbox*,s32,s32);
void obj_explode_and_spawn_coins(f32 sp18, s32 sp1C);
void obj_set_collision_data(struct Object*, const void*);
void cur_obj_if_hit_wall_bounce_away(void);
s32 cur_obj_hide_if_mario_far_away_y(f32);
extern Gfx *geo_offset_klepto_held_object(s32 run, struct GraphNode *node, UNUSED f32 mtx[4][4]);
// extern ? geo_offset_klepto_debug(?);
s32 obj_is_hidden(struct Object*);
extern void enable_time_stop(void);
extern void disable_time_stop(void);
void set_time_stop_flags(s32);
void clear_time_stop_flags(s32);
s32 cur_obj_can_mario_activate_textbox(f32,f32,s32);
extern s32 cur_obj_can_mario_activate_textbox_2(f32 sp18, f32 sp1C);
// extern ? obj_end_dialog(?);
s32 cur_obj_update_dialog(s32 arg0, s32 dialogFlags, s32 dialogID, s32 unused);
s32 cur_obj_update_dialog_with_cutscene(s32 arg0, s32 dialogFlags, s32 cutsceneTable, s32 dialogID);
s32 cur_obj_has_model(u16);
extern void cur_obj_align_gfx_with_floor(void);
// extern ? mario_is_within_rectangle(?);
void cur_obj_shake_screen(s32 shake);
extern s32 obj_attack_collided_from_other_object(struct Object *obj);
s32 cur_obj_was_attacked_or_ground_pounded(void);
void obj_copy_behavior_params(struct Object*,struct Object*);
void cur_obj_init_animation_and_anim_frame(s32,s32);
s32 cur_obj_init_animation_and_check_if_near_end(s32);
void cur_obj_init_animation_and_extend_if_at_end(s32);
s32 cur_obj_check_grabbed_mario(void);
s32 player_performed_grab_escape_action(void);
// extern ? cur_obj_unused_play_footstep_sound(?);
// extern ? enable_time_stop_including_mario(?);
extern void disable_time_stop_including_mario(void);
s32 cur_obj_check_interacted(void);
void cur_obj_spawn_loot_blue_coin(void);

#ifndef VERSION_JP
void cur_obj_spawn_star_at_y_offset(f32 f12, f32 f14, f32 a2, f32 a3);
#endif

#endif /* OBJECT_HELPERS2_H */
