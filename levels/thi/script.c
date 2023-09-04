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
#include "levels/thi/header.h"

static const LevelScript script_func_local_1[] = {
    RETURN(),
};

static const LevelScript script_func_local_2[] = {
    OBJECT_WITH_ACTS(/*model*/ MODEL_NONE,    /*pos*/     0, -700, -4500, /*angle*/ 0, 0, 0, /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_4), /*bhv*/ bhvHiddenStar,          /*acts*/ ALL_ACTS),
    RETURN(),
};

static const LevelScript script_func_local_3[] = {
    OBJECT_WITH_ACTS(/*model*/ MODEL_NONE,             /*pos*/ -1800,   800, -1500, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_5), /*bhv*/ bhvHiddenRedCoinStar, /*acts*/ ALL_ACTS),
    OBJECT          (/*model*/ MODEL_WIGGLER_HEAD,     /*pos*/    17,  1843,   -62, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_6), /*bhv*/ bhvWigglerHead),
    RETURN(),
};

static const LevelScript script_func_local_4[] = {
    OBJECT_WITH_ACTS(/*model*/ MODEL_KOOPA_WITH_SHELL, /*pos*/ -1900,  -511,  2400, /*angle*/ 0, -30, 0, /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_3) | BPARAM2(KOOPA_BP_KOOPA_THE_QUICK_THI), /*bhv*/ bhvKoopa,             /*acts*/ ACT_3),
    OBJECT_WITH_ACTS(/*model*/ MODEL_NONE,             /*pos*/  7400, -1537, -6300, /*angle*/ 0,   0, 0, /*bhvParam*/ 0, /*bhv*/ bhvKoopaRaceEndpoint, /*acts*/ ACT_3),
    OBJECT          (/*model*/ MODEL_NONE,             /*pos*/ -6556, -2969,  6565, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM2(GOOMBA_TRIPLET_SPAWNER_BP_EXTRA_GOOMBAS(0) | GOOMBA_SIZE_HUGE), /*bhv*/ bhvGoombaTripletSpawner),
    OBJECT          (/*model*/ MODEL_GOOMBA,           /*pos*/  6517, -2559,  4327, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM2(GOOMBA_SIZE_HUGE), /*bhv*/ bhvGoomba),
    OBJECT          (/*model*/ MODEL_PIRANHA_PLANT,    /*pos*/ -6336, -2047, -3861, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_1) | BPARAM2(0x01), /*bhv*/ bhvFirePiranhaPlant),
    OBJECT          (/*model*/ MODEL_PIRANHA_PLANT,    /*pos*/ -5740, -2047, -6578, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_1) | BPARAM2(0x01), /*bhv*/ bhvFirePiranhaPlant),
    OBJECT          (/*model*/ MODEL_PIRANHA_PLANT,    /*pos*/ -6481, -2047, -5998, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_1) | BPARAM2(0x01), /*bhv*/ bhvFirePiranhaPlant),
    OBJECT          (/*model*/ MODEL_PIRANHA_PLANT,    /*pos*/ -5577, -2047, -4961, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_1) | BPARAM2(0x01), /*bhv*/ bhvFirePiranhaPlant),
    OBJECT          (/*model*/ MODEL_PIRANHA_PLANT,    /*pos*/ -6865, -2047, -4568, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_1) | BPARAM2(0x01), /*bhv*/ bhvFirePiranhaPlant),
    OBJECT          (/*model*/ MODEL_NONE,             /*pos*/ -4413,   204, -2140, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM2(BBALL_BP_STYPE_THI_LARGE), /*bhv*/ bhvTHIBowlingBallSpawner),
    OBJECT          (/*model*/ MODEL_BUBBA,            /*pos*/ -6241, -3300,  -716, /*angle*/ 0,   0, 0, /*bhvParam*/ 0, /*bhv*/ bhvBubba),
    OBJECT          (/*model*/ MODEL_BUBBA,            /*pos*/  1624, -3300,  8142, /*angle*/ 0,   0, 0, /*bhvParam*/ 0, /*bhv*/ bhvBubba),
    RETURN(),
};

static const LevelScript script_func_local_5[] = {
    OBJECT(/*model*/ MODEL_THI_HUGE_ISLAND_TOP, /*pos*/     0, 3891, -1533, /*angle*/ 0, 0, 0, /*bhvParam*/ 0, /*bhv*/ bhvTHIHugeIslandTop),
    RETURN(),
};

