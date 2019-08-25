thi_seg7_light_070076A8: # 0x070076A8 - 0x070076B0
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

thi_seg7_light_070076B0: # 0x070076B0 - 0x070076C0
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

thi_seg7_light_070076C0: # 0x070076C0 - 0x070076C8
.byte 0x4C, 0x4C, 0x4C, 0x00, 0x4C, 0x4C, 0x4C, 0x00

thi_seg7_light_070076C8: # 0x070076C8 - 0x070076D8
.byte 0x99, 0x99, 0x99, 0x00, 0x99, 0x99, 0x99, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

thi_seg7_vertex_070076D8: # 0x070076D8 - 0x07007718
vertex   -409,      0,   -409,   -848,    172,  0xAC, 0x54, 0xD6, 0xFF
vertex    410,      0,    410,    786,   1806,  0x54, 0x54, 0x2A, 0xFF
vertex    410,      0,   -409,    786,    172,  0x33, 0x33, 0x99, 0xFF
vertex   -409,      0,    410,   -848,   1806,  0xCD, 0x33, 0x67, 0xFF

thi_seg7_vertex_07007718: # 0x07007718 - 0x070077D8
vertex   -409,   -101,   -409,    990,    224,  0xC0, 0xD4, 0x9C, 0xFF
vertex   -409,      0,   -409,    990,      0,  0xAC, 0x54, 0xD6, 0xFF
vertex    410,      0,   -409,      0,      0,  0x33, 0x33, 0x99, 0xFF
vertex    410,   -101,   -409,      0,    224,  0x64, 0xD4, 0xC0, 0xFF
vertex    410,      0,    410,    990,      0,  0x54, 0x54, 0x2A, 0xFF
vertex    410,   -101,    410,    990,    224,  0x40, 0xD4, 0x64, 0xFF
vertex    410,   -101,    410,      0,    224,  0x40, 0xD4, 0x64, 0xFF
vertex   -409,      0,    410,    990,      0,  0xCD, 0x33, 0x67, 0xFF
vertex   -409,   -101,    410,    990,    224,  0x9C, 0xD4, 0x40, 0xFF
vertex    410,      0,    410,      0,      0,  0x54, 0x54, 0x2A, 0xFF
vertex   -409,      0,   -409,      0,      0,  0xAC, 0x54, 0xD6, 0xFF
vertex   -409,   -101,   -409,      0,    224,  0xC0, 0xD4, 0x9C, 0xFF

thi_seg7_vertex_070077D8: # 0x070077D8 - 0x07007828
vertex   -409,   -101,   -409,   -438,   2624,  0xC0, 0xD4, 0x9C, 0xFF
vertex    410,   -101,   -409,  -1666,   2624,  0x64, 0xD4, 0xC0, 0xFF
vertex      0,   -613,      0,  -1052,   2010,  0x00, 0x82, 0x00, 0xFF
vertex    410,   -101,    410,  -1666,   1396,  0x40, 0xD4, 0x64, 0xFF
vertex   -409,   -101,    410,   -438,   1396,  0x9C, 0xD4, 0x40, 0xFF

thi_seg7_dl_07007828: # 0x07007828 - 0x07007870
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09005800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight thi_seg7_light_070076B0, 1
gsSPLight thi_seg7_light_070076A8, 2
gsSPVertex thi_seg7_vertex_070076D8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

thi_seg7_dl_07007870: # 0x07007870 - 0x070078D8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09005000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex thi_seg7_vertex_07007718, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  3,  2,  4, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  9,  7, 0x0
gsSP2Triangles  8,  7, 10, 0x0,  8, 10, 11, 0x0
gsSPEndDisplayList

thi_seg7_dl_070078D8: # 0x070078D8 - 0x07007930
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09004800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight thi_seg7_light_070076C8, 1
gsSPLight thi_seg7_light_070076C0, 2
gsSPVertex thi_seg7_vertex_070077D8, 5, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP2Triangles  3,  4,  2, 0x0,  4,  0,  2, 0x0
gsSPEndDisplayList

glabel thi_seg7_dl_07007930 # 0x07007930 - 0x070079D0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList thi_seg7_dl_07007828
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList thi_seg7_dl_07007870
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList thi_seg7_dl_070078D8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
