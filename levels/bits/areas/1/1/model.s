bits_seg7_vertex_07002800: # 0x07002800 - 0x070028C0
vertex   5570,   3242,  -3991,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   5468,   3242,  -3991,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   5570,   3160,  -3930,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   5468,   3160,  -3930,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6517,   3791,  -1836,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6414,   3791,  -1836,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6517,   3709,  -1774,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6414,   3709,  -1774,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   5966,   3777,  -3991,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   5864,   3777,  -3991,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   5966,   3695,  -3930,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   5864,   3695,  -3930,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF

bits_seg7_dl_070028C0: # 0x070028C0 - 0x07002918
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_metal_hole
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bits_seg7_vertex_07002800, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  5,  7,  6, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  9, 11, 10, 0x0
gsSPEndDisplayList

glabel bits_seg7_dl_07002918 # 0x07002918 - 0x07002988
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bits_seg7_dl_070028C0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
