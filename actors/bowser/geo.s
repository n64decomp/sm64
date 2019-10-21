glabel bowser_geo_0000D8 # 0x0D0000D8
   geo_shadow SHADOW_CIRCLE_9_VERTS, 0x9B, 400
   geo_open_node
      geo_animated_part LAYER_OPAQUE, 0, 0, 0, bowser_seg6_dl_06040210
      geo_open_node
         geo_animated_part LAYER_OPAQUE, -89, -2, -18
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 69, 0, 0
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 85, 0, 0
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 0, 0, 0, bowser_seg6_dl_0603D200
                  geo_close_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, bowser_seg6_dl_0603E6B8
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_OPAQUE, 0, -32, -112
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 0, 0, 0, bowser_seg6_dl_06043698
               geo_asm 0, Geo18_802B798C
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_OPAQUE, 118, 67, 105
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 65, 0, 0
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 49, 0, 0
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 0, 0, 0, bowser_seg6_dl_0603B208
                  geo_close_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, bowser_seg6_dl_060399D8
               geo_close_node
               geo_animated_part LAYER_OPAQUE, 0, 0, 0, bowser_seg6_dl_060392E0
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_OPAQUE, 0, 136, 130
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 61, 0, 0
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, -13, 258, 0, bowser_seg6_dl_060431F0
               geo_close_node
               geo_switch_case 9, geo_switch_bowser_eyes
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, bowser_seg6_dl_06042348
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, bowser_seg6_dl_060423A0
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, bowser_seg6_dl_060423F8
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, bowser_seg6_dl_06042450
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, bowser_seg6_dl_060424A8
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, bowser_seg6_dl_06042500
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, bowser_seg6_dl_06042558
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, bowser_seg6_dl_060425B0
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, bowser_seg6_dl_06042608
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_OPAQUE, -118, 67, 105
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 65, 0, 0
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 49, 0, 0
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 0, 0, 0, bowser_seg6_dl_0603DFB0
                  geo_close_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, bowser_seg6_dl_0603C6D0
               geo_close_node
               geo_animated_part LAYER_OPAQUE, 0, 0, 0, bowser_seg6_dl_0603BFC8
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_OPAQUE, 89, -2, -18
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 0, 0, 0
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 69, 0, 0
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 85, 0, 0
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 0, 0, 0, bowser_seg6_dl_0603A4E8
                  geo_close_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, bowser_seg6_dl_0603B8D0
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_OPAQUE, 0, 0, 0
         geo_animated_part LAYER_OPAQUE, 0, 0, 0
         geo_animated_part LAYER_OPAQUE, 0, 0, 0
         geo_animated_part LAYER_OPAQUE, 0, 0, 0
         geo_animated_part LAYER_OPAQUE, 0, 0, 0
         geo_animated_part LAYER_OPAQUE, 0, 0, 0
         geo_animated_part LAYER_OPAQUE, 0, 0, 0
         geo_animated_part LAYER_OPAQUE, 0, 0, 0
         geo_animated_part LAYER_OPAQUE, 0, 0, 0
      geo_close_node
   geo_close_node
   geo_return

glabel bowser_geo_000424 # 0x0D000424
   geo_shadow SHADOW_CIRCLE_9_VERTS, 0x9B, 400
   geo_open_node
.ifdef VERSION_JP
      geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_06040210
.else
      geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_06040358
.endif
      geo_open_node
         geo_animated_part LAYER_TRANSPARENT, -89, -2, -18
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 69, 0, 0
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 85, 0, 0
                  geo_open_node
                     geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_0603D200
                  geo_close_node
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_0603E6B8
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_TRANSPARENT, 0, -32, -112
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_06043698
               geo_asm 0, Geo18_802B798C
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_TRANSPARENT, 118, 67, 105
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 65, 0, 0
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 49, 0, 0
                  geo_open_node
                     geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_0603B208
                  geo_close_node
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_060399D8
               geo_close_node
               geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_060392E0
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_TRANSPARENT, 0, 136, 130
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 61, 0, 0
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, -13, 258, 0, bowser_seg6_dl_060431F0
               geo_close_node
               geo_switch_case 9, geo_switch_bowser_eyes
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_06042348
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_060423A0
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_060423F8
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_06042450
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_060424A8
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_06042500
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_06042558
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_060425B0
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_06042608
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_TRANSPARENT, -118, 67, 105
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 65, 0, 0
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 49, 0, 0
                  geo_open_node
                     geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_0603DFB0
                  geo_close_node
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_0603C6D0
               geo_close_node
               geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_0603BFC8
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_TRANSPARENT, 89, -2, -18
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 69, 0, 0
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 85, 0, 0
                  geo_open_node
                     geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_0603A4E8
                  geo_close_node
