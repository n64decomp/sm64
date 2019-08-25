glabel ssl_geo_0005D8 # 0x0E0005D8
   geo_culling_radius 2000
   geo_open_node
      geo_render_range -1000, 4000
      geo_open_node
         geo_asm 0x802, geo_movtex_draw_colored_2_no_update
      geo_close_node
      geo_render_range 4000, 12800
      geo_open_node
         geo_display_list LAYER_OPAQUE, ssl_dl_pyramid_quicksand_pit_static
      geo_close_node
   geo_close_node
   geo_end
