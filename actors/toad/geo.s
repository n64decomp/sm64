glabel toad_geo_000114 # 0x0D000114
   geo_node_start
   geo_open_node
      geo_animated_part LAYER_OPAQUE, 0, 0, 0
      geo_open_node
         geo_animated_part LAYER_OPAQUE, 0, 0, 0
         geo_open_node
            geo_animated_part LAYER_OPAQUE, 83, 0, 0
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 126, -37, 0, toad_seg6_dl_06007710
            geo_close_node
            geo_animated_part LAYER_OPAQUE, 25, 8, 0, toad_seg6_dl_06007A48
            geo_animated_part LAYER_OPAQUE, 34, 8, 0, toad_seg6_dl_06007EB0
            geo_animated_part LAYER_OPAQUE, 4, 7, 38
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 0, 0, 0
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 37, 0, 0
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 9, -25, 3, toad_seg6_dl_06008890
                  geo_close_node
               geo_close_node
            geo_close_node
            geo_animated_part LAYER_OPAQUE, 4, 7, -38
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 0, 0, 0
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 37, 0, 0
                  geo_open_node
                     geo_animated_part LAYER_OPAQUE, 9, -25, -3, toad_seg6_dl_06008BD8
                  geo_close_node
               geo_close_node
            geo_close_node
            geo_animated_part LAYER_OPAQUE, 61, -3, 52
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 0, 0, 0
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 17, 0, 4, toad_seg6_dl_060081F8
               geo_close_node
            geo_close_node
            geo_animated_part LAYER_OPAQUE, 61, -3, -52
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 0, 0, 0
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 17, 0, -4, toad_seg6_dl_06008520
               geo_close_node
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_return

glabel toad_geo_00027C # 0x0D00027C
   geo_node_start
   geo_open_node
      geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
      geo_open_node
         geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
         geo_open_node
            geo_animated_part LAYER_TRANSPARENT, 83, 0, 0
            geo_open_node
.ifdef VERSION_JP
               geo_animated_part LAYER_TRANSPARENT, 126, -37, 0, toad_seg6_dl_06007710
.else
               geo_animated_part LAYER_TRANSPARENT, 126, -37, 0, toad_seg6_us_dl_06007788
.endif
            geo_close_node
.ifdef VERSION_JP
            geo_animated_part LAYER_TRANSPARENT, 25, 8, 0, toad_seg6_dl_06007A48
.else
            geo_animated_part LAYER_TRANSPARENT, 25, 8, 0, toad_seg6_us_dl_06007B00
.endif
            geo_animated_part LAYER_TRANSPARENT, 34, 8, 0, toad_seg6_dl_06007EB0
            geo_animated_part LAYER_TRANSPARENT, 4, 7, 38
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 37, 0, 0
                  geo_open_node
                     geo_animated_part LAYER_TRANSPARENT, 9, -25, 3, toad_seg6_dl_06008890
                  geo_close_node
               geo_close_node
            geo_close_node
            geo_animated_part LAYER_TRANSPARENT, 4, 7, -38
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 37, 0, 0
                  geo_open_node
                     geo_animated_part LAYER_TRANSPARENT, 9, -25, -3, toad_seg6_dl_06008BD8
                  geo_close_node
               geo_close_node
            geo_close_node
            geo_animated_part LAYER_TRANSPARENT, 61, -3, 52
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
               geo_open_node
                  geo_animated_part LAYER_TRANSPARENT, 17, 0, 4, toad_seg6_dl_060081F8
               geo_close_node
            geo_close_node
            geo_animated_part LAYER_TRANSPARENT, 61, -3, -52
            geo_open_node
               geo_animated_part LAYER_TRANSPARENT, 0, 0, 0
               geo_open_node
.ifdef VERSION_JP
                  geo_animated_part LAYER_TRANSPARENT, 17, 0, -4, toad_seg6_dl_06008520
.else
                  geo_animated_part LAYER_TRANSPARENT, 17, 0, -4, toad_seg6_us_dl_06008608
.endif
               geo_close_node
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_return

glabel toad_geo # 0x0D0003E4
   geo_culling_radius 1000
   geo_open_node
      geo_shadow SHADOW_CIRCLE_9_VERTS, 0x96, 100
      geo_open_node
         geo_scale 0x00, 16384
         geo_open_node
            geo_asm 10, Geo18_8029D924
            geo_switch_case 2, geo_switch_anim_state
            geo_open_node
               geo_branch 1, toad_geo_000114
               geo_branch 1, toad_geo_00027C
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_end
