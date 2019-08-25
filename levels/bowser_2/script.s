script_func_local_1:
    object /*model*/ MODEL_BOWSER_2_TILTING_ARENA, /*pos*/     0,    0,     0, /*angle*/ 0, 90, 0, /*behParam*/ 0x00000000, /*beh*/ bhvTiltingBowserLavaPlatform
    object /*model*/ MODEL_BOWSER_BOMB,            /*pos*/     4, 1329,  3598, /*angle*/ 0, 90, 0, /*behParam*/ 0x00000000, /*beh*/ bhvBowserBomb
    object /*model*/ MODEL_BOWSER_BOMB,            /*pos*/  3584, 1329,     0, /*angle*/ 0, 90, 0, /*behParam*/ 0x00000000, /*beh*/ bhvBowserBomb
    object /*model*/ MODEL_BOWSER_BOMB,            /*pos*/     0, 1329, -3583, /*angle*/ 0, 90, 0, /*behParam*/ 0x00000000, /*beh*/ bhvBowserBomb
    object /*model*/ MODEL_BOWSER_BOMB,            /*pos*/ -3583, 1329,     0, /*angle*/ 0, 90, 0, /*behParam*/ 0x00000000, /*beh*/ bhvBowserBomb
    return

glabel level_bowser_2_entry
    init_level
    load_mio0         /*seg*/ 0x0A, /*romStart*/ _bitfs_skybox_mio0SegmentRomStart, /*romEnd*/ _bitfs_skybox_mio0SegmentRomEnd
    load_mio0_texture /*seg*/ 0x09, /*romStart*/ _fire_mio0SegmentRomStart, /*romEnd*/ _fire_mio0SegmentRomEnd
    load_mio0         /*seg*/ 0x0B, /*romStart*/ _effect_mio0SegmentRomStart, /*romEnd*/ _effect_mio0SegmentRomEnd
    load_mio0         /*seg*/ 0x07, /*romStart*/ _bowser_2_segment_7SegmentRomStart, /*romEnd*/ _bowser_2_segment_7SegmentRomEnd
    load_mio0         /*seg*/ 0x06, /*romStart*/ _group12_mio0SegmentRomStart, /*romEnd*/ _group12_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0D, /*romStart*/ _group12_geoSegmentRomStart, /*romEnd*/ _group12_geoSegmentRomEnd
    alloc_level_pool
    mario /*model*/ MODEL_MARIO, /*behParam*/ 0x00000001, /*beh*/ bhvMario
    jump_link /*target*/ script_func_global_13
    load_model_from_geo /*model*/ MODEL_BOWSER_2_TILTING_ARENA, /*geo*/ bowser_2_geo_000170

    area /*index*/ 1, /*geo*/ bowser_2_geo_000188
        object /*model*/ MODEL_NONE, /*pos*/ 0, 2229, 0, /*angle*/ 0, 180, 0, /*behParam*/ 0x000A0000, /*beh*/ bhvWarps6C
        warp_node /*id*/ 0x0A, /*destLevel*/ 0x21, /*destArea*/ 0x01, /*destNode*/ 0x0A, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF0, /*destLevel*/ 0x06, /*destArea*/ 0x03, /*destNode*/ 0x36, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF1, /*destLevel*/ 0x13, /*destArea*/ 0x01, /*destNode*/ 0x0C, /*unk6*/ 0x0000
        jump_link /*target*/ script_func_local_1
        terrain /*terrainData*/ bowser_2_seg7_collision_lava
        set_background_music /*unk2*/ 0x0002, /*seq*/ SEQ_LEVEL_BOSS_KOOPA
        terrain_type /*terrainType*/ TERRAIN_STONE
    end_area

    free_level_pool
    mario_pos /*area*/ 1, /*yaw*/ 180, /*pos*/ 0, 1229, 0
    call /*arg*/ 0, /*func*/ lvl_init_or_update
    call_loop /*arg*/ 1, /*func*/ lvl_init_or_update
    clear_level
    sleep_before_exit /*frames*/ 1
    exit
