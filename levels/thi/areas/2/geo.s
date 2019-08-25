# SHARE_PATH: [level]/areas/1/1/, [level]/areas/1/2/, [level]/areas/1/3/, [level]/areas/1/4/

glabel thi_geo_0006D4 # 0x0E0006D4
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
         geo_camera_frustum 45, 100, 12800, geo_camera_fov
         geo_open_node
            geo_camera 1, 0, 2000, 6000, 0, 0, 0, geo_camera_preset_and_pos
            geo_open_node
               geo_scale 0x00, 19660
               geo_open_node
                  geo_display_list LAYER_OPAQUE, thi_seg7_dl_07005260
                  geo_display_list LAYER_OPAQUE, thi_seg7_dl_07006968
                  geo_display_list LAYER_ALPHA, thi_seg7_dl_07007008
                  geo_display_list LAYER_TRANSPARENT, thi_seg7_dl_070072E8
               geo_close_node
               geo_display_list LAYER_TRANSPARENT_DECAL, thi_seg7_dl_07007538
               geo_asm    0, geo_movtex_pause_control
               geo_asm 0x1302, geo_movtex_draw_water_regions
               geo_render_obj
               geo_asm    0, geo_enfvx_main
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_end
