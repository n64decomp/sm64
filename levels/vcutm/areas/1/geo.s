glabel vcutm_geo_000208 # 0x0E000208
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
         geo_camera_frustum 45, 100, 25000, geo_camera_fov
         geo_open_node
            geo_camera 14, 0, 2000, 6000, 0, 0, 0, geo_camera_preset_and_pos
            geo_open_node
               geo_display_list LAYER_OPAQUE, vcutm_seg7_dl_07007E88
               geo_display_list LAYER_OPAQUE, vcutm_seg7_dl_07008E10
               geo_display_list LAYER_OPAQUE, vcutm_seg7_dl_070093E8
               geo_display_list LAYER_ALPHA, vcutm_seg7_dl_070080D0
               geo_render_obj
               geo_asm 0, geo_enfvx_main
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_end
