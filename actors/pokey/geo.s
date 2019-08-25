glabel pokey_head_geo # 0x0C000610
   geo_shadow SHADOW_CIRCLE_4_VERTS, 0x96, 50
   geo_open_node
      geo_switch_case 2, geo_switch_anim_state
      geo_open_node
         geo_display_list LAYER_ALPHA, pokey_seg5_dl_050127D8
         geo_display_list LAYER_ALPHA, pokey_seg5_dl_05012808
      geo_close_node
   geo_close_node
   geo_end

glabel pokey_body_part_geo # 0x0C000644
   geo_shadow SHADOW_CIRCLE_4_VERTS, 0x96, 50
   geo_open_node
      geo_display_list LAYER_ALPHA, pokey_seg5_dl_050130B0
   geo_close_node
   geo_end
