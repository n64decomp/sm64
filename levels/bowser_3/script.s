script_func_local_1:
    object /*model*/ MODEL_BOWSER_3_FALLING_PLATFORM_1,  /*pos*/     0,   0,     0, /*angle*/ 0, 0, 0, /*behParam*/ 0x00010000, /*beh*/ bhvFallingBowserPlatform
    object /*model*/ MODEL_BOWSER_3_FALLING_PLATFORM_2,  /*pos*/     0,   0,     0, /*angle*/ 0, 0, 0, /*behParam*/ 0x00020000, /*beh*/ bhvFallingBowserPlatform
    object /*model*/ MODEL_BOWSER_3_FALLING_PLATFORM_3,  /*pos*/     0,   0,     0, /*angle*/ 0, 0, 0, /*behParam*/ 0x00030000, /*beh*/ bhvFallingBowserPlatform
    object /*model*/ MODEL_BOWSER_3_FALLING_PLATFORM_4,  /*pos*/     0,   0,     0, /*angle*/ 0, 0, 0, /*behParam*/ 0x00040000, /*beh*/ bhvFallingBowserPlatform
    object /*model*/ MODEL_BOWSER_3_FALLING_PLATFORM_5,  /*pos*/     0,   0,     0, /*angle*/ 0, 0, 0, /*behParam*/ 0x00050000, /*beh*/ bhvFallingBowserPlatform
    object /*model*/ MODEL_BOWSER_3_FALLING_PLATFORM_6,  /*pos*/     0,   0,     0, /*angle*/ 0, 0, 0, /*behParam*/ 0x00060000, /*beh*/ bhvFallingBowserPlatform
    object /*model*/ MODEL_BOWSER_3_FALLING_PLATFORM_7,  /*pos*/     0,   0,     0, /*angle*/ 0, 0, 0, /*behParam*/ 0x00070000, /*beh*/ bhvFallingBowserPlatform
    object /*model*/ MODEL_BOWSER_3_FALLING_PLATFORM_8,  /*pos*/     0,   0,     0, /*angle*/ 0, 0, 0, /*behParam*/ 0x00080000, /*beh*/ bhvFallingBowserPlatform
    object /*model*/ MODEL_BOWSER_3_FALLING_PLATFORM_9,  /*pos*/     0,   0,     0, /*angle*/ 0, 0, 0, /*behParam*/ 0x00090000, /*beh*/ bhvFallingBowserPlatform
    object /*model*/ MODEL_BOWSER_3_FALLING_PLATFORM_10, /*pos*/     0,   0,     0, /*angle*/ 0, 0, 0, /*behParam*/ 0x000A0000, /*beh*/ bhvFallingBowserPlatform
    object /*model*/ MODEL_BOWSER_BOMB,                  /*pos*/ -2122, 512, -2912, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvBowserBomb
    object /*model*/ MODEL_BOWSER_BOMB,                  /*pos*/ -3362, 512,  1121, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvBowserBomb
    object /*model*/ MODEL_BOWSER_BOMB,                  /*pos*/     0, 512,  3584, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvBowserBomb
    object /*model*/ MODEL_BOWSER_BOMB,                  /*pos*/  3363, 512,  1121, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvBowserBomb
    object /*model*/ MODEL_BOWSER_BOMB,                  /*pos*/  2123, 512, -2912, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvBowserBomb
    return

glabel level_bowser_3_entry
    init_level
    load_mio0 /*seg*/ 0x07, /*romStart*/ _bowser_3_segment_7SegmentRomStart, /*romEnd*/ _bowser_3_segment_7SegmentRomEnd
    load_mio0 /*seg*/ 0x06, /*romStart*/ _group12_mio0SegmentRomStart, /*romEnd*/ _group12_mio0SegmentRomEnd
    load_raw  /*seg*/ 0x0D, /*romStart*/ _group12_geoSegmentRomStart,  /*romEnd*/ _group12_geoSegmentRomEnd
    load_mio0 /*seg*/ 0x0A, /*romStart*/ _bits_skybox_mio0SegmentRomStart, /*romEnd*/ _bits_skybox_mio0SegmentRomEnd
    alloc_level_pool
    mario /*model*/ MODEL_MARIO, /*behParam*/ 0x00000001, /*beh*/ bhvMario
    jump_link /*target*/ script_func_global_13
    load_model_from_geo /*model*/ MODEL_BOWSER_3_FALLING_PLATFORM_1,  /*geo*/ bowser_3_geo_000290
    load_model_from_geo /*model*/ MODEL_BOWSER_3_FALLING_PLATFORM_2,  /*geo*/ bowser_3_geo_0002A8
    load_model_from_geo /*model*/ MODEL_BOWSER_3_FALLING_PLATFORM_3,  /*geo*/ bowser_3_geo_0002C0
    load_model_from_geo /*model*/ MODEL_BOWSER_3_FALLING_PLATFORM_4,  /*geo*/ bowser_3_geo_0002D8
    load_model_from_geo /*model*/ MODEL_BOWSER_3_FALLING_PLATFORM_5,  /*geo*/ bowser_3_geo_0002F0
    load_model_from_geo /*model*/ MODEL_BOWSER_3_FALLING_PLATFORM_6,  /*geo*/ bowser_3_geo_000308
    load_model_from_geo /*model*/ MODEL_BOWSER_3_FALLING_PLATFORM_7,  /*geo*/ bowser_3_geo_000320
    load_model_from_geo /*model*/ MODEL_BOWSER_3_FALLING_PLATFORM_8,  /*geo*/ bowser_3_geo_000338
    load_model_from_geo /*model*/ MODEL_BOWSER_3_FALLING_PLATFORM_9,  /*geo*/ bowser_3_geo_000350
    load_model_from_geo /*model*/ MODEL_BOWSER_3_FALLING_PLATFORM_10, /*geo*/ bowser_3_geo_000368
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_03,            /*geo*/ bowser_3_geo_000380

    area /*index*/ 1, /*geo*/ bowser_3_geo_000398
        object /*model*/ MODEL_NONE, /*pos*/ 0, 1307, 0, /*angle*/ 0, 183, 0, /*behParam*/ 0x000A0000, /*beh*/ bhvWarps6C
        warp_node /*id*/ 0x0A, /*destLevel*/ 0x22, /*destArea*/ 0x01, /*destNode*/ 0x0A, /*unk6*/ 0x0000
        jump_link /*target*/ script_func_local_1
        warp_node /*id*/ 0xF1, /*destLevel*/ 0x15, /*destArea*/ 0x01, /*destNode*/ 0x0C, /*unk6*/ 0x0000
        terrain /*terrainData*/ bowser_3_seg7_collision_level
        set_background_music /*unk2*/ 0x0002, /*seq*/ SEQ_LEVEL_BOSS_KOOPA_FINAL
        terrain_type /*terrainType*/ TERRAIN_STONE
    end_area

    free_level_pool
    mario_pos /*area*/ 1, /*yaw*/ 183, /*pos*/ 0, 307, 0
    call /*arg*/ 0, /*func*/ lvl_init_or_update
    call_loop /*arg*/ 1, /*func*/ lvl_init_or_update
    clear_level
    sleep_before_exit /*frames*/ 1
    exit
