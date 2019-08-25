glabel enemy_lakitu_geo # 0x0C0001BC
   geo_shadow SHADOW_CIRCLE_4_VERTS, 0x96, 100
   geo_open_node
      geo_scale 0x00, 16384
      geo_open_node
         geo_animated_part LAYER_OPAQUE, 0, 63, -62, lakitu_enemy_seg5_dl_050138B0
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0, lakitu_enemy_seg5_dl_05012910
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 132, 0, 0, lakitu_enemy_seg5_dl_05013160
               geo_open_node
                  geo_switch_case 2, geo_switch_anim_state
                  geo_open_node
                     geo_display_list LAYER_ALPHA, lakitu_enemy_seg5_dl_05013350
                     geo_display_list LAYER_ALPHA, lakitu_enemy_seg5_dl_05013378
                  geo_close_node
               geo_close_node
               geo_animated_part LAYER_OPAQUE, 87, 18, 72
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, lakitu_enemy_seg5_dl_050136A0
               geo_close_node
               geo_animated_part LAYER_OPAQUE, 87, 18, -72
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, lakitu_enemy_seg5_dl_050134A8
                  geo_asm 0, Geo18_8029D890
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0
               geo_close_node
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_end
