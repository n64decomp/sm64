bbh_seg7_vertex_070076C0: # 0x070076C0 - 0x070077B0
vertex   1044,    819,   1659,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1044,    922,   2048,   3852,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1044,    819,   2048,   3852,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1044,    922,   1659,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1044,    819,   1659,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2048,    819,   1659,  -9024,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2048,    922,   1659,  -9024,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1044,    922,   1659,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1229,    819,    389,  -3300,    990,  0x00, 0x00, 0x00, 0xFF
vertex   1659,    922,    389,    990,      0,  0x00, 0x00, 0x00, 0xFF
vertex   1229,    922,    389,  -3300,      0,  0x00, 0x00, 0x00, 0xFF
vertex    389,    819,    389,    990,    990,  0x00, 0x00, 0x00, 0xFF
vertex    389,    922,    389,    990,      0,  0x00, 0x00, 0x00, 0xFF
vertex    389,    922,   2048, -15564,      0,  0x00, 0x00, 0x00, 0xFF
vertex    389,    819,   2048, -15564,    990,  0x00, 0x00, 0x00, 0xFF

bbh_seg7_vertex_070077B0: # 0x070077B0 - 0x070078A0
vertex   1659,    922,    389,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex   1659,    819,    389,      0,    990,  0x00, 0x00, 0x00, 0xFF
vertex   1659,    819,    799,   4056,    990,  0x00, 0x00, 0x00, 0xFF
vertex   1659,    922,    799,   4056,      0,  0x00, 0x00, 0x00, 0xFF
vertex    717,    922,    389,   3238,      0,  0x00, 0x00, 0x00, 0xFF
vertex    389,    922,    389,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    389,    819,    389,      0,    990,  0x00, 0x00, 0x00, 0xFF
vertex    717,    819,    389,   3238,    990,  0x00, 0x00, 0x00, 0xFF
vertex   2048,    922,    799,   3852,      0,  0x00, 0x00, 0x00, 0xFF
vertex   1659,    819,    799,      0,    990,  0x00, 0x00, 0x00, 0xFF
vertex   2048,    819,    799,   3852,    990,  0x00, 0x00, 0x00, 0xFF
vertex   1229,    819,    389,  -3300,    990,  0x00, 0x00, 0x00, 0xFF
vertex   1659,    819,    389,    990,    990,  0x00, 0x00, 0x00, 0xFF
vertex   1659,    922,    389,    990,      0,  0x00, 0x00, 0x00, 0xFF
vertex   1659,    922,    799,      0,      0,  0x00, 0x00, 0x00, 0xFF

bbh_seg7_dl_070078A0: # 0x070078A0 - 0x07007940
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09008000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bbh_seg7_vertex_070076C0, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex bbh_seg7_vertex_070077B0, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle  8, 14,  9, 0x0
gsSPEndDisplayList

glabel bbh_seg7_dl_07007940 # 0x07007940 - 0x070079B0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bbh_seg7_dl_070078A0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