static const LevelScript script_func_local_6[] = {
    OBJECT(/*model*/ MODEL_THI_TINY_ISLAND_TOP, /*pos*/     0, 1167,  -460, /*angle*/ 0, 0, 0, /*bhvParam*/ 0, /*bhv*/ bhvTHITinyIslandTop),
    OBJECT(/*model*/ MODEL_NONE,                /*pos*/ -1382,   80,  -649, /*angle*/ 0, 0, 0, /*bhvParam*/ BPARAM2(BBALL_BP_STYPE_THI_SMALL), /*bhv*/ bhvTHIBowlingBallSpawner),
    RETURN(),
};

static const LevelScript script_func_local_7[] = {
    OBJECT(/*model*/ MODEL_THI_WARP_PIPE, /*pos*/  6656, -1536, -5632, /*angle*/ 0, 0, 0, /*bhvParam*/ BPARAM2(WARP_NODE_32), /*bhv*/ bhvWarpPipe),
    OBJECT(/*model*/ MODEL_THI_WARP_PIPE, /*pos*/ -5888, -2048, -5888, /*angle*/ 0, 0, 0, /*bhvParam*/ BPARAM2(WARP_NODE_33), /*bhv*/ bhvWarpPipe),
    OBJECT(/*model*/ MODEL_THI_WARP_PIPE, /*pos*/ -3072,   512, -3840, /*angle*/ 0, 0, 0, /*bhvParam*/ BPARAM2(WARP_NODE_34), /*bhv*/ bhvWarpPipe),
    WARP_NODE(/*id*/ WARP_NODE_32, /*destLevel*/ LEVEL_THI, /*destArea*/ 2, /*destNode*/ WARP_NODE_32, /*flags*/ WARP_NO_CHECKPOINT),
    WARP_NODE(/*id*/ WARP_NODE_33, /*destLevel*/ LEVEL_THI, /*destArea*/ 2, /*destNode*/ WARP_NODE_33, /*flags*/ WARP_NO_CHECKPOINT),
    WARP_NODE(/*id*/ WARP_NODE_34, /*destLevel*/ LEVEL_THI, /*destArea*/ 2, /*destNode*/ WARP_NODE_34, /*flags*/ WARP_NO_CHECKPOINT),
    RETURN(),
};

static const LevelScript script_func_local_8[] = {
    OBJECT(/*model*/ MODEL_THI_WARP_PIPE, /*pos*/  1997, -461, -1690, /*angle*/ 0, 0, 0, /*bhvParam*/ BPARAM2(WARP_NODE_32), /*bhv*/ bhvWarpPipe),
    OBJECT(/*model*/ MODEL_THI_WARP_PIPE, /*pos*/ -1766, -614, -1766, /*angle*/ 0, 0, 0, /*bhvParam*/ BPARAM2(WARP_NODE_33), /*bhv*/ bhvWarpPipe),
    OBJECT(/*model*/ MODEL_THI_WARP_PIPE, /*pos*/  -922,  154, -1152, /*angle*/ 0, 0, 0, /*bhvParam*/ BPARAM2(WARP_NODE_34), /*bhv*/ bhvWarpPipe),
    WARP_NODE(/*id*/ WARP_NODE_32, /*destLevel*/ LEVEL_THI, /*destArea*/ 1, /*destNode*/ WARP_NODE_32, /*flags*/ WARP_NO_CHECKPOINT),
    WARP_NODE(/*id*/ WARP_NODE_33, /*destLevel*/ LEVEL_THI, /*destArea*/ 1, /*destNode*/ WARP_NODE_33, /*flags*/ WARP_NO_CHECKPOINT),
    WARP_NODE(/*id*/ WARP_NODE_34, /*destLevel*/ LEVEL_THI, /*destArea*/ 1, /*destNode*/ WARP_NODE_34, /*flags*/ WARP_NO_CHECKPOINT),
    RETURN(),
};

