bowser_3_seg7_light_07003018: # 0x07003018 - 0x07003020
.byte 0x22, 0x22, 0x22, 0x00, 0x22, 0x22, 0x22, 0x00

bowser_3_seg7_light_07003020: # 0x07003020 - 0x07003030
.byte 0x89, 0x89, 0x8A, 0x00, 0x89, 0x89, 0x8A, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bowser_3_seg7_light_07003030: # 0x07003030 - 0x07003038
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

bowser_3_seg7_light_07003038: # 0x07003038 - 0x07003048
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bowser_3_seg7_vertex_07003048: # 0x07003048 - 0x070030A8
vertex   1183,  -2364,    394,   2232,  -2336,  0x34, 0x90, 0x18, 0xFF
vertex   3072,  -1340,   1024,   1604,  -4222,  0x34, 0x90, 0x18, 0xFF
vertex   1498,  -1852,   2050,    580,  -2652,  0x34, 0x90, 0x18, 0xFF
vertex   3072,  -1340,   1024,   1604,  -4222,  0x3C, 0x99, 0x29, 0xFF
vertex   1946,  -1340,   2662,      0,  -3098,  0x3C, 0x99, 0x29, 0xFF
vertex   1498,  -1852,   2050,    580,  -2652,  0x3C, 0x99, 0x29, 0xFF

bowser_3_seg7_vertex_070030A8: # 0x070030A8 - 0x070030E8
vertex   3072,    307,   1024,   3034,   -508,  0x00, 0x7F, 0x00, 0xFF
vertex   1183,    307,    394,   1776,   -928,  0x00, 0x7F, 0x00, 0xFF
vertex   1498,    307,   2050,   1986,    174,  0x00, 0x7F, 0x00, 0xFF
vertex   1946,    307,   2662,   2284,    582,  0x00, 0x7F, 0x00, 0xFF

bowser_3_seg7_vertex_070030E8: # 0x070030E8 - 0x070031E8
vertex   1183,  -2364,    394,   -996,   2012,  0x28, 0x00, 0x88, 0xFF
vertex   3072,    307,   1024,    990,      0,  0x28, 0x00, 0x88, 0xFF
vertex   3072,  -1340,   1024,    990,   2012,  0x28, 0x00, 0x88, 0xFF
vertex   3072,  -1340,   1024,   6848,   1816,  0x68, 0x00, 0x47, 0xFF
vertex   1946,    307,   2662,   5340,    172,  0x68, 0x00, 0x47, 0xFF
vertex   1946,  -1340,   2662,   5340,   1816,  0x68, 0x00, 0x47, 0xFF
vertex   3072,    307,   1024,   6848,    172,  0x68, 0x00, 0x47, 0xFF
vertex   1946,  -1340,   2662,    990,   2012,  0x9A, 0x00, 0x4B, 0xFF
vertex   1946,    307,   2662,    990,      0,  0x9A, 0x00, 0x4B, 0xFF
vertex   1498,    307,   2050,    234,      0,  0x9A, 0x00, 0x4B, 0xFF
vertex   1498,  -1852,   2050,    234,   2012,  0x9A, 0x00, 0x4B, 0xFF
vertex   1498,    307,   2050,   -690,      0,  0x84, 0x00, 0x17, 0xFF
vertex   1183,    307,    394,    990,      0,  0x84, 0x00, 0x17, 0xFF
vertex   1498,  -1852,   2050,   -690,   2012,  0x84, 0x00, 0x17, 0xFF
vertex   1183,  -2364,    394,    990,   2012,  0x84, 0x00, 0x17, 0xFF
vertex   1183,    307,    394,   -996,      0,  0x28, 0x00, 0x88, 0xFF

bowser_3_seg7_dl_070031E8: # 0x070031E8 - 0x07003258
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bowser_3_seg7_texture_07000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight bowser_3_seg7_light_07003020, 1
gsSPLight bowser_3_seg7_light_07003018, 2
gsSPVertex bowser_3_seg7_vertex_07003048, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPLight bowser_3_seg7_light_07003038, 1
gsSPLight bowser_3_seg7_light_07003030, 2
gsSPVertex bowser_3_seg7_vertex_070030A8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

bowser_3_seg7_dl_07003258: # 0x07003258 - 0x070032C0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bowser_3_seg7_texture_07001000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex bowser_3_seg7_vertex_070030E8, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 12, 14, 13, 0x0,  0, 15,  1, 0x0
gsSPEndDisplayList

glabel bowser_3_seg7_dl_070032C0 # 0x070032C0 - 0x07003350
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bowser_3_seg7_dl_070031E8
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList bowser_3_seg7_dl_07003258
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
