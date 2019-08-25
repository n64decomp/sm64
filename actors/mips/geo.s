glabel mips_geo # 0x0D000448
   geo_shadow SHADOW_CIRCLE_4_VERTS, 0x96, 100
   geo_open_node
      geo_scale 0x00, 16384
      geo_open_node
         geo_animated_part LAYER_OPAQUE, 0, 0, 0
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0, mips_seg6_dl_06010C40
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 64, 0, 0, mips_seg6_dl_060107B8
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 52, -24, -32
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 0, 0, 0, mips_seg6_dl_06011DB0
                     geo_open_node
                        geo_animated_part LAYER_OPAQUE, 79, 0, 0, mips_seg6_dl_06011BB0
                     geo_close_node
                  geo_close_node
                  geo_animated_part LAYER_OPAQUE, 52, -24, 32
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 0, 0, 0, mips_seg6_dl_060110B0
                     geo_open_node
                        geo_animated_part LAYER_OPAQUE, 79, 0, 0, mips_seg6_dl_06010E60
                     geo_close_node
                  geo_close_node
               geo_close_node
               geo_animated_part LAYER_OPAQUE, -31, 4, -39
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, mips_seg6_dl_06011FC0
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 45, 0, 0, mips_seg6_dl_06011990
                     geo_open_node
                        geo_animated_part LAYER_OPAQUE, 52, 0, 0, mips_seg6_dl_06011780
                     geo_close_node
                  geo_close_node
               geo_close_node
               geo_animated_part LAYER_OPAQUE, -31, 4, 40
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, mips_seg6_dl_06011ED8
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 45, 0, 0, mips_seg6_dl_06011520
                     geo_open_node
                        geo_animated_part LAYER_OPAQUE, 52, 0, 0, mips_seg6_dl_06011310
                     geo_close_node
                  geo_close_node
               geo_close_node
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
geo_close_node #! more close than open nodes
geo_end
