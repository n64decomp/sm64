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
#include "levels/ssl/header.h"

static const LevelScript script_func_local_1[] = {
    OBJECT(/*model*/ MODEL_SSL_PYRAMID_TOP, /*pos*/ -2047, 1536, -1023, /*angle*/ 0, 0, 0, /*bhvParam*/ 0, /*bhv*/ bhvPyramidTop),
    RETURN(),
};

static const LevelScript script_func_local_2[] = {
    OBJECT          (/*model*/ MODEL_SSL_TOX_BOX,     /*pos*/ -1284,    0, -5895, /*angle*/ 0, 0, 0, /*bhvParam*/ BPARAM2(TOX_BOX_BP_MOVEMENT_PATTERN_1), /*bhv*/ bhvToxBox),
    OBJECT          (/*model*/ MODEL_SSL_TOX_BOX,     /*pos*/  1283,    0, -4865, /*angle*/ 0, 0, 0, /*bhvParam*/ BPARAM2(TOX_BOX_BP_MOVEMENT_PATTERN_2), /*bhv*/ bhvToxBox),
    OBJECT          (/*model*/ MODEL_SSL_TOX_BOX,     /*pos*/  4873,    0, -3335, /*angle*/ 0, 0, 0, /*bhvParam*/ BPARAM2(TOX_BOX_BP_MOVEMENT_PATTERN_3), /*bhv*/ bhvToxBox),
    OBJECT          (/*model*/ MODEL_TWEESTER,        /*pos*/ -3600, -200,  2940, /*angle*/ 0, 0, 0, /*bhvParam*/ BPARAM2(0x12), /*bhv*/ bhvTweester),
    OBJECT_WITH_ACTS(/*model*/ MODEL_TWEESTER,        /*pos*/  1017, -200,  3832, /*angle*/ 0, 0, 0, /*bhvParam*/ BPARAM2(0x19), /*bhv*/ bhvTweester, /*acts*/ ACT_4 | ACT_5 | ACT_6),
    OBJECT_WITH_ACTS(/*model*/ MODEL_TWEESTER,        /*pos*/  3066, -200,   400, /*angle*/ 0, 0, 0, /*bhvParam*/ BPARAM2(0x19), /*bhv*/ bhvTweester, /*acts*/ ACT_4 | ACT_5 | ACT_6),
    OBJECT_WITH_ACTS(/*model*/ MODEL_KLEPTO,          /*pos*/  2200, 1174, -2820, /*angle*/ 0, 0, 0, /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_1) | BPARAM2(0x01), /*bhv*/ bhvKlepto,   /*acts*/ ACT_1),
    OBJECT_WITH_ACTS(/*model*/ MODEL_KLEPTO,          /*pos*/ -5963,  573, -4784, /*angle*/ 0, 0, 0, /*bhvParam*/ 0, /*bhv*/ bhvKlepto,   /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6),
    RETURN(),
};

static const LevelScript script_func_local_3[] = {
    OBJECT_WITH_ACTS(/*model*/ MODEL_STAR, /*pos*/ -2050, 1200, -580, /*angle*/ 0, 0, 0, /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_2), /*bhv*/ bhvStar,                 /*acts*/ ALL_ACTS),
    OBJECT_WITH_ACTS(/*model*/ MODEL_NONE, /*pos*/  6000,  800, 3500, /*angle*/ 0, 0, 0, /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_5), /*bhv*/ bhvHiddenRedCoinStar, /*acts*/ ALL_ACTS),
    RETURN(),
};

