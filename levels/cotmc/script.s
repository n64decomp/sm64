script_func_local_1:
    object /*model*/ MODEL_CAP_SWITCH, /*pos*/ 0,  363, -6144, /*angle*/ 0, 0, 0, /*behParam*/ 0x00010000, /*beh*/ bhvCapSwitch
    object /*model*/ MODEL_NONE,       /*pos*/ 0,  500, -7373, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvWaterfallSoundLoop
    object /*model*/ MODEL_NONE,       /*pos*/ 0,  500,  3584, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvWaterfallSoundLoop
    return

script_func_local_2:
    object /*model*/ MODEL_NONE,       /*pos*/ 0, -200, -7000, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvHiddenRedCoinStar
    return

glabel level_cotmc_entry
    init_level
    load_mio0         /*seg*/ 0x07, /*romStart*/ _cotmc_segment_7SegmentRomStart, /*romEnd*/ _cotmc_segment_7SegmentRomEnd
    load_mio0_texture /*seg*/ 0x09, /*romStart*/ _cave_mio0SegmentRomStart, /*romEnd*/ _cave_mio0SegmentRomEnd
    load_mio0         /*seg*/ 0x05, /*romStart*/ _group8_mio0SegmentRomStart, /*romEnd*/ _group8_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0C, /*romStart*/ _group8_geoSegmentRomStart,  /*romEnd*/ _group8_geoSegmentRomEnd
    load_mio0         /*seg*/ 0x06, /*romStart*/ _group17_mio0SegmentRomStart, /*romEnd*/ _group17_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0D, /*romStart*/ _group17_geoSegmentRomStart,  /*romEnd*/ _group17_geoSegmentRomEnd
    load_mio0         /*seg*/ 0x08, /*romStart*/ _common0_mio0SegmentRomStart, /*romEnd*/ _common0_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0F, /*romStart*/ _common0_geoSegmentRomStart,  /*romEnd*/ _common0_geoSegmentRomEnd
    alloc_level_pool
    mario /*model*/ MODEL_MARIO, /*behParam*/ 0x00000001, /*beh*/ bhvMario
    jump_link /*target*/ script_func_global_9
    jump_link /*target*/ script_func_global_18
    jump_link /*target*/ script_func_global_1

    area /*index*/ 1, /*geo*/ cotmc_geo_0001A0
        object /*model*/ MODEL_NONE, /*pos*/ -4185, 1020, -47, /*angle*/ 0, 90, 0, /*behParam*/ 0x000A0000, /*beh*/ bhvWarps64
        warp_node /*id*/ 0x0A, /*destLevel*/ 0x1C, /*destArea*/ 0x01, /*destNode*/ 0x0A, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF0, /*destLevel*/ 0x06, /*destArea*/ 0x03, /*destNode*/ 0x34, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF1, /*destLevel*/ 0x06, /*destArea*/ 0x03, /*destNode*/ 0x66, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF3, /*destLevel*/ 0x10, /*destArea*/ 0x01, /*destNode*/ 0x14, /*unk6*/ 0x0000
        jump_link /*target*/ script_func_local_2
        jump_link /*target*/ script_func_local_1
        terrain /*terrainData*/ cotmc_seg7_collision_level
        macro_objects /*objList*/ cotmc_seg7_macro_objs
        show_dialog /*unk2*/ 0x00, /*dialogid*/ 0x82
        set_background_music /*unk2*/ 0x0004, /*seq*/ SEQ_LEVEL_UNDERGROUND
        terrain_type /*terrainType*/ TERRAIN_STONE
    end_area

    free_level_pool
    mario_pos /*area*/ 1, /*yaw*/ 90, /*pos*/ -4185, 20, -47
    call /*arg*/ 0, /*func*/ lvl_init_or_update
    call_loop /*arg*/ 1, /*func*/ lvl_init_or_update
    clear_level
    sleep_before_exit /*frames*/ 1
    exit
