#ifndef _MARIO_MISC_H
#define _MARIO_MISC_H

#include "types.h"

#define TOAD_STAR_1_REQUIREMENT 12
#define TOAD_STAR_2_REQUIREMENT 25
#define TOAD_STAR_3_REQUIREMENT 35

#define TOAD_STAR_1_DIALOG 82
#define TOAD_STAR_2_DIALOG 76
#define TOAD_STAR_3_DIALOG 83

#define TOAD_STAR_1_DIALOG_AFTER 154
#define TOAD_STAR_2_DIALOG_AFTER 155
#define TOAD_STAR_3_DIALOG_AFTER 156


enum ToadMessageStates {
    TOAD_MESSAGE_FADED,
    TOAD_MESSAGE_OPAQUE,
    TOAD_MESSAGE_OPACIFYING,
    TOAD_MESSAGE_FADING,
    TOAD_MESSAGE_TALKING
};

enum UnlockDoorStarStates {
    UNLOCK_DOOR_STAR_RISING,
    UNLOCK_DOOR_STAR_WAITING,
    UNLOCK_DOOR_STAR_SPAWNING_PARTICLES,
    UNLOCK_DOOR_STAR_DONE
};

extern struct GraphNodeObject D_80339FE0;
extern struct MarioBodyState gBodyStates[2];

extern Gfx *Geo18_802764B0(s32 a, struct GraphNode *b, Mat4 *c);
extern void bhvToadMessage_loop(void);
extern void bhvToadMessage_init(void);
extern void bhvUnlockDoorStar_init(void);
extern void bhvUnlockDoorStar_loop(void);
extern Gfx *Geo18_802770A4(s32 a, struct GraphNode *b, UNUSED Mat4 *c);
extern Gfx *geo_switch_mario_stand_run(s32 run, struct GraphNode *node, UNUSED Mat4 *c);
extern Gfx *geo_switch_mario_eyes(s32 run, struct GraphNode *node, UNUSED Mat4 *c);
extern Gfx *Geo18_80277294(s32 a, struct GraphNode *b, UNUSED Mat4 *c);
extern Gfx *Geo18_802773A4(s32 a, struct GraphNode *b, UNUSED Mat4 *c);
extern Gfx *geo_switch_mario_hand(s32 run, struct GraphNode *node, UNUSED Mat4 *c);
extern Gfx *Geo18_802775CC(s32 a, struct GraphNode *b, UNUSED Mat4 *c);
extern Gfx *geo_switch_mario_cap_effect(s32 run, struct GraphNode *node, UNUSED Mat4 *c);
extern Gfx *geo_switch_mario_cap_on_off(s32 run, struct GraphNode *node, UNUSED Mat4 *c);
extern Gfx *Geo18_80277824(s32 a, struct GraphNode *b, UNUSED Mat4 *c);
extern Gfx *geo_switch_mario_hand_grab_pos(s32 callContext, struct GraphNode *b, Mat4 *c);
extern Gfx *Geo1C_8027795C(s32 a, struct GraphNode *b, Mat4 *c);
extern Gfx *geo_render_mirror_mario(s32 a, struct GraphNode *b, UNUSED Mat4 *c);
extern Gfx *geo_mirror_mario_backface_culling(s32 a, struct GraphNode *b, UNUSED Mat4 *c);

#endif /* _MARIO_MISC_H */
