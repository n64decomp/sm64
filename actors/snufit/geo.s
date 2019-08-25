glabel snufit_geo # 0x0D0001A0
   geo_shadow SHADOW_CIRCLE_4_VERTS, 0x96, 100
   geo_open_node
      geo_scale 0x00, 16384
      geo_open_node
         geo_asm 0, Geo18_8030D93C
         geo_translate_node 0x00, 0, 0, 0
         geo_open_node
            geo_display_list LAYER_OPAQUE, snufit_seg6_dl_06009748
         geo_close_node
         geo_display_list LAYER_OPAQUE, snufit_seg6_dl_06009498
         geo_display_list LAYER_OPAQUE, snufit_seg6_dl_06009938
         geo_display_list LAYER_OPAQUE, snufit_seg6_dl_06009B68
         geo_billboard
         geo_open_node
            geo_asm 0, Geo18_8030D9AC
            geo_scale 0x00, 0
            geo_open_node
               geo_display_list LAYER_ALPHA, snufit_seg6_dl_06009A10
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
geo_close_node #! more close than open nodes
geo_end
