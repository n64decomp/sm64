bitfs_seg7_vertex_07007798: # 0x07007798 - 0x07007898
vertex    102,      0,    205,   4558,  -4386,  0x8C, 0x8C, 0x8C, 0xFF
vertex     51,    205,     51,   4812,  -3874,  0x8C, 0x8C, 0x8C, 0xFF
vertex    -50,    205,     51,   4558,  -3618,  0x8C, 0x8C, 0x8C, 0xFF
vertex   -101,      0,    205,   4046,  -3874,  0x8C, 0x8C, 0x8C, 0xFF
vertex     51,    205,    -50,   5068,  -3618,  0xC8, 0xC8, 0xC8, 0xFF
vertex    -50,    205,    -50,   4812,  -3364,  0xC8, 0xC8, 0xC8, 0xFF
vertex    -50,    205,     51,   4558,  -3618,  0xC8, 0xC8, 0xC8, 0xFF
vertex     51,    205,     51,   4812,  -3874,  0xC8, 0xC8, 0xC8, 0xFF
vertex   -101,      0,    205,   4046,  -3874,  0x7D, 0x7D, 0x7D, 0xFF
vertex    -50,    205,     51,   4558,  -3618,  0x7D, 0x7D, 0x7D, 0xFF
vertex   -153,      0,   -153,   4812,  -2852,  0x7D, 0x7D, 0x7D, 0xFF
vertex    -50,    205,    -50,   4812,  -3364,  0x7D, 0x7D, 0x7D, 0xFF
vertex    154,      0,   -153,   5580,  -3618,  0x7D, 0x7D, 0x7D, 0xFF
vertex     51,    205,     51,   4812,  -3874,  0x7D, 0x7D, 0x7D, 0xFF
vertex    102,      0,    205,   4558,  -4386,  0x7D, 0x7D, 0x7D, 0xFF
vertex     51,    205,    -50,   5068,  -3618,  0x7D, 0x7D, 0x7D, 0xFF

bitfs_seg7_vertex_07007898: # 0x07007898 - 0x070078D8
vertex   -153,      0,   -153,   4812,  -2852,  0x8C, 0x8C, 0x8C, 0xFF
vertex     51,    205,    -50,   5068,  -3618,  0x8C, 0x8C, 0x8C, 0xFF
vertex    154,      0,   -153,   5580,  -3618,  0x8C, 0x8C, 0x8C, 0xFF
vertex    -50,    205,    -50,   4812,  -3364,  0x8C, 0x8C, 0x8C, 0xFF

bitfs_seg7_dl_070078D8: # 0x070078D8 - 0x07007958
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09001800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bitfs_seg7_vertex_07007798, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  9, 11, 10, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 15, 13, 0x0
gsSPVertex bitfs_seg7_vertex_07007898, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel bitfs_seg7_dl_07007958 # 0x07007958 - 0x070079C8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bitfs_seg7_dl_070078D8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
