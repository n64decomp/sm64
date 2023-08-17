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
#include "levels/sl/header.h"


static const LevelScript script_func_local_1[] = {
    OBJECT_WITH_ACTS(/*model*/ MODEL_STAR, /*pos*/  700, 4500,  690, /*angle*/ 0, 0, 0, /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_1), /*bhv*/ bhvStar,                 /*acts*/ ALL_ACTS),
    OBJECT_WITH_ACTS(/*model*/ MODEL_STAR, /*pos*/ 4350, 1350, 4350, /*angle*/ 0, 0, 0, /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_3), /*bhv*/ bhvStar,                 /*acts*/ ALL_ACTS),
    OBJECT_WITH_ACTS(/*model*/ MODEL_NONE, /*pos*/ 5000, 1200,    0, /*angle*/ 0, 0, 0, /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_5), /*bhv*/ bhvHiddenRedCoinStar, /*acts*/ ALL_ACTS),
    RETURN(),
};

static const LevelScript script_func_local_2[] = {
    OBJECT(/*model*/ MODEL_NONE, /*pos*/  977, 1024, 2075, /*angle*/ 0, 0, 0, /*bhvParam*/ 0, /*bhv*/ bhvSnowMoundSpawn),
    RETURN(),
};

static const LevelScript script_func_local_3[] = {
    OBJECT(/*model*/ MODEL_PENGUIN,            /*pos*/ 1715, 3328,   518, /*angle*/ 0, -51, 0, /*bhvParam*/ 0, /*bhv*/ bhvSLWalkingPenguin),
    OBJECT(/*model*/ MODEL_NONE,               /*pos*/  700, 3428,   700, /*angle*/ 0,  30, 0, /*bhvParam*/ 0, /*bhv*/ bhvSLSnowmanWind),
    OBJECT(/*model*/ MODEL_NONE,               /*pos*/  480, 2300,  1370, /*angle*/ 0,   0, 0, /*bhvParam*/ 0, /*bhv*/ bhvIgloo),
    OBJECT(/*model*/ MODEL_BIG_CHILL_BULLY,    /*pos*/  315, 1331, -4852, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_2), /*bhv*/ bhvBigChillBully),
    OBJECT(/*model*/ MODEL_MR_BLIZZARD_HIDDEN, /*pos*/ 2954,  970,   750, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM2(MR_BLIZZARD_STYPE_CAP), /*bhv*/ bhvMrBlizzard),
    RETURN(),
};

static const LevelScript script_func_local_4[] = {
    OBJECT_WITH_ACTS(/*model*/ MODEL_STAR, /*pos*/ 0, 500, 1000, /*angle*/ 0, 0, 0, /*bhvParam*/ BPARAM1(STAR_INDEX_ACT_6), /*bhv*/ bhvStar, /*acts*/ ALL_ACTS),
    RETURN(),
};

