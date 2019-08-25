glabel rr_geo_0009D0 # 0x0E0009D0
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
         geo_camera_frustum 45, 100, 20000, geo_camera_fov
         geo_open_node
            geo_camera 14, 0, 2000, 6000, 0, 0, -8000, geo_camera_preset_and_pos
            geo_open_node
               geo_asm 0, geo_exec_flying_carpet_timer_update
               geo_display_list LAYER_ALPHA, dl_cruiser_metal_holes
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
