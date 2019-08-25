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

struct Struct802763D4_Unknown
{
    u8 filler0[0x1C];
    f32 unk1C;
};

struct Struct802769E0
{
    u8 filler0[2];
    s16 unk2;
    u8 filler4[0x18-0x4];
    s32 unk18;
};

struct Struct80277150
{
    struct GraphNode node;
    u8 filler14[0x4];
    f32 unk18;
    s16 unk1C;
    s16 unk1E;
};

struct Struct80277294
{
    struct GraphNode node;
    u8 filler14[0x4];
    s32 unk18;
};

struct Struct80277294_2
{
    struct GraphNode node;
    u8 filler14[4];
    s16 unk18;
    s16 unk1A;
    s16 unk1C;
};

struct Struct802773A4
{
    struct GraphNode node;
    u8 filler14[0x4];
    s32 unk18;
};

struct Struct802773A4_2
{
    struct GraphNode node;
    u8 filler14[0x4];
    Vec3s unk18;
};

struct Struct802775CC
{
    struct GraphNode node;
    u8 filler14[4];
    s32 unk18;
};

struct Struct80277824
{
    struct GraphNode node;
    u8 filler14[4];
    u32 unk18;
};

struct Struct80277824_2
{
    struct GraphNode node;
    u8 filler14[4];
    s16 unk18;
};

struct Struct8027795C
{
    struct GraphNode node;
    u8 filler14[4];
    s32 unk18;
    struct Object *unk1C;
    Vec3s unk20;
};

struct Struct80277D6C
{
    struct GraphNode node;
    u8 filler14[4];
    s32 unk18;
};

extern struct GraphNodeObject D_80339FE0;
extern struct MarioBodyState gBodyStates[2];

extern Gfx *Geo18_802764B0(s32 a, struct GraphNode *b, Mat4 *c);
extern void bhvToadMessage_loop(void);
extern void bhvToadMessage_init(void);
extern void bhvUnlockDoorStar_init(void);
extern void bhvUnlockDoorStar_loop(void);
extern Gfx *Geo18_802770A4(s32 a, struct GraphNode *b, UNUSED Mat4 *c);
extern s32 geo_switch_mario_stand_run(s32 run, struct GraphNode *node, UNUSED Mat4 *c);
extern s32 geo_switch_mario_eyes(s32 run, struct GraphNode *node, UNUSED Mat4 *c);
extern Gfx *Geo18_80277294(s32 a, struct GraphNode *b, UNUSED Mat4 *c);
extern Gfx *Geo18_802773A4(s32 a, struct GraphNode *b, UNUSED Mat4 *c);
extern s32 geo_switch_mario_hand(s32 run, struct GraphNode *node, UNUSED Mat4 *c);
extern Gfx *Geo18_802775CC(s32 a, struct GraphNode *b, UNUSED Mat4 *c);
extern s32 geo_switch_mario_cap_effect(s32 run, struct GraphNode *node, UNUSED Mat4 *c);
extern s32 geo_switch_mario_cap_on_off(s32 run, struct GraphNode *node, UNUSED Mat4 *c);
extern Gfx *Geo18_80277824(s32 a, struct GraphNode *b, UNUSED Mat4 *c);
extern Gfx *Geo1C_8027795C(s32 a, struct GraphNode *b, Mat4 *c);
extern Gfx *geo_render_mirror_mario(s32 a, struct GraphNode *b, UNUSED Mat4 *c);
extern Gfx *geo_mirror_mario_backface_culling(s32 a, struct GraphNode *b, UNUSED Mat4 *c);

#endif /* _MARIO_MISC_H */
