bbh_seg7_vertex_0701ED88: # 0x0701ED88 - 0x0701EE08
vertex   1331,    563,   2161,    990,      0,  0xFF, 0x00, 0x00, 0x9A
vertex    922,    154,   2161,      0,    990,  0xFF, 0x00, 0x00, 0x9A
vertex   1331,    154,   2161,    990,    990,  0xFF, 0x00, 0x00, 0x9A
vertex    922,    563,   2161,      0,      0,  0xFF, 0x00, 0x00, 0x9A
vertex      0,    154,   2161,      0,    990,  0xFF, 0x00, 0x00, 0x9A
vertex    410,    154,   2161,    990,    990,  0xFF, 0x00, 0x00, 0x9A
vertex    410,    563,   2161,    990,      0,  0xFF, 0x00, 0x00, 0x9A
vertex      0,    563,   2161,      0,      0,  0xFF, 0x00, 0x00, 0x9A

bbh_seg7_vertex_0701EE08: # 0x0701EE08 - 0x0701EE48
vertex  -1740,    717,  -1648,    990,      0,  0xFF, 0x57, 0x00, 0x9A
vertex  -1381,    717,  -1648,      0,      0,  0xFF, 0x57, 0x00, 0x9A
vertex  -1381,      0,  -1648,      0,   2012,  0xFF, 0x57, 0x00, 0x9A
vertex  -1740,      0,  -1648,    990,   2012,  0xFF, 0x57, 0x00, 0x9A

bbh_seg7_dl_0701EE48: # 0x0701EE48 - 0x0701EE90
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, spooky_0900A800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bbh_seg7_vertex_0701ED88, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSPEndDisplayList

bbh_seg7_dl_0701EE90: # 0x0701EE90 - 0x0701EEC8
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, spooky_0900B800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex bbh_seg7_vertex_0701EE08, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel bbh_seg7_dl_0701EEC8 # 0x0701EEC8 - 0x0701EF58
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bbh_seg7_dl_0701EE48
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList bbh_seg7_dl_0701EE90
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
