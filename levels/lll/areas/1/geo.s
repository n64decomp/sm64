glabel lll_geo_000E00 # 0x0E000E00
   geo_node_screen_area 10, SCREEN_WIDTH/2, SCREEN_HEIGHT/2, SCREEN_WIDTH/2, SCREEN_HEIGHT/2
   geo_open_node
      geo_zbuffer 0
      geo_open_node
         geo_node_ortho 100
         geo_open_node
            geo_background BACKGROUND_FLAMING_SKY, geo_skybox_main
         geo_close_node
      geo_close_node
      geo_zbuffer 1
      geo_open_node
         geo_camera_frustum 64, 100, 20000, geo_camera_fov
         geo_open_node
            geo_camera 1, 0, 2000, 6000, 0, 0, -8192, geo_camera_preset_and_pos
            geo_open_node
               geo_display_list LAYER_OPAQUE, lll_seg7_dl_070134E0
               geo_display_list LAYER_ALPHA, lll_seg7_dl_070138F8
               geo_display_list LAYER_ALPHA, lll_seg7_dl_070137C0
               geo_asm    0, geo_movtex_pause_control
               geo_asm 0x2201, geo_movtex_draw_nocolor
               geo_render_obj
               geo_asm   12, geo_enfvx_main
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_end
