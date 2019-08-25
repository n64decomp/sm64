glabel sl_geo_0003A8 # 0x0E0003A8
   geo_node_screen_area 10, SCREEN_WIDTH/2, SCREEN_HEIGHT/2, SCREEN_WIDTH/2, SCREEN_HEIGHT/2
   geo_open_node
      geo_zbuffer 0
      geo_open_node
         geo_node_ortho 100
         geo_open_node
            geo_background BACKGROUND_SNOW_MOUNTAINS, geo_skybox_main
         geo_close_node
      geo_close_node
      geo_zbuffer 1
      geo_open_node
         geo_camera_frustum 45, 100, 20000, geo_camera_fov
         geo_open_node
            geo_camera 16, 0, 2000, 6000, 0, 4400, 0, geo_camera_preset_and_pos
            geo_open_node
               geo_display_list LAYER_OPAQUE, sl_seg7_dl_07005478
               geo_display_list LAYER_TRANSPARENT, sl_seg7_dl_070056B0
               geo_display_list LAYER_OPAQUE, sl_seg7_dl_070073D0
               geo_display_list LAYER_ALPHA, sl_seg7_dl_07007880
               geo_display_list LAYER_TRANSPARENT, sl_seg7_dl_070088B0
               geo_display_list LAYER_TRANSPARENT_DECAL, sl_seg7_dl_07008D58
               geo_display_list LAYER_OPAQUE, sl_seg7_dl_0700A5A0
               geo_asm    0, geo_movtex_pause_control
               geo_asm 0x1001, geo_movtex_draw_water_regions
               geo_render_obj
               geo_asm    1, geo_enfvx_main
            geo_close_node
         geo_close_node
      geo_close_node
      geo_zbuffer 0
      geo_open_node
         geo_asm 0, Geo18_802CD1E8
      geo_close_node
   geo_close_node
   geo_end
