script_func_local_1:
    object /*model*/ MODEL_NONE, /*pos*/     0, 200, -1652, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvAmbientSounds
    object /*model*/ MODEL_NONE, /*pos*/ -2700,   0, -1652, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvBirdsSoundLoop
    object /*model*/ MODEL_NONE, /*pos*/  2700,   0, -1652, /*angle*/ 0, 0, 0, /*behParam*/ 0x00010000, /*beh*/ bhvBirdsSoundLoop
    return

script_func_local_2:
    object /*model*/ MODEL_BOO, /*pos*/ -3217, 100,  -101, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvCourtyardBooTriplet
    object /*model*/ MODEL_BOO, /*pos*/  3317, 100, -1701, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvCourtyardBooTriplet
    object /*model*/ MODEL_BOO, /*pos*/   -71,   1, -1387, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvCourtyardBooTriplet
    return

glabel level_castle_courtyard_entry
    init_level
    load_mio0         /*seg*/ 0x07, /*romStart*/ _castle_courtyard_segment_7SegmentRomStart, /*romEnd*/ _castle_courtyard_segment_7SegmentRomEnd
    load_mio0         /*seg*/ 0x0A, /*romStart*/ _water_skybox_mio0SegmentRomStart, /*romEnd*/ _water_skybox_mio0SegmentRomEnd
    load_mio0_texture /*seg*/ 0x09, /*romStart*/ _outside_mio0SegmentRomStart, /*romEnd*/ _outside_mio0SegmentRomEnd
    load_mio0         /*seg*/ 0x05, /*romStart*/ _group9_mio0SegmentRomStart, /*romEnd*/ _group9_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0C, /*romStart*/ _group9_geoSegmentRomStart,  /*romEnd*/ _group9_geoSegmentRomEnd
    load_mio0         /*seg*/ 0x08, /*romStart*/ _common0_mio0SegmentRomStart, /*romEnd*/ _common0_mio0SegmentRomEnd
    load_raw          /*seg*/ 0x0F, /*romStart*/ _common0_geoSegmentRomStart,  /*romEnd*/ _common0_geoSegmentRomEnd
    alloc_level_pool
    mario /*model*/ MODEL_MARIO, /*behParam*/ 0x00000001, /*beh*/ bhvMario
    jump_link /*target*/ script_func_global_1
    jump_link /*target*/ script_func_global_10
    load_model_from_geo /*model*/ MODEL_COURTYARD_SPIKY_TREE,  /*geo*/ spiky_tree_geo
    load_model_from_geo /*model*/ MODEL_COURTYARD_WOODEN_DOOR, /*geo*/ wooden_door_geo
    load_model_from_geo /*model*/ MODEL_LEVEL_GEOMETRY_03,     /*geo*/ castle_courtyard_geo_000200

    area /*index*/ 1, /*geo*/ castle_courtyard_geo_000218
        object /*model*/ MODEL_BOO,  /*pos*/ -2360, -100, -2712, /*angle*/ 0,   0, 0, /*behParam*/ 0x01050000, /*beh*/ bhvBooWithCage
        object /*model*/ MODEL_NONE, /*pos*/     0,   51, -1000, /*angle*/ 0, 180, 0, /*behParam*/ 0x000A0000, /*beh*/ bhvWarps8C
        object /*model*/ MODEL_NONE, /*pos*/     0,   51, -1000, /*angle*/ 0, 180, 0, /*behParam*/ 0x000B0000, /*beh*/ bhvWarps90
        warp_node /*id*/ 0x05, /*destLevel*/ 0x04, /*destArea*/ 0x01, /*destNode*/ 0x0A, /*unk6*/ 0x0000
        warp_node /*id*/ 0x0A, /*destLevel*/ 0x1A, /*destArea*/ 0x01, /*destNode*/ 0x0A, /*unk6*/ 0x0000
        warp_node /*id*/ 0x0B, /*destLevel*/ 0x1A, /*destArea*/ 0x01, /*destNode*/ 0x0B, /*unk6*/ 0x0000
        warp_node /*id*/ 0x01, /*destLevel*/ 0x06, /*destArea*/ 0x01, /*destNode*/ 0x02, /*unk6*/ 0x0000
        warp_node /*id*/ 0xF1, /*destLevel*/ 0x10, /*destArea*/ 0x01, /*destNode*/ 0x03, /*unk6*/ 0x0000
        jump_link /*target*/ script_func_local_1
        jump_link /*target*/ script_func_local_2
        terrain /*terrainData*/ castle_courtyard_seg7_collision
        macro_objects /*objList*/ castle_courtyard_seg7_macro_objs
        set_background_music /*unk2*/ 0x0000, /*seq*/ SEQ_SOUND_PLAYER
        terrain_type /*terrainType*/ TERRAIN_STONE
    end_area

    free_level_pool
    mario_pos /*area*/ 1, /*yaw*/ 0, /*pos*/ -14, 0, -201
    call /*arg*/ 0, /*func*/ lvl_init_or_update
    call_loop /*arg*/ 1, /*func*/ lvl_init_or_update
    clear_level
    sleep_before_exit /*frames*/ 1
    exit
