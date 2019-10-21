.section .level, "a"

script_func_local_1:
    object /*model*/ MODEL_RED_FLAME,                  /*pos*/  2089,  1331, -1125, /*angle*/ 0, 270, 0, /*behParam*/ 0x00000000, /*beh*/ bhvFlame
    object /*model*/ MODEL_RED_FLAME,                  /*pos*/  1331,  1075, -1330, /*angle*/ 0, 90, 0,  /*behParam*/ 0x00000000, /*beh*/ bhvFlame
    object /*model*/ MODEL_RED_FLAME,                  /*pos*/  2089,  1331,  -511, /*angle*/ 0, 270, 0, /*behParam*/ 0x00000000, /*beh*/ bhvFlame
    object /*model*/ MODEL_RED_FLAME,                  /*pos*/  -511,   358, -1330, /*angle*/ 0, 90, 0,  /*behParam*/ 0x00000000, /*beh*/ bhvFlame
    object /*model*/ MODEL_RED_FLAME,                  /*pos*/  1126,   358,  2212, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvFlame
    object /*model*/ MODEL_RED_FLAME,                  /*pos*/   205,   358,  2212, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvFlame
    return

script_func_local_2:
    object /*model*/ MODEL_BBH_TILTING_FLOOR_PLATFORM, /*pos*/  2866,   820,  1897, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvBbhTiltingTrapPlatform
    object /*model*/ MODEL_BBH_TUMBLING_PLATFORM,      /*pos*/  2961,     0,  -768, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvBbhTumblingBridge
    object /*model*/ MODEL_BBH_MOVING_BOOKSHELF,       /*pos*/ -1994,   819,   213, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvHauntedBookshelf
    object /*model*/ MODEL_BBH_MESH_ELEVATOR,          /*pos*/ -2985,  -205,  5400, /*angle*/ 0, -45, 0, /*behParam*/ 0x00000000, /*beh*/ bhvMeshElevator
    object /*model*/ MODEL_BBH_MERRY_GO_ROUND,         /*pos*/  -205, -2560,   205, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvMerryGoRound
    object /*model*/ MODEL_NONE,                       /*pos*/  2200,   819,  -800, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvCoffinManager
    return

