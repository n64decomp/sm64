glabel fish_shadow_geo # 0x16000BEC
   geo_shadow SHADOW_CIRCLE_4_VERTS, 0x9B, 50
   geo_open_node
      geo_scale 0x00, 16384
      geo_open_node
         geo_animated_part LAYER_OPAQUE, -16, 0, 0
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0, blue_fish_seg3_dl_0301BFB8
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 97, 0, 0, blue_fish_seg3_dl_0301C150
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_end

glabel fish_geo # 0x16000C44
   geo_scale 0x00, 16384
   geo_open_node
      geo_animated_part LAYER_OPAQUE, -16, 0, 0
      geo_open_node
         geo_animated_part LAYER_OPAQUE, 0, 0, 0, blue_fish_seg3_dl_0301BFB8
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 97, 0, 0, blue_fish_seg3_dl_0301C150
         geo_close_node
      geo_close_node
   geo_close_node
   geo_end
