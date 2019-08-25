bitfs_seg7_vertex_070101D8: # 0x070101D8 - 0x070102D8
vertex      0,      0,   -298,      0,   1000,  0xFF, 0xD4, 0x00, 0xFF
vertex  -1125,    717,    315,   2012,  -3438,  0xFF, 0xD4, 0x00, 0xFF
vertex      0,      0,    314,   2004,   1002,  0xFF, 0xD4, 0x00, 0xFF
vertex   1331,   1946,   -911,   2008,    990,  0xFF, 0xD4, 0x00, 0xFF
vertex    154,   2662,   -298,      0,  -3596,  0xFF, 0xD4, 0x00, 0xFF
vertex   1331,   1946,   -298,      0,    990,  0xFF, 0xD4, 0x00, 0xFF
vertex    154,   2662,   -913,   2012,  -3596,  0xFF, 0xD4, 0x00, 0xFF
vertex    614,   1331,    315,   2012,    990,  0xFF, 0xD4, 0x00, 0xFF
vertex   1331,   1946,   -298,      0,  -2150,  0xFF, 0xD4, 0x00, 0xFF
vertex    614,   1331,   -298,      0,    990,  0xFF, 0xD4, 0x00, 0xFF
vertex   1331,   1946,    321,   2032,  -2150,  0xFF, 0xD4, 0x00, 0xFF
vertex   -306,   1331,   -918,   2028,  -2416,  0xFF, 0xD4, 0x00, 0xFF
vertex  -1125,    717,   -913,   2012,    990,  0xFF, 0xD4, 0x00, 0xFF
vertex  -1125,    717,   -298,      0,    990,  0xFF, 0xD4, 0x00, 0xFF
vertex   -306,   1331,   -298,      0,  -2416,  0xFF, 0xD4, 0x00, 0xFF
vertex  -1125,    717,   -298,      0,  -3440,  0xFF, 0xD4, 0x00, 0xFF

bitfs_seg7_dl_070102D8: # 0x070102D8 - 0x07010340
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09003800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPVertex bitfs_seg7_vertex_070101D8, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 13, 14, 0x0,  0, 15,  1, 0x0
gsSPEndDisplayList

glabel bitfs_seg7_dl_07010340 # 0x07010340 - 0x070103B0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList bitfs_seg7_dl_070102D8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
