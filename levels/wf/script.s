# Unlike most levels, some of the level geometry objects in WF are defined as regular objects instead of terrain objects.
# Some of them are still terrain objects, however.
script_func_local_1:
    object /*model*/ MODEL_LEVEL_GEOMETRY_03, /*pos*/  2305, 2432,  -255, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvStaticObject
    object /*model*/ MODEL_LEVEL_GEOMETRY_04, /*pos*/  3405, 1664, -1791, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvStaticObject
    object /*model*/ MODEL_LEVEL_GEOMETRY_05, /*pos*/  3840,    0, -2303, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvStaticObject
    object /*model*/ MODEL_LEVEL_GEOMETRY_05, /*pos*/  3840,    0, -1279, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvStaticObject
    object /*model*/ MODEL_LEVEL_GEOMETRY_06, /*pos*/     0,    0,     0, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvStaticObject
    object /*model*/ MODEL_LEVEL_GEOMETRY_07, /*pos*/  1757, 3519, -3151, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvStaticObject
    object /*model*/ MODEL_LEVEL_GEOMETRY_0A, /*pos*/  3840,  794,  2688, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvStaticObject
    object /*model*/ MODEL_LEVEL_GEOMETRY_0C, /*pos*/  1408, 2522,  2431, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvStaticObject
    object /*model*/ MODEL_WF_GIANT_POLE,     /*pos*/ -2560, 2560,  -256, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvGiantPole
    return

script_func_local_2:
    object /*model*/ MODEL_WF_SMALL_BOMP,               /*pos*/  3300, 1070,     1, /*angle*/ 0,  90, 0, /*behParam*/ 0x00000000, /*beh*/ bhvSmallBomp
    object /*model*/ MODEL_WF_SMALL_BOMP,               /*pos*/  3300, 1070,  1281, /*angle*/ 0,  90, 0, /*behParam*/ 0x00000000, /*beh*/ bhvSmallBomp
    object /*model*/ MODEL_WF_LARGE_BOMP,               /*pos*/  3300, 1070,   641, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvLargeBomp
    object /*model*/ MODEL_WF_ROTATING_WOODEN_PLATFORM, /*pos*/  -255, 2560,  2304, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvWfRotatingWoodenPlatform
    object /*model*/ MODEL_WF_SLIDING_PLATFORM,         /*pos*/  3328, 1075, -1791, /*angle*/ 0,  90, 0, /*behParam*/ 0x00020000, /*beh*/ bhvWfSlidingPlatform
    object /*model*/ MODEL_WF_SLIDING_PLATFORM,         /*pos*/  3328, 1075,  -767, /*angle*/ 0,  90, 0, /*behParam*/ 0x00010000, /*beh*/ bhvWfSlidingPlatform
    object /*model*/ MODEL_WF_SLIDING_PLATFORM,         /*pos*/  3328, 1075, -2815, /*angle*/ 0,  90, 0, /*behParam*/ 0x00030000, /*beh*/ bhvWfSlidingPlatform
    object /*model*/ MODEL_WF_TUMBLING_BRIDGE,          /*pos*/  1792, 2496,  1600, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvWfTumblingBridge
    object /*model*/ MODEL_WF_BREAKABLE_WALL_RIGHT,     /*pos*/   512, 2176,  2944, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvWfBreakableWallRight
    object /*model*/ MODEL_WF_BREAKABLE_WALL_LEFT,      /*pos*/ -1023, 2176,  2944, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvWfBreakableWallLeft
    object /*model*/ MODEL_WF_KICKABLE_BOARD,           /*pos*/    13, 3584, -1407, /*angle*/ 0, 315, 0, /*behParam*/ 0x00000000, /*beh*/ bhvKickableBoard, /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6
    object /*model*/ MODEL_1UP,                         /*pos*/  -384, 3584,     6, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhv1Up,            /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6
    object /*model*/ MODEL_WF_ROTATING_PLATFORM,        /*pos*/  2304, 3584, -2303, /*angle*/ 0,   0, 0, /*behParam*/ 0x08000000, /*beh*/ bhvRotatingPlatform
    object /*model*/ MODEL_WF_ROTATING_PLATFORM,        /*pos*/  3200, 3328, -1791, /*angle*/ 0,   0, 0, /*behParam*/ 0x08000000, /*beh*/ bhvRotatingPlatform
    object /*model*/ MODEL_WF_ROTATING_PLATFORM,        /*pos*/  2688, 3584,  -895, /*angle*/ 0,   0, 0, /*behParam*/ 0x08000000, /*beh*/ bhvRotatingPlatform
    object /*model*/ MODEL_NONE,                        /*pos*/ -2495, 1331,  -256, /*angle*/ 0,   0, 0, /*behParam*/ 0x003D0000, /*beh*/ bhvPoleGrabbing
    return

