bowser_3_seg7_light_07002670: # 0x07002670 - 0x07002678
.byte 0x22, 0x22, 0x22, 0x00, 0x22, 0x22, 0x22, 0x00

bowser_3_seg7_light_07002678: # 0x07002678 - 0x07002688
.byte 0x89, 0x89, 0x8A, 0x00, 0x89, 0x89, 0x8A, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bowser_3_seg7_light_07002688: # 0x07002688 - 0x07002690
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

bowser_3_seg7_light_07002690: # 0x07002690 - 0x070026A0
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bowser_3_seg7_vertex_070026A0: # 0x070026A0 - 0x07002700
vertex  -3071,  -1340,   1024,   1604,   1908,  0xC4, 0x99, 0x29, 0xFF
vertex  -1497,  -1852,   2050,    580,    338,  0xC4, 0x99, 0x29, 0xFF
vertex  -1945,  -1340,   2662,      0,    786,  0xC4, 0x99, 0x29, 0xFF
vertex  -3071,  -1340,   1024,   1604,   1908,  0xCC, 0x90, 0x18, 0xFF
vertex  -1182,  -2364,    394,   2232,     24,  0xCC, 0x90, 0x18, 0xFF
vertex  -1497,  -1852,   2050,    580,    338,  0xCC, 0x90, 0x18, 0xFF

bowser_3_seg7_vertex_07002700: # 0x07002700 - 0x07002740
vertex  -3071,    307,   1024,  -1052,   -508,  0x00, 0x7F, 0x00, 0xFF
vertex  -1497,    307,   2050,     -6,    174,  0x00, 0x7F, 0x00, 0xFF
vertex  -1182,    307,    394,    204,   -928,  0x00, 0x7F, 0x00, 0xFF
vertex  -1945,    307,   2662,   -302,    582,  0x00, 0x7F, 0x00, 0xFF

bowser_3_seg7_vertex_07002740: # 0x07002740 - 0x07002840
vertex  -3071,  -1340,   1024,   -996,   2012,  0xD8, 0x00, 0x88, 0xFF
vertex  -1182,    307,    394,    990,      0,  0xD8, 0x00, 0x88, 0xFF
vertex  -1182,  -2364,    394,    990,   2012,  0xD8, 0x00, 0x88, 0xFF
vertex  -1945,  -1340,   2662,   2260,   1816,  0x98, 0x00, 0x47, 0xFF
vertex  -1945,    307,   2662,   2260,    172,  0x98, 0x00, 0x47, 0xFF
vertex  -3071,    307,   1024,    754,    172,  0x98, 0x00, 0x47, 0xFF
vertex  -3071,  -1340,   1024,    754,   1816,  0x98, 0x00, 0x47, 0xFF
vertex  -1182,  -2364,    394,   -690,   2012,  0x7C, 0x00, 0x17, 0xFF
vertex  -1497,    307,   2050,    990,      0,  0x7C, 0x00, 0x17, 0xFF
vertex  -1497,  -1852,   2050,    990,   2012,  0x7C, 0x00, 0x17, 0xFF
vertex  -1182,    307,    394,   -690,      0,  0x7C, 0x00, 0x17, 0xFF
vertex  -1497,    307,   2050,    234,      0,  0x66, 0x00, 0x4B, 0xFF
vertex  -1945,  -1340,   2662,    990,   2012,  0x66, 0x00, 0x4B, 0xFF
vertex  -1497,  -1852,   2050,    234,   2012,  0x66, 0x00, 0x4B, 0xFF
vertex  -1945,    307,   2662,    990,      0,  0x66, 0x00, 0x4B, 0xFF
vertex  -3071,    307,   1024,   -996,      0,  0xD8, 0x00, 0x88, 0xFF

bowser_3_seg7_dl_07002840: # 0x07002840 - 0x070028B0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bowser_3_seg7_texture_07000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight bowser_3_seg7_light_07002678, 1
gsSPLight bowser_3_seg7_light_07002670, 2
gsSPVertex bowser_3_seg7_vertex_070026A0, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPLight bowser_3_seg7_light_07002690, 1
gsSPLight bowser_3_seg7_light_07002688, 2
gsSPVertex bowser_3_seg7_vertex_07002700, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

bowser_3_seg7_dl_070028B0: # 0x070028B0 - 0x07002918
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bowser_3_seg7_texture_07001000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex bowser_3_seg7_vertex_07002740, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0,  0, 15,  1, 0x0
gsSPEndDisplayList

glabel bowser_3_seg7_dl_07002918 # 0x07002918 - 0x070029A8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bowser_3_seg7_dl_07002840
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList bowser_3_seg7_dl_070028B0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
