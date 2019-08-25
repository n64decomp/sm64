rr_seg7_vertex_0701B9F0: # 0x0701B9F0 - 0x0701BAD0
vertex     26,    154,      0,   1672,   1328,  0xA9, 0xCD, 0x97, 0xFF
vertex    666,    154,    410,      0,    990,  0xA9, 0xCD, 0x97, 0xFF
vertex    666,    154,   -613,   1672,   -714,  0xA9, 0xCD, 0x97, 0xFF
vertex     26,    154,   -613,   2694,    308,  0xA9, 0xCD, 0x97, 0xFF
vertex   -665,    154,    410,   2012,   3032,  0xA9, 0xCD, 0x97, 0xFF
vertex   -665,    154,      0,   2694,   2350,  0xA9, 0xCD, 0x97, 0xFF
vertex   -665,      0,      0,   2694,   2350,  0x67, 0x89, 0x51, 0xFF
vertex     26,    154,      0,   1672,   1328,  0x67, 0x89, 0x51, 0xFF
vertex     26,      0,      0,   1672,   1328,  0x67, 0x89, 0x51, 0xFF
vertex   -665,    154,      0,   2694,   2350,  0x67, 0x89, 0x51, 0xFF
vertex    666,      0,    410,      0,    990,  0x67, 0x89, 0x51, 0xFF
vertex   -665,    154,    410,   2012,   3032,  0x67, 0x89, 0x51, 0xFF
vertex   -665,      0,    410,   2012,   3032,  0x67, 0x89, 0x51, 0xFF
vertex    666,    154,    410,      0,    990,  0x67, 0x89, 0x51, 0xFF

rr_seg7_vertex_0701BAD0: # 0x0701BAD0 - 0x0701BBB0
vertex     26,      0,   -613,   2694,    308,  0x67, 0x89, 0x51, 0xFF
vertex    666,    154,   -613,   1672,   -714,  0x67, 0x89, 0x51, 0xFF
vertex    666,      0,   -613,   1672,   -714,  0x67, 0x89, 0x51, 0xFF
vertex     26,    154,   -613,   2694,    308,  0x67, 0x89, 0x51, 0xFF
vertex   -665,      0,    410,   2012,   3032,  0x4D, 0x50, 0x36, 0xFF
vertex   -665,      0,      0,   2694,   2350,  0x4D, 0x50, 0x36, 0xFF
vertex     26,      0,      0,   1672,   1328,  0x4D, 0x50, 0x36, 0xFF
vertex    666,      0,    410,      0,    990,  0x4D, 0x50, 0x36, 0xFF
vertex     26,      0,   -613,   2694,    308,  0x4D, 0x50, 0x36, 0xFF
vertex    666,      0,   -613,   1672,   -714,  0x4D, 0x50, 0x36, 0xFF
vertex     26,      0,      0,   1672,   1328,  0x62, 0x78, 0x60, 0xFF
vertex     26,    154,      0,   1672,   1328,  0x62, 0x78, 0x60, 0xFF
vertex     26,    154,   -613,   2694,    308,  0x62, 0x78, 0x60, 0xFF
vertex     26,      0,   -613,   2694,    308,  0x62, 0x78, 0x60, 0xFF

rr_seg7_vertex_0701BBB0: # 0x0701BBB0 - 0x0701BC30
vertex   -665,      0,    410,   2012,   3032,  0x62, 0x78, 0x60, 0xFF
vertex   -665,    154,    410,   2012,   3032,  0x62, 0x78, 0x60, 0xFF
vertex   -665,    154,      0,   2694,   2350,  0x62, 0x78, 0x60, 0xFF
vertex   -665,      0,      0,   2694,   2350,  0x62, 0x78, 0x60, 0xFF
vertex    666,      0,   -613,   1672,   -714,  0x62, 0x78, 0x60, 0xFF
vertex    666,    154,   -613,   1672,   -714,  0x62, 0x78, 0x60, 0xFF
vertex    666,    154,    410,      0,    990,  0x62, 0x78, 0x60, 0xFF
vertex    666,      0,    410,      0,    990,  0x62, 0x78, 0x60, 0xFF

rr_seg7_dl_0701BC30: # 0x0701BC30 - 0x0701BD08
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09001800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex rr_seg7_vertex_0701B9F0, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  0,  4,  1, 0x0,  0,  5,  4, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  9,  7, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 13, 11, 0x0
gsSPVertex rr_seg7_vertex_0701BAD0, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  6,  7,  4, 0x0
gsSP2Triangles  6,  8,  9, 0x0,  6,  9,  7, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 12, 13, 0x0
gsSPVertex rr_seg7_vertex_0701BBB0, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSPEndDisplayList

glabel rr_seg7_dl_0701BD08 # 0x0701BD08 - 0x0701BD78
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList rr_seg7_dl_0701BC30
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
