script_func_local_1:
    object /*model*/ MODEL_NONE, /*pos*/ 0, -1000, 0, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvLargeFishGroup
    object /*model*/ MODEL_NONE, /*pos*/ 0, -1000, 0, /*angle*/ 0, 0, 0, /*behParam*/ 0x00020000, /*beh*/ bhvLargeFishGroup
    return

script_func_local_2:
    object /*model*/ MODEL_NONE, /*pos*/ 0, -4250, 0, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvHiddenRedCoinStar
    return

glabel level_sa_entry
    init_level
    load_mio0         /*seg*/ 0x07, /*romStart*/ _sa_segment_7SegmentRomStart, /*romEnd*/ _sa_segment_7SegmentRomEnd
    load_mio0_texture /*seg*/ 0x09, /*romStart*/ _inside_mio0SegmentRomStart, /*romEnd*/ _inside_mio0SegmentRomEnd
    load_mio0         /*seg*/ 0x0A, /*romStart*/ _cloud_floor_skybox_mio0SegmentRomStart, /*romEnd*/ _cloud_floor_skybox_mio0SegmentRomEnd
    load_mio0         /*seg*/ 0x0B, /*romStart*/ _effect_mio0SegmentRomStart, /*romEnd*/ _effect_mio0SegmentRomEnd
    load_mio0         /*seg*/ 0x05, /*romStart*/ _group4_mio0SegmentRomStart, /*romEnd*/ _group4_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0C, /*romStart*/ _group4_geoSegmentRomStart,  /*romEnd*/ _group4_geoSegmentRomEnd
    load_mio0         /*seg*/ 0x06, /*romStart*/ _group13_mio0SegmentRomStart, /*romEnd*/ _group13_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0D, /*romStart*/ _group13_geoSegmentRomStart,  /*romEnd*/ _group13_geoSegmentRomEnd
    alloc_level_pool
    mario /*model*/ MODEL_MARIO, /*behParam*/ 0x00000001, /*beh*/ bhvMario
    jump_link /*target*/ script_func_global_5
    jump_link /*target*/ script_func_global_14

    area /*index*/ 1, /*geo*/ sa_geo_000170
        object /*model*/ MODEL_NONE, /*pos*/ 0, -1535, 0, /*angle*/ 0, 90, 0, /*behParam*/ 0x000A0000, /*beh*/ bhvWarps94
        warp_node /*id*/ 0x0A, /*destLevel*/ 0x14, /*destArea*/ 0x01, /*destNode*/ 0x0A, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF0, /*destLevel*/ 0x06, /*destArea*/ 0x01, /*destNode*/ 0x27, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF1, /*destLevel*/ 0x06, /*destArea*/ 0x01, /*destNode*/ 0x28, /*unk6*/ 0x0000
        jump_link /*target*/ script_func_local_1
        jump_link /*target*/ script_func_local_2
        terrain /*terrainData*/ sa_seg7_collision
        macro_objects /*objList*/ sa_seg7_macro_objs
        set_background_music /*unk2*/ 0x0003, /*seq*/ (SEQ_LEVEL_WATER | SEQ_VARIATION)
        terrain_type /*terrainType*/ TERRAIN_WATER
    end_area

    free_level_pool
    mario_pos /*area*/ 1, /*yaw*/ 90, /*pos*/ 0, -1535, 0
    call /*arg*/ 0, /*func*/ lvl_init_or_update
    call_loop /*arg*/ 1, /*func*/ lvl_init_or_update
    clear_level
    sleep_before_exit /*frames*/ 1
    exit