script_func_local_3:
    object /*model*/ MODEL_BOO,                        /*pos*/  1000,    50,  1000, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvGhostHuntBigBoo,       /*acts*/ ACT_1
    object /*model*/ MODEL_BOO,                        /*pos*/    20,   100,  -908, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvGhostHuntBoo,                 /*acts*/ ACT_1
    object /*model*/ MODEL_BOO,                        /*pos*/  3150,   100,   398, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvGhostHuntBoo,                 /*acts*/ ACT_1
    object /*model*/ MODEL_BOO,                        /*pos*/ -2000,   150,  -800, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvGhostHuntBoo,                 /*acts*/ ACT_1
    object /*model*/ MODEL_BOO,                        /*pos*/  2851,   100,  2289, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvGhostHuntBoo,                 /*acts*/ ACT_1
    object /*model*/ MODEL_BOO,                        /*pos*/ -1551,   100, -1018, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvGhostHuntBoo,                 /*acts*/ ACT_1
    object /*model*/ MODEL_BBH_STAIRCASE_STEP,         /*pos*/   973,     0,   517, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvHiddenStaircaseStep, /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6
    object /*model*/ MODEL_BBH_STAIRCASE_STEP,         /*pos*/   973,  -206,   717, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvHiddenStaircaseStep, /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6
    object /*model*/ MODEL_BBH_STAIRCASE_STEP,         /*pos*/   973,  -412,   917, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvHiddenStaircaseStep, /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6
    object /*model*/ MODEL_BOO,                        /*pos*/    20,   100,  -908, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvBoo,                 /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6
    object /*model*/ MODEL_BOO,                        /*pos*/  3150,   100,   398, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvBoo,                 /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6
    object /*model*/ MODEL_BOO,                        /*pos*/ -2000,   150,  -800, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvBoo,                 /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6
    object /*model*/ MODEL_BOO,                        /*pos*/  2851,   100,  2289, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvBoo,                 /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6
    object /*model*/ MODEL_BOO,                        /*pos*/ -1551,   100, -1018, /*angle*/ 0, 0, 0,   /*behParam*/ 0x00000000, /*beh*/ bhvBoo,                 /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6
    object /*model*/ MODEL_NONE,                       /*pos*/   990, -2146,  -908, /*angle*/ 0, -45, 0, /*behParam*/ 0x00030000, /*beh*/ bhvFlamethrower,          /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6
    object /*model*/ MODEL_NONE,                       /*pos*/ -1100, -2372,  1100, /*angle*/ 0, 135, 0, /*behParam*/ 0x01000000, /*beh*/ bhvMerryGoRoundBooManager,         /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6
    object /*model*/ MODEL_BOO,                        /*pos*/  1030,  1922,  2546, /*angle*/ 0, -90, 0, /*behParam*/ 0x04000000, /*beh*/ bhvBalconyBigBoo,        /*acts*/ ALL_ACTS
    object /*model*/ MODEL_BOO,                        /*pos*/   581,  1850,  -206, /*angle*/ 0, -90, 0, /*behParam*/ 0x00000000, /*beh*/ bhvBoo,                 /*acts*/ ALL_ACTS
    object /*model*/ MODEL_MAD_PIANO,                  /*pos*/ -1300,     0,  2310, /*angle*/ 0, 243, 0, /*behParam*/ 0x00000000, /*beh*/ bhvMadPiano
    object /*model*/ MODEL_HAUNTED_CHAIR,              /*pos*/ -1530,     0,  2200, /*angle*/ 0, 66, 0,  /*behParam*/ 0x00000000, /*beh*/ bhvHauntedChair
    object /*model*/ MODEL_NONE,                       /*pos*/ -1330,   890,   200, /*angle*/ 0, 90, 0,  /*behParam*/ 0x00000000, /*beh*/ bhvBookendSpawn
    object /*model*/ MODEL_NONE,                       /*pos*/  -818,   890,  -200, /*angle*/ 0, 270, 0, /*behParam*/ 0x00000000, /*beh*/ bhvBookendSpawn
    object /*model*/ MODEL_NONE,                       /*pos*/ -1330,   890,  -622, /*angle*/ 0, 90, 0,  /*behParam*/ 0x00000000, /*beh*/ bhvBookendSpawn
    object /*model*/ MODEL_NONE,                       /*pos*/  -818,   890,  -686, /*angle*/ 0, 270, 0, /*behParam*/ 0x00000000, /*beh*/ bhvBookendSpawn
    object /*model*/ MODEL_NONE,                       /*pos*/ -1950,   880,     8, /*angle*/ 0, 180, 0, /*behParam*/ 0x00000000, /*beh*/ bhvHauntedBookshelfManager
    object /*model*/ MODEL_BOOKEND,                    /*pos*/  2680,  1045,   876, /*angle*/ 0, 166, 0, /*behParam*/ 0x00000000, /*beh*/ bhvFlyingBookend
    object /*model*/ MODEL_BOOKEND,                    /*pos*/  3075,  1045,   995, /*angle*/ 0, 166, 0, /*behParam*/ 0x00000000, /*beh*/ bhvFlyingBookend
    object /*model*/ MODEL_BOOKEND,                    /*pos*/ -1411,   218,   922, /*angle*/ 0, 180, 0, /*behParam*/ 0x00000000, /*beh*/ bhvFlyingBookend
    return

script_func_local_4:
    object /*model*/ MODEL_STAR, /*pos*/ -2030, 1350,  1940, /*angle*/ 0, 0, 0,  /*behParam*/ 0x02000000, /*beh*/ bhvStar,                    /*acts*/ ALL_ACTS
    object /*model*/ MODEL_NONE, /*pos*/  -204, 1100,  1576, /*angle*/ 0, 0, 0,  /*behParam*/ 0x03000000, /*beh*/ bhvHiddenRedCoinStar,    /*acts*/ ALL_ACTS
    object /*model*/ MODEL_NONE, /*pos*/   923, 1741,  -332, /*angle*/ 0, 18, 0, /*behParam*/ 0x05010000, /*beh*/ bhvMrI,                    /*acts*/ ALL_ACTS
    return

