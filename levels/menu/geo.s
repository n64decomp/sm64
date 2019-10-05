glabel geo_menu_mario_save_button # 0x0E0001D0
   geo_node_start
   geo_open_node
      geo_scale 0x00, 524288
      geo_open_node
         geo_display_list LAYER_OPAQUE, dl_menu_mario_save_button_base
         geo_display_list LAYER_OPAQUE, dl_menu_save_button_back
      geo_close_node
   geo_close_node
   geo_end

glabel geo_menu_mario_save_button_fade # 0x0E000200
   geo_node_start
   geo_open_node
      geo_scale 0x00, 524288
      geo_open_node
         geo_display_list LAYER_OPAQUE, dl_menu_mario_save_button_base
         geo_display_list LAYER_OPAQUE, dl_menu_save_button_fade_back
      geo_close_node
   geo_close_node
   geo_end

glabel geo_menu_mario_new_button # 0x0E000230
   geo_node_start
   geo_open_node
      geo_scale 0x00, 524288
      geo_open_node
         geo_display_list LAYER_OPAQUE, dl_menu_mario_new_button_base
         geo_display_list LAYER_OPAQUE, dl_menu_save_button_back
      geo_close_node
   geo_close_node
   geo_end

glabel geo_menu_mario_new_button_fade # 0x0E000260
   geo_node_start
   geo_open_node
      geo_scale 0x00, 524288
      geo_open_node
         geo_display_list LAYER_OPAQUE, dl_menu_mario_new_button_base
         geo_display_list LAYER_OPAQUE, dl_menu_save_button_fade_back
      geo_close_node
   geo_close_node
   geo_end

glabel geo_menu_erase_button # 0x0E000290
   geo_node_start
   geo_open_node
      geo_scale 0x00, 524288
      geo_open_node
         geo_display_list LAYER_OPAQUE, dl_menu_erase_button
      geo_close_node
   geo_close_node
   geo_end

glabel geo_menu_copy_button # 0x0E0002B8
   geo_node_start
   geo_open_node
      geo_scale 0x00, 524288
      geo_open_node
         geo_display_list LAYER_OPAQUE, dl_menu_copy_button
      geo_close_node
   geo_close_node
   geo_end

glabel geo_menu_file_button # 0x0E0002E0
   geo_node_start
   geo_open_node
      geo_scale 0x00, 524288
      geo_open_node
         geo_display_list LAYER_OPAQUE, dl_menu_file_button
      geo_close_node
   geo_close_node
   geo_end

glabel geo_menu_score_button # 0x0E000308
   geo_node_start
   geo_open_node
      geo_scale 0x00, 524288
      geo_open_node
         geo_display_list LAYER_OPAQUE, dl_menu_score_button
      geo_close_node
   geo_close_node
   geo_end

glabel geo_menu_sound_button # 0x0E000330
   geo_node_start
   geo_open_node
      geo_scale 0x00, 524288
      geo_open_node
         geo_display_list LAYER_OPAQUE, dl_menu_sound_button
      geo_close_node
   geo_close_node
   geo_end

glabel geo_menu_generic_button # 0x0E000358
   geo_node_start
   geo_open_node
      geo_scale 0x00, 524288
      geo_open_node
         geo_display_list LAYER_OPAQUE, dl_menu_generic_button
      geo_close_node
   geo_close_node
   geo_end

glabel geo_menu_file_select_strings_and_menu_cursor # 0x0E000380
   geo_node_screen_area 10, SCREEN_WIDTH/2, SCREEN_HEIGHT/2, SCREEN_WIDTH/2, SCREEN_HEIGHT/2
   geo_open_node
      geo_zbuffer 0
      geo_open_node
         geo_node_ortho 100
         geo_open_node
            geo_background 0x0001
         geo_close_node
      geo_close_node
      geo_zbuffer 1
      geo_open_node
         geo_camera_frustum 45, 100, 25000
         geo_open_node
            geo_camera 0, 0, 0, 1000, 0, 0, 0, 0x00000000
            geo_open_node
               geo_render_obj
            geo_close_node
         geo_close_node
      geo_close_node
      geo_zbuffer 0
      geo_open_node
         geo_asm 0, geo_file_select_strings_and_menu_cursor
      geo_close_node
   geo_close_node
   geo_end

glabel geo_menu_act_selector_strings # 0x0E000408
   geo_node_screen_area 10, SCREEN_WIDTH/2, SCREEN_HEIGHT/2, SCREEN_WIDTH/2, SCREEN_HEIGHT/2
   geo_open_node
      geo_zbuffer 0
      geo_open_node
         geo_node_ortho 100
         geo_open_node
            geo_background 0xFFFF
         geo_close_node
      geo_close_node
      geo_zbuffer 1
      geo_open_node
         geo_camera_frustum 45, 100, 25000
         geo_open_node
            geo_camera 0, 0, 0, 1000, 0, 0, 0, 0x00000000
            geo_open_node
               geo_render_obj
            geo_close_node
         geo_close_node
      geo_close_node
      geo_zbuffer 0
      geo_open_node
         geo_asm 0, geo_act_selector_strings
      geo_close_node
   geo_close_node
   geo_end
