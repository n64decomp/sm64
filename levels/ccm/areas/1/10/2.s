ccm_seg7_vertex_070106D8: # 0x070106D8 - 0x07010758
vertex  -1457,   -890,    550,  23466,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -377,   -397,    185,  11430,     24,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -377,   -499,    185,  11436,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1457,   -787,    550,  23460,     24,  0xFF, 0xFF, 0xFF, 0xFF
vertex    703,     -6,   -178,  -2624,     24,  0xFF, 0xFF, 0xFF, 0xFF
vertex    703,   -108,   -178,  -2618,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -377,   -499,    185,   9410,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -377,   -397,    185,   9404,     24,  0xFF, 0xFF, 0xFF, 0xFF

ccm_seg7_vertex_07010758: # 0x07010758 - 0x07010848
vertex  -1120,    297,    770,   3368,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1120,    553,    770,   3376,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1586,    553,    983,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1120,    348,    770,  -5376,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -12,    336,    667,   2028,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1120,    553,    770,  -5392,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -12,    540,    667,   2012,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -55,    336,    574,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1163,    348,    677,   7372,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1163,    553,    677,   7388,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -55,    540,    574,    -16,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1333,    297,    304,      0,    -34,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1333,    553,    304,      0,    988,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1120,    553,    770,   3376,    988,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1120,    297,    770,   3372,    -34,  0xFF, 0xFF, 0xFF, 0xFF

ccm_seg7_vertex_07010848: # 0x07010848 - 0x070108F8
vertex  -1799,    297,    517,    -36,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1799,    553,    517,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1333,    553,    304,   3376,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1120,    297,    770,   3368,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1586,    553,    983,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1586,    297,    983,    -36,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1586,    297,    982,   3368,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1586,    553,    982,   3372,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1799,    553,    516,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1799,    297,    516,    -36,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1333,    297,    304,   3368,      0,  0xFF, 0xFF, 0xFF, 0xFF

ccm_seg7_dl_070108F8: # 0x070108F8 - 0x07010940
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, snow_09005800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex ccm_seg7_vertex_070106D8, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  7,  4,  6, 0x0
gsSPEndDisplayList

ccm_seg7_dl_07010940: # 0x07010940 - 0x070109D0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, snow_09007000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPVertex ccm_seg7_vertex_07010758, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  4,  6,  5, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 13, 14, 11, 0x0
gsSPVertex ccm_seg7_vertex_07010848, 11, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  8,  9,  6, 0x0
gsSP1Triangle  2, 10,  0, 0x0
gsSPEndDisplayList

glabel ccm_seg7_dl_070109D0 # 0x070109D0 - 0x07010A60
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ccm_seg7_dl_070108F8
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList ccm_seg7_dl_07010940
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