.ifdef VERSION_JP
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_0603B8D0
.else
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_0603B948
.endif
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
         geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
         geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
         geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
         geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
         geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
         geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
         geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
         geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
      geo_close_node
   geo_close_node
   geo_return

glabel bowser_geo_000770 # 0x0D000770
   geo_node_start
   geo_open_node
.ifdef VERSION_JP
      geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_06040210
.else
      geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_06040358
.endif
      geo_open_node
         geo_animated_part LAYER_TRANSPARENT, -89, -2, -18
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 69, 0, 0
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 85, 0, 0
                  geo_open_node
                     geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_0603D200
                  geo_close_node
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_0603E6B8
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_TRANSPARENT, 0, -32, -112
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_06043698
               geo_asm 0, Geo18_802B798C
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_TRANSPARENT, 118, 67, 105
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 65, 0, 0
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 49, 0, 0
                  geo_open_node
                     geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_0603B208
                  geo_close_node
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_060399D8
               geo_close_node
               geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_060392E0
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_TRANSPARENT, 0, 136, 130
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 61, 0, 0
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, -13, 258, 0, bowser_seg6_dl_060431F0
               geo_close_node
               geo_switch_case 9, geo_switch_bowser_eyes
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_06042348
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_060423A0
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_060423F8
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_06042450
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_060424A8
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_06042500
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_06042558
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_060425B0
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_06042608
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_TRANSPARENT, -118, 67, 105
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 65, 0, 0
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 49, 0, 0
                  geo_open_node
                     geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_0603DFB0
                  geo_close_node
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_0603C6D0
               geo_close_node
               geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_0603BFC8
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_TRANSPARENT, 89, -2, -18
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 69, 0, 0
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 85, 0, 0
                  geo_open_node
                     geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_0603A4E8
                  geo_close_node
.ifdef VERSION_JP
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_0603B8D0
.else
                  geo_animated_part LAYER_TRANSPARENT, 0, 0, 0, bowser_seg6_dl_0603B948
.endif
               geo_close_node
            geo_close_node
         geo_close_node
         geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
         geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
         geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
         geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
         geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
         geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
         geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
         geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
         geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
      geo_close_node
   geo_close_node
   geo_return

.ifndef VERSION_JP
glabel bowser_shadow_geo # 0x0D000AB8
   geo_shadow 0x00, 0x9B, 400
   geo_return
.endif

glabel bowser_geo # 0x0D000AB8 / 0AC4
   geo_node_start
   geo_open_node
      geo_asm 0, Geo18_8029D924
.ifdef VERSION_JP
      geo_switch_case 2, geo_switch_anim_state
.endif
.ifndef VERSION_JP
      geo_switch_case 3, geo_switch_anim_state
.endif
      geo_open_node
         geo_node_start
         geo_open_node
            geo_asm 0, Geo18_802B7D44
            geo_branch 1, bowser_geo_0000D8
         geo_close_node

         geo_node_start
         geo_open_node
            geo_asm 0, Geo18_802B7D44
            geo_branch 1, bowser_geo_000424
         geo_close_node

.ifndef VERSION_JP
         geo_node_start
         geo_open_node
            geo_asm 0, Geo18_802B7D44
            geo_branch 1, bowser_shadow_geo
         geo_close_node
.endif
      geo_close_node

   geo_close_node
   geo_end

glabel bowser2_geo # 0x0D000B18 / 0B40
   geo_node_start
   geo_open_node
      geo_asm 0, Geo18_8029D924

.ifdef VERSION_JP
      geo_switch_case 2, geo_switch_anim_state
.endif
.ifndef VERSION_JP
      geo_switch_case 3, geo_switch_anim_state
.endif
      geo_open_node

         geo_node_start
         geo_open_node
            geo_asm 0, Geo18_802B7D44
            geo_branch 1, bowser_geo_0000D8
         geo_close_node

         geo_node_start
         geo_open_node
            geo_asm 0, Geo18_802B7D44
            geo_branch 1, bowser_geo_000770
         geo_close_node

.ifndef VERSION_JP
         geo_node_start
         geo_open_node
            geo_asm 0, Geo18_802B7D44
            geo_branch 1, bowser_shadow_geo
         geo_close_node
.endif
      geo_close_node

   geo_close_node
   geo_end
