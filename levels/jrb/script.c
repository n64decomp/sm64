#include <ultra64.h>
#include "sm64.h"
#include "behavior_data.h"
#include "model_ids.h"
#include "seq_ids.h"
#include "segment_symbols.h"
#include "level_commands.h"

#include "game/level_update.h"

#include "levels/scripts.h"

#include "actors/common1.h"

#include "make_const_nonconst.h"
#include "levels/jrb/header.h"

static const LevelScript script_func_local_1[] = {
    OBJECT_WITH_ACTS(/*model*/ MODEL_JRB_SUNKEN_SHIP,          /*pos*/  2385,  3589,  3727, /*angle*/ 0,   0, 0, /*bhvParam*/ 0, /*bhv*/ bhvSunkenShipPart,          /*acts*/ ACT_1),
    OBJECT_WITH_ACTS(/*model*/ MODEL_JRB_SUNKEN_SHIP_BACK,     /*pos*/  2385,  3589,  3727, /*angle*/ 0,   0, 0, /*bhvParam*/ 0, /*bhv*/ bhvSunkenShipPart,          /*acts*/ ACT_1),
    OBJECT_WITH_ACTS(/*model*/ MODEL_JRB_SHIP_LEFT_HALF_PART,  /*pos*/  5385, -5520,  2428, /*angle*/ 0,   0, 0, /*bhvParam*/ 0, /*bhv*/ bhvSunkenShipPart2,        /*acts*/ ACT_1),
    OBJECT_WITH_ACTS(/*model*/ MODEL_JRB_SHIP_RIGHT_HALF_PART, /*pos*/  5385, -5520,  2428, /*angle*/ 0,   0, 0, /*bhvParam*/ 0, /*bhv*/ bhvSunkenShipPart2,        /*acts*/ ACT_1),
    OBJECT_WITH_ACTS(/*model*/ MODEL_NONE,                     /*pos*/  5385, -5520,  2428, /*angle*/ 0,   0, 0, /*bhvParam*/ 0, /*bhv*/ bhvInSunkenShip,            /*acts*/ ACT_1),
    OBJECT_WITH_ACTS(/*model*/ MODEL_NONE,                     /*pos*/  5385, -5520,  2428, /*angle*/ 0,   0, 0, /*bhvParam*/ 0, /*bhv*/ bhvInSunkenShip2,          /*acts*/ ACT_1),
    OBJECT_WITH_ACTS(/*model*/ MODEL_JRB_SHIP_LEFT_HALF_PART,  /*pos*/  4880,   820,  2375, /*angle*/ 0,   0, 0, /*bhvParam*/ 0, /*bhv*/ bhvShipPart3,               /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6),
    OBJECT_WITH_ACTS(/*model*/ MODEL_JRB_SHIP_BACK_LEFT_PART,  /*pos*/  4880,   820,  2375, /*angle*/ 0,   0, 0, /*bhvParam*/ 0, /*bhv*/ bhvShipPart3,               /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6),
    OBJECT_WITH_ACTS(/*model*/ MODEL_JRB_SHIP_RIGHT_HALF_PART, /*pos*/  4880,   820,  2375, /*angle*/ 0,   0, 0, /*bhvParam*/ 0, /*bhv*/ bhvShipPart3,               /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6),
    OBJECT_WITH_ACTS(/*model*/ MODEL_JRB_SHIP_BACK_RIGHT_PART, /*pos*/  4880,   820,  2375, /*angle*/ 0,   0, 0, /*bhvParam*/ 0, /*bhv*/ bhvShipPart3,               /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6),
    OBJECT_WITH_ACTS(/*model*/ MODEL_NONE,                     /*pos*/  4880,   820,  2375, /*angle*/ 0,   0, 0, /*bhvParam*/ 0, /*bhv*/ bhvInSunkenShip3,          /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6),
    OBJECT_WITH_ACTS(/*model*/ MODEL_JRB_SLIDING_BOX,          /*pos*/  4668,  1434,  2916, /*angle*/ 0,   0, 0, /*bhvParam*/ 0, /*bhv*/ bhvJRBSlidingBox,           /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6),
    OBJECT_WITH_ACTS(/*model*/ MODEL_UNAGI,                    /*pos*/  6048, -5381,  1154, /*angle*/ 0, 340, 0, /*bhvParam*/ 0, /*bhv*/ bhvUnagi,                     /*acts*/ ACT_1),
    OBJECT_WITH_ACTS(/*model*/ MODEL_UNAGI,                    /*pos*/  8270, -3130,  1846, /*angle*/ 0, 285, 0, /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_2) | BPARAM2(0x01), /*bhv*/ bhvUnagi,                     /*acts*/ ACT_2),
    OBJECT_WITH_ACTS(/*model*/ MODEL_UNAGI,                    /*pos*/  6048, -5381,  1154, /*angle*/ 0, 340, 0, /*bhvParam*/ BPARAM1(0x02) | BPARAM2(0x02), /*bhv*/ bhvUnagi,                     /*acts*/ ACT_3 | ACT_4 | ACT_5 | ACT_6),
    OBJECT_WITH_ACTS(/*model*/ MODEL_NONE,                     /*pos*/  4988, -5221,  2473, /*angle*/ 0,   0, 0, /*bhvParam*/ 0, /*bhv*/ bhvJetStream,                /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6),
    OBJECT          (/*model*/ MODEL_NONE,                     /*pos*/ -1800, -2812, -2100, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_3), /*bhv*/ bhvTreasureChestsJRB),
    OBJECT_WITH_ACTS(/*model*/ MODEL_BOBOMB_BUDDY,             /*pos*/ -1956,  1331,  6500, /*angle*/ 0,   0, 0, /*bhvParam*/ 0, /*bhv*/ bhvBobombBuddyOpensCannon, /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6),
    RETURN(),
};

