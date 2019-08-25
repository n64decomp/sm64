bowser_3_seg7_light_07002338: # 0x07002338 - 0x07002340
.byte 0x22, 0x22, 0x22, 0x00, 0x22, 0x22, 0x22, 0x00

bowser_3_seg7_light_07002340: # 0x07002340 - 0x07002350
.byte 0x89, 0x89, 0x8A, 0x00, 0x89, 0x89, 0x8A, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bowser_3_seg7_light_07002350: # 0x07002350 - 0x07002358
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

bowser_3_seg7_light_07002358: # 0x07002358 - 0x07002368
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bowser_3_seg7_vertex_07002368: # 0x07002368 - 0x070023C8
vertex  -2364,  -1852,   -787,   3412,   1202,  0xB6, 0x9A, 0x00, 0xFF
vertex  -3071,  -1340,   1024,   1604,   1908,  0xB6, 0x9A, 0x00, 0xFF
vertex  -3071,  -1340,  -1023,   3648,   1908,  0xB6, 0x9A, 0x00, 0xFF
vertex  -2364,  -1852,   -787,   3412,   1202,  0xC7, 0x90, 0x09, 0xFF
vertex  -1182,  -2364,    394,   2232,     24,  0xC7, 0x90, 0x09, 0xFF
vertex  -3071,  -1340,   1024,   1604,   1908,  0xC7, 0x90, 0x09, 0xFF

bowser_3_seg7_vertex_070023C8: # 0x070023C8 - 0x07002408
vertex  -3071,    307,   1024,  -1052,   -508,  0x00, 0x7F, 0x00, 0xFF
vertex  -1182,    307,    394,    204,   -928,  0x00, 0x7F, 0x00, 0xFF
vertex  -2364,    307,   -787,   -582,  -1714,  0x00, 0x7F, 0x00, 0xFF
vertex  -3071,    307,  -1023,  -1052,  -1872,  0x00, 0x7F, 0x00, 0xFF

bowser_3_seg7_vertex_07002408: # 0x07002408 - 0x07002508
vertex  -1182,  -2364,    394,   -996,   2012,  0x28, 0x00, 0x78, 0xFF
vertex  -3071,    307,   1024,    990,      0,  0x28, 0x00, 0x78, 0xFF
vertex  -3071,  -1340,   1024,    990,   2012,  0x28, 0x00, 0x78, 0xFF
vertex  -3071,  -1340,   1024,  16084,   1816,  0x81, 0x00, 0x00, 0xFF
vertex  -3071,    307,  -1023,  14512,    172,  0x81, 0x00, 0x00, 0xFF
vertex  -3071,  -1340,  -1023,  14512,   1816,  0x81, 0x00, 0x00, 0xFF
vertex  -3071,    307,   1024,  16084,    172,  0x81, 0x00, 0x00, 0xFF
vertex  -3071,  -1340,  -1023,    990,   2012,  0x28, 0x00, 0x88, 0xFF
vertex  -3071,    307,  -1023,    990,      0,  0x28, 0x00, 0x88, 0xFF
vertex  -2364,    307,   -787,    246,      0,  0x28, 0x00, 0x88, 0xFF
vertex  -2364,  -1852,   -787,    246,   2012,  0x28, 0x00, 0x88, 0xFF
vertex  -2364,    307,   -787,   -678,      0,  0x59, 0x00, 0xA7, 0xFF
vertex  -1182,  -2364,    394,    990,   2012,  0x59, 0x00, 0xA7, 0xFF
vertex  -2364,  -1852,   -787,   -678,   2012,  0x59, 0x00, 0xA7, 0xFF
vertex  -1182,    307,    394,    990,      0,  0x59, 0x00, 0xA7, 0xFF
vertex  -1182,    307,    394,   -996,      0,  0x28, 0x00, 0x78, 0xFF

bowser_3_seg7_dl_07002508: # 0x07002508 - 0x07002578
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bowser_3_seg7_texture_07000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight bowser_3_seg7_light_07002340, 1
gsSPLight bowser_3_seg7_light_07002338, 2
gsSPVertex bowser_3_seg7_vertex_07002368, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPLight bowser_3_seg7_light_07002358, 1
gsSPLight bowser_3_seg7_light_07002350, 2
gsSPVertex bowser_3_seg7_vertex_070023C8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

bowser_3_seg7_dl_07002578: # 0x07002578 - 0x070025E0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bowser_3_seg7_texture_07001000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex bowser_3_seg7_vertex_07002408, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0,  0, 15,  1, 0x0
gsSPEndDisplayList

glabel bowser_3_seg7_dl_070025E0 # 0x070025E0 - 0x07002670
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bowser_3_seg7_dl_07002508
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList bowser_3_seg7_dl_07002578
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
