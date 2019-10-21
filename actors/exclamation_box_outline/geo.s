glabel exclamation_box_outline_geo # 0x0F000A5A
   geo_culling_radius 300
   geo_open_node
      geo_shadow SHADOW_SQUARE_PERMANENT, 0xB4, 70
      geo_open_node
         geo_switch_case 4, geo_switch_anim_state
         geo_open_node
            geo_display_list LAYER_TRANSPARENT, exclamation_box_outline_seg8_dl_08024F88
            geo_display_list LAYER_TRANSPARENT, exclamation_box_outline_seg8_dl_08024FA8
            geo_display_list LAYER_TRANSPARENT, exclamation_box_outline_seg8_dl_08024FC8
            geo_display_list LAYER_TRANSPARENT, exclamation_box_outline_seg8_dl_08024FE8
         geo_close_node
         geo_display_list LAYER_ALPHA, exclamation_box_outline_seg8_dl_080259F8
      geo_close_node
   geo_close_node
   geo_end
