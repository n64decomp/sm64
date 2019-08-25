glabel dirt_animation_geo # 0x16000ED4
   geo_culling_radius 300
   geo_open_node
      geo_switch_case 6, geo_switch_anim_state
      geo_open_node
         geo_display_list LAYER_OPAQUE, dirt_seg3_dl_0302C378
         geo_display_list LAYER_OPAQUE, dirt_seg3_dl_0302C3B0
         geo_display_list LAYER_OPAQUE, dirt_seg3_dl_0302C3E8
         geo_display_list LAYER_ALPHA, dirt_seg3_dl_0302C028
         geo_display_list LAYER_OPAQUE, dirt_seg3_dl_0302C420
         geo_display_list LAYER_OPAQUE, dirt_seg3_dl_0302C458
      geo_close_node
   geo_close_node
   geo_end

# This is probably wrongly named according to the Bin IDs...
glabel cartoon_star_geo # 0x16000F24
   geo_culling_radius 300
   geo_open_node
      geo_switch_case 5, geo_switch_anim_state
      geo_open_node
         geo_display_list LAYER_OPAQUE, dirt_seg3_dl_0302C298
         geo_display_list LAYER_OPAQUE, dirt_seg3_dl_0302C2B8
         geo_display_list LAYER_OPAQUE, dirt_seg3_dl_0302C2D8
         geo_display_list LAYER_OPAQUE, dirt_seg3_dl_0302C2F8
         geo_display_list LAYER_OPAQUE, dirt_seg3_dl_0302C318
      geo_close_node
   geo_close_node
   geo_end