static const LevelScript script_func_local_4[] = {
    OBJECT(/*model*/ MODEL_NONE,                    /*pos*/  2867,  640,  2867, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM2(77), /*bhv*/ bhvPoleGrabbing),
    OBJECT(/*model*/ MODEL_NONE,                    /*pos*/     0, 3200,  1331, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM2(92), /*bhv*/ bhvPoleGrabbing),
    OBJECT(/*model*/ MODEL_SSL_GRINDEL,             /*pos*/  3297,    0,    95, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM2(28), /*bhv*/ bhvGrindel),
    OBJECT(/*model*/ MODEL_SSL_GRINDEL,             /*pos*/  -870, 3840,   105, /*angle*/ 0, 180, 0, /*bhvParam*/ 0, /*bhv*/ bhvHorizontalGrindel),
    OBJECT(/*model*/ MODEL_SSL_GRINDEL,             /*pos*/ -3362,    0, -1385, /*angle*/ 0,   0, 0, /*bhvParam*/ 0, /*bhv*/ bhvHorizontalGrindel),
    OBJECT(/*model*/ MODEL_SSL_SPINDEL,             /*pos*/ -2458, 2109, -1430, /*angle*/ 0,   0, 0, /*bhvParam*/ 0, /*bhv*/ bhvSpindel),
    OBJECT(/*model*/ MODEL_SSL_MOVING_PYRAMID_WALL, /*pos*/   858, 1927, -2307, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM2(PYRAMID_WALL_BP_POSITION_HIGH),   /*bhv*/ bhvSSLMovingPyramidWall),
    OBJECT(/*model*/ MODEL_SSL_MOVING_PYRAMID_WALL, /*pos*/   730, 1927, -2307, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM2(PYRAMID_WALL_BP_POSITION_MIDDLE), /*bhv*/ bhvSSLMovingPyramidWall),
    OBJECT(/*model*/ MODEL_SSL_MOVING_PYRAMID_WALL, /*pos*/  1473, 2567, -2307, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM2(PYRAMID_WALL_BP_POSITION_MIDDLE), /*bhv*/ bhvSSLMovingPyramidWall),
    OBJECT(/*model*/ MODEL_SSL_MOVING_PYRAMID_WALL, /*pos*/  1345, 2567, -2307, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM2(PYRAMID_WALL_BP_POSITION_LOW),    /*bhv*/ bhvSSLMovingPyramidWall),
    OBJECT(/*model*/ MODEL_SSL_PYRAMID_ELEVATOR,    /*pos*/     0, 4966,   256, /*angle*/ 0,   0, 0, /*bhvParam*/ 0, /*bhv*/ bhvPyramidElevator),
    OBJECT(/*model*/ MODEL_NONE,                    /*pos*/  1198, -133,  2396, /*angle*/ 0,   0, 0, /*bhvParam*/ 0, /*bhv*/ bhvSandSoundLoop),
    OBJECT(/*model*/ MODEL_NONE,                    /*pos*/     7, 1229,  -708, /*angle*/ 0,   0, 0, /*bhvParam*/ 0, /*bhv*/ bhvSandSoundLoop),
    OBJECT(/*model*/ MODEL_NONE,                    /*pos*/     7, 4317,  -708, /*angle*/ 0,   0, 0, /*bhvParam*/ 0, /*bhv*/ bhvSandSoundLoop),
    RETURN(),
};

static const LevelScript script_func_local_5[] = {
    OBJECT_WITH_ACTS(/*model*/ MODEL_STAR, /*pos*/ 500, 5050, -500, /*angle*/ 0, 0, 0, /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_3), /*bhv*/ bhvStar,        /*acts*/ ALL_ACTS),
    OBJECT_WITH_ACTS(/*model*/ MODEL_NONE, /*pos*/ 900, 1400, 2350, /*angle*/ 0, 0, 0, /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_6) | BPARAM2(0x04), /*bhv*/ bhvHiddenStar, /*acts*/ ALL_ACTS),
    RETURN(),
};

static const LevelScript script_func_local_6[] = {
    OBJECT(/*model*/ MODEL_NONE, /*pos*/ 0, -1534, -3693, /*angle*/ 0, 0, 0, /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_4), /*bhv*/ bhvEyerokBoss),
    RETURN(),
};

