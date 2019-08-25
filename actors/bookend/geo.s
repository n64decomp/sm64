glabel bookend_part_geo # 0x0C000000
   geo_shadow SHADOW_CIRCLE_4_VERTS, 0x96, 100
   geo_open_node
      geo_scale 0x00, 16384
      geo_open_node
         geo_animated_part LAYER_OPAQUE, 0, 0, 0
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 0, 0, 0, bookend_seg5_dl_05001F98
               geo_animated_part LAYER_OPAQUE, 0, 0, 0, bookend_seg5_dl_05001B20
               geo_animated_part LAYER_OPAQUE, 0, 0, 0, bookend_seg5_dl_05002140
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_OPAQUE, 0, 0, 0
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 0, 0, 0, bookend_seg5_dl_05001D68
               geo_animated_part LAYER_OPAQUE, 0, 0, 0, bookend_seg5_dl_05001978
               geo_animated_part LAYER_OPAQUE, 0, 0, 0, bookend_seg5_dl_050022E0
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
geo_close_node #! more close than open nodes
geo_end