static const LevelScript script_func_local_2[] = {
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  1834, -2556, -7090, /*angle*/ 0, 194, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/ -2005, -2556, -3506, /*angle*/ 0, 135, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  1578, -2556, -5554, /*angle*/ 0,  90, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/    42, -2556, -6578, /*angle*/ 0, 135, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  -981, -2556, -5298, /*angle*/ 0, 255, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/ -6549,  1536,  4343, /*angle*/ 0,  90, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  1322, -2556, -3506, /*angle*/ 0, 165, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  6442, -2556, -6322, /*angle*/ 0, 135, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  3882, -2556, -5042, /*angle*/ 0,   0, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  1497,  1741,  7810, /*angle*/ 0,  14, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/ -3978,  1536,   -85, /*angle*/ 0,   0, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/ -5228,  1230,  2106, /*angle*/ 0, 323, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/ -7481,  1536,   185, /*angle*/ 0, 149, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/ -5749,  1536, -1113, /*angle*/ 0, 255, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/ -5332,  1434,  1023, /*angle*/ 0, 315, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  -815,  -613,  3556, /*angle*/ 0, 315, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/ -3429,   819,  4948, /*angle*/ 0, 284, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/ -1940,   410,  2377, /*angle*/ 0, 194, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/ -1798,  -716,  4330, /*angle*/ 0,   0, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  -845,   922,  7668, /*angle*/ 0, 315, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  6741, -2886,  3556, /*angle*/ 0, 135, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/   255,  -101,  4719, /*angle*/ 0,  45, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  1787,  -306,  5133, /*angle*/ 0, 315, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  1079,  -613,  2299, /*angle*/ 0,  75, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  2931, -1697,   980, /*angle*/ 0, 315, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  3036, -4709,  4027, /*angle*/ 0, 315, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  4222, -1125,  7083, /*angle*/ 0, 104, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  6650,  -613,  4941, /*angle*/ 0, 315, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  5764, -4709,  4427, /*angle*/ 0, 315, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  3693, -4709,   856, /*angle*/ 0, 135, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  7981,   410,  2704, /*angle*/ 0, 165, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  2917, -3046,  4818, /*angle*/ 0, 241, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  5896,  -393,  -123, /*angle*/ 0, 315, 0, /*bhvParam*/ 0, /*bhv*/ bhvRockSolid),
    OBJECT(/*model*/ MODEL_NONE,                     /*pos*/    53,  2355,  2724, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM2(41), /*bhv*/ bhvPoleGrabbing),
    OBJECT(/*model*/ MODEL_NONE,                     /*pos*/   659,  2560,  3314, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM2(41), /*bhv*/ bhvPoleGrabbing),
    OBJECT(/*model*/ MODEL_NONE,                     /*pos*/  1087,  2150,  3798, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM2(41), /*bhv*/ bhvPoleGrabbing),
    OBJECT(/*model*/ MODEL_NONE,                     /*pos*/ -2535,  1075,  6113, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM2(97), /*bhv*/ bhvPoleGrabbing),
    OBJECT(/*model*/ MODEL_JRB_FALLING_PILLAR,       /*pos*/  2078, -2863, -4696, /*angle*/ 0,  90, 0, /*bhvParam*/ 0, /*bhv*/ bhvFallingPillar),
    OBJECT(/*model*/ MODEL_JRB_FALLING_PILLAR,       /*pos*/ -1403, -2863, -4696, /*angle*/ 0,  90, 0, /*bhvParam*/ 0, /*bhv*/ bhvFallingPillar),
    OBJECT(/*model*/ MODEL_JRB_FALLING_PILLAR,       /*pos*/ -1096, -2863, -3262, /*angle*/ 0,  90, 0, /*bhvParam*/ 0, /*bhv*/ bhvFallingPillar),
    OBJECT(/*model*/ MODEL_JRB_FALLING_PILLAR,       /*pos*/   337, -2863, -5106, /*angle*/ 0,  90, 0, /*bhvParam*/ 0, /*bhv*/ bhvFallingPillar),
    OBJECT(/*model*/ MODEL_JRB_FALLING_PILLAR,       /*pos*/  2078, -2863, -6232, /*angle*/ 0,  90, 0, /*bhvParam*/ 0, /*bhv*/ bhvFallingPillar),
    OBJECT(/*model*/ MODEL_JRB_FALLING_PILLAR,       /*pos*/  4330, -2863, -5618, /*angle*/ 0,  90, 0, /*bhvParam*/ 0, /*bhv*/ bhvFallingPillar),
    OBJECT(/*model*/ MODEL_JRB_FALLING_PILLAR_BASE,  /*pos*/  2078, -2966, -4696, /*angle*/ 0,  90, 0, /*bhvParam*/ 0, /*bhv*/ bhvPillarBase),
    OBJECT(/*model*/ MODEL_JRB_FALLING_PILLAR_BASE,  /*pos*/ -1403, -2966, -4696, /*angle*/ 0,  90, 0, /*bhvParam*/ 0, /*bhv*/ bhvPillarBase),
    OBJECT(/*model*/ MODEL_JRB_FALLING_PILLAR_BASE,  /*pos*/ -1096, -2966, -3262, /*angle*/ 0,  90, 0, /*bhvParam*/ 0, /*bhv*/ bhvPillarBase),
    OBJECT(/*model*/ MODEL_JRB_FALLING_PILLAR_BASE,  /*pos*/   337, -2966, -5106, /*angle*/ 0,  90, 0, /*bhvParam*/ 0, /*bhv*/ bhvPillarBase),
    OBJECT(/*model*/ MODEL_JRB_FALLING_PILLAR_BASE,  /*pos*/  2078, -2966, -6232, /*angle*/ 0,  90, 0, /*bhvParam*/ 0, /*bhv*/ bhvPillarBase),
    OBJECT(/*model*/ MODEL_JRB_FALLING_PILLAR_BASE,  /*pos*/  4330, -2966, -5618, /*angle*/ 0,  90, 0, /*bhvParam*/ 0, /*bhv*/ bhvPillarBase),
    OBJECT(/*model*/ MODEL_JRB_FLOATING_PLATFORM,    /*pos*/ -1059,  1025,  7072, /*angle*/ 0, 247, 0, /*bhvParam*/ 0, /*bhv*/ bhvJRBFloatingPlatform),
    OBJECT(/*model*/ MODEL_NONE,                     /*pos*/ -4236, 1044, 2136,   /*angle*/ 0,   0, 0, /*bhvParam*/ 0, /*bhv*/ bhvInsideCannon),
    RETURN(),
};

