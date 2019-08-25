glabel koopa_shell_geo # 0x0F000AB0
   geo_shadow SHADOW_CIRCLE_4_VERTS, 0xC8, 70
   geo_open_node
      geo_scale 0x00, 65536
      geo_open_node
         geo_display_list LAYER_OPAQUE, koopa_shell_seg8_dl_08028B78
      geo_close_node
   geo_close_node
   geo_end

glabel koopa_shell2_geo # 0x0F000ADC
   geo_shadow SHADOW_CIRCLE_4_VERTS, 0xC8, 70
   geo_open_node
      geo_scale 0x00, 16384
      geo_open_node
         geo_display_list LAYER_OPAQUE, koopa_shell_seg8_dl_08027420
      geo_close_node
   geo_close_node
   geo_end

glabel koopa_shell3_geo # 0x0F000B08
   geo_shadow SHADOW_CIRCLE_4_VERTS, 0xC8, 70
   geo_open_node
      geo_scale 0x00, 16384
      geo_open_node
         geo_display_list LAYER_OPAQUE, koopa_shell_seg8_dl_080273C8
      geo_close_node
   geo_close_node
   geo_end
