script_func_local_1:
    object /*model*/ MODEL_SSL_PYRAMID_TOP, /*pos*/ -2047, 1536, -1023, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvPyramidTop
    return

script_func_local_2:
    object /*model*/ MODEL_SSL_TOX_BOX,     /*pos*/ -1284,    0, -5895, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvToxBox
    object /*model*/ MODEL_SSL_TOX_BOX,     /*pos*/  1283,    0, -4865, /*angle*/ 0, 0, 0, /*behParam*/ 0x00010000, /*beh*/ bhvToxBox
    object /*model*/ MODEL_SSL_TOX_BOX,     /*pos*/  4873,    0, -3335, /*angle*/ 0, 0, 0, /*behParam*/ 0x00020000, /*beh*/ bhvToxBox
    object /*model*/ MODEL_TORNADO,         /*pos*/ -3600, -200,  2940, /*angle*/ 0, 0, 0, /*behParam*/ 0x00120000, /*beh*/ bhvTornado
    object /*model*/ MODEL_TORNADO,         /*pos*/  1017, -200,  3832, /*angle*/ 0, 0, 0, /*behParam*/ 0x00190000, /*beh*/ bhvTornado, /*acts*/ ACT_4 | ACT_5 | ACT_6
    object /*model*/ MODEL_TORNADO,         /*pos*/  3066, -200,   400, /*angle*/ 0, 0, 0, /*behParam*/ 0x00190000, /*beh*/ bhvTornado, /*acts*/ ACT_4 | ACT_5 | ACT_6
    object /*model*/ MODEL_KLEPTO,          /*pos*/  2200, 1174, -2820, /*angle*/ 0, 0, 0, /*behParam*/ 0x00010000, /*beh*/ bhvKlepto,     /*acts*/ ACT_1
    object /*model*/ MODEL_KLEPTO,          /*pos*/ -5963,  573, -4784, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvKlepto,     /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6
    return

script_func_local_3:
    object /*model*/ MODEL_STAR, /*pos*/ -2050, 1200, -580, /*angle*/ 0, 0, 0, /*behParam*/ 0x01000000, /*beh*/ bhvStar,                 /*acts*/ ALL_ACTS
    object /*model*/ MODEL_NONE, /*pos*/  6000,  800, 3500, /*angle*/ 0, 0, 0, /*behParam*/ 0x04000000, /*beh*/ bhvHiddenRedCoinStar, /*acts*/ ALL_ACTS
    return

script_func_local_4:
    object /*model*/ MODEL_NONE,                    /*pos*/  2867,  640,  2867, /*angle*/ 0,   0, 0, /*behParam*/ 0x004D0000, /*beh*/ bhvPoleGrabbing
    object /*model*/ MODEL_NONE,                    /*pos*/     0, 3200,  1331, /*angle*/ 0,   0, 0, /*behParam*/ 0x005C0000, /*beh*/ bhvPoleGrabbing
    object /*model*/ MODEL_SSL_GRINDEL,             /*pos*/  3297,    0,    95, /*angle*/ 0,   0, 0, /*behParam*/ 0x001C0000, /*beh*/ bhvGrindel
    object /*model*/ MODEL_SSL_GRINDEL,             /*pos*/  -870, 3840,   105, /*angle*/ 0, 180, 0, /*behParam*/ 0x00000000, /*beh*/ bhvHorizontalGrindel
    object /*model*/ MODEL_SSL_GRINDEL,             /*pos*/ -3362,    0, -1385, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvHorizontalGrindel
    object /*model*/ MODEL_SSL_SPINDEL,             /*pos*/ -2458, 2109, -1430, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvSpindel
    object /*model*/ MODEL_SSL_MOVING_PYRAMID_WALL, /*pos*/   858, 1927, -2307, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvSslMovingPyramidWall
    object /*model*/ MODEL_SSL_MOVING_PYRAMID_WALL, /*pos*/   730, 1927, -2307, /*angle*/ 0,   0, 0, /*behParam*/ 0x00010000, /*beh*/ bhvSslMovingPyramidWall
    object /*model*/ MODEL_SSL_MOVING_PYRAMID_WALL, /*pos*/  1473, 2567, -2307, /*angle*/ 0,   0, 0, /*behParam*/ 0x00010000, /*beh*/ bhvSslMovingPyramidWall
    object /*model*/ MODEL_SSL_MOVING_PYRAMID_WALL, /*pos*/  1345, 2567, -2307, /*angle*/ 0,   0, 0, /*behParam*/ 0x00020000, /*beh*/ bhvSslMovingPyramidWall
    object /*model*/ MODEL_SSL_PYRAMID_ELEVATOR,    /*pos*/     0, 4966,   256, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvPyramidElevator
    object /*model*/ MODEL_NONE,                    /*pos*/  1198, -133,  2396, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvSandSoundLoop
    object /*model*/ MODEL_NONE,                    /*pos*/     7, 1229,  -708, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvSandSoundLoop
    object /*model*/ MODEL_NONE,                    /*pos*/     7, 4317,  -708, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvSandSoundLoop
    return

