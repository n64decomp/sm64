bbh_seg7_light_07020058: # 0x07020058 - 0x07020060
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

bbh_seg7_light_07020060: # 0x07020060 - 0x07020070
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bbh_seg7_vertex_07020070: # 0x07020070 - 0x07020130
vertex   -204,      0,   -204,      0,      0,  0x00, 0x38, 0x8F, 0xFF
vertex      0,    410,      0,    480,    784,  0x00, 0x38, 0x8F, 0xFF
vertex    205,      0,   -204,    990,      0,  0x00, 0x38, 0x8F, 0xFF
vertex   -204,      0,    205,    990,      0,  0x8F, 0x38, 0x00, 0xFF
vertex      0,    410,      0,    478,    784,  0x8F, 0x38, 0x00, 0xFF
vertex   -204,      0,   -204,      0,      0,  0x8F, 0x38, 0x00, 0xFF
vertex    205,      0,   -204,      0,      0,  0x71, 0x38, 0x00, 0xFF
vertex      0,    410,      0,    478,    784,  0x71, 0x38, 0x00, 0xFF
vertex    205,      0,    205,    990,      0,  0x71, 0x38, 0x00, 0xFF
vertex    205,      0,    205,    990,      0,  0x00, 0x38, 0x71, 0xFF
vertex      0,    410,      0,    480,    784,  0x00, 0x38, 0x71, 0xFF
vertex   -204,      0,    205,      0,      0,  0x00, 0x38, 0x71, 0xFF

bbh_seg7_vertex_07020130: # 0x07020130 - 0x07020230
vertex   1434,      0,  -1433,   4056,   2164,  0x00, 0x7F, 0x00, 0xFF
vertex    205,      0,   -204,    990,    284,  0x00, 0x7F, 0x00, 0xFF
vertex    205,      0,    205,      0,    284,  0x00, 0x7F, 0x00, 0xFF
vertex    205,      0,    205,    990,    284,  0x00, 0x7F, 0x00, 0xFF
vertex  -1433,      0,   1434,  -3096,   2164,  0x00, 0x7F, 0x00, 0xFF
vertex   1434,      0,   1434,   4056,   2164,  0x00, 0x7F, 0x00, 0xFF
vertex   -204,      0,    205,      0,    284,  0x00, 0x7F, 0x00, 0xFF
vertex  -1433,      0,   1434,   4056,   2164,  0x00, 0x7F, 0x00, 0xFF
vertex   -204,      0,   -204,      0,    284,  0x00, 0x7F, 0x00, 0xFF
vertex  -1433,      0,  -1433,  -3096,   2164,  0x00, 0x7F, 0x00, 0xFF
vertex   -204,      0,    205,    990,    284,  0x00, 0x7F, 0x00, 0xFF
vertex  -1433,      0,  -1433,   4056,   2164,  0x00, 0x7F, 0x00, 0xFF
vertex    205,      0,   -204,      0,    284,  0x00, 0x7F, 0x00, 0xFF
vertex   1434,      0,  -1433,  -3096,   2164,  0x00, 0x7F, 0x00, 0xFF
vertex   -204,      0,   -204,    990,    284,  0x00, 0x7F, 0x00, 0xFF
vertex   1434,      0,   1434,  -3096,   2164,  0x00, 0x7F, 0x00, 0xFF

bbh_seg7_dl_07020230: # 0x07020230 - 0x07020288
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09005000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPLight bbh_seg7_light_07020060, 1
gsSPLight bbh_seg7_light_07020058, 2
gsSPVertex bbh_seg7_vertex_07020070, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSPEndDisplayList

bbh_seg7_dl_07020288: # 0x07020288 - 0x070202F0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bbh_seg7_texture_07000000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex bbh_seg7_vertex_07020130, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0,  0,  2, 15, 0x0
gsSPEndDisplayList

glabel bbh_seg7_dl_070202F0 # 0x070202F0 - 0x07020368
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList bbh_seg7_dl_07020230
gsSPDisplayList bbh_seg7_dl_07020288
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