script_func_local_3:
    object /*model*/ MODEL_THWOMP,            /*pos*/  3462, 1939, -1545, /*angle*/ 0,  180, 0, /*behParam*/ 0x00000000, /*beh*/ bhvThwomp
    object /*model*/ MODEL_THWOMP,            /*pos*/  3462, 1075, -3314, /*angle*/ 0,   90, 0, /*behParam*/ 0x00000000, /*beh*/ bhvThwomp2
    object /*model*/ MODEL_NONE,              /*pos*/  -856,  922,  3819, /*angle*/ 0,    0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvBetaFishSplashSpawner
    object /*model*/ MODEL_PIRANHA_PLANT,     /*pos*/  1822, 2560,  -101, /*angle*/ 0,   90, 0, /*behParam*/ 0x00000000, /*beh*/ bhvPiranhaPlant
    object /*model*/ MODEL_PIRANHA_PLANT,     /*pos*/  4625,  256,  5017, /*angle*/ 0,  -90, 0, /*behParam*/ 0x00000000, /*beh*/ bhvPiranhaPlant
    object /*model*/ MODEL_PIRANHA_PLANT,     /*pos*/   689, 2560,  1845, /*angle*/ 0,   90, 0, /*behParam*/ 0x00000000, /*beh*/ bhvPiranhaPlant
    object /*model*/ MODEL_WHOMP,             /*pos*/ -1545, 2560,  -286, /*angle*/ 0,    0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvSmallWhomp
    object /*model*/ MODEL_WHOMP,             /*pos*/   189, 2560, -1857, /*angle*/ 0, -135, 0, /*behParam*/ 0x00000000, /*beh*/ bhvSmallWhomp
    object /*model*/ MODEL_BUTTERFLY,         /*pos*/  4736,  256,  4992, /*angle*/ 0,    0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvButterfly
    object /*model*/ MODEL_BUTTERFLY,         /*pos*/  4608,  256,  5120, /*angle*/ 0,    0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvButterfly
    object /*model*/ MODEL_BUTTERFLY,         /*pos*/  4608,  256,  4992, /*angle*/ 0,    0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvButterfly
    object /*model*/ MODEL_BUTTERFLY,         /*pos*/  4608,  256,  4864, /*angle*/ 0,    0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvButterfly
    object /*model*/ MODEL_BUTTERFLY,         /*pos*/  4480,  256,  4992, /*angle*/ 0,    0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvButterfly
    object /*model*/ MODEL_BUTTERFLY,         /*pos*/  4608,  256,   256, /*angle*/ 0,    0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvButterfly
    object /*model*/ MODEL_BUTTERFLY,         /*pos*/  4736,  256,   128, /*angle*/ 0,    0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvButterfly
    object /*model*/ MODEL_BUTTERFLY,         /*pos*/  4480,  256,   128, /*angle*/ 0,    0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvButterfly
    object /*model*/ MODEL_BUTTERFLY,         /*pos*/  4608,  256,     0, /*angle*/ 0,    0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvButterfly
    object /*model*/ MODEL_BUTTERFLY,         /*pos*/  4608,  256,   128, /*angle*/ 0,    0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvButterfly
    object /*model*/ MODEL_NONE,              /*pos*/  1035, 2880,  -900, /*angle*/ 0,   45, 0, /*behParam*/ 0x00000000, /*beh*/ bhvCheckerboardElevatorGroup
    object /*model*/ MODEL_BULLET_BILL,       /*pos*/  1280, 3712,   968, /*angle*/ 0,  180, 0, /*behParam*/ 0x00000000, /*beh*/ bhvBulletBill,               /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6
    object /*model*/ MODEL_LEVEL_GEOMETRY_08, /*pos*/     0, 3584,     0, /*angle*/ 0,    0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvTower,                     /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6
    object /*model*/ MODEL_LEVEL_GEOMETRY_09, /*pos*/  1280, 3584,   896, /*angle*/ 0,    0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvBulletBillCannon,        /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6
    object /*model*/ MODEL_NONE,              /*pos*/     0, 3483,     0, /*angle*/ 0,    0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvTowerPlatformGroup,      /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6
    object /*model*/ MODEL_WF_TOWER_DOOR,     /*pos*/  -511, 3584,     0, /*angle*/ 0,    0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvTowerDoor,                /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6
    object /*model*/ MODEL_BOBOMB_BUDDY,      /*pos*/ -1700, 1140,  3500, /*angle*/ 0,    0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvBobombBuddyOpensCannon, /*acts*/ ACT_3 | ACT_4 | ACT_5 | ACT_6
    object /*model*/ MODEL_HOOT,              /*pos*/  2560,  700,  4608, /*angle*/ 0,    0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvHoot,                      /*acts*/ ACT_3 | ACT_4 | ACT_5 | ACT_6
    return

