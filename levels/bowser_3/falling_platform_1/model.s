bowser_3_seg7_light_07002000: # 0x07002000 - 0x07002008
.byte 0x22, 0x22, 0x22, 0x00, 0x22, 0x22, 0x22, 0x00

bowser_3_seg7_light_07002008: # 0x07002008 - 0x07002018
.byte 0x89, 0x89, 0x8A, 0x00, 0x89, 0x89, 0x8A, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bowser_3_seg7_light_07002018: # 0x07002018 - 0x07002020
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

bowser_3_seg7_light_07002020: # 0x07002020 - 0x07002030
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bowser_3_seg7_vertex_07002030: # 0x07002030 - 0x07002090
vertex  -1945,  -1340,  -2661,   5282,    786,  0xC4, 0x99, 0xD7, 0xFF
vertex  -2364,  -1852,   -787,   3412,   1202,  0xC4, 0x99, 0xD7, 0xFF
vertex  -3071,  -1340,  -1023,   3648,   1908,  0xC4, 0x99, 0xD7, 0xFF
vertex  -1945,  -1340,  -2661,   5282,    786,  0xD6, 0x90, 0xD8, 0xFF
vertex   -787,  -2364,  -1024,   3648,   -370,  0xD6, 0x90, 0xD8, 0xFF
vertex  -2364,  -1852,   -787,   3412,   1202,  0xD6, 0x90, 0xD8, 0xFF

bowser_3_seg7_vertex_07002090: # 0x07002090 - 0x070020D0
vertex  -3071,    307,  -1023,  -1052,  -1872,  0x00, 0x7F, 0x00, 0xFF
vertex   -787,    307,  -1024,    466,  -1872,  0x00, 0x7F, 0x00, 0xFF
vertex  -1945,    307,  -2661,   -302,  -2962,  0x00, 0x7F, 0x00, 0xFF
vertex  -2364,    307,   -787,   -582,  -1714,  0x00, 0x7F, 0x00, 0xFF

bowser_3_seg7_vertex_070020D0: # 0x070020D0 - 0x070021D0
vertex  -1945,  -1340,  -2661,    990,   2012,  0x67, 0x00, 0xB7, 0xFF
vertex  -1945,    307,  -2661,    990,      0,  0x67, 0x00, 0xB7, 0xFF
vertex   -787,  -2364,  -1024,  -1010,   2012,  0x67, 0x00, 0xB7, 0xFF
vertex  -2364,    307,   -787,    494,      0,  0xD8, 0x00, 0x78, 0xFF
vertex  -3071,    307,  -1023,    990,      0,  0xD8, 0x00, 0x78, 0xFF
vertex  -3071,  -1340,  -1023,    990,   2012,  0xD8, 0x00, 0x78, 0xFF
vertex  -2364,  -1852,   -787,    494,   2012,  0xD8, 0x00, 0x78, 0xFF
vertex   -787,  -2364,  -1024,   -504,   2012,  0x12, 0x00, 0x7D, 0xFF
vertex   -787,    307,  -1024,   -506,      0,  0x12, 0x00, 0x7D, 0xFF
vertex  -2364,  -1852,   -787,   1048,   2012,  0x12, 0x00, 0x7D, 0xFF
vertex  -2364,    307,   -787,   1046,      0,  0x12, 0x00, 0x7D, 0xFF
vertex  -3071,  -1340,  -1023,  14512,   1816,  0x98, 0x00, 0xB9, 0xFF
vertex  -3071,    307,  -1023,  14512,    172,  0x98, 0x00, 0xB9, 0xFF
vertex  -1945,  -1340,  -2661,  13006,   1816,  0x98, 0x00, 0xB9, 0xFF
vertex  -1945,    307,  -2661,  13006,    172,  0x98, 0x00, 0xB9, 0xFF
vertex   -787,    307,  -1024,  -1010,      0,  0x67, 0x00, 0xB7, 0xFF

bowser_3_seg7_dl_070021D0: # 0x070021D0 - 0x07002240
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bowser_3_seg7_texture_07000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight bowser_3_seg7_light_07002008, 1
gsSPLight bowser_3_seg7_light_07002000, 2
gsSPVertex bowser_3_seg7_vertex_07002030, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPLight bowser_3_seg7_light_07002020, 1
gsSPLight bowser_3_seg7_light_07002018, 2
gsSPVertex bowser_3_seg7_vertex_07002090, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

bowser_3_seg7_dl_07002240: # 0x07002240 - 0x070022A8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bowser_3_seg7_texture_07001000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex bowser_3_seg7_vertex_070020D0, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  8, 10,  9, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 12, 14, 13, 0x0,  1, 15,  2, 0x0
gsSPEndDisplayList

glabel bowser_3_seg7_dl_070022A8 # 0x070022A8 - 0x07002338
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bowser_3_seg7_dl_070021D0
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList bowser_3_seg7_dl_07002240
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
