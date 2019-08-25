lll_seg7_light_0701A670: # 0x0701A670 - 0x0701A678
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

lll_seg7_light_0701A678: # 0x0701A678 - 0x0701A688
.byte 0xFE, 0xFF, 0xFF, 0x00, 0xFE, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

lll_seg7_vertex_0701A688: # 0x0701A688 - 0x0701A778
vertex   -127,      0,    256,   1910,   3134,  0x81, 0x00, 0x00, 0xFF
vertex   -127,    154,    256,   2524,   2520,  0x81, 0x00, 0x00, 0xFF
vertex   -127,    154,   -255,    480,    478,  0x81, 0x00, 0x00, 0xFF
vertex    128,    154,    256,   -542,   3542,  0x00, 0x7F, 0x00, 0xFF
vertex    128,    154,   -255,   1502,   1498,  0x00, 0x7F, 0x00, 0xFF
vertex   -127,    154,   -255,    478,    478,  0x00, 0x7F, 0x00, 0xFF
vertex   -127,    154,    256,  -1564,   2520,  0x00, 0x7F, 0x00, 0xFF
vertex    128,      0,   -255,   1910,   3134,  0x7F, 0x00, 0x00, 0xFF
vertex    128,    154,   -255,   2522,   2520,  0x7F, 0x00, 0x00, 0xFF
vertex    128,    154,    256,    478,    478,  0x7F, 0x00, 0x00, 0xFF
vertex    128,      0,    256,   -132,   1090,  0x7F, 0x00, 0x00, 0xFF
vertex   -127,      0,   -255,    888,   2112,  0x00, 0x00, 0x81, 0xFF
vertex    128,    154,   -255,    480,    480,  0x00, 0x00, 0x81, 0xFF
vertex    128,      0,   -255,   -132,   1090,  0x00, 0x00, 0x81, 0xFF
vertex   -127,    154,   -255,   1502,   1500,  0x00, 0x00, 0x81, 0xFF

lll_seg7_vertex_0701A778: # 0x0701A778 - 0x0701A7E8
vertex    128,      0,    256,    888,   2112,  0x00, 0x00, 0x7F, 0xFF
vertex   -127,    154,    256,    478,    478,  0x00, 0x00, 0x7F, 0xFF
vertex   -127,      0,    256,   -132,   1090,  0x00, 0x00, 0x7F, 0xFF
vertex   -127,      0,    256,   1910,   3134,  0x81, 0x00, 0x00, 0xFF
vertex   -127,    154,   -255,    480,    478,  0x81, 0x00, 0x00, 0xFF
vertex   -127,      0,   -255,   -132,   1090,  0x81, 0x00, 0x00, 0xFF
vertex    128,    154,    256,   1500,   1498,  0x00, 0x00, 0x7F, 0xFF

lll_seg7_dl_0701A7E8: # 0x0701A7E8 - 0x0701A878
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fire_09002000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight lll_seg7_light_0701A678, 1
gsSPLight lll_seg7_light_0701A670, 2
gsSPVertex lll_seg7_vertex_0701A688, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 14, 12, 0x0
gsSPVertex lll_seg7_vertex_0701A778, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP1Triangle  0,  6,  1, 0x0
gsSPEndDisplayList

glabel lll_seg7_dl_0701A878 # 0x0701A878 - 0x0701A8E8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList lll_seg7_dl_0701A7E8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
