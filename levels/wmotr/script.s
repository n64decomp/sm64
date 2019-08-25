script_func_local_1:
    object /*model*/ MODEL_NONE, /*pos*/  3996, -2739,  5477, /*angle*/ 0, 0, 0, /*behParam*/ 0x00520000, /*beh*/ bhvPoleGrabbing
    object /*model*/ MODEL_NONE, /*pos*/ -2911,  3564, -3967, /*angle*/ 0, 0, 0, /*behParam*/ 0x00540000, /*beh*/ bhvPoleGrabbing
    object /*model*/ MODEL_NONE, /*pos*/ -3258,  3359, -3946, /*angle*/ 0, 0, 0, /*behParam*/ 0x00690000, /*beh*/ bhvPoleGrabbing
    object /*model*/ MODEL_NONE, /*pos*/ -2639,  3154, -4369, /*angle*/ 0, 0, 0, /*behParam*/ 0x007D0000, /*beh*/ bhvPoleGrabbing
    object /*model*/ MODEL_NONE, /*pos*/ -2980,  4048, -4248, /*angle*/ 0, 0, 0, /*behParam*/ 0x00240000, /*beh*/ bhvPoleGrabbing
    object /*model*/ MODEL_NONE, /*pos*/ -3290,  3636, -4477, /*angle*/ 0, 0, 0, /*behParam*/ 0x004D0000, /*beh*/ bhvPoleGrabbing
    return

script_func_local_2:
    object /*model*/ MODEL_NONE, /*pos*/ -160, 1950, -470, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvHiddenRedCoinStar
    return

glabel level_wmotr_entry
    init_level
    load_mio0         /*seg*/ 0x07, /*romStart*/ _wmotr_segment_7SegmentRomStart, /*romEnd*/ _wmotr_segment_7SegmentRomEnd
    load_mio0         /*seg*/ 0x0A, /*romStart*/ _cloud_floor_skybox_mio0SegmentRomStart, /*romEnd*/ _cloud_floor_skybox_mio0SegmentRomEnd
    load_mio0_texture /*seg*/ 0x09, /*romStart*/ _sky_mio0SegmentRomStart, /*romEnd*/ _sky_mio0SegmentRomEnd
    load_mio0         /*seg*/ 0x05, /*romStart*/ _group2_mio0SegmentRomStart, /*romEnd*/ _group2_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0C, /*romStart*/ _group2_geoSegmentRomStart,  /*romEnd*/ _group2_geoSegmentRomEnd
    load_mio0         /*seg*/ 0x06, /*romStart*/ _group17_mio0SegmentRomStart, /*romEnd*/ _group17_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0D, /*romStart*/ _group17_geoSegmentRomStart,  /*romEnd*/ _group17_geoSegmentRomEnd
    load_mio0         /*seg*/ 0x08, /*romStart*/ _common0_mio0SegmentRomStart, /*romEnd*/ _common0_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0F, /*romStart*/ _common0_geoSegmentRomStart,  /*romEnd*/ _common0_geoSegmentRomEnd
    alloc_level_pool
    mario /*model*/ MODEL_MARIO, /*behParam*/ 0x00000001, /*beh*/ bhvMario
    jump_link /*target*/ script_func_global_1
    jump_link /*target*/ script_func_global_3
    jump_link /*target*/ script_func_global_18

    area /*index*/ 1, /*geo*/ wmotr_geo_0001F0
        object /*model*/ MODEL_NONE, /*pos*/ -67, 2669, -16, /*angle*/ 0, 270, 0, /*behParam*/ 0x000A0000, /*beh*/ bhvWarps64
        warp_node /*id*/ 0x0A, /*destLevel*/ 0x1F, /*destArea*/ 0x01, /*destNode*/ 0x0A, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF0, /*destLevel*/ 0x06, /*destArea*/ 0x02, /*destNode*/ 0x38, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF1, /*destLevel*/ 0x06, /*destArea*/ 0x02, /*destNode*/ 0x6D, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF3, /*destLevel*/ 0x10, /*destArea*/ 0x01, /*destNode*/ 0x0A, /*unk6*/ 0x0000
        jump_link /*target*/ script_func_local_1
        jump_link /*target*/ script_func_local_2
        terrain /*terrainData*/ wmotr_seg7_collision
        macro_objects /*objList*/ wmotr_seg7_macro_objs
        set_background_music /*unk2*/ 0x0000, /*seq*/ SEQ_LEVEL_SLIDE
        terrain_type /*terrainType*/ TERRAIN_SNOW
    end_area

    free_level_pool
    mario_pos /*area*/ 1, /*yaw*/ 270, /*pos*/ -67, 1669, -16
    call /*arg*/ 0, /*func*/ lvl_init_or_update
    call_loop /*arg*/ 1, /*func*/ lvl_init_or_update
    clear_level
    sleep_before_exit /*frames*/ 1
    exit
