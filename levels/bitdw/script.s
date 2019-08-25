script_func_local_1:
    object /*model*/ MODEL_BITDW_SQUARE_PLATFORM,   /*pos*/ -1966, -3154,  3586, /*angle*/ 0, 0, 0,  /*behParam*/ 0x00000000, /*beh*/ bhvSquarishPathMoving
    object /*model*/ MODEL_BITDW_SQUARE_PLATFORM,   /*pos*/ -1352, -3154,  4200, /*angle*/ 0, 0, 0,  /*behParam*/ 0x00020000, /*beh*/ bhvSquarishPathMoving
    object /*model*/ MODEL_BITDW_SQUARE_PLATFORM,   /*pos*/ -2963,  1017, -2464, /*angle*/ 0, 0, 0,  /*behParam*/ 0x00000000, /*beh*/ bhvSquarishPathMoving
    object /*model*/ MODEL_BITDW_SQUARE_PLATFORM,   /*pos*/ -2349,  1017, -1849, /*angle*/ 0, 0, 0,  /*behParam*/ 0x00020000, /*beh*/ bhvSquarishPathMoving
    object /*model*/ MODEL_BITDW_SQUARE_PLATFORM,   /*pos*/ -2349,  1017, -1235, /*angle*/ 0, 0, 0,  /*behParam*/ 0x00000000, /*beh*/ bhvSquarishPathMoving
    object /*model*/ MODEL_BITDW_SQUARE_PLATFORM,   /*pos*/ -1735,  1017,  -621, /*angle*/ 0, 0, 0,  /*behParam*/ 0x00020000, /*beh*/ bhvSquarishPathMoving
    object /*model*/ MODEL_BITDW_SEESAW_PLATFORM,   /*pos*/  1491,  1273,   512, /*angle*/ 0, 90, 0, /*behParam*/ 0x00000000, /*beh*/ bhvSeesawPlatform
    object /*model*/ MODEL_BITDW_SEESAW_PLATFORM,   /*pos*/  -147,   894,   512, /*angle*/ 0, 90, 0, /*behParam*/ 0x00000000, /*beh*/ bhvSeesawPlatform
    object /*model*/ MODEL_BITDW_SLIDING_PLATFORM,  /*pos*/ -5728,   819, -2151, /*angle*/ 0, 0, 0,  /*behParam*/ 0x03CE0000, /*beh*/ bhvSlidingPlatform2
    object /*model*/ MODEL_BITDW_FERRIS_WHEEL_AXLE, /*pos*/  -204, -1924,  3381, /*angle*/ 0, 0, 0,  /*behParam*/ 0x00010000, /*beh*/ bhvFerrisWheelAxle
    object /*model*/ MODEL_BITDW_STAIRCASE,         /*pos*/  5279,  1740,    -6, /*angle*/ 0, 0, 0,  /*behParam*/ 0x00010000, /*beh*/ bhvAnimatesOnFloorSwitchPress
    object /*model*/ MODEL_PURPLE_SWITCH,           /*pos*/  3922,  1740,    -7, /*angle*/ 0, 0, 0,  /*behParam*/ 0x00000000, /*beh*/ bhvFloorSwitchAnimatesObject
    return

script_func_local_2:
    object /*model*/ MODEL_NONE, /*pos*/ -3092, -2795, 2842, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvFlamethrower
    object /*model*/ MODEL_NONE, /*pos*/  2463, -2386, 2844, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvFlamethrower
    return

script_func_local_3:
    object /*model*/ MODEL_NONE, /*pos*/  7180,  3000,    0, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvBowserCourseRedCoinStar
    return

