glabel water_bomb_geo # 0x0C000308
   geo_culling_radius 150
   geo_open_node
      geo_open_node
         geo_display_list LAYER_TRANSPARENT, water_bubble_seg5_dl_05011000
      geo_close_node
   geo_close_node
   geo_end

glabel water_bomb_shadow_geo # 0x0C000328
   geo_culling_radius 150
   geo_open_node
      geo_shadow SHADOW_CIRCLE_4_VERTS, 0x64, 160
   geo_close_node
   geo_end
