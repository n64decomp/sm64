glabel boo_geo # 0x0C000224
   geo_shadow SHADOW_CIRCLE_4_VERTS, 0x96, 70
   geo_open_node
      geo_scale 0x00, 26214
      geo_open_node
         geo_asm 0, Geo18_8029D924
         geo_switch_case 2, geo_switch_anim_state
         geo_open_node
            geo_display_list LAYER_OPAQUE, boo_seg5_dl_0500C1B0
            geo_display_list LAYER_TRANSPARENT, boo_seg5_dl_0500C1B0
         geo_close_node
      geo_close_node
   geo_close_node
geo_close_node #! more close than open nodes
geo_end