glabel level_bitdw_entry
    init_level
    load_mio0         /*seg*/ 0x07, /*romStart*/ _bitdw_segment_7SegmentRomStart, /*romEnd*/ _bitdw_segment_7SegmentRomEnd
    load_mio0         /*seg*/ 0x0A, /*romStart*/ _bidw_skybox_mio0SegmentRomStart, /*romEnd*/ _bidw_skybox_mio0SegmentRomEnd
    load_mio0_texture /*seg*/ 0x09, /*romStart*/ _sky_mio0SegmentRomStart, /*romEnd*/ _sky_mio0SegmentRomEnd
    load_mio0         /*seg*/ 0x05, /*romStart*/ _group11_mio0SegmentRomStart, /*romEnd*/ _group11_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0C, /*romStart*/ _group11_geoSegmentRomStart,  /*romEnd*/ _group11_geoSegmentRomEnd
    load_mio0         /*seg*/ 0x06, /*romStart*/ _group17_mio0SegmentRomStart, /*romEnd*/ _group17_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0D, /*romStart*/ _group17_geoSegmentRomStart,  /*romEnd*/ _group17_geoSegmentRomEnd
    load_mio0         /*seg*/ 0x08, /*romStart*/ _common0_mio0SegmentRomStart, /*romEnd*/ _common0_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0F, /*romStart*/ _common0_geoSegmentRomStart,  /*romEnd*/ _common0_geoSegmentRomEnd
    alloc_level_pool
    mario /*model*/ MODEL_MARIO, /*behParam*/ 0x00000001, /*beh*/ bhvMario
    jump_link /*target*/ script_func_global_12
    jump_link /*target*/ script_func_global_18
    jump_link /*target*/ script_func_global_1
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_03,       /*geo*/ geo_bitdw_0003C0
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_04,       /*geo*/ geo_bitdw_0003D8
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_05,       /*geo*/ geo_bitdw_0003F0
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_06,       /*geo*/ geo_bitdw_000408
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_07,       /*geo*/ geo_bitdw_000420
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_08,       /*geo*/ geo_bitdw_000438
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_09,       /*geo*/ geo_bitdw_000450
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_0A,       /*geo*/ geo_bitdw_000468
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_0B,       /*geo*/ geo_bitdw_000480
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_0C,       /*geo*/ geo_bitdw_000498
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_0D,       /*geo*/ geo_bitdw_0004B0
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_0E,       /*geo*/ geo_bitdw_0004C8
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_0F,       /*geo*/ geo_bitdw_0004E0
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_10,       /*geo*/ geo_bitdw_0004F8
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_11,       /*geo*/ geo_bitdw_000510
    load_model_from_geo /*model*/ MODEL_BITDW_WARP_PIPE,         /*geo*/ warp_pipe_geo
    load_model_from_geo /*model*/ MODEL_BITDW_SQUARE_PLATFORM,   /*geo*/ geo_bitdw_000558
    load_model_from_geo /*model*/ MODEL_BITDW_SEESAW_PLATFORM,   /*geo*/ geo_bitdw_000540
    load_model_from_geo /*model*/ MODEL_BITDW_SLIDING_PLATFORM,  /*geo*/ geo_bitdw_000528
    load_model_from_geo /*model*/ MODEL_BITDW_FERRIS_WHEEL_AXLE, /*geo*/ geo_bitdw_000570
    load_model_from_geo /*model*/ MODEL_BITDW_BLUE_PLATFORM,     /*geo*/ geo_bitdw_000588
    load_model_from_geo /*model*/ MODEL_BITDW_STAIRCASE_FRAME4,  /*geo*/ geo_bitdw_0005A0
    load_model_from_geo /*model*/ MODEL_BITDW_STAIRCASE_FRAME3,  /*geo*/ geo_bitdw_0005B8
    load_model_from_geo /*model*/ MODEL_BITDW_STAIRCASE_FRAME2,  /*geo*/ geo_bitdw_0005D0
    load_model_from_geo /*model*/ MODEL_BITDW_STAIRCASE_FRAME1,  /*geo*/ geo_bitdw_0005E8
    load_model_from_geo /*model*/ MODEL_BITDW_STAIRCASE,         /*geo*/ geo_bitdw_000600

    area /*index*/ 1, /*geo*/ geo_bitdw_000618
        object /*model*/ MODEL_NONE,            /*pos*/ -7443, -2153, 3886, /*angle*/ 0, 90, 0, /*behParam*/ 0x000A0000, /*beh*/ bhvWarps64
        object /*model*/ MODEL_BITDW_WARP_PIPE, /*pos*/  6816,  2860,   -7, /*angle*/ 0, 0, 0,  /*behParam*/ 0x000B0000, /*beh*/ bhvWarpPipe
        object /*model*/ MODEL_NONE,            /*pos*/  5910,  3500,   -7, /*angle*/ 0, 90, 0, /*behParam*/ 0x000C0000, /*beh*/ bhvWarps70
        warp_node /*id*/ 0x0A, /*destLevel*/ 0x11, /*destArea*/ 0x01, /*destNode*/ 0x0A, /*unk6*/ 0x0000
        warp_node /*id*/ 0x0B, /*destLevel*/ 0x1E, /*destArea*/ 0x01, /*destNode*/ 0x0A, /*unk6*/ 0x0000
        warp_node /*id*/ 0x0C, /*destLevel*/ 0x11, /*destArea*/ 0x01, /*destNode*/ 0x0C, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF1, /*destLevel*/ 0x06, /*destArea*/ 0x01, /*destNode*/ 0x25, /*unk6*/ 0x0000
        jump_link /*target*/ script_func_local_1
        jump_link /*target*/ script_func_local_2
        jump_link /*target*/ script_func_local_3
        terrain /*terrainData*/ bitdw_seg7_collision_level
        macro_objects /*objList*/ bitdw_seg7_macro_objs
        show_dialog /*unk2*/ 0x00, /*dialogid*/ 0x5A
        set_background_music /*unk2*/ 0x0000, /*seq*/ SEQ_LEVEL_KOOPA_ROAD
        terrain_type /*terrainType*/ TERRAIN_STONE
    end_area

    free_level_pool
    mario_pos /*area*/ 1, /*yaw*/ 90, /*pos*/ -7443, -3153, 3886
    call /*arg*/ 0, /*func*/ lvl_init_or_update
    call_loop /*arg*/ 1, /*func*/ lvl_init_or_update
    clear_level
    sleep_before_exit /*frames*/ 1
    exit
