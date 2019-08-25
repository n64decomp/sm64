glabel bob_geo_000488 # 0x0E000488
   geo_node_screen_area 10, SCREEN_WIDTH/2, SCREEN_HEIGHT/2, SCREEN_WIDTH/2, SCREEN_HEIGHT/2
   geo_open_node
      geo_zbuffer 0
      geo_open_node
         geo_node_ortho 100
         geo_open_node
            geo_background BACKGROUND_OCEAN_SKY, geo_skybox_main
         geo_close_node
      geo_close_node
      geo_zbuffer 1
      geo_open_node
         geo_camera_frustum 45, 100, 30000, geo_camera_fov
         geo_open_node
            geo_camera 1, 0, 2000, 6000, 3072, 0, -4608, geo_camera_preset_and_pos
            geo_open_node
               geo_display_list LAYER_OPAQUE, bob_seg7_dl_07004390
               geo_display_list LAYER_OPAQUE, bob_seg7_dl_07009D80
               geo_display_list LAYER_TRANSPARENT_DECAL, bob_seg7_dl_0700A470
               geo_display_list LAYER_ALPHA, bob_seg7_dl_0700A920
               geo_display_list LAYER_OPAQUE, bob_seg7_dl_0700DD18
               geo_display_list LAYER_OPAQUE, bob_seg7_dl_0700E338
               geo_render_obj
               geo_asm 0, geo_enfvx_main
            geo_close_node
         geo_close_node
      geo_close_node
      geo_zbuffer 0
      geo_open_node
         geo_asm 0, Geo18_802CD1E8
      geo_close_node
   geo_close_node
   geo_end