script_func_local_4:
    object /*model*/ MODEL_WHOMP, /*pos*/     0, 3584,    0, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvWhompKingBoss,      /*acts*/ ACT_1
    object /*model*/ MODEL_STAR,  /*pos*/   300, 5550,    0, /*angle*/ 0, 0, 0, /*behParam*/ 0x01000000, /*beh*/ bhvStar,                 /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6
    object /*model*/ MODEL_STAR,  /*pos*/ -2500, 1500, -750, /*angle*/ 0, 0, 0, /*behParam*/ 0x02000000, /*beh*/ bhvStar,                 /*acts*/ ALL_ACTS
    object /*model*/ MODEL_NONE,  /*pos*/  4600,  550, 2500, /*angle*/ 0, 0, 0, /*behParam*/ 0x03000000, /*beh*/ bhvHiddenRedCoinStar, /*acts*/ ALL_ACTS
    object /*model*/ MODEL_STAR,  /*pos*/  2880, 4300,  190, /*angle*/ 0, 0, 0, /*behParam*/ 0x04000000, /*beh*/ bhvStar,                 /*acts*/ ALL_ACTS
    object /*model*/ MODEL_STAR,  /*pos*/   590, 2450, 2650, /*angle*/ 0, 0, 0, /*behParam*/ 0x05000000, /*beh*/ bhvStar,                 /*acts*/ ALL_ACTS
    return

