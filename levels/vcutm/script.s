script_func_local_1:
    object /*model*/ MODEL_VCUTM_SEESAW_PLATFORM, /*pos*/   154, -1919, -6256, /*angle*/ 0, 270, 0, /*behParam*/ 0x00070000, /*beh*/ bhvSeesawPlatform
    object /*model*/ MODEL_VCUTM_SEESAW_PLATFORM, /*pos*/ -2047, -3378, -2047, /*angle*/ 0,   0, 0, /*behParam*/ 0x00070000, /*beh*/ bhvSeesawPlatform
    #! @bug invalid model IDs - model ID 0x37 isn't loaded
    object /*model*/ MODEL_VCUTM_CHECKERBOARD_PLATFORM_SPAWNER,           /*pos*/  3251, -1082, -6256, /*angle*/ 0, 270, 0, /*behParam*/ 0x014B0000, /*beh*/ bhvCheckerboardElevatorGroup
    object /*model*/ MODEL_VCUTM_CHECKERBOARD_PLATFORM_SPAWNER,           /*pos*/  2355, -1901, -6256, /*angle*/ 0, 270, 0, /*behParam*/ 0x014B0000, /*beh*/ bhvCheckerboardElevatorGroup
    object /*model*/ MODEL_VCUTM_CHECKERBOARD_PLATFORM_SPAWNER,           /*pos*/  1459, -1594, -6256, /*angle*/ 0,  90, 0, /*behParam*/ 0x014B0000, /*beh*/ bhvCheckerboardElevatorGroup
    object /*model*/ MODEL_VCUTM_CHECKERBOARD_PLATFORM_SPAWNER,           /*pos*/ -1151, -2413, -6256, /*angle*/ 0, 270, 0, /*behParam*/ 0x014B0000, /*beh*/ bhvCheckerboardElevatorGroup
    return

script_func_local_2:
    object /*model*/ MODEL_CAP_SWITCH, /*pos*/ 4506,  26, -6246, /*angle*/ 0, 0, 0, /*behParam*/ 0x00020000, /*beh*/ bhvCapSwitch
    return

script_func_local_3:
    object /*model*/ MODEL_NONE,       /*pos*/ 4600, 250, -4500, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvHiddenRedCoinStar
    return

glabel level_vcutm_entry
    init_level
    load_mio0_texture /*seg*/ 0x09, /*romStart*/ _outside_mio0SegmentRomStart, /*romEnd*/ _outside_mio0SegmentRomEnd
    load_mio0         /*seg*/ 0x07, /*romStart*/ _vcutm_segment_7SegmentRomStart, /*romEnd*/ _vcutm_segment_7SegmentRomEnd
    load_mio0         /*seg*/ 0x05, /*romStart*/ _group8_mio0SegmentRomStart, /*romEnd*/ _group8_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0C, /*romStart*/ _group8_geoSegmentRomStart,  /*romEnd*/ _group8_geoSegmentRomEnd
    load_mio0         /*seg*/ 0x08, /*romStart*/ _common0_mio0SegmentRomStart, /*romEnd*/ _common0_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0F, /*romStart*/ _common0_geoSegmentRomStart,  /*romEnd*/ _common0_geoSegmentRomEnd
    alloc_level_pool
    mario /*model*/ MODEL_MARIO, /*behParam*/ 0x00000001, /*beh*/ bhvMario
    jump_link /*target*/ script_func_global_1
    jump_link /*target*/ script_func_global_9
    load_model_from_geo /*model*/ MODEL_VCUTM_SEESAW_PLATFORM, /*geo*/ vcutm_geo_0001F0
    load_model_from_geo /*model*/ MODEL_VCUTM_WARP_PIPE,       /*geo*/ warp_pipe_geo

    area /*index*/ 1, /*geo*/ vcutm_geo_000208
        object /*model*/ MODEL_NONE, /*pos*/ -6143, 6734, -6143, /*angle*/ 0, 0, 0, /*behParam*/ 0x000A0000, /*beh*/ bhvWarps64
        warp_node /*id*/ 0x0A, /*destLevel*/ 0x12, /*destArea*/ 0x01, /*destNode*/ 0x0A, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF3, /*destLevel*/ 0x10, /*destArea*/ 0x01, /*destNode*/ 0x07, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF0, /*destLevel*/ 0x10, /*destArea*/ 0x01, /*destNode*/ 0x08, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF1, /*destLevel*/ 0x10, /*destArea*/ 0x01, /*destNode*/ 0x06, /*unk6*/ 0x0000
        jump_link /*target*/ script_func_local_3
        jump_link /*target*/ script_func_local_1
        jump_link /*target*/ script_func_local_2
        terrain /*terrainData*/ vcutm_seg7_collision
        macro_objects /*objList*/ vcutm_seg7_macro_objs
        show_dialog /*unk2*/ 0x00, /*dialogid*/ 0x81
        set_background_music /*unk2*/ 0x0000, /*seq*/ SEQ_LEVEL_SLIDE
        terrain_type /*terrainType*/ TERRAIN_STONE
    end_area

    free_level_pool
    mario_pos /*area*/ 1, /*yaw*/ 0, /*pos*/ -6143, 5734, -6143
    call /*arg*/ 0, /*func*/ lvl_init_or_update
    call_loop /*arg*/ 1, /*func*/ lvl_init_or_update
    clear_level
    sleep_before_exit /*frames*/ 1
    exit
