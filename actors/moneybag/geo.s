glabel moneybag_geo_000000 # 0x0D000000
   geo_animated_part LAYER_OPAQUE, 0, 0, 0
   geo_open_node
      geo_animated_part LAYER_OPAQUE, 0, 0, 0, moneybag_seg6_dl_06005750
      geo_open_node
         geo_animated_part LAYER_OPAQUE, 0, 0, -120
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0, moneybag_seg6_dl_06005980
         geo_close_node
         geo_animated_part LAYER_OPAQUE, 0, 0, 120
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0, moneybag_seg6_dl_060059F0
         geo_close_node
      geo_close_node
      geo_animated_part LAYER_OPAQUE, 0, 0, 0, moneybag_seg6_dl_06005688
   geo_close_node
   geo_return

glabel moneybag_geo_000078 # 0x0D000078
   geo_animated_part LAYER_OPAQUE, 0, 0, 0
   geo_open_node
      geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, moneybag_seg6_dl_06005750
      geo_open_node
         geo_animated_part LAYER_OPAQUE, 0, 0, -120
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, moneybag_seg6_dl_06005980
         geo_close_node
         geo_animated_part LAYER_OPAQUE, 0, 0, 120
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, moneybag_seg6_dl_060059F0
         geo_close_node
      geo_close_node
      geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, moneybag_seg6_dl_06005688
   geo_close_node
   geo_return

glabel moneybag_geo # 0x0D0000F0
   geo_shadow SHADOW_CIRCLE_4_VERTS, 0xC8, 100
   geo_open_node
      geo_scale 0x00, 16384
      geo_open_node
         geo_asm 0, Geo18_8029D924
         geo_switch_case 2, geo_switch_anim_state
         geo_open_node
            geo_branch 1, moneybag_geo_000000
            geo_branch 1, moneybag_geo_000078
         geo_close_node
      geo_close_node
   geo_close_node
geo_close_node #! more close than open nodes
geo_end
