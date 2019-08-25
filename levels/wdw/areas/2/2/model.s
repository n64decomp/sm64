wdw_seg7_light_07011F58: # 0x07011F58 - 0x07011F60
.byte 0x54, 0x90, 0x88, 0x00, 0x54, 0x90, 0x88, 0x00

wdw_seg7_light_07011F60: # 0x07011F60 - 0x07011F70
.byte 0x8D, 0xF0, 0xE3, 0x00, 0x8D, 0xF0, 0xE3, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

wdw_seg7_light_07011F70: # 0x07011F70 - 0x07011F78
.byte 0x56, 0x57, 0x8E, 0x00, 0x56, 0x57, 0x8E, 0x00

wdw_seg7_light_07011F78: # 0x07011F78 - 0x07011F88
.byte 0x90, 0x92, 0xEE, 0x00, 0x90, 0x92, 0xEE, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

wdw_seg7_light_07011F88: # 0x07011F88 - 0x07011F90
.byte 0x99, 0x99, 0x99, 0x00, 0x99, 0x99, 0x99, 0x00

wdw_seg7_light_07011F90: # 0x07011F90 - 0x07011FA0
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

wdw_seg7_vertex_07011FA0: # 0x07011FA0 - 0x07012020
vertex  -3800,   -827,  -1586,   -584,    320,  0x00, 0x00, 0x7F, 0xFF
vertex  -3800,  -1219,  -1586,   -584,   1100,  0x00, 0x00, 0x7F, 0xFF
vertex  -3523,  -1496,  -1586,      0,   1654,  0x00, 0x00, 0x7F, 0xFF
vertex  -3131,  -1496,  -1586,    750,   1654,  0x00, 0x00, 0x7F, 0xFF
vertex  -2854,  -1219,  -1586,   1304,   1100,  0x00, 0x00, 0x7F, 0xFF
vertex  -2854,   -827,  -1586,   1304,    320,  0x00, 0x00, 0x7F, 0xFF
vertex  -2928,   -753,  -1586,   1156,    172,  0x00, 0x00, 0x7F, 0xFF
vertex  -3726,   -753,  -1586,   -436,    172,  0x00, 0x00, 0x7F, 0xFF

wdw_seg7_vertex_07012020: # 0x07012020 - 0x070120A0
vertex  -3800,   -827,  -2738,   1304,   1100,  0x00, 0x00, 0x7F, 0xFF
vertex  -3800,  -1219,  -2738,   1304,    320,  0x00, 0x00, 0x7F, 0xFF
vertex  -3726,  -1293,  -2738,   1156,    172,  0x00, 0x00, 0x7F, 0xFF
vertex  -2928,  -1293,  -2738,   -436,    172,  0x00, 0x00, 0x7F, 0xFF
vertex  -2854,  -1219,  -2738,   -584,    320,  0x00, 0x00, 0x7F, 0xFF
vertex  -2854,   -827,  -2738,   -584,   1100,  0x00, 0x00, 0x7F, 0xFF
vertex  -3131,   -550,  -2738,      0,   1654,  0x00, 0x00, 0x7F, 0xFF
vertex  -3523,   -550,  -2738,    750,   1654,  0x00, 0x00, 0x7F, 0xFF

wdw_seg7_vertex_070120A0: # 0x070120A0 - 0x07012160
vertex   1192,  -2559,   3460,   1238,    990,  0xA7, 0x00, 0xA7, 0xFF
vertex   1662,   -511,   2990,      0,  -3098,  0xA7, 0x00, 0xA7, 0xFF
vertex   1662,  -2559,   2990,      0,    990,  0xA7, 0x00, 0xA7, 0xFF
vertex   1662,  -2559,   2990,      0,    990,  0xE0, 0x00, 0x86, 0xFF
vertex   1662,   -511,   2990,      0,  -3098,  0xE0, 0x00, 0x86, 0xFF
vertex   2304,   -511,   2818,  -1130,  -3098,  0xE0, 0x00, 0x86, 0xFF
vertex   2304,  -2559,   2818,  -1130,    990,  0xE0, 0x00, 0x86, 0xFF
vertex   1192,   -511,   3460,   1238,  -3098,  0xA7, 0x00, 0xA7, 0xFF
vertex   1024,  -2559,   3840,   2338,    990,  0x8C, 0x00, 0xCD, 0xFF
vertex   1192,   -511,   3460,   1238,  -3098,  0x8C, 0x00, 0xCD, 0xFF
vertex   1192,  -2559,   3460,   1238,    990,  0x8C, 0x00, 0xCD, 0xFF
vertex   1024,   -511,   3840,   2338,  -3098,  0x8C, 0x00, 0xCD, 0xFF

wdw_seg7_dl_07012160: # 0x07012160 - 0x07012258
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09000000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight wdw_seg7_light_07011F60, 1
gsSPLight wdw_seg7_light_07011F58, 2
gsSPVertex wdw_seg7_vertex_07011FA0, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  0,  3,  4, 0x0,  0,  5,  6, 0x0
gsSP2Triangles  0,  6,  7, 0x0,  0,  4,  5, 0x0
gsSPLight wdw_seg7_light_07011F78, 1
gsSPLight wdw_seg7_light_07011F70, 2
gsSPVertex wdw_seg7_vertex_07012020, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  4, 0x0
gsSP2Triangles  0,  4,  5, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  0,  5,  6, 0x0,  0,  6,  7, 0x0
gsSPLight wdw_seg7_light_07011F90, 1
gsSPLight wdw_seg7_light_07011F88, 2
gsSPVertex wdw_seg7_vertex_070120A0, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  0,  7,  1, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSPEndDisplayList

glabel wdw_seg7_dl_07012258 # 0x07012258 - 0x070122C8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList wdw_seg7_dl_07012160
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsSPEndDisplayList
