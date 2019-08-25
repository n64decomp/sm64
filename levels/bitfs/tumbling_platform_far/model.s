bitfs_seg7_vertex_07010000: # 0x07010000 - 0x07010100
vertex   -575,      0,    307,    480,   -542,  0xD3, 0x53, 0x00, 0xFF
vertex    576,    154,    307,   9678,   -542,  0xD3, 0x53, 0x00, 0xFF
vertex   -575,    154,    307,    480,   -542,  0xD3, 0x53, 0x00, 0xFF
vertex    576,      0,    307,   9678,   -542,  0xD3, 0x53, 0x00, 0xFF
vertex   -575,    154,   -306,    480,    480,  0xD3, 0x53, 0x00, 0xFF
vertex    576,      0,   -306,   9678,    480,  0xD3, 0x53, 0x00, 0xFF
vertex   -575,      0,   -306,    480,    480,  0xD3, 0x53, 0x00, 0xFF
vertex    576,    154,   -306,   9678,    480,  0xD3, 0x53, 0x00, 0xFF
vertex   -575,      0,   -306,    480,    480,  0x78, 0x16, 0x01, 0xFF
vertex    576,      0,   -306,   9678,    480,  0x78, 0x16, 0x01, 0xFF
vertex    576,      0,    307,   9678,   -542,  0x78, 0x16, 0x01, 0xFF
vertex   -575,      0,    307,    480,   -542,  0x78, 0x16, 0x01, 0xFF
vertex   -575,    154,    307,    480,   -542,  0xFE, 0xA5, 0x39, 0xFF
vertex    576,    154,   -306,   9678,    480,  0xFE, 0xA5, 0x39, 0xFF
vertex   -575,    154,   -306,    480,    480,  0xFE, 0xA5, 0x39, 0xFF
vertex    576,    154,    307,   9678,   -542,  0xFE, 0xA5, 0x39, 0xFF

bitfs_seg7_dl_07010100: # 0x07010100 - 0x07010168
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bitfs_seg7_texture_07001000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bitfs_seg7_vertex_07010000, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 10, 11, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 15, 13, 0x0
gsSPEndDisplayList

glabel bitfs_seg7_dl_07010168 # 0x07010168 - 0x070101D8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bitfs_seg7_dl_07010100
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