const LevelScript level_sl_entry[] = {
    INIT_LEVEL(),
    LOAD_MIO0        (/*seg*/ 0x07, _sl_segment_7SegmentRomStart, _sl_segment_7SegmentRomEnd),
    LOAD_MIO0_TEXTURE(/*seg*/ 0x09, _snow_mio0SegmentRomStart, _snow_mio0SegmentRomEnd),
    LOAD_MIO0        (/*seg*/ 0x0B, _effect_mio0SegmentRomStart, _effect_mio0SegmentRomEnd),
    LOAD_MIO0        (/*seg*/ 0x0A, _ccm_skybox_mio0SegmentRomStart, _ccm_skybox_mio0SegmentRomEnd),
    LOAD_MIO0        (/*seg*/ 0x05, _group7_mio0SegmentRomStart, _group7_mio0SegmentRomEnd),
    LOAD_RAW         (/*seg*/ 0x0C, _group7_geoSegmentRomStart,  _group7_geoSegmentRomEnd),
    LOAD_MIO0        (/*seg*/ 0x06, _group16_mio0SegmentRomStart, _group16_mio0SegmentRomEnd),
    LOAD_RAW         (/*seg*/ 0x0D, _group16_geoSegmentRomStart,  _group16_geoSegmentRomEnd),
    LOAD_MIO0        (/*seg*/ 0x08, _common0_mio0SegmentRomStart, _common0_mio0SegmentRomEnd),
    LOAD_RAW         (/*seg*/ 0x0F, _common0_geoSegmentRomStart,  _common0_geoSegmentRomEnd),
    ALLOC_LEVEL_POOL(),
    MARIO(/*model*/ MODEL_MARIO, /*bhvParam*/ BPARAM4(0x01), /*bhv*/ bhvMario),
    JUMP_LINK(script_func_global_1),
    JUMP_LINK(script_func_global_8),
    JUMP_LINK(script_func_global_17),
    LOAD_MODEL_FROM_GEO(MODEL_SL_SNOW_TRIANGLE,     sl_geo_000390),
    LOAD_MODEL_FROM_GEO(MODEL_SL_CRACKED_ICE,       sl_geo_000360),
    LOAD_MODEL_FROM_GEO(MODEL_SL_CRACKED_ICE_CHUNK, sl_geo_000378),
    LOAD_MODEL_FROM_GEO(MODEL_SL_SNOW_TREE,         snow_tree_geo),

    AREA(/*index*/ 1, sl_geo_0003A8),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/  5541, 2024,   443, /*angle*/ 0, 270, 0, /*bhvParam*/ BPARAM2(WARP_NODE_0A), /*bhv*/ bhvSpinAirborneWarp),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/   257, 2150,  1399, /*angle*/ 0, 290, 0, /*bhvParam*/ BPARAM2(WARP_NODE_0B), /*bhv*/ bhvInstantActiveWarp),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/   569, 2150,  1336, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM1(6) | BPARAM2(WARP_NODE_0C), /*bhv*/ bhvWarp),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/  5468, 1056, -5400, /*angle*/ 0, -20, 0, /*bhvParam*/ BPARAM2(WARP_NODE_0D), /*bhv*/ bhvFadingWarp),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/ -3698, 1024, -1237, /*angle*/ 0,   6, 0, /*bhvParam*/ BPARAM2(WARP_NODE_0E), /*bhv*/ bhvFadingWarp),
        WARP_NODE(/*id*/ WARP_NODE_0A, /*destLevel*/ LEVEL_SL, /*destArea*/ 1, /*destNode*/ WARP_NODE_0A, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_0B, /*destLevel*/ LEVEL_SL, /*destArea*/ 1, /*destNode*/ WARP_NODE_0B, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_0C, /*destLevel*/ LEVEL_SL, /*destArea*/ 2, /*destNode*/ WARP_NODE_0A, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_0D, /*destLevel*/ LEVEL_SL, /*destArea*/ 1, /*destNode*/ WARP_NODE_0E, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_0E, /*destLevel*/ LEVEL_SL, /*destArea*/ 1, /*destNode*/ WARP_NODE_0D, /*flags*/ WARP_NO_CHECKPOINT),
        JUMP_LINK(script_func_local_1),
        JUMP_LINK(script_func_local_2),
        JUMP_LINK(script_func_local_3),
        WARP_NODE(/*id*/ WARP_NODE_SUCCESS,    /*destLevel*/ LEVEL_CASTLE, /*destArea*/ 2, /*destNode*/ WARP_NODE_36, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_DEATH, /*destLevel*/ LEVEL_CASTLE, /*destArea*/ 2, /*destNode*/ WARP_NODE_68, /*flags*/ WARP_NO_CHECKPOINT),
        TERRAIN(/*terrainData*/ sl_seg7_area_1_collision),
        MACRO_OBJECTS(/*objList*/ sl_seg7_area_1_macro_objs),
        SET_BACKGROUND_MUSIC(/*settingsPreset*/ 0x0000, /*seq*/ SEQ_LEVEL_SNOW),
        TERRAIN_TYPE(/*terrainType*/ TERRAIN_SNOW),
    END_AREA(),

    AREA(/*index*/ 2, sl_geo_000484),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/ 0, 0, 2867, /*angle*/ 0, 180, 0, /*bhvParam*/ BPARAM2(WARP_NODE_0A), /*bhv*/ bhvInstantActiveWarp),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/ 0, 0, 3277, /*angle*/ 0,   0, 0, /*bhvParam*/ BPARAM1(20) | BPARAM2(WARP_NODE_0B), /*bhv*/ bhvWarp),
        WARP_NODE(/*id*/ WARP_NODE_0A, /*destLevel*/ LEVEL_SL, /*destArea*/ 2, /*destNode*/ WARP_NODE_0A, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_0B, /*destLevel*/ LEVEL_SL, /*destArea*/ 1, /*destNode*/ WARP_NODE_0B, /*flags*/ WARP_NO_CHECKPOINT),
        JUMP_LINK(script_func_local_4),
        WARP_NODE(/*id*/ WARP_NODE_SUCCESS,    /*destLevel*/ LEVEL_CASTLE, /*destArea*/ 2, /*destNode*/ WARP_NODE_36, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_DEATH, /*destLevel*/ LEVEL_CASTLE, /*destArea*/ 2, /*destNode*/ WARP_NODE_68, /*flags*/ WARP_NO_CHECKPOINT),
        TERRAIN(/*terrainData*/ sl_seg7_area_2_collision),
        MACRO_OBJECTS(/*objList*/ sl_seg7_area_2_macro_objs),
        SET_BACKGROUND_MUSIC(/*settingsPreset*/ 0x0004, /*seq*/ SEQ_LEVEL_UNDERGROUND),
        TERRAIN_TYPE(/*terrainType*/ TERRAIN_SNOW),
    END_AREA(),

    FREE_LEVEL_POOL(),
    MARIO_POS(/*area*/ 1, /*yaw*/ 270, /*pos*/ 5541, 1024, 443),
    CALL(/*arg*/ 0, /*func*/ lvl_init_or_update),
    CALL_LOOP(/*arg*/ 1, /*func*/ lvl_init_or_update),
    CLEAR_LEVEL(),
    SLEEP_BEFORE_EXIT(/*frames*/ 1),
    EXIT(),
};
