#include <ultra64.h>
#include "sm64.h"
#include "behavior_data.h"
#include "model_ids.h"
#include "seq_ids.h"
#include "dialog_ids.h"
#include "segment_symbols.h"
#include "level_commands.h"

#include "game/level_update.h"

#include "levels/scripts.h"

#include "actors/common1.h"

#include "make_const_nonconst.h"
#include "levels/bob/header.h"

static const LevelScript script_func_local_1[] = {
    OBJECT(/*model*/ MODEL_BOB_CHAIN_CHOMP_GATE,  /*pos*/  1456,   768,   446, /*angle*/ 0, 326, 0,  /*bhvParam*/ 0, /*bhv*/ bhvChainChompGate),
    OBJECT(/*model*/ MODEL_BOB_SEESAW_PLATFORM,   /*pos*/ -2303,   717,  1024, /*angle*/ 0, 45, 0,   /*bhvParam*/ BPARAM2(0x03), /*bhv*/ bhvSeesawPlatform),
    OBJECT(/*model*/ MODEL_NONE,                  /*pos*/ -2050,     0, -3069, /*angle*/ 0, 25, 0,   /*bhvParam*/ BPARAM2(OPENABLE_GRILL_BP_BOB), /*bhv*/ bhvOpenableGrill),
    OBJECT(/*model*/ MODEL_PURPLE_SWITCH,         /*pos*/ -2283,     0, -3682, /*angle*/ 0, 27, 0,   /*bhvParam*/ 0, /*bhv*/ bhvFloorSwitchGrills),
    OBJECT(/*model*/ MODEL_CHECKERBOARD_PLATFORM, /*pos*/  1612,   300,  4611, /*angle*/ 0, 0, 0,    /*bhvParam*/ BPARAM1(0) | BPARAM2(40), /*bhv*/ bhvCheckerboardElevatorGroup),
    RETURN(),
};

static const LevelScript script_func_local_2[] = {
    OBJECT_WITH_ACTS(/*model*/ MODEL_NONE,                  /*pos*/  1535, 3840, -5561, /*angle*/ 0, 0, 0,   /*bhvParam*/ BPARAM2(BBALL_BP_STYPE_BOB_UPPER), /*bhv*/ bhvBoBBowlingBallSpawner,  /*acts*/ ACT_1 | ACT_2),
    OBJECT_WITH_ACTS(/*model*/ MODEL_NONE,                  /*pos*/  1535, 3840, -5561, /*angle*/ 0, 0, 0,   /*bhvParam*/ BPARAM2(BBALL_BP_STYPE_BOB_UPPER), /*bhv*/ bhvTTMBowlingBallSpawner,  /*acts*/ ACT_3 | ACT_4 | ACT_5 | ACT_6),
    OBJECT_WITH_ACTS(/*model*/ MODEL_NONE,                  /*pos*/   524, 2825, -5400, /*angle*/ 0, 0, 0,   /*bhvParam*/ BPARAM2(BBALL_BP_STYPE_BOB_LOWER), /*bhv*/ bhvBoBBowlingBallSpawner,  /*acts*/ ACT_1 | ACT_2),
    OBJECT_WITH_ACTS(/*model*/ MODEL_NONE,                  /*pos*/   524, 2825, -5400, /*angle*/ 0, 0, 0,   /*bhvParam*/ BPARAM2(BBALL_BP_STYPE_BOB_LOWER), /*bhv*/ bhvTTMBowlingBallSpawner,  /*acts*/ ACT_3 | ACT_4 | ACT_5 | ACT_6),
    OBJECT          (/*model*/ MODEL_BOWLING_BALL,          /*pos*/  -993,  886, -3565, /*angle*/ 0, 0, 0,   /*bhvParam*/ 0, /*bhv*/ bhvPitBowlingBall),
    OBJECT          (/*model*/ MODEL_BOWLING_BALL,          /*pos*/  -785,  886, -4301, /*angle*/ 0, 0, 0,   /*bhvParam*/ 0, /*bhv*/ bhvPitBowlingBall),
    OBJECT_WITH_ACTS(/*model*/ MODEL_BOWLING_BALL,          /*pos*/   -93,  886, -3414, /*angle*/ 0, 0, 0,   /*bhvParam*/ 0, /*bhv*/ bhvPitBowlingBall,         /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6),
    OBJECT_WITH_ACTS(/*model*/ MODEL_BOBOMB_BUDDY,          /*pos*/ -5723,  140,  6017, /*angle*/ 0, 0, 0,   /*bhvParam*/ BPARAM2(DIALOG_002), /*bhv*/ bhvBobombBuddy,            /*acts*/ ACT_1),
    OBJECT_WITH_ACTS(/*model*/ MODEL_BOBOMB_BUDDY,          /*pos*/ -6250,    0,  6680, /*angle*/ 0, 0, 0,   /*bhvParam*/ BPARAM2(DIALOG_001), /*bhv*/ bhvBobombBuddy,            /*acts*/ ACT_1),
    OBJECT_WITH_ACTS(/*model*/ MODEL_BOBOMB_BUDDY,          /*pos*/ -5723,  140,  6017, /*angle*/ 0, 0, 0,   /*bhvParam*/ 0,       /*bhv*/ bhvBobombBuddyOpensCannon, /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6),
    OBJECT_WITH_ACTS(/*model*/ MODEL_BOBOMB_BUDDY,          /*pos*/ -6250,    0,  6680, /*angle*/ 0, 0, 0,   /*bhvParam*/ BPARAM2(DIALOG_003), /*bhv*/ bhvBobombBuddy,            /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6),
    OBJECT_WITH_ACTS(/*model*/ MODEL_CANNON_BASE,           /*pos*/ -5694,  128,  5600, /*angle*/ 0, 135, 0, /*bhvParam*/ BPARAM2(0x01), /*bhv*/ bhvWaterBombCannon,        /*acts*/ ACT_1),
    OBJECT_WITH_ACTS(/*model*/ MODEL_DL_CANNON_LID,         /*pos*/ -5694,  128,  5600, /*angle*/ 0, 180, 0, /*bhvParam*/ BPARAM2(0x00), /*bhv*/ bhvCannonClosed,           /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6),
    OBJECT_WITH_ACTS(/*model*/ MODEL_NONE,                  /*pos*/  3304, 4242, -4603, /*angle*/ 0, 0, 0,   /*bhvParam*/ 0, /*bhv*/ bhvKoopaRaceEndpoint,      /*acts*/ ACT_2),
    OBJECT_WITH_ACTS(/*model*/ MODEL_KOOPA_WITH_SHELL,      /*pos*/  3400,  770,  6500, /*angle*/ 0, 0, 0,   /*bhvParam*/ BPARAM2(KOOPA_BP_NORMAL), /*bhv*/ bhvKoopa,                  /*acts*/ ACT_3 | ACT_4 | ACT_5 | ACT_6),
    RETURN(),
};

