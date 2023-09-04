#ifndef LEVEL_UPDATE_H
#define LEVEL_UPDATE_H

#include <PR/ultratypes.h>

#include "types.h"


#define TIMER_CONTROL_SHOW  0
#define TIMER_CONTROL_START 1
#define TIMER_CONTROL_STOP  2
#define TIMER_CONTROL_HIDE  3

#define WARP_OP_NONE          0x00
#define WARP_OP_UNKNOWN_01    0x01
#define WARP_OP_UNKNOWN_02    0x02
#define WARP_OP_WARP_DOOR     0x03
#define WARP_OP_WARP_OBJECT   0x04
#define WARP_OP_TELEPORT      0x05
#define WARP_OP_STAR_EXIT     0x11
#define WARP_OP_DEATH         0x12
#define WARP_OP_WARP_FLOOR    0x13
#define WARP_OP_GAME_OVER     0x14
#define WARP_OP_CREDITS_END   0x15
#define WARP_OP_DEMO_NEXT     0x16
#define WARP_OP_CREDITS_START 0x17
#define WARP_OP_CREDITS_NEXT  0x18
#define WARP_OP_DEMO_END      0x19

#define WARP_OP_TRIGGERS_LEVEL_SELECT 0x10

#define MARIO_SPAWN_DOOR_WARP             0x01
#define MARIO_SPAWN_UNKNOWN_02            0x02
#define MARIO_SPAWN_UNKNOWN_03            0x03
#define MARIO_SPAWN_TELEPORT              0x04
#define MARIO_SPAWN_INSTANT_ACTIVE        0x10
#define MARIO_SPAWN_SWIMMING              0x11
#define MARIO_SPAWN_AIRBORNE              0x12
#define MARIO_SPAWN_HARD_AIR_KNOCKBACK    0x13
#define MARIO_SPAWN_SPIN_AIRBORNE_CIRCLE  0x14
#define MARIO_SPAWN_DEATH                 0x15
#define MARIO_SPAWN_SPIN_AIRBORNE         0x16
#define MARIO_SPAWN_FLYING                0x17
#define MARIO_SPAWN_PAINTING_STAR_COLLECT 0x20
#define MARIO_SPAWN_PAINTING_DEATH        0x21
#define MARIO_SPAWN_AIRBORNE_STAR_COLLECT 0x22
#define MARIO_SPAWN_AIRBORNE_DEATH        0x23
#define MARIO_SPAWN_LAUNCH_STAR_COLLECT   0x24
#define MARIO_SPAWN_LAUNCH_DEATH          0x25
#define MARIO_SPAWN_UNKNOWN_27            0x27

enum WarpNodes {
    WARP_NODE_00,
    WARP_NODE_01,
    WARP_NODE_02,
    WARP_NODE_03,
    WARP_NODE_04,
    WARP_NODE_05,
    WARP_NODE_06,
    WARP_NODE_07,
    WARP_NODE_08,
    WARP_NODE_09,
    WARP_NODE_0A,
    WARP_NODE_0B,
    WARP_NODE_0C,
    WARP_NODE_0D,
    WARP_NODE_0E,
    WARP_NODE_0F,
    WARP_NODE_10,
    WARP_NODE_11,
    WARP_NODE_14 = 0x14,
    WARP_NODE_15,
    WARP_NODE_16,
    WARP_NODE_17,
    WARP_NODE_18,
    WARP_NODE_19,
    WARP_NODE_1A,
    WARP_NODE_1B,
    WARP_NODE_1C,
    WARP_NODE_1D,
    WARP_NODE_1E,
    WARP_NODE_1F,
    WARP_NODE_20,
    WARP_NODE_21,
    WARP_NODE_22,
    WARP_NODE_23,
    WARP_NODE_24,
    WARP_NODE_25,
    WARP_NODE_26,
    WARP_NODE_27,
    WARP_NODE_28,
    WARP_NODE_29,
    WARP_NODE_2A,
    WARP_NODE_32 = 0x32,
    WARP_NODE_33,
    WARP_NODE_34,
    WARP_NODE_35,
    WARP_NODE_36,
    WARP_NODE_37,
    WARP_NODE_38,
    WARP_NODE_3A = 0x3A,
    WARP_NODE_64 = 0x64,
    WARP_NODE_65,
    WARP_NODE_66,
    WARP_NODE_67,
    WARP_NODE_68,
    WARP_NODE_69,
    WARP_NODE_6B = 0x6B,
    WARP_NODE_6C,
    WARP_NODE_6D,

