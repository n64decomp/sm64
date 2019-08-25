glabel ccm_geo_00051C # 0x0E00051C
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
         geo_camera_frustum 45, 100, 12800, geo_camera_fov
         geo_open_node
            geo_camera 1, 0, 2000, 6000, 0, 0, 0, geo_camera_preset_and_pos
            geo_open_node
               geo_display_list LAYER_OPAQUE, ccm_seg7_dl_0700B090
               geo_display_list LAYER_OPAQUE, ccm_seg7_dl_0700B1D8
               geo_display_list LAYER_OPAQUE, ccm_seg7_dl_0700C380
               geo_display_list LAYER_ALPHA, ccm_seg7_dl_0700D578
               geo_display_list LAYER_TRANSPARENT_DECAL, ccm_seg7_dl_0700DDF0
               geo_asm    0, geo_movtex_pause_control
               geo_asm 0x0501, geo_movtex_draw_water_regions
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
