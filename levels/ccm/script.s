script_func_local_1:
    object /*model*/ MODEL_CCM_ROPEWAY_LIFT, /*pos*/ 531, -4430, 6426,    /*angle*/ 0,   0, 0, /*behParam*/ 0x07120000, /*beh*/ bhvPlatformOnTrack
    return

script_func_local_2:
    object /*model*/ MODEL_PENGUIN,          /*pos*/  2650, -3735,  3970, /*angle*/ 0,   0, 0, /*behParam*/ 0x00010000, /*beh*/ bhvSmallPenguin
    object /*model*/ MODEL_PENGUIN,          /*pos*/  -555,  3470, -1000, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvSmallPenguin
    object /*model*/ MODEL_MR_BLIZZARD,      /*pos*/ -2376, -1589,  4256, /*angle*/ 0, 252, 0, /*behParam*/ 0x00010000, /*beh*/ bhvMrBlizzard
    object /*model*/ MODEL_MR_BLIZZARD,      /*pos*/  -394, -1589,  4878, /*angle*/ 0,  74, 0, /*behParam*/ 0x00010000, /*beh*/ bhvMrBlizzard
    object /*model*/ MODEL_CCM_SNOWMAN_BASE, /*pos*/  2560,  2662, -1122, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvSnowmansBottom, /*acts*/ ACT_5
    return

script_func_local_3:
    object /*model*/ MODEL_NONE,             /*pos*/  2665, -4607,  4525, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvCcmTouchedStarSpawn, /*acts*/ ALL_ACTS
    object /*model*/ MODEL_PENGUIN,          /*pos*/  3450, -4700,  4550, /*angle*/ 0,   0, 0, /*behParam*/ 0x01000000, /*beh*/ bhvTuxiesMother,          /*acts*/ ALL_ACTS
    object /*model*/ MODEL_NONE,             /*pos*/  4200,  -927,   400, /*angle*/ 0,   0, 0, /*behParam*/ 0x03000000, /*beh*/ bhvHiddenRedCoinStar,   /*acts*/ ALL_ACTS
    object /*model*/ MODEL_CCM_SNOWMAN_HEAD, /*pos*/ -4230, -1169,  1813, /*angle*/ 0, 270, 0, /*behParam*/ 0x04000000, /*beh*/ bhvSnowmansHead,          /*acts*/ ALL_ACTS
    object /*model*/ MODEL_STAR,             /*pos*/ -2000, -2200, -3000, /*angle*/ 0,   0, 0, /*behParam*/ 0x05000000, /*beh*/ bhvStar,                   /*acts*/ ALL_ACTS
    return

script_func_local_4:
    object /*model*/ MODEL_PENGUIN, /*pos*/ -4952,  6656, -6075, /*angle*/ 0, 270, 0, /*behParam*/ 0x02000000, /*beh*/ bhvRacingPenguin,   /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6
    object /*model*/ MODEL_NONE,    /*pos*/ -6500, -5836, -6400, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvPenguinRaceFinishLine
    object /*model*/ MODEL_NONE,    /*pos*/ -6393,  -716,  7503, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvPenguinRaceShortcutCheck
.ifndef VERSION_JP
    object /*model*/ MODEL_NONE,    /*pos*/ -4943,  1321,   667, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvPlaysMusicTrackWhenTouched
.endif
    return

