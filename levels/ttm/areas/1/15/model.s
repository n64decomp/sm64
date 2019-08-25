ttm_seg7_light_0700DFE8: # 0x0700DFE8 - 0x0700DFF0
.byte 0x4C, 0x4C, 0x4C, 0x00, 0x4C, 0x4C, 0x4C, 0x00

ttm_seg7_light_0700DFF0: # 0x0700DFF0 - 0x0700E000
.byte 0x99, 0x99, 0x99, 0x00, 0x99, 0x99, 0x99, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ttm_seg7_vertex_0700E000: # 0x0700E000 - 0x0700E100
vertex    -43,     93,   -191,      0,    376,  0xB0, 0xA7, 0x28, 0xFF
vertex     48,     -9,   -237,      0,    582,  0xB0, 0xA7, 0x28, 0xFF
vertex    231,     -9,    127,    782,    582,  0xB0, 0xA7, 0x28, 0xFF
vertex   -317,   -213,    -54,      0,    990,  0x71, 0x00, 0xC8, 0xFF
vertex   -317,     -9,    -54,      0,    582,  0x71, 0x00, 0xC8, 0xFF
vertex   -130,     -9,    319,    802,    582,  0x71, 0x00, 0xC8, 0xFF
vertex   -130,   -213,    319,    802,    990,  0x71, 0x00, 0xC8, 0xFF
vertex   -130,     -9,    319,    802,    582,  0x50, 0xA7, 0xD8, 0xFF
vertex   -317,     -9,    -54,      0,    582,  0x50, 0xA7, 0xD8, 0xFF
vertex   -226,     93,   -100,      0,    376,  0x50, 0xA7, 0xD8, 0xFF
vertex   -130,     -9,    319,    802,    582,  0x5A, 0xB1, 0xD8, 0xFF
vertex   -226,     93,   -100,      0,    376,  0x5A, 0xB1, 0xD8, 0xFF
vertex      9,    215,    185,    688,    132,  0x5A, 0xB1, 0xD8, 0xFF
vertex      9,    215,    185,    134,    230,  0x12, 0x88, 0x24, 0xFF
vertex   -226,     93,   -100,      0,    990,  0x12, 0x88, 0x24, 0xFF
vertex    -43,     93,   -191,    376,    990,  0x12, 0x88, 0x24, 0xFF

ttm_seg7_vertex_0700E100: # 0x0700E100 - 0x0700E200
vertex      9,    215,    185,    688,    132,  0xB0, 0xA7, 0x28, 0xFF
vertex    -43,     93,   -191,      0,    376,  0xB0, 0xA7, 0x28, 0xFF
vertex    231,     -9,    127,    782,    582,  0xB0, 0xA7, 0x28, 0xFF
vertex   -317,     -9,    -54,   6732,  -5344,  0x38, 0x00, 0x71, 0xFF
vertex     48,   -213,   -237,   7510,  -4898,  0x38, 0x00, 0x71, 0xFF
vertex     48,     -9,   -237,   7530,  -5306,  0x38, 0x00, 0x71, 0xFF
vertex    231,     -9,    127,    782,    582,  0x8F, 0x00, 0x39, 0xFF
vertex     48,     -9,   -237,      0,    582,  0x8F, 0x00, 0x39, 0xFF
vertex     48,   -213,   -237,      0,    990,  0x8F, 0x00, 0x39, 0xFF
vertex    231,   -213,    127,    782,    990,  0x8F, 0x00, 0x39, 0xFF
vertex    231,   -213,    127,   3290,  -7342,  0x00, 0x7F, 0x00, 0xFF
vertex     48,   -213,   -237,   2926,  -8070,  0x00, 0x7F, 0x00, 0xFF
vertex      9,   -213,    185,   2848,  -7226,  0x00, 0x7F, 0x00, 0xFF
vertex   -317,   -213,    -54,   2194,  -7704,  0x00, 0x7F, 0x00, 0xFF
vertex   -130,   -213,    319,   2568,  -6958,  0x00, 0x7F, 0x00, 0xFF
vertex   -317,   -213,    -54,   6712,  -4936,  0x38, 0x00, 0x71, 0xFF

ttm_seg7_vertex_0700E200: # 0x0700E200 - 0x0700E240
vertex   -317,     -9,    -54,   6732,  -5344,  0x38, 0x00, 0x71, 0xFF
vertex     48,     -9,   -237,   7530,  -5306,  0x38, 0x00, 0x71, 0xFF
vertex    -43,     93,   -191,   7340,  -5520,  0x38, 0x00, 0x71, 0xFF
vertex   -226,     93,   -100,   6942,  -5538,  0x38, 0x00, 0x71, 0xFF

ttm_seg7_dl_0700E240: # 0x0700E240 - 0x0700E308
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mountain_09004000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ttm_seg7_light_0700DFF0, 1
gsSPLight ttm_seg7_light_0700DFE8, 2
gsSPVertex ttm_seg7_vertex_0700E000, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  3,  5, 0x0,  7,  8,  9, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 13, 14, 15, 0x0
gsSPVertex ttm_seg7_vertex_0700E100, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  8,  9, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 13, 14, 12, 0x0
gsSP2Triangles 11, 13, 12, 0x0,  3, 15,  4, 0x0
gsSPVertex ttm_seg7_vertex_0700E200, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel ttm_seg7_dl_0700E308 # 0x0700E308 - 0x0700E378
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ttm_seg7_dl_0700E240
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
