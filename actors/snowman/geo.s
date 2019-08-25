glabel mr_blizzard_hidden_geo # 0x0C00021C
   geo_scale 0x00, 16384
   geo_open_node
      geo_animated_part LAYER_OPAQUE, 0, 0, 0
      geo_open_node
         geo_animated_part LAYER_OPAQUE, 0, 0, 0
         geo_open_node
            geo_billboard
            geo_open_node
               geo_display_list LAYER_ALPHA, snowman_seg5_dl_0500C620
            geo_close_node
         geo_close_node
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 356, 0, 0
            geo_open_node
               geo_billboard
               geo_open_node
                  geo_display_list LAYER_ALPHA, snowman_seg5_dl_0500CBF8
               geo_close_node
            geo_close_node
            geo_animated_part LAYER_ALPHA, 356, 0, 0, snowman_seg5_dl_0500CCE8
            geo_animated_part LAYER_ALPHA, 356, 0, 0, snowman_seg5_dl_0500C760
            geo_switch_case 2, geo_switch_anim_state
            geo_open_node
               geo_node_start
               geo_node_start
               geo_open_node
                  geo_scale 0x00, 65536
                  geo_open_node
                     geo_translate_rotate LAYER_OPAQUE, 490, 14, 43, 305, 0, 248, mario_cap_seg3_dl_03022F48
                  geo_close_node
               geo_close_node
            geo_close_node
            geo_animated_part LAYER_OPAQUE, 89, 0, -229
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 0, 0, 0, snowman_seg5_dl_0500C500
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 68, 0, 0, snowman_seg5_dl_0500CAA8
                  geo_asm 0, Geo18_8029D890
               geo_close_node
            geo_close_node
            geo_animated_part LAYER_OPAQUE, 356, 0, 0
         geo_close_node
      geo_close_node
   geo_close_node
   geo_end

glabel mr_blizzard_geo # 0x0C000348
   geo_shadow SHADOW_CIRCLE_4_VERTS, 0xB4, 160
   geo_open_node
      geo_branch_and_link mr_blizzard_hidden_geo
   geo_close_node
   geo_end
