glabel ddd_geo_000570 # 0x0E000570
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
         geo_camera_frustum 45, 100, 12800, geo_camera_fov
         geo_open_node
            geo_camera 4, 0, 2000, 6000, 2560, 0, 512, geo_camera_preset_and_pos
            geo_open_node
               geo_display_list LAYER_OPAQUE, ddd_seg7_dl_07007408
               geo_display_list LAYER_OPAQUE, ddd_seg7_dl_07007CB8
               geo_display_list LAYER_ALPHA, ddd_seg7_dl_07008C48
               geo_display_list LAYER_TRANSPARENT, ddd_seg7_dl_07008F80
               geo_display_list LAYER_ALPHA, ddd_seg7_dl_0700BAE0
               geo_display_list LAYER_OPAQUE, ddd_seg7_dl_0700CE48
               geo_asm    0, geo_movtex_pause_control
               geo_asm 0x2302, geo_movtex_draw_water_regions
               geo_render_obj
               geo_asm   14, geo_enfvx_main
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_end
