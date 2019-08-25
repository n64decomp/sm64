script_func_local_1:
    object /*model*/ MODEL_BOB_CHAIN_CHOMP_GATE,  /*pos*/  1456,   768,   446, /*angle*/ 0, 326, 0,  /*behParam*/ 0x00000000, /*beh*/ bhvChainChompGate
    object /*model*/ MODEL_BOB_SEESAW_PLATFORM,   /*pos*/ -2303,   717,  1024, /*angle*/ 0, 45, 0,   /*behParam*/ 0x00030000, /*beh*/ bhvSeesawPlatform
    object /*model*/ MODEL_NONE,                  /*pos*/ -2050,     0, -3069, /*angle*/ 0, 25, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvOpenableGrill
    object /*model*/ MODEL_PURPLE_SWITCH,         /*pos*/ -2283,     0, -3682, /*angle*/ 0, 27, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvFloorSwitchGrills
    object /*model*/ MODEL_CHECKERBOARD_PLATFORM, /*pos*/  1612,   300,  4611, /*angle*/ 0, 0, 0,    /*behParam*/ 0x00280000, /*beh*/ bhvCheckerboardElevatorGroup
    return

script_func_local_2:
    object /*model*/ MODEL_NONE,                  /*pos*/  1535, 3840, -5561, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvBobBowlingBallSpawner,  /*acts*/ ACT_1 | ACT_2
    object /*model*/ MODEL_NONE,                  /*pos*/  1535, 3840, -5561, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvTtmBowlingBallSpawner,  /*acts*/ ACT_3 | ACT_4 | ACT_5 | ACT_6
    object /*model*/ MODEL_NONE,                  /*pos*/   524, 2825, -5400, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00020000, /*beh*/ bhvBobBowlingBallSpawner,  /*acts*/ ACT_1 | ACT_2
    object /*model*/ MODEL_NONE,                  /*pos*/   524, 2825, -5400, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00020000, /*beh*/ bhvTtmBowlingBallSpawner,  /*acts*/ ACT_3 | ACT_4 | ACT_5 | ACT_6
    object /*model*/ MODEL_BOWLING_BALL,          /*pos*/  -993,  886, -3565, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvPitBowlingBall
    object /*model*/ MODEL_BOWLING_BALL,          /*pos*/  -785,  886, -4301, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvPitBowlingBall
    object /*model*/ MODEL_BOWLING_BALL,          /*pos*/   -93,  886, -3414, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvPitBowlingBall,      /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6
    object /*model*/ MODEL_BOBOMB_BUDDY,          /*pos*/ -5723,  140,  6017, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00020000, /*beh*/ bhvBobombBuddy,              /*acts*/ ACT_1
    object /*model*/ MODEL_BOBOMB_BUDDY,          /*pos*/ -6250,    0,  6680, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00010000, /*beh*/ bhvBobombBuddy,              /*acts*/ ACT_1
    object /*model*/ MODEL_BOBOMB_BUDDY,          /*pos*/ -5723,  140,  6017, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvBobombBuddyOpensCannon, /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6
    object /*model*/ MODEL_BOBOMB_BUDDY,          /*pos*/ -6250,    0,  6680, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00030000, /*beh*/ bhvBobombBuddy,              /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6
    object /*model*/ MODEL_CANNON_BASE,           /*pos*/ -5694,  128,  5600, /*angle*/ 0, 135, 0, /*behParam*/ 0x00010000, /*beh*/ bhvWaterBombCannon,         /*acts*/ ACT_1
    object /*model*/ MODEL_DL_CANNON_LID,         /*pos*/ -5694,  128,  5600, /*angle*/ 0, 180, 0, /*behParam*/ 0x00000000, /*beh*/ bhvCannonClosed,             /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6
    object /*model*/ MODEL_NONE,                  /*pos*/  3304, 4242, -4603, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvKoopaRaceEndpoint,            /*acts*/ ACT_2
    object /*model*/ MODEL_KOOPA_WITH_SHELL,      /*pos*/  3400,  770,  6500, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00010000, /*beh*/ bhvKoopa,                        /*acts*/ ACT_3 | ACT_4 | ACT_5 | ACT_6
    return

script_func_local_3:
    object /*model*/ MODEL_KING_BOBOMB,           /*pos*/  1636, 4242, -5567, /*angle*/ 0, -147, 0, /*behParam*/ 0x00000000, /*beh*/ bhvKingBobomb,              /*acts*/ ACT_1
    object /*model*/ MODEL_KOOPA_WITH_SHELL,      /*pos*/ -4004,    0,  5221, /*angle*/ 0, 0, 0,    /*behParam*/ 0x01020000, /*beh*/ bhvKoopa,                       /*acts*/ ACT_2
    object /*model*/ MODEL_NONE,                  /*pos*/ -6000, 1000,  2400, /*angle*/ 0, 0, 0,    /*behParam*/ 0x03000000, /*beh*/ bhvHiddenRedCoinStar,     /*acts*/ ALL_ACTS
    object /*model*/ MODEL_NONE,                  /*pos*/ -6600, 1000,  1250, /*angle*/ 0, 0, 0,    /*behParam*/ 0x04040000, /*beh*/ bhvHiddenStar,              /*acts*/ ALL_ACTS
    object /*model*/ MODEL_STAR,                  /*pos*/  1550, 1200,   300, /*angle*/ 0, 0, 0,    /*behParam*/ 0x05000000, /*beh*/ bhvStar,                     /*acts*/ ALL_ACTS
    return

