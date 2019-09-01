glabel spindrift_geo # 0x0C000000
   geo_shadow SHADOW_CIRCLE_4_VERTS, 0x96, 100
   geo_open_node
      geo_scale 0x00, 32768
      geo_open_node
         geo_animated_part LAYER_OPAQUE, 0, 0, 0
         geo_open_node
            geo_animated_part LAYER_ALPHA, 0, 0, 0, spindrift_seg5_dl_05002900
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 100, 0, 0, spindrift_seg5_dl_05000328
               geo_animated_part LAYER_ALPHA, 100, 0, 0, spindrift_seg5_dl_05002A20
               geo_animated_part LAYER_ALPHA, 100, 0, 0, spindrift_seg5_dl_05002B30
               geo_animated_part LAYER_OPAQUE, -88, -32, 0
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, spindrift_seg5_dl_050002A0
                  geo_animated_part LAYER_ALPHA, 0, 0, 0, spindrift_seg5_dl_05002D08
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0
               geo_close_node
            geo_close_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0
            geo_open_node
               geo_billboard
               geo_open_node
                  geo_display_list LAYER_ALPHA, spindrift_seg5_dl_05002748
               geo_close_node
            geo_close_node
            geo_animated_part LAYER_ALPHA, 0, 0, 0, spindrift_seg5_dl_05002830
         geo_close_node
      geo_close_node
   geo_close_node
   geo_end
