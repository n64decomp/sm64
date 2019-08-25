glabel ending_geo_000050 # 0x0E000050
   geo_node_screen_area 10, SCREEN_WIDTH/2, SCREEN_HEIGHT/2, SCREEN_WIDTH/2, SCREEN_HEIGHT/2
   geo_open_node
      geo_zbuffer 0
      geo_open_node
         geo_node_ortho 100
         geo_open_node
            geo_asm 0, geo_exec_cake_end_screen
         geo_close_node
      geo_close_node
      geo_zbuffer 1
      geo_open_node
         geo_camera_frustum 45, 100, 12800, geo_camera_fov
         geo_open_node
            geo_camera 1, 0, 2000, 6000, 0, 0, 0, geo_camera_preset_and_pos
         geo_close_node
      geo_close_node
   geo_close_node
   geo_end

.word 0x0
