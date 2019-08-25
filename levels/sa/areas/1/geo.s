glabel sa_geo_000170 # 0x0E000170
   geo_node_screen_area 10, SCREEN_WIDTH/2, SCREEN_HEIGHT/2, SCREEN_WIDTH/2, SCREEN_HEIGHT/2
   geo_open_node
      geo_zbuffer 0
      geo_open_node
         geo_node_ortho 100
         geo_open_node
            geo_background BACKGROUND_BELOW_CLOUDS, geo_skybox_main
         geo_close_node
      geo_close_node
      geo_zbuffer 1
      geo_open_node
         geo_camera_frustum 45, 100, 12800, geo_camera_fov
         geo_open_node
            geo_camera 1, 0, 2000, 6000, 0, 0, 0, geo_camera_preset_and_pos
            geo_open_node
               geo_display_list LAYER_OPAQUE, sa_seg7_dl_07002DE8
               geo_display_list LAYER_TRANSPARENT, sa_seg7_dl_07002FD0
               geo_render_obj
               geo_asm 2, geo_enfvx_main
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_end