static const LevelScript script_func_local_3[] = {
    OBJECT_WITH_ACTS(/*model*/ MODEL_KING_BOBOMB,           /*pos*/  1636, 4242, -5567, /*angle*/ 0, -147, 0, /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_1), /*bhv*/ bhvKingBobomb,            /*acts*/ ACT_1),
    OBJECT_WITH_ACTS(/*model*/ MODEL_KOOPA_WITH_SHELL,      /*pos*/ -4004,    0,  5221, /*angle*/ 0, 0, 0,    /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_2) | BPARAM2(KOOPA_BP_KOOPA_THE_QUICK_BOB), /*bhv*/ bhvKoopa,                 /*acts*/ ACT_2),
    OBJECT_WITH_ACTS(/*model*/ MODEL_NONE,                  /*pos*/ -6000, 1000,  2400, /*angle*/ 0, 0, 0,    /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_4), /*bhv*/ bhvHiddenRedCoinStar,     /*acts*/ ALL_ACTS),
    OBJECT_WITH_ACTS(/*model*/ MODEL_NONE,                  /*pos*/ -6600, 1000,  1250, /*angle*/ 0, 0, 0,    /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_5) | BPARAM2(0x04), /*bhv*/ bhvHiddenStar,            /*acts*/ ALL_ACTS),
    OBJECT_WITH_ACTS(/*model*/ MODEL_STAR,                  /*pos*/  1550, 1200,   300, /*angle*/ 0, 0, 0,    /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_6), /*bhv*/ bhvStar,                  /*acts*/ ALL_ACTS),
    RETURN(),
};

