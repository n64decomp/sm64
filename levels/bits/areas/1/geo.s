glabel bits_geo_000718 # 0x0E000718
   geo_node_screen_area 10, SCREEN_WIDTH/2, SCREEN_HEIGHT/2, SCREEN_WIDTH/2, SCREEN_HEIGHT/2
   geo_open_node
      geo_zbuffer 0
      geo_open_node
         geo_node_ortho 100
         geo_open_node
            geo_background BACKGROUND_PURPLE_SKY, geo_skybox_main
         geo_close_node
      geo_close_node
      geo_zbuffer 1
      geo_open_node
         geo_camera_frustum 45, 100, 20000, geo_camera_fov
         geo_open_node
            geo_camera 14, 0, 2000, 6000, 0, -4500, -8000, geo_camera_preset_and_pos
            geo_open_node
               geo_display_list LAYER_ALPHA, bits_seg7_dl_07002918
               geo_render_obj
               geo_asm 0, geo_enfvx_main
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_end
