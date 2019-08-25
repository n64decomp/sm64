inside_castle_seg7_vertex_070516E8: # 0x070516E8 - 0x070517E8
vertex   2081,   2970,   6091,    478,    990,  0xFF, 0xFF, 0xFF, 0x91
vertex   1569,   2970,   6091,    478,      0,  0xFF, 0xFF, 0xFF, 0x91
vertex   1569,   2970,   5681,    990,      0,  0xFF, 0xFF, 0xFF, 0x91
vertex  -2489,   2970,   6091,    478,    990,  0xFF, 0xFF, 0xFF, 0x91
vertex  -1977,   3379,   6091,      0,      0,  0xFF, 0xFF, 0xFF, 0x91
vertex  -2489,   3379,   6091,      0,    990,  0xFF, 0xFF, 0xFF, 0x91
vertex  -1977,   2970,   6091,    478,      0,  0xFF, 0xFF, 0xFF, 0x91
vertex  -2489,   2970,   5681,    990,    990,  0xFF, 0xFF, 0xFF, 0x91
vertex  -1977,   2970,   5681,    990,      0,  0xFF, 0xFF, 0xFF, 0x91
vertex  -1977,   3379,   5681,    478,      0,  0xFF, 0xFF, 0xFF, 0x91
vertex  -2489,   3379,   5681,    478,    990,  0xFF, 0xFF, 0xFF, 0x91
vertex   2081,   3379,   6091,      0,    990,  0xFF, 0xFF, 0xFF, 0x91
vertex   2081,   2970,   5681,    990,    990,  0xFF, 0xFF, 0xFF, 0x91
vertex   2900,   3021,   5989,    990,    990,  0xFF, 0xFF, 0xFF, 0x91
vertex   2900,   3277,   5989,    990,      0,  0xFF, 0xFF, 0xFF, 0x91
vertex   2900,   3277,   5784,    480,      0,  0xFF, 0xFF, 0xFF, 0x91

inside_castle_seg7_vertex_070517E8: # 0x070517E8 - 0x070518D8
vertex   2081,   3379,   6091,      0,    990,  0xFF, 0xFF, 0xFF, 0x91
vertex   1569,   3379,   6091,      0,      0,  0xFF, 0xFF, 0xFF, 0x91
vertex   1569,   2970,   6091,    478,      0,  0xFF, 0xFF, 0xFF, 0x91
vertex   2081,   2970,   5681,    990,    990,  0xFF, 0xFF, 0xFF, 0x91
vertex   1569,   2970,   5681,    990,      0,  0xFF, 0xFF, 0xFF, 0x91
vertex   1569,   3379,   5681,    478,      0,  0xFF, 0xFF, 0xFF, 0x91
vertex   2081,   3379,   5681,    478,    990,  0xFF, 0xFF, 0xFF, 0x91
vertex   2900,   3021,   5784,    480,    990,  0xFF, 0xFF, 0xFF, 0x91
vertex   3105,   3277,   5784,      0,      0,  0xFF, 0xFF, 0xFF, 0x91
vertex   3105,   3021,   5784,      0,    990,  0xFF, 0xFF, 0xFF, 0x91
vertex   2900,   3277,   5784,    480,      0,  0xFF, 0xFF, 0xFF, 0x91
vertex   2900,   3021,   5989,    990,    990,  0xFF, 0xFF, 0xFF, 0x91
vertex   3105,   3277,   5989,    478,      0,  0xFF, 0xFF, 0xFF, 0x91
vertex   3105,   3021,   5989,    478,    990,  0xFF, 0xFF, 0xFF, 0x91
vertex   2900,   3277,   5989,    990,      0,  0xFF, 0xFF, 0xFF, 0x91

inside_castle_seg7_dl_070518D8: # 0x070518D8 - 0x070519C8
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, texture_castle_light
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex inside_castle_seg7_vertex_070516E8, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  6,  3, 0x0
gsSP2Triangles  7,  8,  6, 0x0,  5,  4,  9, 0x0
gsSP2Triangles  5,  9, 10, 0x0, 10,  9,  8, 0x0
gsSP2Triangles 10,  8,  7, 0x0, 11,  1,  0, 0x0
gsSP2Triangles  0,  2, 12, 0x0, 13, 14, 15, 0x0
gsSPVertex inside_castle_seg7_vertex_070517E8, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  6,  5,  1, 0x0
gsSP2Triangles  6,  1,  0, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 10,  7, 0x0
gsSP2Triangles  9,  8, 12, 0x0,  9, 12, 13, 0x0
gsSP2Triangles 13, 14, 11, 0x0, 13, 12, 14, 0x0
gsSPEndDisplayList

glabel inside_castle_seg7_dl_070519C8 # 0x070519C8 - 0x07051A38
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList inside_castle_seg7_dl_070518D8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