glabel level_wf_entry
    init_level
    load_mio0         /*seg*/ 0x07, /*romStart*/ _wf_segment_7SegmentRomStart, /*romEnd*/ _wf_segment_7SegmentRomEnd
    load_mio0         /*seg*/ 0x0A, /*romStart*/ _cloud_floor_skybox_mio0SegmentRomStart, /*romEnd*/ _cloud_floor_skybox_mio0SegmentRomEnd
    load_mio0_texture /*seg*/ 0x09, /*romStart*/ _grass_mio0SegmentRomStart, /*romEnd*/ _grass_mio0SegmentRomEnd
    load_mio0         /*seg*/ 0x05, /*romStart*/ _group1_mio0SegmentRomStart, /*romEnd*/ _group1_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0C, /*romStart*/ _group1_geoSegmentRomStart,  /*romEnd*/ _group1_geoSegmentRomEnd
    load_mio0         /*seg*/ 0x06, /*romStart*/ _group14_mio0SegmentRomStart, /*romEnd*/ _group14_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0D, /*romStart*/ _group14_geoSegmentRomStart,  /*romEnd*/ _group14_geoSegmentRomEnd
    load_mio0         /*seg*/ 0x08, /*romStart*/ _common0_mio0SegmentRomStart, /*romEnd*/ _common0_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0F, /*romStart*/ _common0_geoSegmentRomStart,  /*romEnd*/ _common0_geoSegmentRomEnd
    alloc_level_pool
    mario /*model*/ MODEL_MARIO, /*behParam*/ 0x00000001, /*beh*/ bhvMario
    jump_link /*target*/ script_func_global_1
    jump_link /*target*/ script_func_global_2
    jump_link /*target*/ script_func_global_15
    load_model_from_geo /*model*/ MODEL_WF_BUBBLY_TREE,                   /*geo*/ bubbly_tree_geo
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_03,                /*geo*/ wf_geo_0007E0
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_04,                /*geo*/ wf_geo_000820
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_05,                /*geo*/ wf_geo_000860
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_06,                /*geo*/ wf_geo_000878
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_07,                /*geo*/ wf_geo_000890
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_08,                /*geo*/ wf_geo_0008A8
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_09,                /*geo*/ wf_geo_0008E8
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_0A,                /*geo*/ wf_geo_000900
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_0C,                /*geo*/ wf_geo_000940
    load_model_from_geo /*model*/ MODEL_WF_GIANT_POLE,                    /*geo*/ wf_geo_000AE0
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_0E,                /*geo*/ wf_geo_000958
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_0F,                /*geo*/ wf_geo_0009A0
    load_model_from_geo /*model*/ MODEL_WF_ROTATING_PLATFORM,             /*geo*/ wf_geo_0009B8
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_11,                /*geo*/ wf_geo_0009D0
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_12,                /*geo*/ wf_geo_0009E8
    load_model_from_geo /*model*/ MODEL_WF_SMALL_BOMP,                    /*geo*/ wf_geo_000A00
    load_model_from_geo /*model*/ MODEL_WF_LARGE_BOMP,                    /*geo*/ wf_geo_000A40
    load_model_from_geo /*model*/ MODEL_WF_ROTATING_WOODEN_PLATFORM,      /*geo*/ wf_geo_000A58
    load_model_from_geo /*model*/ MODEL_WF_SLIDING_PLATFORM,              /*geo*/ wf_geo_000A98
    load_model_from_geo /*model*/ MODEL_WF_TUMBLING_BRIDGE_PART,          /*geo*/ wf_geo_000AB0
    load_model_from_geo /*model*/ MODEL_WF_TUMBLING_BRIDGE,               /*geo*/ wf_geo_000AC8
    load_model_from_geo /*model*/ MODEL_WF_TOWER_TRAPEZOID_PLATORM,       /*geo*/ wf_geo_000AF8
    load_model_from_geo /*model*/ MODEL_WF_TOWER_SQUARE_PLATORM,          /*geo*/ wf_geo_000B10
    load_model_from_geo /*model*/ MODEL_WF_TOWER_SQUARE_PLATORM_UNUSED,   /*geo*/ wf_geo_000B38
    load_model_from_geo /*model*/ MODEL_WF_TOWER_SQUARE_PLATORM_ELEVATOR, /*geo*/ wf_geo_000B60
    load_model_from_geo /*model*/ MODEL_WF_BREAKABLE_WALL_RIGHT,          /*geo*/ wf_geo_000B78
    load_model_from_geo /*model*/ MODEL_WF_BREAKABLE_WALL_LEFT,           /*geo*/ wf_geo_000B90
    load_model_from_geo /*model*/ MODEL_WF_KICKABLE_BOARD,                /*geo*/ wf_geo_000BA8
    load_model_from_geo /*model*/ MODEL_WF_TOWER_DOOR,                    /*geo*/ wf_geo_000BE0
    load_model_from_geo /*model*/ MODEL_WF_KICKABLE_BOARD_FELLED,         /*geo*/ wf_geo_000BC8

    area /*index*/ 1, /*geo*/ wf_geo_000BF8
        object /*model*/ MODEL_NONE, /*pos*/  2600, 1256,  5120, /*angle*/ 0, 90, 0, /*behParam*/ 0x000A0000, /*beh*/ bhvWarps74
        object /*model*/ MODEL_NONE, /*pos*/ -2925, 2560,  -947, /*angle*/ 0, 19, 0, /*behParam*/ 0x000B0000, /*beh*/ bhvFadingWarp
        object /*model*/ MODEL_NONE, /*pos*/  2548, 1075, -3962, /*angle*/ 0, 51, 0, /*behParam*/ 0x000C0000, /*beh*/ bhvFadingWarp
        warp_node /*id*/ 0x0A, /*destLevel*/ 0x18, /*destArea*/ 0x01, /*destNode*/ 0x0A, /*unk6*/ 0x0000
        warp_node /*id*/ 0x0B, /*destLevel*/ 0x18, /*destArea*/ 0x01, /*destNode*/ 0x0C, /*unk6*/ 0x0000
        warp_node /*id*/ 0x0C, /*destLevel*/ 0x18, /*destArea*/ 0x01, /*destNode*/ 0x0B, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF0, /*destLevel*/ 0x06, /*destArea*/ 0x01, /*destNode*/ 0x34, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF1, /*destLevel*/ 0x06, /*destArea*/ 0x01, /*destNode*/ 0x66, /*unk6*/ 0x0000
        jump_link /*target*/ script_func_local_1
        jump_link /*target*/ script_func_local_2
        jump_link /*target*/ script_func_local_3
        jump_link /*target*/ script_func_local_4
        terrain /*terrainData*/ wf_seg7_collision_070102D8
        macro_objects /*objList*/ wf_seg7_macro_objs
        show_dialog /*unk2*/ 0x00, /*dialogid*/ 0x1E
        set_background_music /*unk2*/ 0x0005, /*seq*/ SEQ_LEVEL_GRASS
        terrain_type /*terrainType*/ TERRAIN_STONE
    end_area

    free_level_pool
    mario_pos /*area*/ 1, /*yaw*/ 90, /*pos*/ 2600, 256, 5120
    call /*arg*/ 0, /*func*/ lvl_init_or_update
    call_loop /*arg*/ 1, /*func*/ lvl_init_or_update
    clear_level
    sleep_before_exit /*frames*/ 1
    exit
