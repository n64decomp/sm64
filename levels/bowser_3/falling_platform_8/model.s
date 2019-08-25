bowser_3_seg7_light_07003688: # 0x07003688 - 0x07003690
.byte 0x22, 0x22, 0x22, 0x00, 0x22, 0x22, 0x22, 0x00

bowser_3_seg7_light_07003690: # 0x07003690 - 0x070036A0
.byte 0x89, 0x89, 0x8A, 0x00, 0x89, 0x89, 0x8A, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bowser_3_seg7_light_070036A0: # 0x070036A0 - 0x070036A8
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

bowser_3_seg7_light_070036A8: # 0x070036A8 - 0x070036B8
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bowser_3_seg7_vertex_070036B8: # 0x070036B8 - 0x07003718
vertex   2365,  -1852,   -787,   3412,  -3518,  0x3C, 0x99, 0xD7, 0xFF
vertex   1946,  -1340,  -2661,   5282,  -3098,  0x3C, 0x99, 0xD7, 0xFF
vertex   3072,  -1340,  -1023,   3648,  -4222,  0x3C, 0x99, 0xD7, 0xFF
vertex   2365,  -1852,   -787,   3412,  -3518,  0x2A, 0x90, 0xD8, 0xFF
vertex    788,  -2364,  -1024,   3648,  -1944,  0x2A, 0x90, 0xD8, 0xFF
vertex   1946,  -1340,  -2661,   5282,  -3098,  0x2A, 0x90, 0xD8, 0xFF

bowser_3_seg7_vertex_07003718: # 0x07003718 - 0x07003758
vertex    788,    307,  -1024,   1514,  -1872,  0x00, 0x7F, 0x00, 0xFF
vertex   3072,    307,  -1023,   3034,  -1872,  0x00, 0x7F, 0x00, 0xFF
vertex   1946,    307,  -2661,   2284,  -2962,  0x00, 0x7F, 0x00, 0xFF
vertex   2365,    307,   -787,   2564,  -1714,  0x00, 0x7F, 0x00, 0xFF

bowser_3_seg7_vertex_07003758: # 0x07003758 - 0x07003858
vertex    788,  -2364,  -1024,  -1010,   2012,  0x99, 0x00, 0xB7, 0xFF
vertex   1946,    307,  -2661,    990,      0,  0x99, 0x00, 0xB7, 0xFF
vertex   1946,  -1340,  -2661,    990,   2012,  0x99, 0x00, 0xB7, 0xFF
vertex   1946,  -1340,  -2661,   9926,   1816,  0x68, 0x00, 0xB9, 0xFF
vertex   1946,    307,  -2661,   9926,    172,  0x68, 0x00, 0xB9, 0xFF
vertex   3072,    307,  -1023,   8418,    172,  0x68, 0x00, 0xB9, 0xFF
vertex   3072,  -1340,  -1023,   8418,   1816,  0x68, 0x00, 0xB9, 0xFF
vertex   3072,  -1340,  -1023,    990,   2012,  0x28, 0x00, 0x78, 0xFF
vertex   2365,    307,   -787,    246,      0,  0x28, 0x00, 0x78, 0xFF
vertex   2365,  -1852,   -787,    246,   2012,  0x28, 0x00, 0x78, 0xFF
vertex   3072,    307,  -1023,    990,      0,  0x28, 0x00, 0x78, 0xFF
vertex   2365,    307,   -787,    990,      0,  0xEE, 0x00, 0x7D, 0xFF
vertex    788,    307,  -1024,   -600,      0,  0xEE, 0x00, 0x7D, 0xFF
vertex   2365,  -1852,   -787,    990,   2012,  0xEE, 0x00, 0x7D, 0xFF
vertex    788,  -2364,  -1024,   -600,   2012,  0xEE, 0x00, 0x7D, 0xFF
vertex    788,    307,  -1024,  -1010,      0,  0x99, 0x00, 0xB7, 0xFF

bowser_3_seg7_dl_07003858: # 0x07003858 - 0x070038C8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bowser_3_seg7_texture_07000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight bowser_3_seg7_light_07003690, 1
gsSPLight bowser_3_seg7_light_07003688, 2
gsSPVertex bowser_3_seg7_vertex_070036B8, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPLight bowser_3_seg7_light_070036A8, 1
gsSPLight bowser_3_seg7_light_070036A0, 2
gsSPVertex bowser_3_seg7_vertex_07003718, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

bowser_3_seg7_dl_070038C8: # 0x070038C8 - 0x07003930
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bowser_3_seg7_texture_07001000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex bowser_3_seg7_vertex_07003758, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 12, 14, 13, 0x0,  0, 15,  1, 0x0
gsSPEndDisplayList

glabel bowser_3_seg7_dl_07003930 # 0x07003930 - 0x070039C0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bowser_3_seg7_dl_07003858
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList bowser_3_seg7_dl_070038C8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