glabel level_bob_entry
    init_level
    load_mio0         /*seg*/ 0x07, /*romStart*/ _bob_segment_7SegmentRomStart, /*romEnd*/ _bob_segment_7SegmentRomEnd
    load_mio0_texture /*seg*/ 0x09, /*romStart*/ _generic_mio0SegmentRomStart, /*romEnd*/ _generic_mio0SegmentRomEnd
    load_mio0         /*seg*/ 0x0A, /*romStart*/ _water_skybox_mio0SegmentRomStart, /*romEnd*/ _water_skybox_mio0SegmentRomEnd
    load_mio0         /*seg*/ 0x05, /*romStart*/ _group3_mio0SegmentRomStart, /*romEnd*/ _group3_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0C, /*romStart*/ _group3_geoSegmentRomStart,  /*romEnd*/ _group3_geoSegmentRomEnd
    load_mio0         /*seg*/ 0x06, /*romStart*/ _group14_mio0SegmentRomStart, /*romEnd*/ _group14_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0D, /*romStart*/ _group14_geoSegmentRomStart,  /*romEnd*/ _group14_geoSegmentRomEnd
    load_mio0         /*seg*/ 0x08, /*romStart*/ _common0_mio0SegmentRomStart, /*romEnd*/ _common0_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0F, /*romStart*/ _common0_geoSegmentRomStart,  /*romEnd*/ _common0_geoSegmentRomEnd
    alloc_level_pool
    mario /*model*/ MODEL_MARIO, /*behParam*/ 0x00000001, /*beh*/ bhvMario
    jump_link /*target*/ script_func_global_1
    jump_link /*target*/ script_func_global_4
    jump_link /*target*/ script_func_global_15
    load_model_from_geo /*model*/ MODEL_BOB_BUBBLY_TREE,      /*geo*/ bubbly_tree_geo
    load_model_from_geo /*model*/ MODEL_BOB_CHAIN_CHOMP_GATE, /*geo*/ bob_geo_000440
    load_model_from_geo /*model*/ MODEL_BOB_SEESAW_PLATFORM,  /*geo*/ bob_geo_000458
    load_model_from_geo /*model*/ MODEL_BOB_BARS_GRILLS,      /*geo*/ bob_geo_000470

    area /*index*/ 1, /*geo*/ bob_geo_000488
        jump_link /*target*/ script_func_local_1
        jump_link /*target*/ script_func_local_2
        jump_link /*target*/ script_func_local_3
        object /*model*/ MODEL_NONE, /*pos*/ -6558,  1000,  6464, /*angle*/ 0, 135, 0,  /*behParam*/ 0x000A0000, /*beh*/ bhvWarps74
        object /*model*/ MODEL_NONE, /*pos*/   583,  2683, -5387, /*angle*/ 0, -154, 0, /*behParam*/ 0x000B0000, /*beh*/ bhvFadingWarp
        object /*model*/ MODEL_NONE, /*pos*/  1680,  3835, -5523, /*angle*/ 0, -153, 0, /*behParam*/ 0x000C0000, /*beh*/ bhvFadingWarp
        object /*model*/ MODEL_NONE, /*pos*/ -6612,  1024, -3351, /*angle*/ 0, 107, 0,  /*behParam*/ 0x000D0000, /*beh*/ bhvFadingWarp
        object /*model*/ MODEL_NONE, /*pos*/  1980,   768,  6618, /*angle*/ 0, -151, 0, /*behParam*/ 0x000E0000, /*beh*/ bhvFadingWarp
        warp_node /*id*/ 0x0A, /*destLevel*/ 0x09, /*destArea*/ 0x01, /*destNode*/ 0x0A, /*unk6*/ 0x0000
        warp_node /*id*/ 0x0B, /*destLevel*/ 0x09, /*destArea*/ 0x01, /*destNode*/ 0x0C, /*unk6*/ 0x0000
        warp_node /*id*/ 0x0C, /*destLevel*/ 0x09, /*destArea*/ 0x01, /*destNode*/ 0x0B, /*unk6*/ 0x0000
        warp_node /*id*/ 0x0D, /*destLevel*/ 0x09, /*destArea*/ 0x01, /*destNode*/ 0x0E, /*unk6*/ 0x0000
        warp_node /*id*/ 0x0E, /*destLevel*/ 0x09, /*destArea*/ 0x01, /*destNode*/ 0x0D, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF0, /*destLevel*/ 0x06, /*destArea*/ 0x01, /*destNode*/ 0x32, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF1, /*destLevel*/ 0x06, /*destArea*/ 0x01, /*destNode*/ 0x64, /*unk6*/ 0x0000
        terrain /*terrainData*/ bob_seg7_collision_level
        macro_objects /*objList*/ bob_seg7_macro_objs
        show_dialog /*unk2*/ 0x00, /*dialogid*/ 0x00
        set_background_music /*unk2*/ 0x0000, /*seq*/ SEQ_LEVEL_GRASS
        terrain_type /*terrainType*/ TERRAIN_GRASS
    end_area

    free_level_pool
    mario_pos /*area*/ 1, /*yaw*/ 135, /*pos*/ -6558, 0, 6464
    call /*arg*/ 0, /*func*/ lvl_init_or_update
    call_loop /*arg*/ 1, /*func*/ lvl_init_or_update
    clear_level
    sleep_before_exit /*frames*/ 1
    exit
