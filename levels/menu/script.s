glabel level_main_menu_entry_1
    init_level
    fixed_load /*loadAddr*/ _goddardSegmentStart, /*romStart*/ _goddardSegmentRomStart, /*romEnd*/ _goddardSegmentRomEnd
    load_mio0 /*seg*/ 0x07, /*romStart*/ _menu_segment_7SegmentRomStart, /*romEnd*/ _menu_segment_7SegmentRomEnd
    load_raw /*seg*/ 0x13, /*romStart*/ _behaviorSegmentRomStart, /*romEnd*/ _behaviorSegmentRomEnd
    alloc_level_pool
    load_model_from_geo /*model*/ MODEL_MAIN_MENU_MARIO_SAVE_BUTTON,      /*geo*/ geo_menu_mario_save_button
    load_model_from_geo /*model*/ MODEL_MAIN_MENU_RED_ERASE_BUTTON,       /*geo*/ geo_menu_erase_button
    load_model_from_geo /*model*/ MODEL_MAIN_MENU_BLUE_COPY_BUTTON,       /*geo*/ geo_menu_copy_button
    load_model_from_geo /*model*/ MODEL_MAIN_MENU_YELLOW_FILE_BUTTON,     /*geo*/ geo_menu_file_button
    load_model_from_geo /*model*/ MODEL_MAIN_MENU_GREEN_SCORE_BUTTON,     /*geo*/ geo_menu_score_button
    load_model_from_geo /*model*/ MODEL_MAIN_MENU_MARIO_SAVE_BUTTON_FADE, /*geo*/ geo_menu_mario_save_button_fade
    load_model_from_geo /*model*/ MODEL_MAIN_MENU_MARIO_NEW_BUTTON,       /*geo*/ geo_menu_mario_new_button
    load_model_from_geo /*model*/ MODEL_MAIN_MENU_MARIO_NEW_BUTTON_FADE,  /*geo*/ geo_menu_mario_new_button_fade
    load_model_from_geo /*model*/ MODEL_MAIN_MENU_PURPLE_SOUND_BUTTON,    /*geo*/ geo_menu_sound_button
    load_model_from_geo /*model*/ MODEL_MAIN_MENU_GENERIC_BUTTON,         /*geo*/ geo_menu_generic_button

    area /*index*/ 1, /*geo*/ geo_menu_file_select_strings_and_menu_cursor
        object /*model*/ MODEL_NONE,         /*pos*/ 0, 0, -19000, /*angle*/ 0, 0, 0, /*behParam*/ 0x04000000, /*beh*/ bhvMenuButtonManager
        object /*model*/ MODEL_MAIN_MENU_YELLOW_FILE_BUTTON, /*pos*/ 0, 0, -19000, /*angle*/ 0, 0, 0, /*behParam*/ 0x04000000, /*beh*/ bhvYellowBackgroundInMenu
        terrain /*terrainData*/ main_menu_seg7_collision
    end_area

    free_level_pool
    load_area /*area*/ 1
    set_menu_music /*seq*/ 0x0021
    transition /*unk2*/ 0, /*unk3*/ 16, /*color*/ -1, -1, -1
    call /*arg*/ 0, /*func*/ lvl_init_menu_values_and_cursor_pos
    call_loop /*arg*/ 0, /*func*/ lvl_update_obj_and_load_file_selected
    get_or_set /*op*/ OP_SET, /*var*/ VAR_CURR_SAVE_FILE_NUM
    cmd38 /*unk2*/ 0x00BE
    transition /*unk2*/ 1, /*unk3*/ 16, /*color*/ -1, -1, -1
    sleep /*frames*/ 16
    clear_level
    sleep_before_exit /*frames*/ 1
    set_reg /*value*/ 16
    exit_and_execute /*seg*/ 0x15, /*script*/ _scriptsSegmentRomStart, /*scriptEnd*/ _scriptsSegmentRomEnd, /*entry*/ level_main_scripts_entry

glabel level_main_menu_entry_2
    call /*arg*/ 0, /*func*/ lvl_set_current_level
    jump_if /*op*/ OP_EQ, /*arg*/ 0, /*target*/ L1
    init_level
    fixed_load /*loadAddr*/ _goddardSegmentStart, /*romStart*/ _goddardSegmentRomStart, /*romEnd*/ _goddardSegmentRomEnd
    load_mio0 /*seg*/ 0x07, /*romStart*/ _menu_segment_7SegmentRomStart, /*romEnd*/ _menu_segment_7SegmentRomEnd
    alloc_level_pool

    area /*index*/ 2, /*geo*/ geo_menu_act_selector_strings
        object /*model*/ MODEL_NONE, /*pos*/ 0, -100, 0, /*angle*/ 0, 0, 0, /*behParam*/ 0x04000000, /*beh*/ bhvActSelector
        terrain /*terrainData*/ main_menu_seg7_collision
    end_area

    free_level_pool
    load_area /*area*/ 2
    transition /*unk2*/ 0, /*unk3*/ 16, /*color*/ -1, -1, -1
    sleep /*frames*/ 16
    set_menu_music /*seq*/ 0x000D
    call /*arg*/ 0, /*func*/ lvl_init_act_selector_values_and_stars
    call_loop /*arg*/ 0, /*func*/ lvl_update_obj_and_load_act_button_actions
    get_or_set /*op*/ OP_SET, /*var*/ VAR_CURR_ACT_NUM
    cmd38 /*unk2*/ 0x00BE
    transition /*unk2*/ 1, /*unk3*/ 16, /*color*/ -1, -1, -1
    sleep /*frames*/ 16
    clear_level
    sleep_before_exit /*frames*/ 1
L1:
    exit