script_func_local_5:
    object /*model*/ MODEL_STAR, /*pos*/ 500, 5050, -500, /*angle*/ 0, 0, 0, /*behParam*/ 0x02000000, /*beh*/ bhvStar,        /*acts*/ ALL_ACTS
    object /*model*/ MODEL_NONE, /*pos*/ 900, 1400, 2350, /*angle*/ 0, 0, 0, /*behParam*/ 0x05040000, /*beh*/ bhvHiddenStar, /*acts*/ ALL_ACTS
    return

script_func_local_6:
    object /*model*/ MODEL_NONE, /*pos*/ 0, -1534, -3693, /*angle*/ 0, 0, 0, /*behParam*/ 0x03000000, /*beh*/ bhvEyerokBoss
    return

glabel level_ssl_entry
    init_level
    load_mio0         /*seg*/ 0x07, /*romStart*/ _ssl_segment_7SegmentRomStart, /*romEnd*/ _ssl_segment_7SegmentRomEnd
    load_mio0         /*seg*/ 0x0A, /*romStart*/ _ssl_skybox_mio0SegmentRomStart, /*romEnd*/ _ssl_skybox_mio0SegmentRomEnd
    load_mio0_texture /*seg*/ 0x09, /*romStart*/ _generic_mio0SegmentRomStart, /*romEnd*/ _generic_mio0SegmentRomEnd
    load_mio0         /*seg*/ 0x05, /*romStart*/ _group5_mio0SegmentRomStart, /*romEnd*/ _group5_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0C, /*romStart*/ _group5_geoSegmentRomStart,  /*romEnd*/ _group5_geoSegmentRomEnd
    load_mio0         /*seg*/ 0x08, /*romStart*/ _common0_mio0SegmentRomStart, /*romEnd*/ _common0_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0F, /*romStart*/ _common0_geoSegmentRomStart,  /*romEnd*/ _common0_geoSegmentRomEnd
    alloc_level_pool
    mario /*model*/ MODEL_MARIO, /*behParam*/ 0x00000001, /*beh*/ bhvMario
    jump_link /*target*/ script_func_global_1
    jump_link /*target*/ script_func_global_6
    load_model_from_geo /*model*/ MODEL_SSL_PALM_TREE,           /*geo*/ palm_tree_geo
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_03,       /*geo*/ ssl_geo_0005C0
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_04,       /*geo*/ ssl_geo_0005D8
    load_model_from_geo /*model*/ MODEL_SSL_PYRAMID_TOP,         /*geo*/ ssl_geo_000618
    load_model_from_geo /*model*/ MODEL_SSL_GRINDEL,             /*geo*/ ssl_geo_000734
    load_model_from_geo /*model*/ MODEL_SSL_SPINDEL,             /*geo*/ ssl_geo_000764
    load_model_from_geo /*model*/ MODEL_SSL_MOVING_PYRAMID_WALL, /*geo*/ ssl_geo_000794
    load_model_from_geo /*model*/ MODEL_SSL_PYRAMID_ELEVATOR,    /*geo*/ ssl_geo_0007AC
    load_model_from_geo /*model*/ MODEL_SSL_TOX_BOX,             /*geo*/ ssl_geo_000630

    area /*index*/ 1, /*geo*/ ssl_geo_000648
        object /*model*/ MODEL_NONE, /*pos*/   653, 1038,  6566, /*angle*/ 0,  90, 0, /*behParam*/ 0x000A0000, /*beh*/ bhvWarps74
        object /*model*/ MODEL_NONE, /*pos*/ -2048,    0,    56, /*angle*/ 0,   0, 0, /*behParam*/ 0x00140000, /*beh*/ bhvWarp
        object /*model*/ MODEL_NONE, /*pos*/ -2048,  768, -1024, /*angle*/ 0,   0, 0, /*behParam*/ 0x0F1E0000, /*beh*/ bhvWarp
        object /*model*/ MODEL_NONE, /*pos*/  6930,    0, -4871, /*angle*/ 0, 159, 0, /*behParam*/ 0x001F0000, /*beh*/ bhvFadingWarp
        object /*model*/ MODEL_NONE, /*pos*/ -5943,    0, -4903, /*angle*/ 0,  49, 0, /*behParam*/ 0x00200000, /*beh*/ bhvFadingWarp
        warp_node /*id*/ 0x0A, /*destLevel*/ 0x08, /*destArea*/ 0x01, /*destNode*/ 0x0A, /*unk6*/ 0x0000
        warp_node /*id*/ 0x14, /*destLevel*/ 0x08, /*destArea*/ 0x02, /*destNode*/ 0x0A, /*unk6*/ 0x8000
        warp_node /*id*/ 0x1E, /*destLevel*/ 0x08, /*destArea*/ 0x02, /*destNode*/ 0x14, /*unk6*/ 0x8000
        warp_node /*id*/ 0x1F, /*destLevel*/ 0x08, /*destArea*/ 0x01, /*destNode*/ 0x20, /*unk6*/ 0x0000
        warp_node /*id*/ 0x20, /*destLevel*/ 0x08, /*destArea*/ 0x01, /*destNode*/ 0x1F, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF0, /*destLevel*/ 0x06, /*destArea*/ 0x03, /*destNode*/ 0x33, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF1, /*destLevel*/ 0x06, /*destArea*/ 0x03, /*destNode*/ 0x65, /*unk6*/ 0x0000
        jump_link /*target*/ script_func_local_1
        jump_link /*target*/ script_func_local_2
        jump_link /*target*/ script_func_local_3
        terrain /*terrainData*/ ssl_seg7_area_1_collision
        macro_objects /*objList*/ ssl_seg7_area_1_macro_objs
        set_background_music /*unk2*/ 0x0000, /*seq*/ SEQ_LEVEL_HOT
        terrain_type /*terrainType*/ TERRAIN_SAND
    end_area

    area /*index*/ 2, /*geo*/ ssl_geo_0007CC
        object /*model*/ MODEL_NONE, /*pos*/    0,  300,  6451, /*angle*/ 0, 180, 0, /*behParam*/ 0x000A0000, /*beh*/ bhvWarps64
        object /*model*/ MODEL_NONE, /*pos*/    0, 5500,   256, /*angle*/ 0, 180, 0, /*behParam*/ 0x00140000, /*beh*/ bhvWarps64
        object /*model*/ MODEL_NONE, /*pos*/ 3070, 1280,  2900, /*angle*/ 0, 180, 0, /*behParam*/ 0x00150000, /*beh*/ bhvFadingWarp
        object /*model*/ MODEL_NONE, /*pos*/ 2546, 1150, -2647, /*angle*/ 0,  78, 0, /*behParam*/ 0x00160000, /*beh*/ bhvFadingWarp
        warp_node /*id*/ 0x0A, /*destLevel*/ 0x08, /*destArea*/ 0x02, /*destNode*/ 0x0A, /*unk6*/ 0x0000
        warp_node /*id*/ 0x14, /*destLevel*/ 0x08, /*destArea*/ 0x02, /*destNode*/ 0x14, /*unk6*/ 0x0000
        warp_node /*id*/ 0x15, /*destLevel*/ 0x08, /*destArea*/ 0x02, /*destNode*/ 0x16, /*unk6*/ 0x0000
        warp_node /*id*/ 0x16, /*destLevel*/ 0x08, /*destArea*/ 0x02, /*destNode*/ 0x15, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF0, /*destLevel*/ 0x06, /*destArea*/ 0x03, /*destNode*/ 0x33, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF1, /*destLevel*/ 0x06, /*destArea*/ 0x03, /*destNode*/ 0x65, /*unk6*/ 0x0000
        jump_link /*target*/ script_func_local_4
        jump_link /*target*/ script_func_local_5
        instant_warp /*index*/ 3, /*destArea*/ 3, /*displace*/ 0, 0, 0
        terrain /*terrainData*/ ssl_seg7_area_2_collision
        macro_objects /*objList*/ ssl_seg7_area_2_macro_objs
        set_background_music /*unk2*/ 0x0004, /*seq*/ SEQ_LEVEL_UNDERGROUND
        terrain_type /*terrainType*/ TERRAIN_STONE
    end_area

    area /*index*/ 3, /*geo*/ ssl_geo_00088C
        warp_node /*id*/ 0xF0, /*destLevel*/ 0x06, /*destArea*/ 0x03, /*destNode*/ 0x33, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF1, /*destLevel*/ 0x06, /*destArea*/ 0x03, /*destNode*/ 0x65, /*unk6*/ 0x0000
        jump_link /*target*/ script_func_local_6
        terrain /*terrainData*/ ssl_seg7_area_3_collision
        macro_objects /*objList*/ ssl_seg7_area_3_macro_objs
        instant_warp /*index*/ 2, /*destArea*/ 2, /*displace*/ 0, 0, 0
        set_background_music /*unk2*/ 0x0004, /*seq*/ SEQ_LEVEL_UNDERGROUND
        terrain_type /*terrainType*/ TERRAIN_STONE
    end_area

    free_level_pool
    mario_pos /*area*/ 1, /*yaw*/ 88, /*pos*/ 653, 38, 6566
    call /*arg*/ 0, /*func*/ lvl_init_or_update
    call_loop /*arg*/ 1, /*func*/ lvl_init_or_update
    clear_level
    sleep_before_exit /*frames*/ 1
    exit
