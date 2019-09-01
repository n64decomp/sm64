glabel penguin_geo # 0x0C000104
.ifdef VERSION_EU
   geo_shadow SHADOW_CIRCLE_9_VERTS, 0x96, 60
.else
   geo_shadow SHADOW_CIRCLE_4_VERTS, 0x96, 100
.endif
   geo_open_node
      geo_scale 0x00, 16384
      geo_open_node
         geo_animated_part LAYER_OPAQUE, 0, 0, 40, penguin_seg5_dl_05007540
         geo_open_node
            geo_animated_part LAYER_OPAQUE, -51, 84, -13
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 0, 0, 0, penguin_seg5_dl_05007198
            geo_close_node
            geo_animated_part LAYER_OPAQUE, 51, 84, -13
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 0, 0, 0, penguin_seg5_dl_050071E8
            geo_close_node
            geo_animated_part LAYER_OPAQUE, -38, -54, -13
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 0, 0, 0, penguin_seg5_dl_05007238
            geo_close_node
            geo_animated_part LAYER_OPAQUE, 38, -54, -13
            geo_open_node
               geo_animated_part LAYER_OPAQUE, 0, 0, 0, penguin_seg5_dl_050072C8
            geo_close_node
            geo_animated_part LAYER_OPAQUE, 0, 111, -19
            geo_open_node
               geo_switch_case 5, geo_switch_tuxie_mother_eyes
               geo_open_node
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, penguin_seg5_dl_05006428
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, penguin_seg5_dl_05006458
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, penguin_seg5_dl_05006488
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, penguin_seg5_dl_050064B8
                  geo_animated_part LAYER_OPAQUE, 0, 0, 0, penguin_seg5_dl_050064E8 # unused, seen in Shoshinkai 1995 footage
               geo_close_node
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_end
