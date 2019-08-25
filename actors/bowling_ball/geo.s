# This is a weird file where it cross-references another actor.
# Most likely, it was a compile time optimization due to the
# exact same DL being referenced.

glabel bowling_ball_geo # 0x0F000640
   geo_shadow SHADOW_CIRCLE_4_VERTS, 0xC8, 280
   geo_open_node
      geo_scale 0x00, 170393
      geo_open_node
         geo_display_list LAYER_ALPHA, bobomb_seg8_dl_08022D08
      geo_close_node
   geo_close_node
   geo_end

glabel bowling_ball_track_geo # 0x0F00066C
   geo_node_start
   geo_open_node
      geo_scale 0x00, 170393
      geo_open_node
         geo_display_list LAYER_ALPHA, bobomb_seg8_dl_08022D08
      geo_close_node
   geo_close_node
   geo_end
