glabel goomba_geo # 0x0F0006E4
   geo_shadow SHADOW_CIRCLE_4_VERTS, 0x96, 100
   geo_open_node
      geo_scale 0x00, 16384
      geo_open_node
         geo_animated_part LAYER_OPAQUE, 0, 0, 0, goomba_seg8_dl_0801D760
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0
            geo_open_node
               geo_billboard
               geo_open_node
                  geo_display_list LAYER_ALPHA, goomba_seg8_dl_0801B690
               geo_close_node
            geo_close_node
            geo_open_node
               geo_switch_case 2, geo_switch_anim_state
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 48, 0, 0, goomba_seg8_dl_0801B5C8
                  geo_animated_part LAYER_OPAQUE, 48, 0, 0, goomba_seg8_dl_0801B5F0
               geo_close_node
               geo_animated_part LAYER_OPAQUE, -60, -16, 45
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, goomba_seg8_dl_0801CE20
               geo_close_node
               geo_animated_part LAYER_OPAQUE, -60, -16, -45
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, goomba_seg8_dl_0801CF78
               geo_close_node
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_end
