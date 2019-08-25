script_func_local_1:
    object /*model*/ MODEL_BITS_SLIDING_PLATFORM,       /*pos*/ -2370, -4525,     0, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00100000, /*beh*/ bhvSlidingPlatform2
    object /*model*/ MODEL_BITS_TWIN_SLIDING_PLATFORMS, /*pos*/ -2611,  3544,  -904, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00CF0000, /*beh*/ bhvSlidingPlatform2
    object /*model*/ MODEL_BITS_TWIN_SLIDING_PLATFORMS, /*pos*/ -4700,  3544,  -904, /*angle*/ 0, 180, 0, /*behParam*/ 0x008F0000, /*beh*/ bhvSlidingPlatform2
    object /*model*/ MODEL_BITS_OCTAGONAL_PLATFORM,     /*pos*/  4139, -1740, -1831, /*angle*/ 0, 0, 0,   /*behParam*/ 0x02000000, /*beh*/ bhvOctagonalPlatformRotating
    object /*model*/ MODEL_BITS_OCTAGONAL_PLATFORM,     /*pos*/ -6459,  1732,  -904, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvOctagonalPlatformRotating
    object /*model*/ MODEL_BITS_OCTAGONAL_PLATFORM,     /*pos*/ -4770,  1732,  -904, /*angle*/ 0, 0, 0,   /*behParam*/ 0x02000000, /*beh*/ bhvOctagonalPlatformRotating
    object /*model*/ MODEL_BITS_FERRIS_WHEEL_AXLE,      /*pos*/ -1748, -1330, -1094, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvFerrisWheelAxle
    object /*model*/ MODEL_BITS_FERRIS_WHEEL_AXLE,      /*pos*/  2275,  5628, -1315, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvFerrisWheelAxle
    object /*model*/ MODEL_BITS_FERRIS_WHEEL_AXLE,      /*pos*/  3114,  4701, -1320, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvFerrisWheelAxle
    object /*model*/ MODEL_BITS_ARROW_PLATFORM,         /*pos*/  2793,  2325,  -904, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00610000, /*beh*/ bhvActivatedBackAndForthPlatform
    object /*model*/ MODEL_BITS_SEESAW_PLATFORM,        /*pos*/    27, -1555,  -713, /*angle*/ 0, 90, 0,  /*behParam*/ 0x00010000, /*beh*/ bhvSeesawPlatform
    object /*model*/ MODEL_BITS_TILTING_W_PLATFORM,     /*pos*/  -306, -4300,     0, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00020000, /*beh*/ bhvSeesawPlatform
    object /*model*/ MODEL_BITS_STAIRCASE,              /*pos*/  1769,  -234,  -899, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvAnimatesOnFloorSwitchPress
    object /*model*/ MODEL_PURPLE_SWITCH,               /*pos*/  -279,  -234,  -900, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvFloorSwitchAnimatesObject
    object /*model*/ MODEL_NONE,                        /*pos*/ -6460,  2039,  -905, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00CF0000, /*beh*/ bhvPoleGrabbing
    object /*model*/ MODEL_NONE,                        /*pos*/ -3326,  3227,  -905, /*angle*/ 0, 0, 0,   /*behParam*/ 0x004D0000, /*beh*/ bhvPoleGrabbing
    object /*model*/ MODEL_NONE,                        /*pos*/  5518,  3184, -4019, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvFlamethrower
    object /*model*/ MODEL_NONE,                        /*pos*/  6465,  3731, -1915, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvFlamethrower
    object /*model*/ MODEL_NONE,                        /*pos*/  5915,  3718, -4019, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvFlamethrower
    return

script_func_local_2:
    object /*model*/ MODEL_NONE, /*pos*/ 350, 6800, -6800, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvBowserCourseRedCoinStar
    return

glabel level_bits_entry
    init_level
    load_mio0         /*seg*/ 0x07, /*romStart*/ _bits_segment_7SegmentRomStart, /*romEnd*/ _bits_segment_7SegmentRomEnd
    load_mio0         /*seg*/ 0x0A, /*romStart*/ _bits_skybox_mio0SegmentRomStart, /*romEnd*/ _bits_skybox_mio0SegmentRomEnd
    load_mio0_texture /*seg*/ 0x09, /*romStart*/ _sky_mio0SegmentRomStart, /*romEnd*/ _sky_mio0SegmentRomEnd
    load_mio0         /*seg*/ 0x06, /*romStart*/ _group14_mio0SegmentRomStart, /*romEnd*/ _group14_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0D, /*romStart*/ _group14_geoSegmentRomStart,  /*romEnd*/ _group14_geoSegmentRomEnd
    load_mio0         /*seg*/ 0x08, /*romStart*/ _common0_mio0SegmentRomStart, /*romEnd*/ _common0_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0F, /*romStart*/ _common0_geoSegmentRomStart,  /*romEnd*/ _common0_geoSegmentRomEnd
    alloc_level_pool
    mario /*model*/ MODEL_MARIO, /*behParam*/ 0x00000001, /*beh*/ bhvMario
    jump_link /*target*/ script_func_global_15
    jump_link /*target*/ script_func_global_1
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_03,           /*geo*/ bits_geo_000430
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_04,           /*geo*/ bits_geo_000448
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_05,           /*geo*/ bits_geo_000460
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_06,           /*geo*/ bits_geo_000478
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_07,           /*geo*/ bits_geo_000490
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_08,           /*geo*/ bits_geo_0004A8
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_09,           /*geo*/ bits_geo_0004C0
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_0A,           /*geo*/ bits_geo_0004D8
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_0B,           /*geo*/ bits_geo_0004F0
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_0C,           /*geo*/ bits_geo_000508
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_0D,           /*geo*/ bits_geo_000520
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_0E,           /*geo*/ bits_geo_000538
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_0F,           /*geo*/ bits_geo_000550
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_10,           /*geo*/ bits_geo_000568
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_11,           /*geo*/ bits_geo_000580
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_12,           /*geo*/ bits_geo_000598
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_13,           /*geo*/ bits_geo_0005B0
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_14,           /*geo*/ bits_geo_0005C8
    load_model_from_geo /*model*/ MODEL_BITS_SLIDING_PLATFORM,       /*geo*/ bits_geo_0005E0
    load_model_from_geo /*model*/ MODEL_BITS_TWIN_SLIDING_PLATFORMS, /*geo*/ bits_geo_0005F8
    load_model_from_geo /*model*/ MODEL_BITS_OCTAGONAL_PLATFORM,     /*geo*/ bits_geo_000610
    load_model_from_geo /*model*/ MODEL_BITS_BLUE_PLATFORM,          /*geo*/ bits_geo_000628
    load_model_from_geo /*model*/ MODEL_BITS_FERRIS_WHEEL_AXLE,      /*geo*/ bits_geo_000640
    load_model_from_geo /*model*/ MODEL_BITS_ARROW_PLATFORM,         /*geo*/ bits_geo_000658
    load_model_from_geo /*model*/ MODEL_BITS_SEESAW_PLATFORM,        /*geo*/ bits_geo_000670
    load_model_from_geo /*model*/ MODEL_BITS_TILTING_W_PLATFORM,     /*geo*/ bits_geo_000688
    load_model_from_geo /*model*/ MODEL_BITS_STAIRCASE,              /*geo*/ bits_geo_0006A0
    load_model_from_geo /*model*/ MODEL_BITS_STAIRCASE_FRAME1,       /*geo*/ bits_geo_0006B8
    load_model_from_geo /*model*/ MODEL_BITS_STAIRCASE_FRAME2,       /*geo*/ bits_geo_0006D0
    load_model_from_geo /*model*/ MODEL_BITS_STAIRCASE_FRAME3,       /*geo*/ bits_geo_0006E8
    load_model_from_geo /*model*/ MODEL_BITS_STAIRCASE_FRAME4,       /*geo*/ bits_geo_000700
    load_model_from_geo /*model*/ MODEL_BITS_WARP_PIPE,              /*geo*/ warp_pipe_geo

    area /*index*/ 1, /*geo*/ bits_geo_000718
        object /*model*/ MODEL_NONE,           /*pos*/ -7039, -3812,     4, /*angle*/ 0, 90, 0,  /*behParam*/ 0x000A0000, /*beh*/ bhvWarps64
        object /*model*/ MODEL_BITS_WARP_PIPE, /*pos*/   351,  6652, -6030, /*angle*/ 0, 0, 0,   /*behParam*/ 0x000B0000, /*beh*/ bhvWarpPipe
        object /*model*/ MODEL_NONE,           /*pos*/   351,  6800, -3900, /*angle*/ 0, 180, 0, /*behParam*/ 0x000C0000, /*beh*/ bhvWarps70
        warp_node /*id*/ 0x0A, /*destLevel*/ 0x15, /*destArea*/ 0x01, /*destNode*/ 0x0A, /*unk6*/ 0x0000
        warp_node /*id*/ 0x0B, /*destLevel*/ 0x22, /*destArea*/ 0x01, /*destNode*/ 0x0A, /*unk6*/ 0x0000
        warp_node /*id*/ 0x0C, /*destLevel*/ 0x15, /*destArea*/ 0x01, /*destNode*/ 0x0C, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF1, /*destLevel*/ 0x06, /*destArea*/ 0x02, /*destNode*/ 0x6B, /*unk6*/ 0x0000
        jump_link /*target*/ script_func_local_1
        jump_link /*target*/ script_func_local_2
        terrain /*terrainData*/ bits_seg7_collision_level
        macro_objects /*objList*/ bits_seg7_macro_objs
        set_background_music /*unk2*/ 0x0000, /*seq*/ SEQ_LEVEL_KOOPA_ROAD
        terrain_type /*terrainType*/ TERRAIN_STONE
    end_area

    free_level_pool
    mario_pos /*area*/ 1, /*yaw*/ 90, /*pos*/ -7039, -4812, 4
    call /*arg*/ 0, /*func*/ lvl_init_or_update
    call_loop /*arg*/ 1, /*func*/ lvl_init_or_update
    clear_level
    sleep_before_exit /*frames*/ 1
    exit
