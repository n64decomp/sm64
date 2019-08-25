glabel marios_cap_geo # 0x16000CA4
   geo_shadow SHADOW_CIRCLE_9_VERTS, 0xB4, 75
   geo_open_node
      geo_scale 0x00, 16384
      geo_open_node
         geo_asm 10, Geo18_8029D924
         geo_switch_case 2, geo_switch_anim_state
         geo_open_node
            geo_display_list LAYER_OPAQUE, mario_cap_seg3_dl_03022F48
            geo_display_list LAYER_TRANSPARENT, mario_cap_seg3_dl_03022F48
         geo_close_node
      geo_close_node
   geo_close_node
   geo_end

glabel marios_metal_cap_geo # 0x16000CF0
   geo_shadow SHADOW_CIRCLE_9_VERTS, 0xB4, 75
   geo_open_node
      geo_scale 0x00, 16384
      geo_open_node
         geo_asm 10, Geo18_8029D924
         geo_switch_case 2, geo_switch_anim_state
         geo_open_node
            geo_display_list LAYER_OPAQUE, mario_cap_seg3_dl_03022FF8
            geo_display_list LAYER_TRANSPARENT, mario_cap_seg3_dl_03022FF8
         geo_close_node
      geo_close_node
   geo_close_node
   geo_end

glabel marios_wing_cap_geo # 0x16000D3C
   geo_shadow SHADOW_CIRCLE_9_VERTS, 0xB4, 75
   geo_open_node
      geo_scale 0x00, 16384
      geo_open_node
         geo_asm 10, Geo18_8029D924
         geo_switch_case 2, geo_switch_anim_state
         geo_open_node
            geo_node_start
            geo_open_node
               geo_display_list LAYER_OPAQUE, mario_cap_seg3_dl_03022F48
               geo_display_list LAYER_ALPHA, mario_cap_seg3_dl_030230B0
            geo_close_node
            geo_node_start
            geo_open_node
               geo_display_list LAYER_TRANSPARENT, mario_cap_seg3_dl_03023160
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_end

glabel marios_winged_metal_cap_geo # 0x16000DA8
   geo_shadow SHADOW_CIRCLE_9_VERTS, 0xB4, 75
   geo_open_node
      geo_scale 0x00, 16384
      geo_open_node
         geo_asm 10, Geo18_8029D924
         geo_switch_case 2, geo_switch_anim_state
         geo_open_node
            geo_node_start
            geo_open_node
               geo_display_list LAYER_OPAQUE, mario_cap_seg3_dl_03022FF8
               geo_display_list LAYER_ALPHA, mario_cap_seg3_dl_03023108
            geo_close_node
            geo_node_start
            geo_open_node
               geo_display_list LAYER_TRANSPARENT, mario_cap_seg3_dl_03023298
            geo_close_node
         geo_close_node
      geo_close_node
   geo_close_node
   geo_end