    // Special Warps
    WARP_NODE_SUCCESS = 0xF0,
    WARP_NODE_DEATH = 0xF1,
    WARP_NODE_TOTWC = 0xF2,
    WARP_NODE_WARP_FLOOR = 0xF3,
    WARP_NODE_CREDITS_START = 0xF8,
    WARP_NODE_CREDITS_MIN = WARP_NODE_CREDITS_START,
    WARP_NODE_CREDITS_NEXT = 0xF9,
    WARP_NODE_CREDITS_END = 0xFA
};


struct CreditsEntry {
    /*0x00*/ u8 levelNum;
    /*0x01*/ u8 areaIndex;
    /*0x02*/ u8 unk02;
    /*0x03*/ s8 marioAngle;
    /*0x04*/ Vec3s marioPos;
    /*0x0C*/ const char **unk0C;
};

extern struct CreditsEntry *gCurrCreditsEntry;

extern struct MarioState gMarioStates[];
extern struct MarioState *gMarioState;

extern s16 sCurrPlayMode;
extern u16 D_80339ECA;
extern s16 sTransitionTimer;
extern void (*sTransitionUpdate)(s16 *);
extern u8 unused2[4];

struct WarpDest {
    u8 type;
    u8 levelNum;
    u8 areaIdx;
    u8 nodeId;
    u32 arg;
};

extern struct WarpDest sWarpDest;

extern s16 D_80339EE0;
extern s16 sDelayedWarpOp;
extern s16 sDelayedWarpTimer;
extern s16 sSourceWarpNodeId;
extern s32 sDelayedWarpArg;
extern s16 sUnusedLevelUpdateBss;
extern s8 sTimerRunning;

struct HudDisplay {
    /*0x00*/ s16 lives;
    /*0x02*/ s16 coins;
    /*0x04*/ s16 stars;
    /*0x06*/ s16 wedges;
    /*0x08*/ s16 keys;
    /*0x0A*/ s16 flags;
    /*0x0C*/ u16 timer;
};

extern struct HudDisplay gHudDisplay;
extern s8 gNeverEnteredCastle;

enum HUDDisplayFlag {
    HUD_DISPLAY_FLAG_LIVES = 0x0001,
    HUD_DISPLAY_FLAG_COIN_COUNT = 0x0002,
    HUD_DISPLAY_FLAG_STAR_COUNT = 0x0004,
    HUD_DISPLAY_FLAG_CAMERA_AND_POWER = 0x0008,
    HUD_DISPLAY_FLAG_KEYS = 0x0010,
    HUD_DISPLAY_FLAG_UNKNOWN_0020 = 0x0020,
    HUD_DISPLAY_FLAG_TIMER = 0x0040,
    HUD_DISPLAY_FLAG_EMPHASIZE_POWER = 0x8000,

    HUD_DISPLAY_NONE = 0x0000,
    HUD_DISPLAY_DEFAULT = HUD_DISPLAY_FLAG_LIVES | HUD_DISPLAY_FLAG_COIN_COUNT | HUD_DISPLAY_FLAG_STAR_COUNT | HUD_DISPLAY_FLAG_CAMERA_AND_POWER | HUD_DISPLAY_FLAG_KEYS | HUD_DISPLAY_FLAG_UNKNOWN_0020
};


u16 level_control_timer(s32 timerOp);
void fade_into_special_warp(u32 arg, u32 color);
void load_level_init_text(u32 arg);
s16 level_trigger_warp(struct MarioState *m, s32 warpOp);
void level_set_transition(s16 length, void (*updateFunction)(s16 *));

s32 lvl_init_or_update(s16 initOrUpdate, UNUSED s32 unused);
s32 lvl_init_from_save_file(UNUSED s16 arg0, s32 levelNum);
s32 lvl_set_current_level(UNUSED s16 arg0, s32 levelNum);
s32 lvl_play_the_end_screen_sound(UNUSED s16 arg0, UNUSED s32 arg1);
void basic_update(UNUSED s16 *arg);

#endif // LEVEL_UPDATE_H