glabel level_bbh_entry
    init_level
    load_mio0         /*seg*/ 0x07, /*romStart*/ _bbh_segment_7SegmentRomStart, /*romEnd*/ _bbh_segment_7SegmentRomEnd
    load_mio0         /*seg*/ 0x0A, /*romStart*/ _bbh_skybox_mio0SegmentRomStart, /*romEnd*/ _bbh_skybox_mio0SegmentRomEnd
    load_mio0_texture /*seg*/ 0x09, /*romStart*/ _spooky_mio0SegmentRomStart, /*romEnd*/ _spooky_mio0SegmentRomEnd
    load_mio0         /*seg*/ 0x05, /*romStart*/ _group9_mio0SegmentRomStart, /*romEnd*/ _group9_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0C, /*romStart*/ _group9_geoSegmentRomStart,  /*romEnd*/ _group9_geoSegmentRomEnd
    load_mio0         /*seg*/ 0x06, /*romStart*/ _group17_mio0SegmentRomStart, /*romEnd*/ _group17_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0D, /*romStart*/ _group17_geoSegmentRomStart, /*romEnd*/ _group17_geoSegmentRomEnd
    load_mio0         /*seg*/ 0x08, /*romStart*/ _common0_mio0SegmentRomStart, /*romEnd*/ _common0_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0F, /*romStart*/ _common0_geoSegmentRomStart,  /*romEnd*/ _common0_geoSegmentRomEnd
    alloc_level_pool
    mario /*model*/ MODEL_MARIO, /*behParam*/ 0x00000001, /*beh*/ bhvMario
    jump_link /*target*/ script_func_global_1
    jump_link /*target*/ script_func_global_10
    jump_link /*target*/ script_func_global_18
    load_model_from_geo /*model*/ MODEL_BBH_HAUNTED_DOOR,           /*geo*/ haunted_door_geo
    load_model_from_geo /*model*/ MODEL_BBH_STAIRCASE_STEP,         /*geo*/ geo_bbh_0005B0
    load_model_from_geo /*model*/ MODEL_BBH_TILTING_FLOOR_PLATFORM, /*geo*/ geo_bbh_0005C8
    load_model_from_geo /*model*/ MODEL_BBH_TUMBLING_PLATFORM,      /*geo*/ geo_bbh_0005E0
    load_model_from_geo /*model*/ MODEL_BBH_TUMBLING_PLATFORM_PART, /*geo*/ geo_bbh_0005F8
    load_model_from_geo /*model*/ MODEL_BBH_MOVING_BOOKSHELF,       /*geo*/ geo_bbh_000610
    load_model_from_geo /*model*/ MODEL_BBH_MESH_ELEVATOR,          /*geo*/ geo_bbh_000628
    load_model_from_geo /*model*/ MODEL_BBH_MERRY_GO_ROUND,         /*geo*/ geo_bbh_000640
    load_model_from_geo /*model*/ MODEL_BBH_WOODEN_TOMB,            /*geo*/ geo_bbh_000658

    area /*index*/ 1, /*geo*/ geo_bbh_000F00
        jump_link /*target*/ script_func_local_1
        jump_link /*target*/ script_func_local_2
        jump_link /*target*/ script_func_local_3
        jump_link /*target*/ script_func_local_4
        object /*model*/ MODEL_NONE, /*pos*/ 666, 796, 5350, /*angle*/ 0, 180, 0, /*behParam*/ 0x000A0000, /*beh*/ bhvWarps74
        warp_node /*id*/ 0x0A, /*destLevel*/ 0x04, /*destArea*/ 0x01, /*destNode*/ 0x0A, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF0, /*destLevel*/ 0x1A, /*destArea*/ 0x01, /*destNode*/ 0x0A, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF1, /*destLevel*/ 0x1A, /*destArea*/ 0x01, /*destNode*/ 0x0B, /*unk6*/ 0x0000
        terrain /*terrainData*/ bbh_seg7_collision_level
        macro_objects /*objList*/ bbh_seg7_macro_objs
        rooms /*surfaceRooms*/ bbh_seg7_rooms
        show_dialog /*unk2*/ 0x00, /*dialogid*/ 0x62
        set_background_music /*unk2*/ 0x0006, /*seq*/ SEQ_LEVEL_SPOOKY
        terrain_type /*terrainType*/ TERRAIN_SPOOKY
    end_area

    free_level_pool
    mario_pos /*area*/ 1, /*yaw*/ 180, /*pos*/ 666, -204, 5350
    call /*arg*/ 0, /*func*/ lvl_init_or_update
    call_loop /*arg*/ 1, /*func*/ lvl_init_or_update
    clear_level
    sleep_before_exit /*frames*/ 1
    exit
