bbh_seg7_light_07017480: # 0x07017480 - 0x07017488
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

bbh_seg7_light_07017488: # 0x07017488 - 0x07017498
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bbh_seg7_vertex_07017498: # 0x07017498 - 0x07017518
vertex    102,   2372,   1132,      0,    990,  0x00, 0xAB, 0xA2, 0xFF
vertex   -306,   2676,    858,    990,      0,  0x00, 0xAB, 0xA2, 0xFF
vertex    102,   2676,    858,      0,      0,  0x00, 0xAB, 0xA2, 0xFF
vertex   -306,   2372,   1132,    990,    990,  0x00, 0xAB, 0xA2, 0xFF
vertex   1638,   2372,   1132,      0,    990,  0x00, 0xAB, 0xA2, 0xFF
vertex   1229,   2676,    858,    990,      0,  0x00, 0xAB, 0xA2, 0xFF
vertex   1638,   2676,    858,      0,      0,  0x00, 0xAB, 0xA2, 0xFF
vertex   1229,   2372,   1132,    990,    990,  0x00, 0xAB, 0xA2, 0xFF

bbh_seg7_dl_07017518: # 0x07017518 - 0x07017570
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09006000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight bbh_seg7_light_07017488, 1
gsSPLight bbh_seg7_light_07017480, 2
gsSPVertex bbh_seg7_vertex_07017498, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

glabel bbh_seg7_dl_07017570 # 0x07017570 - 0x070175E0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bbh_seg7_dl_07017518
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