const LevelScript level_thi_entry[] = {
    INIT_LEVEL(),
    LOAD_MIO0        (/*seg*/ 0x07, _thi_segment_7SegmentRomStart, _thi_segment_7SegmentRomEnd),
    LOAD_MIO0_TEXTURE(/*seg*/ 0x09, _grass_mio0SegmentRomStart, _grass_mio0SegmentRomEnd),
    LOAD_MIO0        (/*seg*/ 0x0A, _water_skybox_mio0SegmentRomStart, _water_skybox_mio0SegmentRomEnd),
    LOAD_MIO0        (/*seg*/ 0x05, _group11_mio0SegmentRomStart, _group11_mio0SegmentRomEnd),
    LOAD_RAW         (/*seg*/ 0x0C, _group11_geoSegmentRomStart,  _group11_geoSegmentRomEnd),
    LOAD_MIO0        (/*seg*/ 0x06, _group14_mio0SegmentRomStart, _group14_mio0SegmentRomEnd),
    LOAD_RAW         (/*seg*/ 0x0D, _group14_geoSegmentRomStart,  _group14_geoSegmentRomEnd),
    LOAD_MIO0        (/*seg*/ 0x08, _common0_mio0SegmentRomStart, _common0_mio0SegmentRomEnd),
    LOAD_RAW         (/*seg*/ 0x0F, _common0_geoSegmentRomStart,  _common0_geoSegmentRomEnd),
    ALLOC_LEVEL_POOL(),
    MARIO(/*model*/ MODEL_MARIO, /*bhvParam*/ BPARAM4(0x01), /*bhv*/ bhvMario),
    JUMP_LINK(script_func_global_1),
    JUMP_LINK(script_func_global_12),
    JUMP_LINK(script_func_global_15),
    LOAD_MODEL_FROM_GEO(MODEL_THI_BUBBLY_TREE,     bubbly_tree_geo),
    LOAD_MODEL_FROM_GEO(MODEL_LEVEL_GEOMETRY_03,   thi_geo_0005F0),
    LOAD_MODEL_FROM_GEO(MODEL_THI_WARP_PIPE,       warp_pipe_geo),
    LOAD_MODEL_FROM_GEO(MODEL_THI_HUGE_ISLAND_TOP, thi_geo_0005B0),
    LOAD_MODEL_FROM_GEO(MODEL_THI_TINY_ISLAND_TOP, thi_geo_0005C8),

    AREA(/*index*/ 1, thi_geo_000608),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/ -7372, -1969,  7373, /*angle*/ 0, 149, 0, /*bhvParam*/ BPARAM2(WARP_NODE_0A), /*bhv*/ bhvSpinAirborneWarp),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/   410,  -512,   922, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM2(WARP_NODE_0B), /*bhv*/ bhvInstantActiveWarp),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/   410,  -512,   717, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM1(5)  | BPARAM2(WARP_NODE_0C), /*bhv*/ bhvWarp),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/     0,  3170, -1570, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM1(10) | BPARAM2(WARP_NODE_0D), /*bhv*/ bhvWarp),
        WARP_NODE(/*id*/ WARP_NODE_0A,      /*destLevel*/ LEVEL_THI,    /*destArea*/ 1, /*destNode*/ WARP_NODE_0A, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_0B,      /*destLevel*/ LEVEL_THI,    /*destArea*/ 1, /*destNode*/ WARP_NODE_0B, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_0C,      /*destLevel*/ LEVEL_THI,    /*destArea*/ 3, /*destNode*/ WARP_NODE_0A, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_0D,      /*destLevel*/ LEVEL_THI,    /*destArea*/ 3, /*destNode*/ WARP_NODE_0B, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_SUCCESS, /*destLevel*/ LEVEL_CASTLE, /*destArea*/ 2, /*destNode*/ WARP_NODE_37, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_DEATH,   /*destLevel*/ LEVEL_CASTLE, /*destArea*/ 2, /*destNode*/ WARP_NODE_69, /*flags*/ WARP_NO_CHECKPOINT),
        JUMP_LINK(script_func_local_7),
        JUMP_LINK(script_func_local_1),
        JUMP_LINK(script_func_local_5),
        JUMP_LINK(script_func_local_4),
        TERRAIN(/*terrainData*/ thi_seg7_area_1_collision),
        MACRO_OBJECTS(/*objList*/ thi_seg7_area_1_macro_objs),
        SET_BACKGROUND_MUSIC(/*settingsPreset*/ 0x0000, /*seq*/ SEQ_LEVEL_GRASS),
        TERRAIN_TYPE(/*terrainType*/ TERRAIN_GRASS),
    END_AREA(),

    AREA(/*index*/ 2, thi_geo_0006D4),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/ -2211,  110,  2212, /*angle*/ 0,  149, 0, /*bhvParam*/ BPARAM2(WARP_NODE_0A), /*bhv*/ bhvSpinAirborneWarp),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/   280, -767, -4180, /*angle*/ 0,    0, 0, /*bhvParam*/ BPARAM2(WARP_NODE_0B), /*bhv*/ bhvFadingWarp),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/ -1638,    0, -1988, /*angle*/ 0, -126, 0, /*bhvParam*/ BPARAM2(WARP_NODE_0C), /*bhv*/ bhvFadingWarp),
        WARP_NODE(/*id*/ WARP_NODE_0A,      /*destLevel*/ LEVEL_THI,    /*destArea*/ 2, /*destNode*/ WARP_NODE_0A, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_0B,      /*destLevel*/ LEVEL_THI,    /*destArea*/ 2, /*destNode*/ WARP_NODE_0C, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_0C,      /*destLevel*/ LEVEL_THI,    /*destArea*/ 2, /*destNode*/ WARP_NODE_0B, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_SUCCESS, /*destLevel*/ LEVEL_CASTLE, /*destArea*/ 2, /*destNode*/ WARP_NODE_33, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_DEATH,   /*destLevel*/ LEVEL_CASTLE, /*destArea*/ 2, /*destNode*/ WARP_NODE_65, /*flags*/ WARP_NO_CHECKPOINT),
        JUMP_LINK(script_func_local_8),
        JUMP_LINK(script_func_local_2),
        JUMP_LINK(script_func_local_6),
        TERRAIN(/*terrainData*/ thi_seg7_area_2_collision),
        MACRO_OBJECTS(/*objList*/ thi_seg7_area_2_macro_objs),
        SET_BACKGROUND_MUSIC(/*settingsPreset*/ 0x0000, /*seq*/ SEQ_LEVEL_GRASS),
        TERRAIN_TYPE(/*terrainType*/ TERRAIN_GRASS),
    END_AREA(),

    AREA(/*index*/ 3, thi_geo_00079C),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/ 512, 1024, 2150, /*angle*/ 0, 180, 0, /*bhvParam*/ BPARAM2(WARP_NODE_0A), /*bhv*/ bhvInstantActiveWarp),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/   0, 3277,    0, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM2(WARP_NODE_0B), /*bhv*/ bhvAirborneWarp),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/ 512, 1024, 2355, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM1(5) | BPARAM2(WARP_NODE_0C), /*bhv*/ bhvWarp),
        WARP_NODE(/*id*/ WARP_NODE_0A,      /*destLevel*/ LEVEL_THI,    /*destArea*/ 3, /*destNode*/ WARP_NODE_0A, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_0B,      /*destLevel*/ LEVEL_THI,    /*destArea*/ 3, /*destNode*/ WARP_NODE_0B, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_0C,      /*destLevel*/ LEVEL_THI,    /*destArea*/ 1, /*destNode*/ WARP_NODE_0B, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_SUCCESS, /*destLevel*/ LEVEL_CASTLE, /*destArea*/ 2, /*destNode*/ WARP_NODE_37, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_DEATH,   /*destLevel*/ LEVEL_CASTLE, /*destArea*/ 2, /*destNode*/ WARP_NODE_69, /*flags*/ WARP_NO_CHECKPOINT),
        JUMP_LINK(script_func_local_3),
        TERRAIN(/*terrainData*/ thi_seg7_area_3_collision),
        MACRO_OBJECTS(/*objList*/ thi_seg7_area_3_macro_objs),
        SET_BACKGROUND_MUSIC(/*settingsPreset*/ 0x0004, /*seq*/ SEQ_LEVEL_UNDERGROUND),
        TERRAIN_TYPE(/*terrainType*/ TERRAIN_GRASS),
    END_AREA(),

    FREE_LEVEL_POOL(),
    MARIO_POS(/*area*/ 1, /*yaw*/ 149, /*pos*/ -7372, -2969, 7373),
    CALL(/*arg*/ 0, /*func*/ lvl_init_or_update),
    CALL_LOOP(/*arg*/ 1, /*func*/ lvl_init_or_update),
    CLEAR_LEVEL(),
    SLEEP_BEFORE_EXIT(/*frames*/ 1),
    EXIT(),
};
