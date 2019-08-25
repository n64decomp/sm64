glabel swoop_geo # 0x0D0000DC
   geo_shadow SHADOW_CIRCLE_4_VERTS, 0x96, 100
   geo_open_node
      geo_scale 0x00, 16384
      geo_open_node
         geo_animated_part LAYER_OPAQUE, 0, 0, 0
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0
            geo_open_node
               geo_billboard
               geo_open_node
                  geo_display_list LAYER_ALPHA, swoop_seg6_dl_06006880
               geo_close_node
            geo_close_node
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 54, 0, 0, swoop_seg6_dl_06006758
               geo_animated_part LAYER_OPAQUE, 54, 0, 0, swoop_seg6_dl_06006A88
               geo_animated_part LAYER_OPAQUE, 57, -48, 0
               geo_open_node
                  geo_animated_part LAYER_ALPHA, 0, 0, 0, swoop_seg6_dl_06006BD0
               geo_close_node
               geo_animated_part LAYER_OPAQUE, 57, -48, 0
               geo_open_node
                  geo_animated_part LAYER_ALPHA, 0, 0, 0, swoop_seg6_dl_06006D00
               geo_close_node
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_end
