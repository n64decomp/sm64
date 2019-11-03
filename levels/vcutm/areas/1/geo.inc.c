// 0x0E000208
const GeoLayout vcutm_geo_000208[] = {
   GEO_NODE_SCREEN_AREA(10, SCREEN_WIDTH/2, SCREEN_HEIGHT/2, SCREEN_WIDTH/2, SCREEN_HEIGHT/2),
   GEO_OPEN_NODE(),
      GEO_ZBUFFER(0),
      GEO_OPEN_NODE(),
         GEO_NODE_ORTHO(100),
         GEO_OPEN_NODE(),
            GEO_BACKGROUND_COLOR(0x0001),
         GEO_CLOSE_NODE(),
      GEO_CLOSE_NODE(),
      GEO_ZBUFFER(1),
      GEO_OPEN_NODE(),
         GEO_CAMERA_FRUSTUM_WITH_FUNC(45, 100, 25000, geo_camera_fov),
         GEO_OPEN_NODE(),
            GEO_CAMERA(14, 0, 2000, 6000, 0, 0, 0, geo_camera_preset_and_pos),
            GEO_OPEN_NODE(),
               GEO_DISPLAY_LIST(LAYER_OPAQUE, vcutm_seg7_dl_07007E88),
               GEO_DISPLAY_LIST(LAYER_OPAQUE, vcutm_seg7_dl_07008E10),
               GEO_DISPLAY_LIST(LAYER_OPAQUE, vcutm_seg7_dl_070093E8),
               GEO_DISPLAY_LIST(LAYER_ALPHA, vcutm_seg7_dl_070080D0),
               GEO_RENDER_OBJ(),
               GEO_ASM(0, geo_enfvx_main),
            GEO_CLOSE_NODE(),
         GEO_CLOSE_NODE(),
      GEO_CLOSE_NODE(),
   GEO_CLOSE_NODE(),
   GEO_END(),
};