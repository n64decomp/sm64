#ifndef _MARIO_ACTIONS_STATIONARY
#define _MARIO_ACTIONS_STATIONARY

#include "types.h"

#define INPUT_UNKNOWN_A41F 0xA41F

extern s32 func_802604E0(struct MarioState *);
extern s32 func_802606DC(struct MarioState *);
extern s32 act_idle(struct MarioState *);
extern void func_80260BC4(struct MarioState *, u32, s32, u32);
extern s32 act_start_sleeping(struct MarioState *);
extern s32 act_sleeping(struct MarioState *);
extern s32 act_waking_up(struct MarioState *);
extern s32 act_shivering(struct MarioState *);
extern s32 act_coughing(struct MarioState *);
extern s32 func_802615C4(struct MarioState *);
extern s32 func_802616C4(struct MarioState *);
extern s32 act_standing_against_wall(struct MarioState *);
extern s32 act_in_quicksand(struct MarioState *);
extern s32 act_crouching(struct MarioState *);
extern s32 act_panting(struct MarioState *);
extern s32 func_80261C74(struct MarioState *);
extern void func_80261D70(struct MarioState *, s32, u32);
extern s32 act_braking_stop(struct MarioState *);
extern s32 act_butt_slide_stop(struct MarioState *);
extern s32 func_80261F8C(struct MarioState *);
extern s32 act_slide_kick_slide_stop(struct MarioState *);
extern s32 act_start_crouching(struct MarioState *);
extern s32 act_stop_crouching(struct MarioState *);
extern s32 act_start_crawling(struct MarioState *);
extern s32 act_stop_crawling(struct MarioState *);
extern s32 func_80262574(struct MarioState *);
extern s32 func_802627B8(struct MarioState *, s32, u32);
extern s32 func_80262828(struct MarioState *, u32);
extern s32 act_jump_land_stop(struct MarioState *);
extern s32 act_double_jump_land_stop(struct MarioState *);
extern s32 act_side_flip_land_stop(struct MarioState *);
extern s32 act_freefall_land_stop(struct MarioState *);
extern s32 act_triple_jump_land_stop(struct MarioState *);
extern s32 act_backflip_land_stop(struct MarioState *);
extern s32 act_lava_boost_land(struct MarioState *);
extern s32 act_long_jump_land_stop(struct MarioState *);
extern s32 func_80262CEC(struct MarioState *);
extern s32 func_80262DE4(struct MarioState *);
extern s32 act_air_throw_land(struct MarioState *);
extern s32 act_twirl_land(struct MarioState *);
extern s32 act_ground_pound_land(struct MarioState *);
extern s32 act_first_person(struct MarioState *);
extern s32 func_80263378(struct MarioState *);
extern s32 mario_execute_stationary_action(struct MarioState *);

#endif /* _MARIO_ACTIONS_STATIONARY */
