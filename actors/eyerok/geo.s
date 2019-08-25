glabel eyerok_geo_0002AC # 0x0C0002AC
   geo_animated_part LAYER_OPAQUE, 0, 0, 0
   geo_open_node
      geo_animated_part LAYER_OPAQUE, 0, 0, 0
      geo_open_node
         geo_animated_part LAYER_OPAQUE, 447, 0, 0
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0, eyerok_seg5_dl_0500C640
            geo_animated_part LAYER_OPAQUE, 281, 5, -419
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 0, 0, 0
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 400, 0, 0
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 401, 0, 0
                     geo_open_node
                        geo_animated_part LAYER_OPAQUE, 0, 0, 0, eyerok_seg5_dl_0500BF00
                     geo_close_node
                     geo_animated_part LAYER_OPAQUE, 0, 0, 0, eyerok_seg5_dl_0500C100
                  geo_close_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, eyerok_seg5_dl_0500C378
               geo_close_node
            geo_close_node
            geo_animated_part LAYER_OPAQUE, 281, 5, -218
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 0, 0, 0
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 400, 0, 0
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 401, 0, 0
                     geo_open_node
                        geo_animated_part LAYER_OPAQUE, 0, 0, 0, eyerok_seg5_dl_0500BF00
                     geo_close_node
                     geo_animated_part LAYER_OPAQUE, 0, 0, 0, eyerok_seg5_dl_0500C100
                  geo_close_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, eyerok_seg5_dl_0500C378
               geo_close_node
            geo_close_node
            geo_animated_part LAYER_OPAQUE, 281, 5, -18
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 0, 0, 0
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 400, 0, 0
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 401, 0, 0
                     geo_open_node
                        geo_animated_part LAYER_OPAQUE, 0, 0, 0, eyerok_seg5_dl_0500BF00
                     geo_close_node
                     geo_animated_part LAYER_OPAQUE, 0, 0, 0, eyerok_seg5_dl_0500C100
                  geo_close_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, eyerok_seg5_dl_0500C378
               geo_close_node
            geo_close_node
            geo_animated_part LAYER_OPAQUE, 281, 5, 180
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 0, 0, 0
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 400, 0, 0
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 401, 0, 0
                     geo_open_node
                        geo_animated_part LAYER_OPAQUE, 0, 0, 0, eyerok_seg5_dl_0500BF00
                     geo_close_node
                     geo_animated_part LAYER_OPAQUE, 0, 0, 0, eyerok_seg5_dl_0500C100
                  geo_close_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, eyerok_seg5_dl_0500C378
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_OPAQUE, 0, 0, 0, eyerok_seg5_dl_0500C908
         geo_open_node
            geo_switch_case 4, geo_switch_anim_state
            geo_open_node
               geo_display_list LAYER_ALPHA, eyerok_seg5_dl_0500C9B8
               geo_display_list LAYER_ALPHA, eyerok_seg5_dl_0500CA50
               geo_display_list LAYER_ALPHA, eyerok_seg5_dl_0500CAE8
               geo_display_list LAYER_ALPHA, eyerok_seg5_dl_0500CB80
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_OPAQUE, 181, 89, 80
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 199, 0, 0
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, eyerok_seg5_dl_0500BC88
                  geo_animated_part LAYER_OPAQUE, 200, 199, 199
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 0, 0, 0
                     geo_open_node
                        geo_animated_part LAYER_OPAQUE, 336, 0, 0
                        geo_open_node
                           geo_animated_part LAYER_OPAQUE, 0, 0, 0, eyerok_seg5_dl_0500B748
                        geo_close_node
                        geo_animated_part LAYER_OPAQUE, 0, 0, 0, eyerok_seg5_dl_0500B9C0
                     geo_close_node
                  geo_close_node
               geo_close_node
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_return

glabel eyerok_left_hand_geo # 0x0C0005A8
   geo_shadow SHADOW_SQUARE_SCALABLE, 0xB4, 300
   geo_open_node
      geo_scale 0x00, 16384
      geo_open_node
         geo_display_list LAYER_OPAQUE, eyerok_seg5_dl_0500CC18
         geo_branch 1, eyerok_geo_0002AC
         geo_display_list LAYER_OPAQUE, eyerok_seg5_dl_0500CC30
      geo_close_node
   geo_close_node
   geo_end

glabel eyerok_right_hand_geo # 0x0C0005E4
   geo_shadow SHADOW_SQUARE_SCALABLE, 0xB4, 300
   geo_open_node
      geo_scale 0x00, 16384
      geo_open_node
         geo_branch 1, eyerok_geo_0002AC
      geo_close_node
   geo_close_node
   geo_end
