script_func_local_1:
    object /*model*/ MODEL_BITFS_PLATFORM_ON_TRACK,       /*pos*/ -5733, -3071,    0, /*angle*/ 0, 0, 0,   /*behParam*/ 0x07330000, /*beh*/ bhvPlatformOnTrack
    object /*model*/ MODEL_BITFS_TILTING_SQUARE_PLATFORM, /*pos*/ -1945, -3225, -715, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvBitfsTiltingSquarePlatform
    object /*model*/ MODEL_BITFS_TILTING_SQUARE_PLATFORM, /*pos*/ -2866, -3225, -715, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvBitfsTiltingSquarePlatform
    object /*model*/ MODEL_BITFS_SINKING_PLATFORMS,       /*pos*/ -1381,  3487,   96, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvBitfsSinkingPlatforms
    object /*model*/ MODEL_BITFS_SINKING_PLATFORMS,       /*pos*/  1126, -3065,  307, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvBitfsSinkingPlatforms
    object /*model*/ MODEL_BITFS_SINKING_PLATFORMS,       /*pos*/ -3225,  3487,   96, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvBitfsSinkingPlatforms
    object /*model*/ MODEL_BITFS_SINKING_CAGE_PLATFORM,   /*pos*/  6605, -3071,  266, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvBitfsSinkingCagePlatform
    object /*model*/ MODEL_BITFS_SINKING_CAGE_PLATFORM,   /*pos*/  1843,  3584,   96, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00010000, /*beh*/ bhvBitfsSinkingCagePlatform
    object /*model*/ MODEL_BITFS_SINKING_CAGE_PLATFORM,   /*pos*/   614,  3584,   96, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00010000, /*beh*/ bhvBitfsSinkingCagePlatform
    object /*model*/ MODEL_BITFS_SINKING_CAGE_PLATFORM,   /*pos*/  3072,  3584,   96, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00010000, /*beh*/ bhvBitfsSinkingCagePlatform
    object /*model*/ MODEL_BITFS_ELEVATOR,                /*pos*/  2867, -1279,  307, /*angle*/ 0, 0, 0,   /*behParam*/ 0x029F0000, /*beh*/ bhvActivatedBackAndForthPlatform
    object /*model*/ MODEL_BITFS_STRETCHING_PLATFORMS,    /*pos*/ -5836,   410,  300, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvSquishablePlatform
    object /*model*/ MODEL_BITFS_SEESAW_PLATFORM,         /*pos*/  4454, -2226,  266, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00040000, /*beh*/ bhvSeesawPlatform
    object /*model*/ MODEL_BITFS_SEESAW_PLATFORM,         /*pos*/  5786, -2380,  266, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00040000, /*beh*/ bhvSeesawPlatform
    object /*model*/ MODEL_BITFS_MOVING_SQUARE_PLATFORM,  /*pos*/ -3890,   102,  617, /*angle*/ 0, 90, 0,  /*behParam*/ 0x010C0000, /*beh*/ bhvSlidingPlatform2
    object /*model*/ MODEL_BITFS_MOVING_SQUARE_PLATFORM,  /*pos*/ -3276,   102,    2, /*angle*/ 0, 270, 0, /*behParam*/ 0x010C0000, /*beh*/ bhvSlidingPlatform2
    object /*model*/ MODEL_BITFS_SLIDING_PLATFORM,        /*pos*/  2103,   198,  312, /*angle*/ 0, 0, 0,   /*behParam*/ 0x019F0000, /*beh*/ bhvSlidingPlatform2
    object /*model*/ MODEL_BITFS_TUMBLING_PLATFORM,       /*pos*/  4979,  4250,   96, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00030000, /*beh*/ bhvWfTumblingBridge
    object /*model*/ MODEL_NONE,                          /*pos*/  3890, -2043,  266, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00520000, /*beh*/ bhvPoleGrabbing
    return

script_func_local_2:
    object /*model*/ MODEL_NONE, /*pos*/ -3226, 3584, -822, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvFlamethrower
    object /*model*/ MODEL_NONE, /*pos*/ -1382, 3584, -822, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvFlamethrower
    object /*model*/ MODEL_NONE, /*pos*/  1229,  307, -412, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvFlamethrower
    return

script_func_local_3:
    object /*model*/ MODEL_NONE, /*pos*/  1200, 5700,  160, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvBowserCourseRedCoinStar
    return

