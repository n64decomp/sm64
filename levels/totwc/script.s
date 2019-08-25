script_func_local_1:
    object /*model*/ MODEL_CAP_SWITCH, /*pos*/   0, -2047, 10, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvCapSwitch
    return

script_func_local_2:
    object /*model*/ MODEL_NONE,       /*pos*/ 800, -1700,  0, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvHiddenRedCoinStar
    return

glabel level_totwc_entry
    init_level
    load_mio0         /*seg*/ 0x07, /*romStart*/ _totwc_segment_7SegmentRomStart, /*romEnd*/ _totwc_segment_7SegmentRomEnd
    load_mio0         /*seg*/ 0x0A, /*romStart*/ _cloud_floor_skybox_mio0SegmentRomStart, /*romEnd*/ _cloud_floor_skybox_mio0SegmentRomEnd
    load_mio0_texture /*seg*/ 0x09, /*romStart*/ _sky_mio0SegmentRomStart, /*romEnd*/ _sky_mio0SegmentRomEnd
    load_mio0         /*seg*/ 0x05, /*romStart*/ _group8_mio0SegmentRomStart, /*romEnd*/ _group8_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0C, /*romStart*/ _group8_geoSegmentRomStart,  /*romEnd*/ _group8_geoSegmentRomEnd
    load_mio0         /*seg*/ 0x08, /*romStart*/ _common0_mio0SegmentRomStart, /*romEnd*/ _common0_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0F, /*romStart*/ _common0_geoSegmentRomStart,  /*romEnd*/ _common0_geoSegmentRomEnd
    alloc_level_pool
    mario /*model*/ MODEL_MARIO, /*behParam*/ 0x00000001, /*beh*/ bhvMario
    jump_link /*target*/ script_func_global_1
    jump_link /*target*/ script_func_global_9
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_03, /*geo*/ totwc_geo_000160

    area /*index*/ 1, /*geo*/ totwc_geo_000188
        object /*model*/ MODEL_NONE, /*pos*/ -4095, 2935, 0, /*angle*/ 0, 90, 0, /*behParam*/ 0x000A0000, /*beh*/ bhvWarps78
        warp_node /*id*/ 0x0A, /*destLevel*/ 0x1D, /*destArea*/ 0x01, /*destNode*/ 0x0A, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF3, /*destLevel*/ 0x06, /*destArea*/ 0x01, /*destNode*/ 0x20, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF0, /*destLevel*/ 0x06, /*destArea*/ 0x01, /*destNode*/ 0x26, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF1, /*destLevel*/ 0x06, /*destArea*/ 0x01, /*destNode*/ 0x23, /*unk6*/ 0x0000
        jump_link /*target*/ script_func_local_2
        jump_link /*target*/ script_func_local_1
        terrain /*terrainData*/ totwc_seg7_collision
        macro_objects /*objList*/ totwc_seg7_macro_objs
        show_dialog /*unk2*/ 0x00, /*dialogid*/ 0x83
        set_background_music /*unk2*/ 0x0000, /*seq*/ SEQ_LEVEL_SLIDE
        terrain_type /*terrainType*/ TERRAIN_STONE
    end_area

    free_level_pool
    mario_pos /*area*/ 1, /*yaw*/ 90, /*pos*/ -4095, 2935, 0
    call /*arg*/ 0, /*func*/ lvl_init_or_update
    call_loop /*arg*/ 1, /*func*/ lvl_init_or_update
    clear_level
    sleep_before_exit /*frames*/ 1
    exit
