bitfs_seg7_vertex_07002000: # 0x07002000 - 0x070020C0
vertex   1280,    348,   -293,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1178,    348,   -293,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1280,    266,   -231,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1178,    266,   -231,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1330,   3625,   -703,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1433,   3625,   -703,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1330,   3543,   -642,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1433,   3543,   -642,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3173,   3625,   -707,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3276,   3625,   -707,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3173,   3543,   -646,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3276,   3543,   -646,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF

bitfs_seg7_dl_070020C0: # 0x070020C0 - 0x07002118
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_metal_hole
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bitfs_seg7_vertex_07002000, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  5,  7,  6, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  9, 11, 10, 0x0
gsSPEndDisplayList

glabel bitfs_seg7_dl_07002118 # 0x07002118 - 0x07002188
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bitfs_seg7_dl_070020C0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