const LevelScript level_ssl_entry[] = {
    INIT_LEVEL(),
    LOAD_MIO0        (/*seg*/ 0x07, _ssl_segment_7SegmentRomStart, _ssl_segment_7SegmentRomEnd),
    LOAD_MIO0        (/*seg*/ 0x0A, _ssl_skybox_mio0SegmentRomStart, _ssl_skybox_mio0SegmentRomEnd),
    LOAD_MIO0_TEXTURE(/*seg*/ 0x09, _generic_mio0SegmentRomStart, _generic_mio0SegmentRomEnd),
    LOAD_MIO0        (/*seg*/ 0x05, _group5_mio0SegmentRomStart, _group5_mio0SegmentRomEnd),
    LOAD_RAW         (/*seg*/ 0x0C, _group5_geoSegmentRomStart,  _group5_geoSegmentRomEnd),
    LOAD_MIO0        (/*seg*/ 0x08, _common0_mio0SegmentRomStart, _common0_mio0SegmentRomEnd),
    LOAD_RAW         (/*seg*/ 0x0F, _common0_geoSegmentRomStart,  _common0_geoSegmentRomEnd),
    ALLOC_LEVEL_POOL(),
    MARIO(/*model*/ MODEL_MARIO, /*bhvParam*/ BPARAM4(0x01), /*bhv*/ bhvMario),
    JUMP_LINK(script_func_global_1),
    JUMP_LINK(script_func_global_6),
    LOAD_MODEL_FROM_GEO(MODEL_SSL_PALM_TREE,           palm_tree_geo),
    LOAD_MODEL_FROM_GEO(MODEL_LEVEL_GEOMETRY_03,       ssl_geo_0005C0),
    LOAD_MODEL_FROM_GEO(MODEL_LEVEL_GEOMETRY_04,       ssl_geo_0005D8),
    LOAD_MODEL_FROM_GEO(MODEL_SSL_PYRAMID_TOP,         ssl_geo_000618),
    LOAD_MODEL_FROM_GEO(MODEL_SSL_GRINDEL,             ssl_geo_000734),
    LOAD_MODEL_FROM_GEO(MODEL_SSL_SPINDEL,             ssl_geo_000764),
    LOAD_MODEL_FROM_GEO(MODEL_SSL_MOVING_PYRAMID_WALL, ssl_geo_000794),
    LOAD_MODEL_FROM_GEO(MODEL_SSL_PYRAMID_ELEVATOR,    ssl_geo_0007AC),
    LOAD_MODEL_FROM_GEO(MODEL_SSL_TOX_BOX,             ssl_geo_000630),

    AREA(/*index*/ 1, ssl_geo_000648),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/   653, 1038,  6566, /*angle*/ 0,  90, 0, /*bhvParam*/ BPARAM2(WARP_NODE_0A), /*bhv*/ bhvSpinAirborneWarp),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/ -2048,    0,    56, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM2(WARP_NODE_14), /*bhv*/ bhvWarp),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/ -2048,  768, -1024, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM1(15) | BPARAM2(WARP_NODE_1E), /*bhv*/ bhvWarp),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/  6930,    0, -4871, /*angle*/ 0, 159, 0, /*bhvParam*/ BPARAM2(WARP_NODE_1F), /*bhv*/ bhvFadingWarp),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/ -5943,    0, -4903, /*angle*/ 0,  49, 0, /*bhvParam*/ BPARAM2(WARP_NODE_20), /*bhv*/ bhvFadingWarp),
        WARP_NODE(/*id*/ WARP_NODE_0A,      /*destLevel*/ LEVEL_SSL,    /*destArea*/ 1, /*destNode*/ WARP_NODE_0A, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_14,      /*destLevel*/ LEVEL_SSL,    /*destArea*/ 2, /*destNode*/ WARP_NODE_0A, /*flags*/ WARP_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_1E,      /*destLevel*/ LEVEL_SSL,    /*destArea*/ 2, /*destNode*/ WARP_NODE_14, /*flags*/ WARP_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_1F,      /*destLevel*/ LEVEL_SSL,    /*destArea*/ 1, /*destNode*/ WARP_NODE_20, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_20,      /*destLevel*/ LEVEL_SSL,    /*destArea*/ 1, /*destNode*/ WARP_NODE_1F, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_SUCCESS, /*destLevel*/ LEVEL_CASTLE, /*destArea*/ 3, /*destNode*/ WARP_NODE_33, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_DEATH,   /*destLevel*/ LEVEL_CASTLE, /*destArea*/ 3, /*destNode*/ WARP_NODE_65, /*flags*/ WARP_NO_CHECKPOINT),
        JUMP_LINK(script_func_local_1),
        JUMP_LINK(script_func_local_2),
        JUMP_LINK(script_func_local_3),
        TERRAIN(/*terrainData*/ ssl_seg7_area_1_collision),
        MACRO_OBJECTS(/*objList*/ ssl_seg7_area_1_macro_objs),
        SET_BACKGROUND_MUSIC(/*settingsPreset*/ 0x0000, /*seq*/ SEQ_LEVEL_HOT),
        TERRAIN_TYPE(/*terrainType*/ TERRAIN_SAND),
    END_AREA(),

    AREA(/*index*/ 2, ssl_geo_0007CC),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/    0,  300,  6451, /*angle*/ 0, 180, 0, /*bhvParam*/ BPARAM2(WARP_NODE_0A), /*bhv*/ bhvAirborneWarp),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/    0, 5500,   256, /*angle*/ 0, 180, 0, /*bhvParam*/ BPARAM2(WARP_NODE_14), /*bhv*/ bhvAirborneWarp),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/ 3070, 1280,  2900, /*angle*/ 0, 180, 0, /*bhvParam*/ BPARAM2(WARP_NODE_15), /*bhv*/ bhvFadingWarp),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/ 2546, 1150, -2647, /*angle*/ 0,  78, 0, /*bhvParam*/ BPARAM2(WARP_NODE_16), /*bhv*/ bhvFadingWarp),
        WARP_NODE(/*id*/ WARP_NODE_0A,      /*destLevel*/ LEVEL_SSL,    /*destArea*/ 2, /*destNode*/ WARP_NODE_0A, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_14,      /*destLevel*/ LEVEL_SSL,    /*destArea*/ 2, /*destNode*/ WARP_NODE_14, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_15,      /*destLevel*/ LEVEL_SSL,    /*destArea*/ 2, /*destNode*/ WARP_NODE_16, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_16,      /*destLevel*/ LEVEL_SSL,    /*destArea*/ 2, /*destNode*/ WARP_NODE_15, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_SUCCESS, /*destLevel*/ LEVEL_CASTLE, /*destArea*/ 3, /*destNode*/ WARP_NODE_33, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_DEATH,   /*destLevel*/ LEVEL_CASTLE, /*destArea*/ 3, /*destNode*/ WARP_NODE_65, /*flags*/ WARP_NO_CHECKPOINT),
        JUMP_LINK(script_func_local_4),
        JUMP_LINK(script_func_local_5),
        INSTANT_WARP(/*index*/ 3, /*destArea*/ 3, /*displace*/ 0, 0, 0),
        TERRAIN(/*terrainData*/ ssl_seg7_area_2_collision),
        MACRO_OBJECTS(/*objList*/ ssl_seg7_area_2_macro_objs),
        SET_BACKGROUND_MUSIC(/*settingsPreset*/ 0x0004, /*seq*/ SEQ_LEVEL_UNDERGROUND),
        TERRAIN_TYPE(/*terrainType*/ TERRAIN_STONE),
    END_AREA(),

    AREA(/*index*/ 3, ssl_geo_00088C),
        WARP_NODE(/*id*/ WARP_NODE_SUCCESS, /*destLevel*/ LEVEL_CASTLE, /*destArea*/ 3, /*destNode*/ WARP_NODE_33, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_DEATH,   /*destLevel*/ LEVEL_CASTLE, /*destArea*/ 3, /*destNode*/ WARP_NODE_65, /*flags*/ WARP_NO_CHECKPOINT),
        JUMP_LINK(script_func_local_6),
        TERRAIN(/*terrainData*/ ssl_seg7_area_3_collision),
        MACRO_OBJECTS(/*objList*/ ssl_seg7_area_3_macro_objs),
        INSTANT_WARP(/*index*/ 2, /*destArea*/ 2, /*displace*/ 0, 0, 0),
        SET_BACKGROUND_MUSIC(/*settingsPreset*/ 0x0004, /*seq*/ SEQ_LEVEL_UNDERGROUND),
        TERRAIN_TYPE(/*terrainType*/ TERRAIN_STONE),
    END_AREA(),

    FREE_LEVEL_POOL(),
    MARIO_POS(/*area*/ 1, /*yaw*/ 88, /*pos*/ 653, 38, 6566),
    CALL(/*arg*/ 0, /*func*/ lvl_init_or_update),
    CALL_LOOP(/*arg*/ 1, /*func*/ lvl_init_or_update),
    CLEAR_LEVEL(),
    SLEEP_BEFORE_EXIT(/*frames*/ 1),
    EXIT(),
};