glabel level_ccm_entry
    init_level
    load_mio0         /*seg*/ 0x07, /*romStart*/ _ccm_segment_7SegmentRomStart, /*romEnd*/ _ccm_segment_7SegmentRomEnd
    load_mio0_texture /*seg*/ 0x09, /*romStart*/ _snow_mio0SegmentRomStart, /*romEnd*/ _snow_mio0SegmentRomEnd
    load_mio0         /*seg*/ 0x0B, /*romStart*/ _effect_mio0SegmentRomStart, /*romEnd*/ _effect_mio0SegmentRomEnd
    load_mio0         /*seg*/ 0x0A, /*romStart*/ _ccm_skybox_mio0SegmentRomStart, /*romEnd*/ _ccm_skybox_mio0SegmentRomEnd
    load_mio0         /*seg*/ 0x05, /*romStart*/ _group7_mio0SegmentRomStart, /*romEnd*/ _group7_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0C, /*romStart*/ _group7_geoSegmentRomStart,  /*romEnd*/ _group7_geoSegmentRomEnd
    load_mio0         /*seg*/ 0x06, /*romStart*/ _group16_mio0SegmentRomStart, /*romEnd*/ _group16_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0D, /*romStart*/ _group16_geoSegmentRomStart,  /*romEnd*/ _group16_geoSegmentRomEnd
    load_mio0         /*seg*/ 0x08, /*romStart*/ _common0_mio0SegmentRomStart, /*romEnd*/ _common0_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0F, /*romStart*/ _common0_geoSegmentRomStart,  /*romEnd*/ _common0_geoSegmentRomEnd
    alloc_level_pool
    mario /*model*/ MODEL_MARIO, /*behParam*/ 0x00000001, /*beh*/ bhvMario
    jump_link /*target*/ script_func_global_1
    jump_link /*target*/ script_func_global_8
    jump_link /*target*/ script_func_global_17
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_03, /*geo*/ ccm_geo_00042C
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_04, /*geo*/ ccm_geo_00045C
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_05, /*geo*/ ccm_geo_000494
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_06, /*geo*/ ccm_geo_0004BC
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_07, /*geo*/ ccm_geo_0004E4
    load_model_from_geo /*model*/ MODEL_CCM_CABIN_DOOR,    /*geo*/ cabin_door_geo
    load_model_from_geo /*model*/ MODEL_CCM_SNOW_TREE,     /*geo*/ snow_tree_geo
    load_model_from_geo /*model*/ MODEL_CCM_ROPEWAY_LIFT,  /*geo*/ ccm_geo_0003D0
    load_model_from_geo /*model*/ MODEL_CCM_SNOWMAN_BASE,  /*geo*/ ccm_geo_0003F0
    load_model_from_geo /*model*/ MODEL_CCM_SNOWMAN_HEAD,  /*geo*/ ccm_geo_00040C

    area /*index*/ 1, /*geo*/ ccm_geo_00051C
        object /*model*/ MODEL_NONE, /*pos*/ -1512,  3560, -2305, /*angle*/ 0,  140, 0, /*behParam*/ 0x000A0000, /*beh*/ bhvWarps74
        object /*model*/ MODEL_NONE, /*pos*/  -181,  2918, -1486, /*angle*/ 0,    0, 0, /*behParam*/ 0x0F1E0000, /*beh*/ bhvWarp
        object /*model*/ MODEL_NONE, /*pos*/ -1847,  2815,  -321, /*angle*/ 0, -158, 0, /*behParam*/ 0x001F0000, /*beh*/ bhvFadingWarp
        object /*model*/ MODEL_NONE, /*pos*/  3349, -4694,  -183, /*angle*/ 0,  -34, 0, /*behParam*/ 0x00200000, /*beh*/ bhvFadingWarp
        warp_node /*id*/ 0x0A, /*destLevel*/ 0x05, /*destArea*/ 0x01, /*destNode*/ 0x0A, /*unk6*/ 0x0000
        warp_node /*id*/ 0x14, /*destLevel*/ 0x05, /*destArea*/ 0x02, /*destNode*/ 0x14, /*unk6*/ 0x0000
        warp_node /*id*/ 0x1E, /*destLevel*/ 0x05, /*destArea*/ 0x02, /*destNode*/ 0x0A, /*unk6*/ 0x0000
        warp_node /*id*/ 0x1F, /*destLevel*/ 0x05, /*destArea*/ 0x01, /*destNode*/ 0x20, /*unk6*/ 0x0000
        warp_node /*id*/ 0x20, /*destLevel*/ 0x05, /*destArea*/ 0x01, /*destNode*/ 0x1F, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF0, /*destLevel*/ 0x06, /*destArea*/ 0x01, /*destNode*/ 0x33, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF1, /*destLevel*/ 0x06, /*destArea*/ 0x01, /*destNode*/ 0x65, /*unk6*/ 0x0000
        jump_link /*target*/ script_func_local_1
        jump_link /*target*/ script_func_local_2
        jump_link /*target*/ script_func_local_3
        terrain /*terrainData*/ ccm_seg7_area_1_collision
        macro_objects /*objList*/ ccm_seg7_area_1_macro_objs
        show_dialog /*unk2*/ 0x00, /*dialogid*/ 0x30
        set_background_music /*unk2*/ 0x0000, /*seq*/ SEQ_LEVEL_SNOW
        terrain_type /*terrainType*/ TERRAIN_SNOW
    end_area

    area /*index*/ 2, /*geo*/ ccm_geo_0005E8
        object /*model*/ MODEL_NONE, /*pos*/ -5836, 7465, -6143, /*angle*/ 0, 90, 0, /*behParam*/ 0x000A0000, /*beh*/ bhvWarps64
        warp_node /*id*/ 0x14, /*destLevel*/ 0x05, /*destArea*/ 0x01, /*destNode*/ 0x14, /*unk6*/ 0x0000
        warp_node /*id*/ 0x0A, /*destLevel*/ 0x05, /*destArea*/ 0x02, /*destNode*/ 0x0A, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF0, /*destLevel*/ 0x06, /*destArea*/ 0x01, /*destNode*/ 0x33, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF1, /*destLevel*/ 0x06, /*destArea*/ 0x01, /*destNode*/ 0x65, /*unk6*/ 0x0000
        jump_link /*target*/ script_func_local_4
        terrain /*terrainData*/ ccm_seg7_area_2_collision
        macro_objects /*objList*/ ccm_seg7_area_2_macro_objs
        set_background_music /*unk2*/ 0x0001, /*seq*/ SEQ_LEVEL_SLIDE
        terrain_type /*terrainType*/ TERRAIN_SLIDE
    end_area

    free_level_pool
    mario_pos /*area*/ 1, /*yaw*/ 140, /*pos*/ -1512, 2560, -2305
    call /*arg*/ 0, /*func*/ lvl_init_or_update
    call_loop /*arg*/ 1, /*func*/ lvl_init_or_update
    clear_level
    sleep_before_exit /*frames*/ 1
    exit
