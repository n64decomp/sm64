rr_seg7_vertex_0701ABE8: # 0x0701ABE8 - 0x0701ACE8
vertex   -409,    102,    307,      0,    990,  0xEC, 0xEF, 0x8E, 0xFF
vertex    410,    102,   -306,   3544,    480,  0xEC, 0xEF, 0x8E, 0xFF
vertex   -409,    102,   -306,   1500,   2520,  0xEC, 0xEF, 0x8E, 0xFF
vertex    410,    102,    307,   2012,  -1054,  0xEC, 0xEF, 0x8E, 0xFF
vertex   -409,      0,    307,   1478,   -520,  0xDF, 0xBF, 0x1F, 0xFF
vertex   -409,    102,    307,   1732,   -264,  0xDF, 0xBF, 0x1F, 0xFF
vertex   -409,    102,   -306,    200,   1268,  0xDF, 0xBF, 0x1F, 0xFF
vertex   -409,      0,   -306,    -54,   1012,  0xDF, 0xBF, 0x1F, 0xFF
vertex    410,      0,   -306,    -54,   1012,  0xDF, 0xBF, 0x1F, 0xFF
vertex    410,    102,    307,   1732,   -264,  0xDF, 0xBF, 0x1F, 0xFF
vertex    410,      0,    307,   1478,   -520,  0xDF, 0xBF, 0x1F, 0xFF
vertex    410,    102,   -306,    200,   1268,  0xDF, 0xBF, 0x1F, 0xFF
vertex    410,      0,    307,   2012,   3032,  0xFF, 0xD4, 0x00, 0xFF
vertex   -409,    102,    307,    224,    734,  0xFF, 0xD4, 0x00, 0xFF
vertex   -409,      0,    307,      0,    990,  0xFF, 0xD4, 0x00, 0xFF
vertex    410,    102,    307,   2268,   2776,  0xFF, 0xD4, 0x00, 0xFF

rr_seg7_vertex_0701ACE8: # 0x0701ACE8 - 0x0701AD68
vertex   -409,      0,   -306,      0,    990,  0xFF, 0xD4, 0x00, 0xFF
vertex    410,    102,   -306,   2268,   2776,  0xFF, 0xD4, 0x00, 0xFF
vertex    410,      0,   -306,   2012,   3032,  0xFF, 0xD4, 0x00, 0xFF
vertex   -409,    102,   -306,    224,    734,  0xFF, 0xD4, 0x00, 0xFF
vertex   -409,      0,   -306,    -52,   4032,  0x78, 0x78, 0x00, 0xFF
vertex    410,      0,    307,    456,    456,  0x78, 0x78, 0x00, 0xFF
vertex   -409,      0,    307,  -1586,   2498,  0x78, 0x78, 0x00, 0xFF
vertex    410,      0,   -306,   1990,   1988,  0x78, 0x78, 0x00, 0xFF

rr_seg7_dl_0701AD68: # 0x0701AD68 - 0x0701ADF8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09007000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex rr_seg7_vertex_0701ABE8, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 15, 13, 0x0
gsSPVertex rr_seg7_vertex_0701ACE8, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

glabel rr_seg7_dl_0701ADF8 # 0x0701ADF8 - 0x0701AE68
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList rr_seg7_dl_0701AD68
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