glabel level_bitfs_entry
    init_level
    load_mio0         /*seg*/ 0x07, /*romStart*/ _bitfs_segment_7SegmentRomStart, /*romEnd*/ _bitfs_segment_7SegmentRomEnd
    load_mio0_texture /*seg*/ 0x09, /*romStart*/ _sky_mio0SegmentRomStart, /*romEnd*/ _sky_mio0SegmentRomEnd
    load_mio0         /*seg*/ 0x0A, /*romStart*/ _bitfs_skybox_mio0SegmentRomStart, /*romEnd*/ _bitfs_skybox_mio0SegmentRomEnd
    load_mio0         /*seg*/ 0x0B, /*romStart*/ _effect_mio0SegmentRomStart, /*romEnd*/ _effect_mio0SegmentRomEnd
    load_mio0         /*seg*/ 0x05, /*romStart*/ _group2_mio0SegmentRomStart, /*romEnd*/ _group2_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0C, /*romStart*/ _group2_geoSegmentRomStart, /*romEnd*/ _group2_geoSegmentRomEnd
    load_mio0         /*seg*/ 0x06, /*romStart*/ _group17_mio0SegmentRomStart, /*romEnd*/ _group17_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0D, /*romStart*/ _group17_geoSegmentRomStart, /*romEnd*/ _group17_geoSegmentRomEnd
    load_mio0         /*seg*/ 0x08, /*romStart*/ _common0_mio0SegmentRomStart, /*romEnd*/ _common0_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0F, /*romStart*/ _common0_geoSegmentRomStart, /*romEnd*/ _common0_geoSegmentRomEnd
    alloc_level_pool
    mario /*model*/ MODEL_MARIO, /*behParam*/ 0x00000001, /*beh*/ bhvMario
    jump_link /*target*/ script_func_global_3
    jump_link /*target*/ script_func_global_18
    jump_link /*target*/ script_func_global_1
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_03,             /*geo*/ bitfs_geo_0004B0
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_04,             /*geo*/ bitfs_geo_0004C8
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_05,             /*geo*/ bitfs_geo_0004E0
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_06,             /*geo*/ bitfs_geo_0004F8
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_07,             /*geo*/ bitfs_geo_000510
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_08,             /*geo*/ bitfs_geo_000528
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_09,             /*geo*/ bitfs_geo_000540
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_0A,             /*geo*/ bitfs_geo_000558
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_0B,             /*geo*/ bitfs_geo_000570
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_0C,             /*geo*/ bitfs_geo_000588
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_0D,             /*geo*/ bitfs_geo_0005A0
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_0E,             /*geo*/ bitfs_geo_0005B8
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_0F,             /*geo*/ bitfs_geo_0005D0
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_10,             /*geo*/ bitfs_geo_0005E8
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_11,             /*geo*/ bitfs_geo_000600
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_12,             /*geo*/ bitfs_geo_000618
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_13,             /*geo*/ bitfs_geo_000630
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_14,             /*geo*/ bitfs_geo_000648
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_15,             /*geo*/ bitfs_geo_000660
    load_model_from_geo /*model*/ MODEL_BITFS_PLATFORM_ON_TRACK,       /*geo*/ bitfs_geo_000758
    load_model_from_geo /*model*/ MODEL_BITFS_TILTING_SQUARE_PLATFORM, /*geo*/ bitfs_geo_0006C0
    load_model_from_geo /*model*/ MODEL_BITFS_SINKING_PLATFORMS,       /*geo*/ bitfs_geo_000770
    load_model_from_geo /*model*/ MODEL_BITFS_BLUE_POLE,               /*geo*/ bitfs_geo_0006A8
    load_model_from_geo /*model*/ MODEL_BITFS_SINKING_CAGE_PLATFORM,   /*geo*/ bitfs_geo_000690
    load_model_from_geo /*model*/ MODEL_BITFS_ELEVATOR,                /*geo*/ bitfs_geo_000678
    load_model_from_geo /*model*/ MODEL_BITFS_STRETCHING_PLATFORMS,    /*geo*/ bitfs_geo_000708
    load_model_from_geo /*model*/ MODEL_BITFS_SEESAW_PLATFORM,         /*geo*/ bitfs_geo_000788
    load_model_from_geo /*model*/ MODEL_BITFS_MOVING_SQUARE_PLATFORM,  /*geo*/ bitfs_geo_000728
    load_model_from_geo /*model*/ MODEL_BITFS_SLIDING_PLATFORM,        /*geo*/ bitfs_geo_000740
    load_model_from_geo /*model*/ MODEL_BITFS_TUMBLING_PLATFORM_PART,  /*geo*/ bitfs_geo_0006D8
    load_model_from_geo /*model*/ MODEL_BITFS_TUMBLING_PLATFORM,       /*geo*/ bitfs_geo_0006F0

    area /*index*/ 1, /*geo*/ bitfs_geo_0007A0
        object /*model*/ MODEL_NONE, /*pos*/ -7577, -1764,  0, /*angle*/ 0, 90, 0, /*behParam*/ 0x000A0000, /*beh*/ bhvWarps64
        object /*model*/ MODEL_NONE, /*pos*/  6735,  3681, 99, /*angle*/ 0, 0, 0,  /*behParam*/ 0x140B0000, /*beh*/ bhvWarp
        object /*model*/ MODEL_NONE, /*pos*/  5886,  5000, 99, /*angle*/ 0, 90, 0, /*behParam*/ 0x000C0000, /*beh*/ bhvWarps70
        warp_node /*id*/ 0x0A, /*destLevel*/ 0x13, /*destArea*/ 0x01, /*destNode*/ 0x0A, /*unk6*/ 0x0000
        warp_node /*id*/ 0x0B, /*destLevel*/ 0x21, /*destArea*/ 0x01, /*destNode*/ 0x0A, /*unk6*/ 0x0000
        warp_node /*id*/ 0x0C, /*destLevel*/ 0x13, /*destArea*/ 0x01, /*destNode*/ 0x0C, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF1, /*destLevel*/ 0x06, /*destArea*/ 0x03, /*destNode*/ 0x68, /*unk6*/ 0x0000
        jump_link /*target*/ script_func_local_1
        jump_link /*target*/ script_func_local_2
        jump_link /*target*/ script_func_local_3
        terrain /*terrainData*/ bitfs_seg7_collision_level
        macro_objects /*objList*/ bitfs_seg7_macro_objs
        set_background_music /*unk2*/ 0x0000, /*seq*/ SEQ_LEVEL_KOOPA_ROAD
        terrain_type /*terrainType*/ TERRAIN_STONE
    end_area

    free_level_pool
    mario_pos /*area*/ 1, /*yaw*/ 90, /*pos*/ -7577, -2764, 0
    call /*arg*/ 0, /*func*/ lvl_init_or_update
    call_loop /*arg*/ 1, /*func*/ lvl_init_or_update
    clear_level
    sleep_before_exit /*frames*/ 1
    exit
