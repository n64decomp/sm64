bowser_3_seg7_light_070039C0: # 0x070039C0 - 0x070039C8
.byte 0x22, 0x22, 0x22, 0x00, 0x22, 0x22, 0x22, 0x00

bowser_3_seg7_light_070039C8: # 0x070039C8 - 0x070039D8
.byte 0x89, 0x89, 0x8A, 0x00, 0x89, 0x89, 0x8A, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bowser_3_seg7_light_070039D8: # 0x070039D8 - 0x070039E0
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

bowser_3_seg7_light_070039E0: # 0x070039E0 - 0x070039F0
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bowser_3_seg7_vertex_070039F0: # 0x070039F0 - 0x07003A50
vertex    788,  -2364,  -1024,   3648,  -1944,  0x19, 0x90, 0xCC, 0xFF
vertex      0,  -1852,  -2522,   5144,  -1156,  0x19, 0x90, 0xCC, 0xFF
vertex   1946,  -1340,  -2661,   5282,  -3098,  0x19, 0x90, 0xCC, 0xFF
vertex      0,  -1852,  -2522,   5144,  -1156,  0x16, 0x99, 0xBA, 0xFF
vertex      0,  -1340,  -3276,   5896,  -1156,  0x16, 0x99, 0xBA, 0xFF
vertex   1946,  -1340,  -2661,   5282,  -3098,  0x16, 0x99, 0xBA, 0xFF

bowser_3_seg7_vertex_07003A50: # 0x07003A50 - 0x07003A90
vertex      0,    307,  -3276,    990,  -3370,  0x00, 0x7F, 0x00, 0xFF
vertex      0,    307,  -2522,    990,  -2870,  0x00, 0x7F, 0x00, 0xFF
vertex    788,    307,  -1024,   1514,  -1872,  0x00, 0x7F, 0x00, 0xFF
vertex   1946,    307,  -2661,   2284,  -2962,  0x00, 0x7F, 0x00, 0xFF

bowser_3_seg7_vertex_07003A90: # 0x07003A90 - 0x07003B90
vertex   1946,  -1340,  -2661,    990,   2012,  0x67, 0x00, 0x49, 0xFF
vertex    788,    307,  -1024,  -1010,      0,  0x67, 0x00, 0x49, 0xFF
vertex    788,  -2364,  -1024,  -1010,   2012,  0x67, 0x00, 0x49, 0xFF
vertex      0,    307,  -3276,    990,      0,  0x81, 0x00, 0x00, 0xFF
vertex      0,  -1340,  -3276,    990,   2012,  0x81, 0x00, 0x00, 0xFF
vertex      0,  -1852,  -2522,    238,   2012,  0x81, 0x00, 0x00, 0xFF
vertex      0,    307,  -2522,    238,      0,  0x81, 0x00, 0x00, 0xFF
vertex    788,    307,  -1024,   -698,      0,  0x90, 0x00, 0x3B, 0xFF
vertex      0,    307,  -2522,    990,      0,  0x90, 0x00, 0x3B, 0xFF
vertex      0,  -1852,  -2522,    990,   2012,  0x90, 0x00, 0x3B, 0xFF
vertex    788,  -2364,  -1024,   -698,   2012,  0x90, 0x00, 0x3B, 0xFF
vertex      0,  -1340,  -3276,  -1044,   2012,  0x26, 0x00, 0x87, 0xFF
vertex   1946,    307,  -2661,    990,      0,  0x26, 0x00, 0x87, 0xFF
vertex   1946,  -1340,  -2661,    990,   2012,  0x26, 0x00, 0x87, 0xFF
vertex      0,    307,  -3276,  -1044,      0,  0x26, 0x00, 0x87, 0xFF
vertex   1946,    307,  -2661,    990,      0,  0x67, 0x00, 0x49, 0xFF

bowser_3_seg7_dl_07003B90: # 0x07003B90 - 0x07003C00
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bowser_3_seg7_texture_07000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight bowser_3_seg7_light_070039C8, 1
gsSPLight bowser_3_seg7_light_070039C0, 2
gsSPVertex bowser_3_seg7_vertex_070039F0, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPLight bowser_3_seg7_light_070039E0, 1
gsSPLight bowser_3_seg7_light_070039D8, 2
gsSPVertex bowser_3_seg7_vertex_07003A50, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

bowser_3_seg7_dl_07003C00: # 0x07003C00 - 0x07003C68
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bowser_3_seg7_texture_07001000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex bowser_3_seg7_vertex_07003A90, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  3,  5, 0x0,  7,  8,  9, 0x0
gsSP2Triangles 10,  7,  9, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0,  0, 15,  1, 0x0
gsSPEndDisplayList

glabel bowser_3_seg7_dl_07003C68 # 0x07003C68 - 0x07003CF8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bowser_3_seg7_dl_07003B90
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList bowser_3_seg7_dl_07003C00
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