static const LevelScript script_func_local_3[] = {
    OBJECT_WITH_ACTS(/*model*/ MODEL_NONE,            /*pos*/ 4900,  2400,   800, /*angle*/ 0, 0, 0, /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_4), /*bhv*/ bhvHiddenRedCoinStar, /*acts*/ ALL_ACTS),
#if defined(VERSION_JP) || defined(VERSION_SH)
    OBJECT_WITH_ACTS(/*model*/ MODEL_STAR,            /*pos*/ 1540,  2160,  2130, /*angle*/ 0, 0, 0, /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_5), /*bhv*/ bhvStar,                 /*acts*/ ALL_ACTS),
#else
    OBJECT_WITH_ACTS(/*model*/ MODEL_EXCLAMATION_BOX, /*pos*/ 1540,  2160,  2130, /*angle*/ 0, 0, 0, /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_5) | BPARAM2(EXCLAMATION_BOX_BP_STAR_ACT_1), /*bhv*/ bhvExclamationBox,      /*acts*/ ALL_ACTS),
#endif
    OBJECT_WITH_ACTS(/*model*/ MODEL_STAR,            /*pos*/ 5000, -4800,  2500, /*angle*/ 0, 0, 0, /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_6), /*bhv*/ bhvStar,                 /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6),
    RETURN(),
};

