lll_seg7_light_07013620: # 0x07013620 - 0x07013628
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

lll_seg7_light_07013628: # 0x07013628 - 0x07013638
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

lll_seg7_vertex_07013638: # 0x07013638 - 0x07013738
vertex  -3327,     10,   3584,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex  -3071,     10,   3584,    990,    990,  0x00, 0x7F, 0x00, 0xFF
vertex  -3071,     10,   3328,    990,      0,  0x00, 0x7F, 0x00, 0xFF
vertex  -3327,     10,   3328,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex   2816,   1280,   8192,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex   2816,    256,   8192,      0,   1244,  0x7F, 0x00, 0x00, 0xFF
vertex   2816,    256,   7552,    766,   1244,  0x7F, 0x00, 0x00, 0xFF
vertex   2816,    563,   5504,   3322,    862,  0x7F, 0x00, 0x00, 0xFF
vertex   2816,   1280,   4608,   4440,      0,  0x7F, 0x00, 0x00, 0xFF
vertex   2816,    563,   4608,   4440,    862,  0x7F, 0x00, 0x00, 0xFF
vertex   2816,   1280,   4608,      0,    224,  0x00, 0x00, 0x7F, 0xFF
vertex   2816,    563,   4608,      0,   1116,  0x00, 0x00, 0x7F, 0xFF
vertex   4352,    563,   4608,   1884,   1116,  0x00, 0x00, 0x7F, 0xFF
vertex   5888,   1280,   4608,   3800,    224,  0x00, 0x00, 0x7F, 0xFF
vertex   4352,      0,   4608,   1884,   1818,  0x00, 0x00, 0x7F, 0xFF
vertex   5888,      0,   4608,   3800,   1818,  0x00, 0x00, 0x7F, 0xFF

lll_seg7_dl_07013738: # 0x07013738 - 0x070137C0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fire_09000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight lll_seg7_light_07013628, 1
gsSPLight lll_seg7_light_07013620, 2
gsSPVertex lll_seg7_vertex_07013638, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  8, 0x0
gsSP2Triangles  4,  6,  7, 0x0,  7,  9,  8, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 12, 13, 10, 0x0
gsSP2Triangles 12, 14, 15, 0x0, 12, 15, 13, 0x0
gsSPEndDisplayList

glabel lll_seg7_dl_070137C0 # 0x070137C0 - 0x07013830
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList lll_seg7_dl_07013738
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsSPEndDisplayList
