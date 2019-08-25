script_func_local_1:
    object /*model*/ MODEL_SUSHI,        /*pos*/ -3071,  -270,   0, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvSushiShark
    object /*model*/ MODEL_SUSHI,        /*pos*/ -3071, -4270,   0, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvSushiShark
    object /*model*/ MODEL_NONE,         /*pos*/ -3071,  -130,   0, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvFish3
    object /*model*/ MODEL_NONE,         /*pos*/ -3071, -4270,   0, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvFish2
    object /*model*/ MODEL_NONE,         /*pos*/ -3071, -2000,   0, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvChirpChirp
    object /*model*/ MODEL_NONE,         /*pos*/ -3071, -3000,   0, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvChirpChirp
    object /*model*/ MODEL_DL_WHIRLPOOL, /*pos*/ -3174, -4915, 102, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvWhirlpool
    return

script_func_local_2:
    object /*model*/ MODEL_NONE,      /*pos*/ -2400, -4607, 125, /*angle*/ 0, 0, 0, /*behParam*/ 0x01000000, /*beh*/ bhvTreasureChests, /*acts*/ ALL_ACTS
    object /*model*/ MODEL_MANTA_RAY, /*pos*/ -4640, -1380,  40, /*angle*/ 0, 0, 0, /*behParam*/ 0x04000000, /*beh*/ bhvMantaRay,       /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6
    return

script_func_local_3:
    object /*model*/ MODEL_DDD_BOWSER_SUB_DOOR, /*pos*/    0,    0,     0, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvBowserSubDoor
    object /*model*/ MODEL_DDD_BOWSER_SUB,      /*pos*/    0,    0,     0, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvBowsersSub
    object /*model*/ MODEL_DDD_POLE,            /*pos*/ 5120, 1005,  3584, /*angle*/ 0, 180, 0, /*behParam*/ 0x001E0000, /*beh*/ bhvDDDPole
    object /*model*/ MODEL_DDD_POLE,            /*pos*/ 5605, 1005,  3380, /*angle*/ 0, 270, 0, /*behParam*/ 0x00150000, /*beh*/ bhvDDDPole
    object /*model*/ MODEL_DDD_POLE,            /*pos*/ 1800, 1005,  1275, /*angle*/ 0,   0, 0, /*behParam*/ 0x000B0000, /*beh*/ bhvDDDPole
    object /*model*/ MODEL_DDD_POLE,            /*pos*/ 4000, 1005,  1075, /*angle*/ 0, 180, 0, /*behParam*/ 0x000B0000, /*beh*/ bhvDDDPole
    object /*model*/ MODEL_DDD_POLE,            /*pos*/ 1830, 1005,   520, /*angle*/ 0, 270, 0, /*behParam*/ 0x00140000, /*beh*/ bhvDDDPole
    object /*model*/ MODEL_DDD_POLE,            /*pos*/ 4000, 1005,  1275, /*angle*/ 0,   0, 0, /*behParam*/ 0x000B0000, /*beh*/ bhvDDDPole
    object /*model*/ MODEL_DDD_POLE,            /*pos*/ 5760, 1005,   360, /*angle*/ 0, 270, 0, /*behParam*/ 0x00170000, /*beh*/ bhvDDDPole
    object /*model*/ MODEL_DDD_POLE,            /*pos*/ 3310, 1005, -1945, /*angle*/ 0,   0, 0, /*behParam*/ 0x00170000, /*beh*/ bhvDDDPole
    object /*model*/ MODEL_DDD_POLE,            /*pos*/ 3550, 1005, -2250, /*angle*/ 0,   0, 0, /*behParam*/ 0x000D0000, /*beh*/ bhvDDDPole
    return

script_func_local_4:
    object /*model*/ MODEL_NONE, /*pos*/ 3404, -3319, -489, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvJetStream
    return

script_func_local_5:
    object /*model*/ MODEL_STAR, /*pos*/ 3900,   850,  -600, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvStar,                    /*acts*/ ALL_ACTS
    object /*model*/ MODEL_NONE, /*pos*/ 5513,  1200,   900, /*angle*/ 0, 0, 0, /*behParam*/ 0x02000000, /*beh*/ bhvHiddenRedCoinStar,    /*acts*/ ALL_ACTS
    object /*model*/ MODEL_NONE, /*pos*/ 3404, -3319,  -489, /*angle*/ 0, 0, 0, /*behParam*/ 0x03000000, /*beh*/ bhvJetStreamRingSpawner, /*acts*/ ALL_ACTS
    object /*model*/ MODEL_STAR, /*pos*/ 2030, -3700, -2780, /*angle*/ 0, 0, 0, /*behParam*/ 0x05000000, /*beh*/ bhvStar,                    /*acts*/ ALL_ACTS
    return

glabel level_ddd_entry
    init_level
    load_mio0         /*seg*/ 0x07, /*romStart*/ _ddd_segment_7SegmentRomStart, /*romEnd*/ _ddd_segment_7SegmentRomEnd
    load_mio0_texture /*seg*/ 0x09, /*romStart*/ _water_mio0SegmentRomStart, /*romEnd*/ _water_mio0SegmentRomEnd
    load_mio0         /*seg*/ 0x0B, /*romStart*/ _effect_mio0SegmentRomStart, /*romEnd*/ _effect_mio0SegmentRomEnd
    load_mio0         /*seg*/ 0x0A, /*romStart*/ _water_skybox_mio0SegmentRomStart, /*romEnd*/ _water_skybox_mio0SegmentRomEnd
    load_mio0         /*seg*/ 0x05, /*romStart*/ _group4_mio0SegmentRomStart, /*romEnd*/ _group4_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0C, /*romStart*/ _group4_geoSegmentRomStart,  /*romEnd*/ _group4_geoSegmentRomEnd
    load_mio0         /*seg*/ 0x06, /*romStart*/ _group13_mio0SegmentRomStart, /*romEnd*/ _group13_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0D, /*romStart*/ _group13_geoSegmentRomStart,  /*romEnd*/ _group13_geoSegmentRomEnd
    load_mio0         /*seg*/ 0x08, /*romStart*/ _common0_mio0SegmentRomStart, /*romEnd*/ _common0_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0F, /*romStart*/ _common0_geoSegmentRomStart,  /*romEnd*/ _common0_geoSegmentRomEnd
    alloc_level_pool
    mario /*model*/ MODEL_MARIO, /*behParam*/ 0x00000001, /*beh*/ bhvMario
    jump_link /*target*/ script_func_global_1
    jump_link /*target*/ script_func_global_5
    jump_link /*target*/ script_func_global_14
    load_model_from_geo /*model*/ MODEL_DDD_BOWSER_SUB_DOOR, /*geo*/ ddd_geo_000478
    load_model_from_geo /*model*/ MODEL_DDD_BOWSER_SUB,      /*geo*/ ddd_geo_0004A0
    load_model_from_geo /*model*/ MODEL_DDD_POLE,            /*geo*/ ddd_geo_000450

    area /*index*/ 1, /*geo*/ ddd_geo_0004C0
        object /*model*/ MODEL_NONE, /*pos*/ -3071, 3000, 0, /*angle*/ 0, 7, 0, /*behParam*/ 0x000A0000, /*beh*/ bhvWarps74
        warp_node /*id*/ 0x0A, /*destLevel*/ 0x17, /*destArea*/ 0x01, /*destNode*/ 0x0A, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF0, /*destLevel*/ 0x06, /*destArea*/ 0x03, /*destNode*/ 0x35, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF1, /*destLevel*/ 0x06, /*destArea*/ 0x03, /*destNode*/ 0x67, /*unk6*/ 0x0000
        whirlpool /*unk2*/ 0, /*unk3*/ 0, /*pos*/ -3174, -4915, 102, /*strength*/ 20
        jump_link /*target*/ script_func_local_1
        jump_link /*target*/ script_func_local_2
        instant_warp /*index*/ 3, /*destArea*/ 2, /*displace*/ -8192, 0, 0
        terrain /*terrainData*/ ddd_seg7_area_1_collision
        macro_objects /*objList*/ ddd_seg7_area_1_macro_objs
        set_background_music /*unk2*/ 0x0003, /*seq*/ SEQ_LEVEL_WATER
        terrain_type /*terrainType*/ TERRAIN_WATER
    end_area

    area /*index*/ 2, /*geo*/ ddd_geo_000570
        whirlpool /*unk2*/ 0, /*unk3*/ 0, /*pos*/ 3355, -3575, -515, /*strength*/ -30
        whirlpool /*unk2*/ 1, /*unk3*/ 2, /*pos*/ 3917, -2040, -6041, /*strength*/ 50
        warp_node /*id*/ 0xF0, /*destLevel*/ 0x06, /*destArea*/ 0x03, /*destNode*/ 0x35, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF1, /*destLevel*/ 0x06, /*destArea*/ 0x03, /*destNode*/ 0x67, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF3, /*destLevel*/ 0x10, /*destArea*/ 0x01, /*destNode*/ 0x1E, /*unk6*/ 0x0000
        jump_link /*target*/ script_func_local_3
        jump_link /*target*/ script_func_local_4
        jump_link /*target*/ script_func_local_5
        instant_warp /*index*/ 2, /*destArea*/ 1, /*displace*/ 8192, 0, 0
        terrain /*terrainData*/ ddd_seg7_area_2_collision
        macro_objects /*objList*/ ddd_seg7_area_2_macro_objs
        set_background_music /*unk2*/ 0x0003, /*seq*/ SEQ_LEVEL_WATER
        terrain_type /*terrainType*/ TERRAIN_WATER
    end_area

    free_level_pool
    mario_pos /*area*/ 1, /*yaw*/ 180, /*pos*/ -3071, 3000, 500
    call /*arg*/ 0, /*func*/ lvl_init_or_update
    call_loop /*arg*/ 1, /*func*/ lvl_init_or_update
    clear_level
    sleep_before_exit /*frames*/ 1
    exit
