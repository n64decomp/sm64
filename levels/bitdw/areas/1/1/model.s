bitdw_seg7_vertex_07002000: # 0x07002000 - 0x07002080
vertex   2516,  -2357,   2962,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2415,  -2440,   3024,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2517,  -2439,   3023,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2413,  -2358,   2962,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3038,  -2766,   2960,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3139,  -2849,   3023,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3037,  -2848,   3022,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3141,  -2768,   2961,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

bitdw_seg7_dl_07002080: # 0x07002080 - 0x070020C8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_metal_hole
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bitdw_seg7_vertex_07002000, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

glabel bitdw_seg7_dl_070020C8 # 0x070020C8 - 0x07002138
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bitdw_seg7_dl_07002080
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
