glabel flyguy_geo # 0x0F000518
   geo_shadow SHADOW_CIRCLE_4_VERTS, 0x96, 100
   geo_open_node
      geo_scale 0x00, 16384
      geo_open_node
         geo_animated_part LAYER_OPAQUE, 0, 0, 0
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0, flyguy_seg8_dl_08011710
            geo_open_node
               geo_animated_part LAYER_OPAQUE, -45, -20, -55
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, flyguy_seg8_dl_08010840
               geo_close_node
               geo_animated_part LAYER_OPAQUE, -45, -20, 55
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, flyguy_seg8_dl_08010968
               geo_close_node
               geo_animated_part LAYER_OPAQUE, 250, 0, 0
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, flyguy_seg8_dl_08010B80
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0
               geo_close_node
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_end
