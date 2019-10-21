glabel amp_geo # 0x0F000028
   geo_shadow SHADOW_CIRCLE_4_VERTS, 0xC8, 100
   geo_open_node
      geo_scale 0x00, 16384
      geo_open_node
         geo_animated_part LAYER_OPAQUE, 0, 0, 0
         geo_open_node
            geo_animated_part LAYER_ALPHA, 0, 0, 0, amp_seg8_dl_08002C88
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 0, 0, 0
               geo_open_node
                  geo_switch_case 2, geo_switch_anim_state
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 0, 0, 0
                     geo_animated_part LAYER_ALPHA, 0, 0, 0, amp_seg8_dl_08002BA0
                  geo_close_node
               geo_close_node
               geo_animated_part LAYER_OPAQUE, 0, 0, 0
               geo_open_node
                  geo_switch_case 2, geo_switch_anim_state
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 0, 0, 0
                     geo_animated_part LAYER_ALPHA, 0, 0, 0, amp_seg8_dl_08002BA0
                  geo_close_node
               geo_close_node
               geo_animated_part LAYER_OPAQUE, 0, 0, 0
               geo_open_node
                  geo_switch_case 2, geo_switch_anim_state
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 0, 0, 0
                     geo_animated_part LAYER_ALPHA, 0, 0, 0, amp_seg8_dl_08002BA0
                  geo_close_node
               geo_close_node
               geo_animated_part LAYER_OPAQUE, 0, 0, 0
               geo_open_node
                  geo_switch_case 2, geo_switch_anim_state
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 0, 0, 0
                     geo_animated_part LAYER_ALPHA, 0, 0, 0, amp_seg8_dl_08002BA0
                  geo_close_node
               geo_close_node
            geo_close_node
            geo_animated_part LAYER_ALPHA, 0, 0, 0, amp_seg8_dl_08002D70
            geo_animated_part LAYER_OPAQUE, 0, 0, 0
            geo_open_node
               geo_billboard
               geo_open_node
                  geo_display_list LAYER_ALPHA, amp_seg8_dl_08002E58
               geo_close_node
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_end
