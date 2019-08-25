lll_seg7_vertex_07017BE8: # 0x07017BE8 - 0x07017CD8
vertex   -101,      0,    177,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    102,    -19,    177,    990,     70,  0xFF, 0xFF, 0xFF, 0xFF
vertex    102,      0,    177,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    102,      0,   -176,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -101,    -19,   -176,    990,   1090,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -101,      0,   -176,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    102,    -19,   -176,      0,   1090,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -101,      0,   -176,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -204,    -19,      0,    990,   1090,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -204,      0,      0,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -101,    -19,   -176,      0,   1090,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -204,      0,      0,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -204,    -19,      0,      0,   1090,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -101,    -19,    177,    990,   1090,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -101,      0,    177,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF

lll_seg7_vertex_07017CD8: # 0x07017CD8 - 0x07017DD8
vertex    205,      0,      0,    786,   -236,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -101,      0,   -176,    268,  -2170,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -101,      0,    177,  -1146,   -754,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -101,      0,    177,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -101,    -19,    177,      0,     70,  0xFF, 0xFF, 0xFF, 0xFF
vertex    102,    -19,    177,    990,     70,  0xFF, 0xFF, 0xFF, 0xFF
vertex    102,      0,    177,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    205,    -19,      0,    990,     70,  0xFF, 0xFF, 0xFF, 0xFF
vertex    205,      0,      0,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    102,    -19,    177,      0,     70,  0xFF, 0xFF, 0xFF, 0xFF
vertex    205,      0,      0,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    102,    -19,   -176,    990,   1090,  0xFF, 0xFF, 0xFF, 0xFF
vertex    102,      0,   -176,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    205,    -19,      0,      0,   1090,  0xFF, 0xFF, 0xFF, 0xFF
vertex    102,      0,   -176,   1084,  -1354,  0xFF, 0xFF, 0xFF, 0xFF
vertex    102,      0,    177,   -330,     62,  0xFF, 0xFF, 0xFF, 0xFF

lll_seg7_vertex_07017DD8: # 0x07017DD8 - 0x07017E68
vertex   -101,      0,   -176,    268,  -2170,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -204,      0,      0,   -848,  -1872,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -101,      0,    177,  -1146,   -754,  0xFF, 0xFF, 0xFF, 0xFF
vertex    102,    -19,    177,    156,    292,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -101,    -19,    177,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -204,    -19,      0,    478,   1498,  0xFF, 0xFF, 0xFF, 0xFF
vertex    102,    -19,   -176,   1364,    616,  0xFF, 0xFF, 0xFF, 0xFF
vertex    205,    -19,      0,    854,    104,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -101,    -19,   -176,   1178,   1312,  0xFF, 0xFF, 0xFF, 0xFF

lll_seg7_dl_07017E68: # 0x07017E68 - 0x07017F40
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fire_09000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex lll_seg7_vertex_07017BE8, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex lll_seg7_vertex_07017CD8, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  9,  7, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 13, 11, 0x0
gsSP2Triangles  0, 14,  1, 0x0,  0,  2, 15, 0x0
gsSPVertex lll_seg7_vertex_07017DD8, 9, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  3,  6,  7, 0x0
gsSP1Triangle  5,  8,  6, 0x0
gsSPEndDisplayList

glabel lll_seg7_dl_07017F40 # 0x07017F40 - 0x07017FB0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList lll_seg7_dl_07017E68
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
