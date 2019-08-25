bitfs_seg7_vertex_070113A8: # 0x070113A8 - 0x070114A8
vertex    355,    109,    179,    990,      0,  0xCE, 0x35, 0x16, 0xFF
vertex    355,      7,    179,    990,    480,  0xCE, 0x35, 0x16, 0xFF
vertex    355,      7,   -188,      0,    480,  0xCE, 0x35, 0x16, 0xFF
vertex    355,    109,   -188,      0,      0,  0xCE, 0x35, 0x16, 0xFF
vertex   -361,    109,   -188,    734,    480,  0xCE, 0x35, 0x16, 0xFF
vertex   -361,      7,   -188,    734,    990,  0xCE, 0x35, 0x16, 0xFF
vertex   -361,      7,    179,   -286,    990,  0xCE, 0x35, 0x16, 0xFF
vertex   -361,    109,    179,   -286,    480,  0xCE, 0x35, 0x16, 0xFF
vertex   -361,    109,    179,    224,    650,  0xDF, 0x3F, 0x1F, 0xFF
vertex    355,      7,    179,   2268,    820,  0xDF, 0x3F, 0x1F, 0xFF
vertex    355,    109,    179,   2268,    650,  0xDF, 0x3F, 0x1F, 0xFF
vertex   -361,      7,    179,    224,    820,  0xDF, 0x3F, 0x1F, 0xFF
vertex    355,    109,   -188,      0,    478,  0xDF, 0x3F, 0x1F, 0xFF
vertex   -361,      7,   -188,   -322,   2522,  0xDF, 0x3F, 0x1F, 0xFF
vertex   -361,    109,   -188,      0,   2522,  0xDF, 0x3F, 0x1F, 0xFF
vertex    355,      7,   -188,   -322,    478,  0xDF, 0x3F, 0x1F, 0xFF

bitfs_seg7_vertex_070114A8: # 0x070114A8 - 0x070114E8
vertex   -361,    109,    179,    990,    990,  0xFF, 0xE5, 0x65, 0xFF
vertex    355,    109,   -188,      0,   3032,  0xFF, 0xE5, 0x65, 0xFF
vertex   -361,    109,   -188,      0,    990,  0xFF, 0xE5, 0x65, 0xFF
vertex    355,    109,    179,    990,   3032,  0xFF, 0xE5, 0x65, 0xFF

bitfs_seg7_dl_070114E8: # 0x070114E8 - 0x07011568
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09003000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bitfs_seg7_vertex_070113A8, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 15, 13, 0x0
gsSPVertex bitfs_seg7_vertex_070114A8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel bitfs_seg7_dl_07011568 # 0x07011568 - 0x070115D8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bitfs_seg7_dl_070114E8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
