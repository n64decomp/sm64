bowser_3_seg7_light_070029A8: # 0x070029A8 - 0x070029B0
.byte 0x22, 0x22, 0x22, 0x00, 0x22, 0x22, 0x22, 0x00

bowser_3_seg7_light_070029B0: # 0x070029B0 - 0x070029C0
.byte 0x89, 0x89, 0x8A, 0x00, 0x89, 0x89, 0x8A, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bowser_3_seg7_light_070029C0: # 0x070029C0 - 0x070029C8
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

bowser_3_seg7_light_070029C8: # 0x070029C8 - 0x070029D8
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bowser_3_seg7_vertex_070029D8: # 0x070029D8 - 0x07002A38
vertex  -1497,  -1852,   2050,    580,    338,  0xF8, 0x90, 0x39, 0xFF
vertex      0,  -2364,   1262,   1366,  -1156,  0xF8, 0x90, 0x39, 0xFF
vertex      0,  -1340,   3277,   -644,  -1156,  0xF8, 0x90, 0x39, 0xFF
vertex  -1497,  -1852,   2050,    580,    338,  0xEA, 0x99, 0x46, 0xFF
vertex      0,  -1340,   3277,   -644,  -1156,  0xEA, 0x99, 0x46, 0xFF
vertex  -1945,  -1340,   2662,      0,    786,  0xEA, 0x99, 0x46, 0xFF

bowser_3_seg7_vertex_07002A38: # 0x07002A38 - 0x07002A78
vertex  -1945,    307,   2662,   -302,    582,  0x00, 0x7F, 0x00, 0xFF
vertex      0,    307,   3277,    990,    990,  0x00, 0x7F, 0x00, 0xFF
vertex      0,    307,   1262,    990,   -350,  0x00, 0x7F, 0x00, 0xFF
vertex  -1497,    307,   2050,     -6,    174,  0x00, 0x7F, 0x00, 0xFF

bowser_3_seg7_vertex_07002A78: # 0x07002A78 - 0x07002B78
vertex      0,  -2364,   1262,  -1020,   2012,  0x7F, 0x00, 0x00, 0xFF
vertex      0,    307,   1262,  -1020,      0,  0x7F, 0x00, 0x00, 0xFF
vertex      0,  -1340,   3277,    990,   2012,  0x7F, 0x00, 0x00, 0xFF
vertex      0,  -1340,   3277,   3800,   1816,  0xDA, 0x00, 0x79, 0xFF
vertex  -1945,    307,   2662,   2260,    172,  0xDA, 0x00, 0x79, 0xFF
vertex  -1945,  -1340,   2662,   2260,   1816,  0xDA, 0x00, 0x79, 0xFF
vertex      0,    307,   3277,   3800,    172,  0xDA, 0x00, 0x79, 0xFF
vertex  -1945,    307,   2662,    234,      0,  0x9A, 0x00, 0xB5, 0xFF
vertex  -1497,    307,   2050,    990,      0,  0x9A, 0x00, 0xB5, 0xFF
vertex  -1497,  -1852,   2050,    990,   2012,  0x9A, 0x00, 0xB5, 0xFF
vertex  -1945,  -1340,   2662,    234,   2012,  0x9A, 0x00, 0xB5, 0xFF
vertex  -1497,    307,   2050,   -698,      0,  0xC5, 0x00, 0x90, 0xFF
vertex      0,  -2364,   1262,    990,   2012,  0xC5, 0x00, 0x90, 0xFF
vertex  -1497,  -1852,   2050,   -698,   2012,  0xC5, 0x00, 0x90, 0xFF
vertex      0,    307,   1262,    990,      0,  0xC5, 0x00, 0x90, 0xFF
vertex      0,    307,   3277,    990,      0,  0x7F, 0x00, 0x00, 0xFF

bowser_3_seg7_dl_07002B78: # 0x07002B78 - 0x07002BE8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bowser_3_seg7_texture_07000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight bowser_3_seg7_light_070029B0, 1
gsSPLight bowser_3_seg7_light_070029A8, 2
gsSPVertex bowser_3_seg7_vertex_070029D8, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPLight bowser_3_seg7_light_070029C8, 1
gsSPLight bowser_3_seg7_light_070029C0, 2
gsSPVertex bowser_3_seg7_vertex_07002A38, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

bowser_3_seg7_dl_07002BE8: # 0x07002BE8 - 0x07002C50
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bowser_3_seg7_texture_07001000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex bowser_3_seg7_vertex_07002A78, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles 10,  7,  9, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0,  1, 15,  2, 0x0
gsSPEndDisplayList

glabel bowser_3_seg7_dl_07002C50 # 0x07002C50 - 0x07002CE0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bowser_3_seg7_dl_07002B78
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList bowser_3_seg7_dl_07002BE8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
