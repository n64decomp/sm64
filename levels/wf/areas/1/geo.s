glabel wf_geo_000BF8 # 0x0E000BF8
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
            geo_camera 1, 0, 2000, 6000, 0, 2000, 0, geo_camera_preset_and_pos
            geo_open_node
               geo_display_list LAYER_OPAQUE, wf_seg7_dl_070050C8
               geo_display_list LAYER_OPAQUE_DECAL, wf_seg7_dl_070052B8
               geo_display_list LAYER_TRANSPARENT_DECAL, wf_seg7_dl_07005538
               geo_display_list LAYER_TRANSPARENT, wf_seg7_dl_07005690
               geo_render_obj
               geo_asm    0, geo_movtex_pause_control
               geo_asm 0x2401, geo_movtex_draw_water_regions
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
