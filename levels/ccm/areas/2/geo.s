glabel ccm_geo_0005E8 # 0x0E0005E8
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
            geo_camera 9, 0, 2000, 6000, 0, 0, 0, geo_camera_preset_and_pos
            geo_open_node
               geo_display_list LAYER_OPAQUE, ccm_seg7_dl_0701CE30
               geo_display_list LAYER_OPAQUE, ccm_seg7_dl_0701E558
               geo_display_list LAYER_OPAQUE_DECAL, ccm_seg7_dl_0701E6B0
               geo_display_list LAYER_ALPHA, ccm_seg7_dl_0701FC78
               geo_display_list LAYER_ALPHA, ccm_seg7_dl_0701FD78
               geo_display_list LAYER_TRANSPARENT, ccm_seg7_dl_0701FE60
               geo_display_list LAYER_TRANSPARENT, ccm_seg7_dl_070207F0
               geo_render_obj
               geo_asm 0, geo_enfvx_main
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_end
