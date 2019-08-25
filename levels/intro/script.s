glabel level_intro_entry_1
    init_level
    fixed_load /*loadAddr*/ _goddardSegmentStart, /*romStart*/ _goddardSegmentRomStart, /*romEnd*/ _goddardSegmentRomEnd
    load_raw /*seg*/ 0x13, /*romStart*/ _behaviorSegmentRomStart, /*romEnd*/ _behaviorSegmentRomEnd
    load_mio0 /*seg*/ 0x07, /*romStart*/ _intro_segment_7SegmentRomStart, /*romEnd*/ _intro_segment_7SegmentRomEnd
    alloc_level_pool

    area /*index*/ 1, /*geo*/ intro_geo_0002D0
    end_area

    free_level_pool
    load_area /*area*/ 1
    call /*arg*/ 0, /*func*/ LevelProc_8016F508
    sleep /*frames*/ 75
    transition /*unk2*/ 1, /*unk3*/ 16, /*color*/ 0, 0, 0
    sleep /*frames*/ 16
    cmd2A /*unk2*/ 1
    clear_level
    sleep /*frames*/ 2
    exit_and_execute /*seg*/ 0x14, /*script*/ _introSegmentRomStart, /*scriptEnd*/ _introSegmentRomEnd, /*entry*/ level_intro_entry_2

glabel level_intro_entry_2
    init_level
    blackout /*active*/ TRUE
    fixed_load /*loadAddr*/ _goddardSegmentStart, /*romStart*/ _goddardSegmentRomStart, /*romEnd*/ _goddardSegmentRomEnd
    load_mario_head /*loadHeadID*/ REGULAR_FACE
    load_raw /*seg*/ 0x13, /*romStart*/ _behaviorSegmentRomStart, /*romEnd*/ _behaviorSegmentRomEnd
    load_mio0_texture /*seg*/ 0x0A, /*romStart*/ _title_screen_bg_mio0SegmentRomStart, /*romEnd*/ _title_screen_bg_mio0SegmentRomEnd
    alloc_level_pool

    area /*index*/ 1, /*geo*/ intro_geo_00035C
    end_area

    free_level_pool
    sleep /*frames*/ 2
    blackout /*active*/ FALSE
    load_area /*area*/ 1
    set_menu_music /*seq*/ 0x0002
    transition /*unk2*/ 8, /*unk3*/ 20, /*color*/ 0, 0, 0
    sleep /*frames*/ 20
    call_loop /*arg*/ 1, /*func*/ LevelProc_8016F508
    jump_if /*op*/ OP_EQ, /*arg*/ 100, /*target*/ L1
    jump_if /*op*/ OP_EQ, /*arg*/ 101, /*target*/ L2
    jump /*target*/ L4

glabel level_intro_entry_3
    init_level
    blackout /*active*/ TRUE
    fixed_load /*loadAddr*/ _goddardSegmentStart, /*romStart*/ _goddardSegmentRomStart, /*romEnd*/ _goddardSegmentRomEnd
    load_mario_head /*loadHeadID*/ DIZZY_FACE
    load_raw /*seg*/ 0x13, /*romStart*/ _behaviorSegmentRomStart, /*romEnd*/ _behaviorSegmentRomEnd
    load_mio0_texture /*seg*/ 0x0A, /*romStart*/ _title_screen_bg_mio0SegmentRomStart, /*romEnd*/ _title_screen_bg_mio0SegmentRomEnd
    alloc_level_pool

    area /*index*/ 1, /*geo*/ intro_geo_0003B8
    end_area

    free_level_pool
    sleep /*frames*/ 2
    blackout /*active*/ FALSE
    load_area /*area*/ 1
    set_menu_music /*seq*/ 0x0082
    transition /*unk2*/ 8, /*unk3*/ 20, /*color*/ 0, 0, 0
    sleep /*frames*/ 20
    call_loop /*arg*/ 2, /*func*/ LevelProc_8016F508
    jump_if /*op*/ OP_EQ, /*arg*/ 100, /*target*/ L1
    jump_if /*op*/ OP_EQ, /*arg*/ 101, /*target*/ L2
    jump /*target*/ L4

glabel level_intro_entry_4
    init_level
    load_raw /*seg*/ 0x13, /*romStart*/ _behaviorSegmentRomStart, /*romEnd*/ _behaviorSegmentRomEnd
    load_mio0_texture /*seg*/ 0x0A, /*romStart*/ _title_screen_bg_mio0SegmentRomStart, /*romEnd*/ _title_screen_bg_mio0SegmentRomEnd
    load_mio0 /*seg*/ 0x07, /*romStart*/ _debug_level_select_mio0SegmentRomStart, /*romEnd*/ _debug_level_select_mio0SegmentRomEnd
    fixed_load /*loadAddr*/ _goddardSegmentStart, /*romStart*/ _goddardSegmentRomStart, /*romEnd*/ _goddardSegmentRomEnd
    alloc_level_pool

    area /*index*/ 1, /*geo*/ intro_geo_000414
    end_area

    free_level_pool
    load_area /*area*/ 1
    set_menu_music /*seq*/ 0x0002
    transition /*unk2*/ 0, /*unk3*/ 16, /*color*/ -1, -1, -1
    sleep /*frames*/ 16
    call_loop /*arg*/ 3, /*func*/ LevelProc_8016F508
    jump_if /*op*/ OP_EQ, /*arg*/ -1, /*target*/ L5
    jump /*target*/ L3
L1:
    cmd38 /*unk2*/ 0x00BE
    transition /*unk2*/ 1, /*unk3*/ 16, /*color*/ -1, -1, -1
    sleep /*frames*/ 16
    clear_level
    sleep /*frames*/ 2
    set_reg /*value*/ 16
    exit_and_execute /*seg*/ 0x14, /*script*/ _menuSegmentRomStart, /*scriptEnd*/ _menuSegmentRomEnd, /*entry*/ level_main_menu_entry_1

L2:
    transition /*unk2*/ 1, /*unk3*/ 16, /*color*/ -1, -1, -1
    sleep /*frames*/ 16
    clear_level
    sleep /*frames*/ 2
    exit_and_execute /*seg*/ 0x14, /*script*/ _introSegmentRomStart, /*scriptEnd*/ _introSegmentRomEnd, /*entry*/ level_intro_entry_4

L3:
    cmd38 /*unk2*/ 0x00BE
    transition /*unk2*/ 1, /*unk3*/ 16, /*color*/ -1, -1, -1
    sleep /*frames*/ 16
    clear_level
    sleep /*frames*/ 2
    exit_and_execute /*seg*/ 0x15, /*script*/ _scriptsSegmentRomStart, /*scriptEnd*/ _scriptsSegmentRomEnd, /*entry*/ level_main_scripts_entry

L4:
    transition /*unk2*/ 1, /*unk3*/ 16, /*color*/ -1, -1, -1
    sleep /*frames*/ 16
    clear_level
    sleep /*frames*/ 2
    exit_and_execute /*seg*/ 0x15, /*script*/ _scriptsSegmentRomStart, /*scriptEnd*/ _scriptsSegmentRomEnd, /*entry*/ level_main_scripts_entry

L5:
    cmd38 /*unk2*/ 0x00BE
    transition /*unk2*/ 1, /*unk3*/ 16, /*color*/ 0, 0, 0
    sleep /*frames*/ 16
    clear_level
    sleep /*frames*/ 2
    exit_and_execute /*seg*/ 0x14, /*script*/ _introSegmentRomStart, /*scriptEnd*/ _introSegmentRomEnd, /*entry*/ level_intro_entry_1
