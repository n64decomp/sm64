bbh_seg7_light_07012318: # 0x07012318 - 0x07012320
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

bbh_seg7_light_07012320: # 0x07012320 - 0x07012330
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bbh_seg7_vertex_07012330: # 0x07012330 - 0x07012430
vertex  -1100,   1382,   1075,    308,   2012,  0x00, 0x00, 0x7F, 0xFF
vertex  -1100,   1178,   1075,    308,    152,  0x00, 0x00, 0x7F, 0xFF
vertex  -1074,   1152,   1075,    138,      0,  0x00, 0x00, 0x7F, 0xFF
vertex  -1100,   1126,   1075,      0,    152,  0x00, 0x00, 0x7F, 0xFF
vertex  -1100,    922,   1075,      0,   2012,  0x00, 0x00, 0x7F, 0xFF
vertex  -1049,    922,   1075,    308,   2012,  0x00, 0x00, 0x7F, 0xFF
vertex  -1049,   1126,   1075,    308,    152,  0x00, 0x00, 0x7F, 0xFF
vertex  -1279,   1178,   1075,      0,   2012,  0x00, 0x00, 0x7F, 0xFF
vertex  -1279,   1126,   1075,    308,   2012,  0x00, 0x00, 0x7F, 0xFF
vertex  -1100,   1126,   1075,    308,    224,  0x00, 0x00, 0x7F, 0xFF
vertex  -1100,   1178,   1075,      0,    224,  0x00, 0x00, 0x7F, 0xFF
vertex  -1049,   1178,   1075,      0,    152,  0x00, 0x00, 0x7F, 0xFF
vertex  -1049,   1382,   1075,      0,   2012,  0x00, 0x00, 0x7F, 0xFF
vertex  -1049,   1178,   1075,    308,    224,  0x00, 0x00, 0x7F, 0xFF
vertex   -869,   1126,   1075,      0,   2012,  0x00, 0x00, 0x7F, 0xFF
vertex   -869,   1178,   1075,    308,   2012,  0x00, 0x00, 0x7F, 0xFF

bbh_seg7_vertex_07012430: # 0x07012430 - 0x07012470
vertex  -1049,   1178,   1075,    308,    224,  0x00, 0x00, 0x7F, 0xFF
vertex  -1074,   1152,   1075,    138,      0,  0x00, 0x00, 0x7F, 0xFF
vertex  -1049,   1126,   1075,      0,    224,  0x00, 0x00, 0x7F, 0xFF
vertex   -869,   1126,   1075,      0,   2012,  0x00, 0x00, 0x7F, 0xFF

bbh_seg7_dl_07012470: # 0x07012470 - 0x07012510
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bbh_seg7_texture_07000000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPLight bbh_seg7_light_07012320, 1
gsSPLight bbh_seg7_light_07012318, 2
gsSPVertex bbh_seg7_vertex_07012330, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  3,  6,  2, 0x0
gsSP2Triangles  7,  8,  9, 0x0,  7,  9,  2, 0x0
gsSP2Triangles  7,  2, 10, 0x0,  0,  2, 11, 0x0
gsSP2Triangles  0, 11, 12, 0x0, 13, 14, 15, 0x0
gsSPVertex bbh_seg7_vertex_07012430, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel bbh_seg7_dl_07012510 # 0x07012510 - 0x07012580
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList bbh_seg7_dl_07012470
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsSPEndDisplayList
