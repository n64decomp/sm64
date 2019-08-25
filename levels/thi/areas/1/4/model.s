thi_seg7_light_07007078: # 0x07007078 - 0x07007080
.byte 0x7F, 0x7F, 0x3C, 0x00, 0x7F, 0x7F, 0x3C, 0x00

thi_seg7_light_07007080: # 0x07007080 - 0x07007090
.byte 0xFF, 0xFF, 0x78, 0x00, 0xFF, 0xFF, 0x78, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

thi_seg7_vertex_07007090: # 0x07007090 - 0x07007180
vertex   5632,  -6655,  -6655,     76,    806,  0x00, 0x7F, 0x00, 0xFF
vertex   5120,  -6655,  -7167,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   4608,  -6655,  -5631,    506,    990,  0x00, 0x7F, 0x00, 0xFF
vertex  -8191,  -3583,  -8191,   1502,    990,  0x00, 0x7F, 0x00, 0xFF
vertex  -5119,  -3583,  -4607,      0,     96,  0x00, 0x7F, 0x00, 0xFF
vertex  -5119,  -3583,  -8191,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex  -8191,  -3583,  -8191,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex  -8191,  -3583,   8192,   8144,    990,  0x00, 0x7F, 0x00, 0xFF
vertex  -5119,  -3583,   8192,   8144,      0,  0x00, 0x7F, 0x00, 0xFF
vertex  -5119,  -3583,  -4607,   1756,      0,  0x00, 0x7F, 0x00, 0xFF
vertex  -5119,  -3583,   8192,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   6963,  -3583,   8192,   5998,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   6963,  -3583,   4608,   5998,     96,  0x00, 0x7F, 0x00, 0xFF
vertex  -5119,  -3583,   4608,      0,     96,  0x00, 0x7F, 0x00, 0xFF
vertex   5632,  -6655,  -4607,    722,    620,  0x00, 0x7F, 0x00, 0xFF

thi_seg7_vertex_07007180: # 0x07007180 - 0x07007240
vertex   7680,  -6655,  -6655,    224,    786,  0xFF, 0xFF, 0xFF, 0xFF
vertex   8192,  -6655,  -7167,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   5120,  -6655,  -7167,   1502,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   5632,  -6655,  -6655,   1246,    786,  0x00, 0x7F, 0x00, 0xFF
vertex   -921,  -6655,  -5426,   1940,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   -921,  -6655,  -4607,   1952,    844,  0x00, 0x7F, 0x00, 0xFF
vertex   5632,  -6655,  -4607,   -382,    800,  0x00, 0x7F, 0x00, 0xFF
vertex   4608,  -6655,  -5631,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   7680,  -6655,  -6655,    970,    790,  0xFF, 0xFF, 0xFF, 0xFF
vertex   7680,  -6655,  -5631,    470,    890,  0xFF, 0xFF, 0xFF, 0xFF
vertex   7680,  -6655,  -4607,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   8192,  -6655,  -7167,   1270,    990,  0x00, 0x7F, 0x00, 0xFF

thi_seg7_dl_07007240: # 0x07007240 - 0x070072E8
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, grass_0900B800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight thi_seg7_light_07007080, 1
gsSPLight thi_seg7_light_07007078, 2
gsSPVertex thi_seg7_vertex_07007090, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  8,  9, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 12, 13, 0x0
gsSP1Triangle  0,  2, 14, 0x0
gsSPVertex thi_seg7_vertex_07007180, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 10, 11, 0x0
gsSPEndDisplayList

glabel thi_seg7_dl_070072E8 # 0x070072E8 - 0x07007348
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList thi_seg7_dl_07007240
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