const LevelScript level_bob_entry[] = {
    INIT_LEVEL(),
    LOAD_MIO0        (/*seg*/ 0x07, _bob_segment_7SegmentRomStart, _bob_segment_7SegmentRomEnd),
    LOAD_MIO0_TEXTURE(/*seg*/ 0x09, _generic_mio0SegmentRomStart, _generic_mio0SegmentRomEnd),
    LOAD_MIO0        (/*seg*/ 0x0A, _water_skybox_mio0SegmentRomStart, _water_skybox_mio0SegmentRomEnd),
    LOAD_MIO0        (/*seg*/ 0x05, _group3_mio0SegmentRomStart, _group3_mio0SegmentRomEnd),
    LOAD_RAW         (/*seg*/ 0x0C, _group3_geoSegmentRomStart,  _group3_geoSegmentRomEnd),
    LOAD_MIO0        (/*seg*/ 0x06, _group14_mio0SegmentRomStart, _group14_mio0SegmentRomEnd),
    LOAD_RAW         (/*seg*/ 0x0D, _group14_geoSegmentRomStart,  _group14_geoSegmentRomEnd),
    LOAD_MIO0        (/*seg*/ 0x08, _common0_mio0SegmentRomStart, _common0_mio0SegmentRomEnd),
    LOAD_RAW         (/*seg*/ 0x0F, _common0_geoSegmentRomStart,  _common0_geoSegmentRomEnd),
    ALLOC_LEVEL_POOL(),
    MARIO(/*model*/ MODEL_MARIO, /*bhvParam*/ BPARAM4(0x01), /*bhv*/ bhvMario),
    JUMP_LINK(script_func_global_1),
    JUMP_LINK(script_func_global_4),
    JUMP_LINK(script_func_global_15),
    LOAD_MODEL_FROM_GEO(MODEL_BOB_BUBBLY_TREE,      bubbly_tree_geo),
    LOAD_MODEL_FROM_GEO(MODEL_BOB_CHAIN_CHOMP_GATE, bob_geo_000440),
    LOAD_MODEL_FROM_GEO(MODEL_BOB_SEESAW_PLATFORM,  bob_geo_000458),
    LOAD_MODEL_FROM_GEO(MODEL_BOB_BARS_GRILLS,      bob_geo_000470),

    AREA(/*index*/ 1, bob_geo_000488),
        JUMP_LINK(script_func_local_1),
        JUMP_LINK(script_func_local_2),
        JUMP_LINK(script_func_local_3),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/ -6558,  1000,  6464, /*angle*/ 0, 135, 0,  /*bhvParam*/ BPARAM2(WARP_NODE_0A), /*bhv*/ bhvSpinAirborneWarp),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/   583,  2683, -5387, /*angle*/ 0, -154, 0, /*bhvParam*/ BPARAM2(WARP_NODE_0B), /*bhv*/ bhvFadingWarp),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/  1680,  3835, -5523, /*angle*/ 0, -153, 0, /*bhvParam*/ BPARAM2(WARP_NODE_0C), /*bhv*/ bhvFadingWarp),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/ -6612,  1024, -3351, /*angle*/ 0, 107, 0,  /*bhvParam*/ BPARAM2(WARP_NODE_0D), /*bhv*/ bhvFadingWarp),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/  1980,   768,  6618, /*angle*/ 0, -151, 0, /*bhvParam*/ BPARAM2(WARP_NODE_0E), /*bhv*/ bhvFadingWarp),
        WARP_NODE(/*id*/ WARP_NODE_0A,      /*destLevel*/ LEVEL_BOB,    /*destArea*/ 1, /*destNode*/ WARP_NODE_0A, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_0B,      /*destLevel*/ LEVEL_BOB,    /*destArea*/ 1, /*destNode*/ WARP_NODE_0C, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_0C,      /*destLevel*/ LEVEL_BOB,    /*destArea*/ 1, /*destNode*/ WARP_NODE_0B, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_0D,      /*destLevel*/ LEVEL_BOB,    /*destArea*/ 1, /*destNode*/ WARP_NODE_0E, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_0E,      /*destLevel*/ LEVEL_BOB,    /*destArea*/ 1, /*destNode*/ WARP_NODE_0D, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_SUCCESS, /*destLevel*/ LEVEL_CASTLE, /*destArea*/ 1, /*destNode*/ WARP_NODE_32, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_DEATH,   /*destLevel*/ LEVEL_CASTLE, /*destArea*/ 1, /*destNode*/ WARP_NODE_64, /*flags*/ WARP_NO_CHECKPOINT),
        TERRAIN(/*terrainData*/ bob_seg7_collision_level),
        MACRO_OBJECTS(/*objList*/ bob_seg7_macro_objs),
        SHOW_DIALOG(/*index*/ 0x00, DIALOG_000),
        SET_BACKGROUND_MUSIC(/*settingsPreset*/ 0x0000, /*seq*/ SEQ_LEVEL_GRASS),
        TERRAIN_TYPE(/*terrainType*/ TERRAIN_GRASS),
    END_AREA(),

    FREE_LEVEL_POOL(),
    MARIO_POS(/*area*/ 1, /*yaw*/ 135, /*pos*/ -6558, 0, 6464),
    CALL(/*arg*/ 0, /*func*/ lvl_init_or_update),
    CALL_LOOP(/*arg*/ 1, /*func*/ lvl_init_or_update),
    CLEAR_LEVEL(),
    SLEEP_BEFORE_EXIT(/*frames*/ 1),
    EXIT(),
};