static const LevelScript script_func_local_4[] = {
    OBJECT(/*model*/ MODEL_NONE,            /*pos*/  400,  -350, -2700, /*angle*/ 0, 0, 0, /*bhvParam*/ 0, /*bhv*/ bhvTreasureChestsShip),
    RETURN(),
};

static const LevelScript script_func_local_5[] = {
    RETURN(),
};

const LevelScript level_jrb_entry[] = {
    INIT_LEVEL(),
    LOAD_MIO0        (/*seg*/ 0x07, _jrb_segment_7SegmentRomStart, _jrb_segment_7SegmentRomEnd),
    LOAD_MIO0        (/*seg*/ 0x0B, _effect_mio0SegmentRomStart, _effect_mio0SegmentRomEnd),
    LOAD_MIO0_TEXTURE(/*seg*/ 0x09, _water_mio0SegmentRomStart, _water_mio0SegmentRomEnd),
    LOAD_MIO0        (/*seg*/ 0x0A, _clouds_skybox_mio0SegmentRomStart, _clouds_skybox_mio0SegmentRomEnd),
    LOAD_MIO0        (/*seg*/ 0x05, _group4_mio0SegmentRomStart, _group4_mio0SegmentRomEnd),
    LOAD_RAW         (/*seg*/ 0x0C, _group4_geoSegmentRomStart, _group4_geoSegmentRomEnd),
    LOAD_MIO0        (/*seg*/ 0x06, _group13_mio0SegmentRomStart, _group13_mio0SegmentRomEnd),
    LOAD_RAW         (/*seg*/ 0x0D, _group13_geoSegmentRomStart,  _group13_geoSegmentRomEnd),
    LOAD_MIO0        (/*seg*/ 0x08, _common0_mio0SegmentRomStart, _common0_mio0SegmentRomEnd),
    LOAD_RAW         (/*seg*/ 0x0F, _common0_geoSegmentRomStart,  _common0_geoSegmentRomEnd),
    ALLOC_LEVEL_POOL(),
    MARIO(/*model*/ MODEL_MARIO, /*bhvParam*/ BPARAM4(0x01), /*bhv*/ bhvMario),
    JUMP_LINK(script_func_global_1),
    JUMP_LINK(script_func_global_5),
    JUMP_LINK(script_func_global_14),
    LOAD_MODEL_FROM_GEO(MODEL_JRB_SHIP_LEFT_HALF_PART,  jrb_geo_000978),
    LOAD_MODEL_FROM_GEO(MODEL_JRB_SHIP_BACK_LEFT_PART,  jrb_geo_0009B0),
    LOAD_MODEL_FROM_GEO(MODEL_JRB_SHIP_RIGHT_HALF_PART, jrb_geo_0009E8),
    LOAD_MODEL_FROM_GEO(MODEL_JRB_SHIP_BACK_RIGHT_PART, jrb_geo_000A00),
    LOAD_MODEL_FROM_GEO(MODEL_JRB_SUNKEN_SHIP,          jrb_geo_000990),
    LOAD_MODEL_FROM_GEO(MODEL_JRB_SUNKEN_SHIP_BACK,     jrb_geo_0009C8),
    LOAD_MODEL_FROM_GEO(MODEL_JRB_ROCK,                 jrb_geo_000930),
    LOAD_MODEL_FROM_GEO(MODEL_JRB_SLIDING_BOX,          jrb_geo_000960),
    LOAD_MODEL_FROM_GEO(MODEL_JRB_FALLING_PILLAR,       jrb_geo_000900),
    LOAD_MODEL_FROM_GEO(MODEL_JRB_FALLING_PILLAR_BASE,  jrb_geo_000918),
    LOAD_MODEL_FROM_GEO(MODEL_JRB_FLOATING_PLATFORM,    jrb_geo_000948),

    AREA(/*index*/ 1, jrb_geo_000A18),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/ -6750, 2126, 1482, /*angle*/ 0, 90, 0, /*bhvParam*/ BPARAM2(WARP_NODE_0A), /*bhv*/ bhvSpinAirborneWarp),
        WARP_NODE(/*id*/ WARP_NODE_0A,         /*destLevel*/ LEVEL_JRB,    /*destArea*/ 1, /*destNode*/ WARP_NODE_0A, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_WARP_FLOOR, /*destLevel*/ LEVEL_JRB,    /*destArea*/ 2, /*destNode*/ WARP_NODE_0A, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_SUCCESS,    /*destLevel*/ LEVEL_CASTLE, /*destArea*/ 1, /*destNode*/ WARP_NODE_35, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_DEATH,      /*destLevel*/ LEVEL_CASTLE, /*destArea*/ 1, /*destNode*/ WARP_NODE_67, /*flags*/ WARP_NO_CHECKPOINT),
        WHIRLPOOL(/*unk2*/ 0, /*unk3*/ 3, /*pos*/ 4979, -5222, 2482, /*strength*/ -30),
        JUMP_LINK(script_func_local_1),
        JUMP_LINK(script_func_local_2),
        JUMP_LINK(script_func_local_3),
        TERRAIN(/*terrainData*/ jrb_seg7_area_1_collision),
        MACRO_OBJECTS(/*objList*/ jrb_seg7_area_1_macro_objs),
        SET_BACKGROUND_MUSIC(/*settingsPreset*/ 0x0003, /*seq*/ SEQ_LEVEL_WATER),
        TERRAIN_TYPE(/*terrainType*/ TERRAIN_WATER),
    END_AREA(),

    AREA(/*index*/ 2, jrb_geo_000AFC),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/ 928, 1050, -1248, /*angle*/ 0, 180, 0, /*bhvParam*/ BPARAM2(WARP_NODE_0A), /*bhv*/ bhvSwimmingWarp),
        WARP_NODE(/*id*/ WARP_NODE_0A,      /*destLevel*/ LEVEL_JRB,    /*destArea*/ 2, /*destNode*/ WARP_NODE_0A, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_SUCCESS, /*destLevel*/ LEVEL_CASTLE, /*destArea*/ 1, /*destNode*/ WARP_NODE_35, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_DEATH,   /*destLevel*/ LEVEL_CASTLE, /*destArea*/ 1, /*destNode*/ WARP_NODE_67, /*flags*/ WARP_NO_CHECKPOINT),
        JUMP_LINK(script_func_local_4),
        JUMP_LINK(script_func_local_5),
        TERRAIN(/*terrainData*/ jrb_seg7_area_2_collision),
        MACRO_OBJECTS(/*objList*/ jrb_seg7_area_2_macro_objs),
        SET_BACKGROUND_MUSIC(/*settingsPreset*/ 0x0003, /*seq*/ SEQ_LEVEL_WATER),
        TERRAIN_TYPE(/*terrainType*/ TERRAIN_WATER),
    END_AREA(),

    FREE_LEVEL_POOL(),
    MARIO_POS(/*area*/ 1, /*yaw*/ 90, /*pos*/ -6750, 1126, 1482),
    CALL(/*arg*/ 0, /*func*/ lvl_init_or_update),
    CALL_LOOP(/*arg*/ 1, /*func*/ lvl_init_or_update),
    CLEAR_LEVEL(),
    SLEEP_BEFORE_EXIT(/*frames*/ 1),
    EXIT(),
};
