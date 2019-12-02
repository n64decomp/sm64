#ifndef _MARIO_MISC_H
#define _MARIO_MISC_H

#include "types.h"

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
