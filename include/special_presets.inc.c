#include "special_presets.h"

// Special Preset types
#define SPTYPE_NO_YROT_OR_PARAMS  0 // object is 8-bytes long, no y-rotation or any behavior params
#define SPTYPE_YROT_NO_PARAMS     1 // object is 10-bytes long, has y-rotation but no params
#define SPTYPE_PARAMS_AND_YROT    2 // object is 12-bytes long, has y-rotation and params
#define SPTYPE_UNKNOWN            3 // object is 14-bytes long, has 3 extra shorts that get converted to floats.
#define SPTYPE_DEF_PARAM_AND_YROT 4 // object is 10-bytes long, has y-rotation and uses the default param

struct SpecialPreset {
    /* 0x00 */ u8  presetID;
    /* 0x01 */ u8  type;      // Determines whether object is 8, 10, 12 or 14 bytes long.
    /* 0x02 */ u8  defParam;  // Default parameter, only used when type is SPTYPE_DEF_PARAM_AND_YROT
    /* 0x03 */ u8  model;
    /* 0x04 */ const BehaviorScript *behavior;
};

// Some Models ID's are missing their names because they are probably unused

static struct SpecialPreset sSpecialObjectPresets[] = {
    { special_null_start,                         SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_NONE, NULL },
    { special_yellow_coin,                        SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_YELLOW_COIN, bhvYellowCoin },
    { special_yellow_coin_2,                      SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_YELLOW_COIN, bhvYellowCoin },
    { special_unknown_3,                          SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_UNKNOWN_B8, bhvStaticObject },
    { special_boo,                                SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_BOO, bhvCourtyardBooTriplet },
    { special_unknown_5,                          SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_UNKNOWN_AC, bhvCastleFloorTrap },
    { special_lll_moving_octagonal_mesh_platform, SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_LLL_MOVING_OCTAGONAL_MESH_PLATFORM, bhvLLLMovingOctagonalMeshPlatform },
    { special_snow_ball,                          SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_CCM_SNOWMAN_HEAD, bhvSnowBall },
    { special_lll_drawbridge_spawner,             SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_LLL_DRAWBRIDGE_PART, bhvLLLDrawbridgeSpawner },
    { special_empty_9,                            SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_NONE, bhvStaticObject },
    { special_lll_rotating_block_with_fire_bars,  SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_LLL_ROTATING_BLOCK_FIRE_BARS, bhvLLLRotatingBlockWithFireBars },
    { special_lll_floating_wood_bridge,           SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_NONE, bhvLLLFloatingWoodBridge },
    { special_tumbling_platform,                  SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_NONE, bhvLLLTumblingBridge },
    { special_lll_rotating_hexagonal_ring,        SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_LLL_ROTATING_HEXAGONAL_RING , bhvLLLRotatingHexagonalRing },
    { special_lll_sinking_rectangular_platform,   SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_LLL_SINKING_RECTANGULAR_PLATFORM, bhvLLLSinkingRectangularPlatform },
    { special_lll_sinking_square_platforms,       SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_LLL_SINKING_SQUARE_PLATFORMS, bhvLLLSinkingSquarePlatforms },
    { special_lll_tilting_square_platform,        SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_LLL_TILTING_SQUARE_PLATFORM, bhvLLLTiltingInvertedPyramid },
    { special_lll_bowser_puzzle,                  SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_NONE, bhvLLLBowserPuzzle },
    { special_mr_i,                               SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_NONE, bhvMrI },
    { special_small_bully,                        SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_BULLY, bhvSmallBully },
    { special_big_bully,                          SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_BULLY_BOSS, bhvBigBully },
    { special_empty_21,                           SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_NONE, bhvStaticObject },
    { special_empty_22,                           SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_NONE, bhvStaticObject },
    { special_empty_23,                           SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_NONE, bhvStaticObject },
    { special_empty_24,                           SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_NONE, bhvStaticObject },
    { special_empty_25,                           SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_NONE, bhvStaticObject },
    { special_moving_blue_coin,                   SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_YELLOW_COIN, bhvMovingBlueCoin },
    { special_jrb_chest,                          SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_TREASURE_CHEST_BASE, bhvBetaChestBottom },
    { special_water_ring,                         SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_WATER_RING, bhvJetStreamRingSpawner },
    { special_mine,                               SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_WATER_MINE, bhvBowserBomb },
    { special_empty_30,                           SPTYPE_UNKNOWN,            0x00, MODEL_NONE, bhvStaticObject },
    { special_empty_31,                           SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_NONE, bhvStaticObject },
    { special_butterfly,                          SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_BUTTERFLY, bhvButterfly },
    { special_bowser,                             SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_BOWSER, bhvBowser },
    { special_wf_rotating_wooden_platform,        SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_WF_ROTATING_WOODEN_PLATFORM, bhvWFRotatingWoodenPlatform },
    { special_small_bomp,                         SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_WF_SMALL_BOMP, bhvSmallBomp },
    { special_wf_sliding_platform,                SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_WF_SLIDING_PLATFORM, bhvWFSlidingPlatform },
    { special_tower_platform_group,               SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_NONE, bhvTowerPlatformGroup },
    { special_rotating_counter_clockwise,         SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_NONE, bhvRotatingCounterClockwise },
    { special_wf_tumbling_bridge,                 SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_WF_TUMBLING_BRIDGE, bhvTumblingBridge },
    { special_large_bomp,                         SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_WF_LARGE_BOMP, bhvLargeBomp },
    { special_level_geo_03,                       SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_LEVEL_GEOMETRY_03, bhvStaticObject },
    { special_level_geo_04,                       SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_LEVEL_GEOMETRY_04, bhvStaticObject },
    { special_level_geo_05,                       SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_LEVEL_GEOMETRY_05, bhvStaticObject },
    { special_level_geo_06,                       SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_LEVEL_GEOMETRY_06, bhvStaticObject },
    { special_level_geo_07,                       SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_LEVEL_GEOMETRY_07, bhvStaticObject },
    { special_level_geo_08,                       SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_LEVEL_GEOMETRY_08, bhvStaticObject },
    { special_level_geo_09,                       SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_LEVEL_GEOMETRY_09, bhvStaticObject },
    { special_level_geo_0A,                       SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_LEVEL_GEOMETRY_0A, bhvStaticObject },
    { special_level_geo_0B,                       SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_LEVEL_GEOMETRY_0B, bhvStaticObject },
    { special_level_geo_0C,                       SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_LEVEL_GEOMETRY_0C, bhvStaticObject },
    { special_level_geo_0D,                       SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_LEVEL_GEOMETRY_0D, bhvStaticObject },
    { special_level_geo_0E,                       SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_LEVEL_GEOMETRY_0E, bhvStaticObject },
    { special_level_geo_0F,                       SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_LEVEL_GEOMETRY_0F, bhvStaticObject },
    { special_level_geo_10,                       SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_LEVEL_GEOMETRY_10, bhvStaticObject },
    { special_level_geo_11,                       SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_LEVEL_GEOMETRY_11, bhvStaticObject },
    { special_level_geo_12,                       SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_LEVEL_GEOMETRY_12, bhvStaticObject },
    { special_level_geo_13,                       SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_LEVEL_GEOMETRY_13, bhvStaticObject },
    { special_level_geo_14,                       SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_LEVEL_GEOMETRY_14, bhvStaticObject },
    { special_level_geo_15,                       SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_LEVEL_GEOMETRY_15, bhvStaticObject },
    { special_level_geo_16,                       SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_LEVEL_GEOMETRY_16, bhvStaticObject },
    { special_bubble_tree,                        SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_BOB_BUBBLY_TREE, bhvTree },
    { special_spiky_tree,                         SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_COURTYARD_SPIKY_TREE, bhvTree },
    { special_snow_tree,                          SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_CCM_SNOW_TREE, bhvTree },
    { special_unknown_tree,                       SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_UNKNOWN_TREE_1A, bhvTree },
    { special_palm_tree,                          SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_SSL_PALM_TREE, bhvTree },
    { special_castle_door,                        SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_CASTLE_CASTLE_DOOR_UNUSED, bhvDoor },
    { special_wooden_door,                        SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_CASTLE_WOODEN_DOOR_UNUSED, bhvDoor },
    { special_unknown_door,                       SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_UNKNOWN_DOOR_1E, bhvDoor },
    { special_metal_door,                         SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_HMC_METAL_DOOR, bhvDoor },
    { special_hmc_door,                           SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_HMC_HAZY_MAZE_DOOR, bhvDoor },
    { special_unknown2_door,                      SPTYPE_YROT_NO_PARAMS,     0x00, MODEL_UNKNOWN_DOOR_21, bhvDoor },
    { special_0stars_door,                        SPTYPE_DEF_PARAM_AND_YROT, 0x00, MODEL_CASTLE_DOOR_0_STARS, bhvDoor },
    { special_1star_door,                         SPTYPE_DEF_PARAM_AND_YROT, 0x01, MODEL_CASTLE_DOOR_1_STAR, bhvDoor },
    { special_3star_door,                         SPTYPE_DEF_PARAM_AND_YROT, 0x03, MODEL_CASTLE_DOOR_3_STARS, bhvDoor },
    { special_key_door,                           SPTYPE_DEF_PARAM_AND_YROT, 0x00, MODEL_CASTLE_KEY_DOOR, bhvDoor },
    { special_castle_door_warp,                   SPTYPE_PARAMS_AND_YROT,    0x00, MODEL_CASTLE_CASTLE_DOOR, bhvDoorWarp },
    { special_wooden_door_warp,                   SPTYPE_PARAMS_AND_YROT,    0x00, MODEL_CASTLE_WOODEN_DOOR, bhvDoorWarp },
    { special_unknown1_door_warp,                 SPTYPE_PARAMS_AND_YROT,    0x00, MODEL_UNKNOWN_DOOR_28, bhvDoorWarp },
    { special_metal_door_warp,                    SPTYPE_PARAMS_AND_YROT,    0x00, MODEL_CASTLE_METAL_DOOR, bhvDoorWarp },
    { special_unknown2_door_warp,                 SPTYPE_PARAMS_AND_YROT,    0x00, MODEL_UNKNOWN_DOOR_2A, bhvDoorWarp },
    { special_unknown3_door_warp,                 SPTYPE_PARAMS_AND_YROT,    0x00, MODEL_UNKNOWN_DOOR_2B, bhvDoorWarp },
    { special_null_end,                           SPTYPE_NO_YROT_OR_PARAMS,  0x00, MODEL_NONE, NULL },
};
