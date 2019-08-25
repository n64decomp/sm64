script_func_local_1:
    object /*model*/ MODEL_NONE,   /*pos*/ -1080,  -840,  1573, /*angle*/ 0,   0, 0, /*behParam*/ 0x00560000, /*beh*/ bhvPoleGrabbing
    object /*model*/ MODEL_THWOMP, /*pos*/  1919,  6191,  1919, /*angle*/ 0, 225, 0, /*behParam*/ 0x00000000, /*beh*/ bhvThwomp2
    return

script_func_local_2:
    object /*model*/ MODEL_STAR,   /*pos*/ -1450, -1130, -1050, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvStar,                 /*acts*/ ALL_ACTS
    object /*model*/ MODEL_STAR,   /*pos*/ -1850,   300,  -950, /*angle*/ 0,   0, 0, /*behParam*/ 0x01000000, /*beh*/ bhvStar,                 /*acts*/ ALL_ACTS
    object /*model*/ MODEL_STAR,   /*pos*/ -1300, -2250, -1300, /*angle*/ 0,   0, 0, /*behParam*/ 0x02000000, /*beh*/ bhvStar,                 /*acts*/ ALL_ACTS
    object /*model*/ MODEL_STAR,   /*pos*/  2200,  7300,  2210, /*angle*/ 0,   0, 0, /*behParam*/ 0x03000000, /*beh*/ bhvStar,                 /*acts*/ ALL_ACTS
    object /*model*/ MODEL_STAR,   /*pos*/ -1050,  2400,  -790, /*angle*/ 0,   0, 0, /*behParam*/ 0x04000000, /*beh*/ bhvStar,                 /*acts*/ ALL_ACTS
    object /*model*/ MODEL_NONE,   /*pos*/  1815, -3200,   800, /*angle*/ 0,   0, 0, /*behParam*/ 0x05000000, /*beh*/ bhvHiddenRedCoinStar, /*acts*/ ALL_ACTS
    return

glabel level_ttc_entry
    init_level
    load_mio0         /*seg*/ 0x07, /*romStart*/ _ttc_segment_7SegmentRomStart, /*romEnd*/ _ttc_segment_7SegmentRomEnd
    load_mio0_texture /*seg*/ 0x09, /*romStart*/ _machine_mio0SegmentRomStart, /*romEnd*/ _machine_mio0SegmentRomEnd
    load_mio0         /*seg*/ 0x05, /*romStart*/ _group1_mio0SegmentRomStart, /*romEnd*/ _group1_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0C, /*romStart*/ _group1_geoSegmentRomStart,  /*romEnd*/ _group1_geoSegmentRomEnd
    load_mio0         /*seg*/ 0x08, /*romStart*/ _common0_mio0SegmentRomStart, /*romEnd*/ _common0_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0F, /*romStart*/ _common0_geoSegmentRomStart,  /*romEnd*/ _common0_geoSegmentRomEnd
    alloc_level_pool
    mario /*model*/ MODEL_MARIO, /*behParam*/ 0x00000001, /*beh*/ bhvMario
    jump_link /*target*/ script_func_global_1
    jump_link /*target*/ script_func_global_2
    load_model_from_geo /*model*/ MODEL_TTC_ROTATING_CUBE,     /*geo*/ ttc_geo_000240
    load_model_from_geo /*model*/ MODEL_TTC_ROTATING_PRISM,    /*geo*/ ttc_geo_000258
    load_model_from_geo /*model*/ MODEL_TTC_PENDULUM,          /*geo*/ ttc_geo_000270
    load_model_from_geo /*model*/ MODEL_TTC_LARGE_TREADMILL,   /*geo*/ ttc_geo_000288
    load_model_from_geo /*model*/ MODEL_TTC_SMALL_TREADMILL,   /*geo*/ ttc_geo_0002A8
    load_model_from_geo /*model*/ MODEL_TTC_PUSH_BLOCK,        /*geo*/ ttc_geo_0002C8
    load_model_from_geo /*model*/ MODEL_TTC_ROTATING_HEXAGON,  /*geo*/ ttc_geo_0002E0
    load_model_from_geo /*model*/ MODEL_TTC_ROTATING_TRIANGLE, /*geo*/ ttc_geo_0002F8
    load_model_from_geo /*model*/ MODEL_TTC_PIT_BLOCK,         /*geo*/ ttc_geo_000310
    load_model_from_geo /*model*/ MODEL_TTC_PIT_BLOCK_UNUSED,  /*geo*/ ttc_geo_000328
    load_model_from_geo /*model*/ MODEL_TTC_ELEVATOR_PLATFORM, /*geo*/ ttc_geo_000340
    load_model_from_geo /*model*/ MODEL_TTC_CLOCK_HAND,        /*geo*/ ttc_geo_000358
    load_model_from_geo /*model*/ MODEL_TTC_SPINNER,           /*geo*/ ttc_geo_000370
    load_model_from_geo /*model*/ MODEL_TTC_SMALL_GEAR,        /*geo*/ ttc_geo_000388
    load_model_from_geo /*model*/ MODEL_TTC_LARGE_GEAR,        /*geo*/ ttc_geo_0003A0

    area /*index*/ 1, /*geo*/ ttc_geo_0003B8
        object /*model*/ MODEL_NONE, /*pos*/ 1417, -3822, -548, /*angle*/ 0, 316, 0, /*behParam*/ 0x000A0000, /*beh*/ bhvWarps74
        warp_node /*id*/ 0x0A, /*destLevel*/ 0x0E, /*destArea*/ 0x01, /*destNode*/ 0x0A, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF0, /*destLevel*/ 0x06, /*destArea*/ 0x02, /*destNode*/ 0x35, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF1, /*destLevel*/ 0x06, /*destArea*/ 0x02, /*destNode*/ 0x67, /*unk6*/ 0x0000
        jump_link /*target*/ script_func_local_1
        jump_link /*target*/ script_func_local_2
        terrain /*terrainData*/ ttc_seg7_collision_level
        macro_objects /*objList*/ ttc_seg7_macro_objs
        set_background_music /*unk2*/ 0x0001, /*seq*/ SEQ_LEVEL_SLIDE
        terrain_type /*terrainType*/ TERRAIN_STONE
    end_area

    free_level_pool
    mario_pos /*area*/ 1, /*yaw*/ 316, /*pos*/ 1417, -4822, -548
    call /*arg*/ 0, /*func*/ lvl_init_or_update
    call_loop /*arg*/ 1, /*func*/ lvl_init_or_update
    clear_level
    sleep_before_exit /*frames*/ 1
    exit
