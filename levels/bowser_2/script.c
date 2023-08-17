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
#include "levels/bowser_2/header.h"

static const LevelScript script_func_local_1[] = {
    OBJECT(/*model*/ MODEL_BOWSER_2_TILTING_ARENA, /*pos*/     0,    0,     0, /*angle*/ 0, 90, 0, /*bhvParam*/ 0, /*bhv*/ bhvTiltingBowserLavaPlatform),
    OBJECT(/*model*/ MODEL_BOWSER_BOMB,            /*pos*/     4, 1329,  3598, /*angle*/ 0, 90, 0, /*bhvParam*/ 0, /*bhv*/ bhvBowserBomb),
    OBJECT(/*model*/ MODEL_BOWSER_BOMB,            /*pos*/  3584, 1329,     0, /*angle*/ 0, 90, 0, /*bhvParam*/ 0, /*bhv*/ bhvBowserBomb),
    OBJECT(/*model*/ MODEL_BOWSER_BOMB,            /*pos*/     0, 1329, -3583, /*angle*/ 0, 90, 0, /*bhvParam*/ 0, /*bhv*/ bhvBowserBomb),
    OBJECT(/*model*/ MODEL_BOWSER_BOMB,            /*pos*/ -3583, 1329,     0, /*angle*/ 0, 90, 0, /*bhvParam*/ 0, /*bhv*/ bhvBowserBomb),
    RETURN(),
};

const LevelScript level_bowser_2_entry[] = {
    INIT_LEVEL(),
    LOAD_MIO0        (/*seg*/ 0x0A, _bitfs_skybox_mio0SegmentRomStart, _bitfs_skybox_mio0SegmentRomEnd),
    LOAD_MIO0_TEXTURE(/*seg*/ 0x09, _fire_mio0SegmentRomStart, _fire_mio0SegmentRomEnd),
    LOAD_MIO0        (/*seg*/ 0x0B, _effect_mio0SegmentRomStart, _effect_mio0SegmentRomEnd),
    LOAD_MIO0        (/*seg*/ 0x07, _bowser_2_segment_7SegmentRomStart, _bowser_2_segment_7SegmentRomEnd),
    LOAD_MIO0        (/*seg*/ 0x06, _group12_mio0SegmentRomStart, _group12_mio0SegmentRomEnd),
    LOAD_RAW         (/*seg*/ 0x0D, _group12_geoSegmentRomStart, _group12_geoSegmentRomEnd),
    ALLOC_LEVEL_POOL(),
    MARIO(/*model*/ MODEL_MARIO, /*bhvParam*/ BPARAM4(0x01), /*bhv*/ bhvMario),
    JUMP_LINK(script_func_global_13),
    LOAD_MODEL_FROM_GEO(MODEL_BOWSER_2_TILTING_ARENA, bowser_2_geo_000170),

    AREA(/*index*/ 1, bowser_2_geo_000188),
        OBJECT(/*model*/ MODEL_NONE, /*pos*/ 0, 2229, 0, /*angle*/ 0, 180, 0, /*bhvParam*/ BPARAM2(WARP_NODE_0A), /*bhv*/ bhvSpinAirborneCircleWarp),
        WARP_NODE(/*id*/ WARP_NODE_0A,      /*destLevel*/ LEVEL_BOWSER_2, /*destArea*/ 1, /*destNode*/ WARP_NODE_0A, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_SUCCESS, /*destLevel*/ LEVEL_CASTLE,   /*destArea*/ 3, /*destNode*/ WARP_NODE_36, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ WARP_NODE_DEATH,   /*destLevel*/ LEVEL_BITFS,    /*destArea*/ 1, /*destNode*/ WARP_NODE_0C, /*flags*/ WARP_NO_CHECKPOINT),
        JUMP_LINK(script_func_local_1),
        TERRAIN(/*terrainData*/ bowser_2_seg7_collision_lava),
        SET_BACKGROUND_MUSIC(/*settingsPreset*/ 0x0002, /*seq*/ SEQ_LEVEL_BOSS_KOOPA),
        TERRAIN_TYPE(/*terrainType*/ TERRAIN_STONE),
    END_AREA(),

    FREE_LEVEL_POOL(),
    MARIO_POS(/*area*/ 1, /*yaw*/ 180, /*pos*/ 0, 1229, 0),
    CALL(/*arg*/ 0, /*func*/ lvl_init_or_update),
    CALL_LOOP(/*arg*/ 1, /*func*/ lvl_init_or_update),
    CLEAR_LEVEL(),
    SLEEP_BEFORE_EXIT(/*frames*/ 1),
    EXIT(),
};
