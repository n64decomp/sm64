bowser_3_seg7_light_07003350: # 0x07003350 - 0x07003358
.byte 0x22, 0x22, 0x22, 0x00, 0x22, 0x22, 0x22, 0x00

bowser_3_seg7_light_07003358: # 0x07003358 - 0x07003368
.byte 0x89, 0x89, 0x8A, 0x00, 0x89, 0x89, 0x8A, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bowser_3_seg7_light_07003368: # 0x07003368 - 0x07003370
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

bowser_3_seg7_light_07003370: # 0x07003370 - 0x07003380
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bowser_3_seg7_vertex_07003380: # 0x07003380 - 0x070033E0
vertex   3072,  -1340,   1024,   1604,  -4222,  0x39, 0x90, 0x09, 0xFF
vertex   1183,  -2364,    394,   2232,  -2336,  0x39, 0x90, 0x09, 0xFF
vertex   2365,  -1852,   -787,   3412,  -3518,  0x39, 0x90, 0x09, 0xFF
vertex   3072,  -1340,   1024,   1604,  -4222,  0x4A, 0x9A, 0x00, 0xFF
vertex   2365,  -1852,   -787,   3412,  -3518,  0x4A, 0x9A, 0x00, 0xFF
vertex   3072,  -1340,  -1023,   3648,  -4222,  0x4A, 0x9A, 0x00, 0xFF

bowser_3_seg7_vertex_070033E0: # 0x070033E0 - 0x07003420
vertex   3072,    307,   1024,   3034,   -508,  0x00, 0x7F, 0x00, 0xFF
vertex   2365,    307,   -787,   2564,  -1714,  0x00, 0x7F, 0x00, 0xFF
vertex   1183,    307,    394,   1776,   -928,  0x00, 0x7F, 0x00, 0xFF
vertex   3072,    307,  -1023,   3034,  -1872,  0x00, 0x7F, 0x00, 0xFF

bowser_3_seg7_vertex_07003420: # 0x07003420 - 0x07003520
vertex   3072,  -1340,   1024,    990,   2012,  0xD8, 0x00, 0x78, 0xFF
vertex   1183,    307,    394,   -996,      0,  0xD8, 0x00, 0x78, 0xFF
vertex   1183,  -2364,    394,   -996,   2012,  0xD8, 0x00, 0x78, 0xFF
vertex   2365,    307,   -787,    246,      0,  0xD8, 0x00, 0x88, 0xFF
vertex   3072,    307,  -1023,    990,      0,  0xD8, 0x00, 0x88, 0xFF
vertex   3072,  -1340,  -1023,    990,   2012,  0xD8, 0x00, 0x88, 0xFF
vertex   2365,  -1852,   -787,    246,   2012,  0xD8, 0x00, 0x88, 0xFF
vertex   1183,  -2364,    394,   -678,   2012,  0xA7, 0x00, 0xA7, 0xFF
vertex   2365,    307,   -787,    990,      0,  0xA7, 0x00, 0xA7, 0xFF
vertex   2365,  -1852,   -787,    990,   2012,  0xA7, 0x00, 0xA7, 0xFF
vertex   1183,    307,    394,   -678,      0,  0xA7, 0x00, 0xA7, 0xFF
vertex   3072,  -1340,  -1023,   8418,   1816,  0x7F, 0x00, 0x00, 0xFF
vertex   3072,    307,   1024,   6848,    172,  0x7F, 0x00, 0x00, 0xFF
vertex   3072,  -1340,   1024,   6848,   1816,  0x7F, 0x00, 0x00, 0xFF
vertex   3072,    307,  -1023,   8418,    172,  0x7F, 0x00, 0x00, 0xFF
vertex   3072,    307,   1024,    990,      0,  0xD8, 0x00, 0x78, 0xFF

bowser_3_seg7_dl_07003520: # 0x07003520 - 0x07003590
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bowser_3_seg7_texture_07000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight bowser_3_seg7_light_07003358, 1
gsSPLight bowser_3_seg7_light_07003350, 2
gsSPVertex bowser_3_seg7_vertex_07003380, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPLight bowser_3_seg7_light_07003370, 1
gsSPLight bowser_3_seg7_light_07003368, 2
gsSPVertex bowser_3_seg7_vertex_070033E0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

bowser_3_seg7_dl_07003590: # 0x07003590 - 0x070035F8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bowser_3_seg7_texture_07001000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex bowser_3_seg7_vertex_07003420, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0,  0, 15,  1, 0x0
gsSPEndDisplayList

glabel bowser_3_seg7_dl_070035F8 # 0x070035F8 - 0x07003688
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bowser_3_seg7_dl_07003520
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList bowser_3_seg7_dl_07003590
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
