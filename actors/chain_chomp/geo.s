glabel chain_chomp # 0x0D0005EC
   geo_shadow SHADOW_CIRCLE_4_VERTS, 0x96, 200
   geo_open_node
      geo_scale 0x00, 16384
      geo_open_node
         geo_animated_part LAYER_OPAQUE, 0, 0, 0
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0, chain_chomp_seg6_dl_06024940
            geo_animated_part LAYER_OPAQUE, 0, 0, 0, chain_chomp_seg6_dl_06024FC0
         geo_close_node
         geo_animated_part LAYER_OPAQUE, 0, 0, 0
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0, chain_chomp_seg6_dl_06024240
            geo_animated_part LAYER_OPAQUE, 0, 0, 0, chain_chomp_seg6_dl_06024D60
            geo_animated_part LAYER_ALPHA, 0, 0, 0, chain_chomp_seg6_dl_06024B00
         geo_close_node
      geo_close_node
   geo_close_node
geo_close_node #! more close than open nodes
geo_end
