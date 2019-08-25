glabel wdw_geo_000658 # 0x0E000658
   geo_node_screen_area 10, SCREEN_WIDTH/2, SCREEN_HEIGHT/2, SCREEN_WIDTH/2, SCREEN_HEIGHT/2
   geo_open_node
      geo_zbuffer 0
      geo_open_node
         geo_node_ortho 100
         geo_open_node
            geo_background BACKGROUND_UNDERWATER_CITY, geo_skybox_main
         geo_close_node
      geo_close_node
      geo_zbuffer 1
      geo_open_node
         geo_camera_frustum 45, 100, 12800, geo_camera_fov
         geo_open_node
            geo_camera 1, 0, 2000, 6000, -4352, 0, -4352, geo_camera_preset_and_pos
            geo_open_node
               geo_display_list LAYER_OPAQUE, wdw_seg7_dl_07009AB0
               geo_display_list LAYER_ALPHA, wdw_seg7_dl_0700A138
               geo_display_list LAYER_TRANSPARENT, wdw_seg7_dl_07012798
               geo_display_list LAYER_TRANSPARENT_DECAL, wdw_seg7_dl_07012908
               geo_asm    0, geo_wdw_set_initial_water_level
               geo_asm    0, geo_movtex_pause_control
               geo_asm 0x1101, geo_movtex_draw_water_regions
               geo_render_obj
               geo_asm    0, geo_enfvx_main
            geo_close_node
         geo_close_node
      geo_close_node
      geo_zbuffer 0
      geo_open_node
         geo_asm 0, Geo18_802CD1E8
      geo_close_node
   geo_close_node
   geo_end
