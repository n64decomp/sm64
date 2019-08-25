glabel breakable_box_geo # 0x0F0005D0
   geo_culling_radius 500
   geo_open_node
      geo_shadow SHADOW_SQUARE_PERMANENT, 0xB4, 240
      geo_open_node
         geo_switch_case 2, geo_switch_anim_state
         geo_open_node
            geo_display_list LAYER_OPAQUE, breakable_box_seg8_dl_08012D20
            geo_display_list LAYER_OPAQUE, breakable_box_seg8_dl_08012D48
         geo_close_node
      geo_close_node
   geo_close_node
   geo_end

glabel breakable_box_small_geo # 0x0F000610
   geo_culling_radius 500
   geo_open_node
      geo_switch_case 2, geo_switch_anim_state
      geo_open_node
         geo_display_list LAYER_OPAQUE, breakable_box_seg8_dl_08012D20
         geo_display_list LAYER_OPAQUE, breakable_box_seg8_dl_08012D48
      geo_close_node
   geo_close_node
   geo_end
