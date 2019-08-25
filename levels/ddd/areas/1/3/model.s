ddd_seg7_light_07005850: # 0x07005850 - 0x07005858
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

ddd_seg7_light_07005858: # 0x07005858 - 0x07005868
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ddd_seg7_vertex_07005868: # 0x07005868 - 0x07005968
vertex      0,   2048,   2048,  10000,      0,  0x9E, 0x00, 0xB1, 0xFF
vertex  -1023,      0,   3072,   8492,    990,  0xB1, 0x00, 0x9E, 0xFF
vertex  -1023,   2048,   3072,   8492,      0,  0xBC, 0x00, 0x96, 0xFF
vertex  -3993,   2048,   3174,   5124,      0,  0x10, 0x00, 0x83, 0xFF
vertex  -5119,      0,   3072,   3904,    990,  0x27, 0x00, 0x88, 0xFF
vertex  -5119,   2048,   3072,   3904,      0,  0x43, 0x00, 0x95, 0xFF
vertex  -6143,      0,   2048,   2328,    990,  0x62, 0x00, 0xB1, 0xFF
vertex  -6143,   2048,   2048,   2328,      0,  0x6A, 0x00, 0xBC, 0xFF
vertex  -3993,      0,   3174,   5124,    990,  0x15, 0x00, 0x83, 0xFF
vertex  -6655,      0,   1024,   1088,    990,  0x7B, 0x00, 0xE4, 0xFF
vertex  -6655,   2048,   1024,   1088,      0,  0x7E, 0x00, 0x03, 0xFF
vertex  -2047,   2048,   3584,   7296,      0,  0xFF, 0x00, 0x82, 0xFF
vertex  -2047,      0,   3584,   7296,    990,  0xE2, 0x00, 0x85, 0xFF
vertex  -2047,   2048,  -3583,  17168,      0,  0xBB, 0x00, 0x6A, 0xFF
vertex  -2047,      0,  -3583,  17168,    990,  0xDE, 0x00, 0x7A, 0xFF
vertex  -1330,      0,  -2764,  16060,    990,  0xAC, 0x00, 0x5E, 0xFF

ddd_seg7_vertex_07005968: # 0x07005968 - 0x07005A68
vertex      0,   2048,   2048,  10000,      0,  0x9E, 0x00, 0xB1, 0xFF
vertex      0,      0,   2048,  10000,    990,  0x96, 0x00, 0xBC, 0xFF
vertex  -1023,      0,   3072,   8492,    990,  0xB1, 0x00, 0x9E, 0xFF
vertex    512,   2048,   1024,  11176,      0,  0x88, 0x00, 0xDA, 0xFF
vertex    512,      0,   1024,  11176,    990,  0x83, 0x00, 0xED, 0xFF
vertex    512,   2048,  -1023,  13288,      0,  0x83, 0x00, 0x13, 0xFF
vertex    512,      0,  -1023,  13288,    990,  0x88, 0x00, 0x26, 0xFF
vertex      0,   2048,  -2047,  14464,      0,  0x9D, 0x00, 0x4E, 0xFF
vertex      0,      0,  -2047,  14464,    990,  0xAF, 0x00, 0x61, 0xFF
vertex  -1330,   2048,  -2764,  16060,      0,  0xB7, 0x00, 0x67, 0xFF
vertex  -1330,      0,  -2764,  16060,    990,  0xAC, 0x00, 0x5E, 0xFF
vertex  -2047,   2048,  -3583,  17168,      0,  0xBB, 0x00, 0x6A, 0xFF
vertex  -4095,   2048,  -3583,  19336,      0,  0x13, 0x00, 0x7D, 0xFF
vertex  -2047,      0,  -3583,  17168,    990,  0xDE, 0x00, 0x7A, 0xFF
vertex  -4095,      0,  -3583,  19336,    990,  0x26, 0x00, 0x78, 0xFF
vertex  -5119,   2048,  -3071,  20560,      0,  0x44, 0x00, 0x6A, 0xFF

ddd_seg7_vertex_07005A68: # 0x07005A68 - 0x07005AF8
vertex  -5119,   2048,  -3071,  20560,      0,  0x44, 0x00, 0x6A, 0xFF
vertex  -5119,      0,  -3071,  20560,    990,  0x4F, 0x00, 0x62, 0xFF
vertex  -4095,      0,  -3583,  19336,    990,  0x26, 0x00, 0x78, 0xFF
vertex  -6143,   2048,  -2047,  22132,      0,  0x6D, 0x00, 0x40, 0xFF
vertex  -6143,      0,  -2047,  22132,    990,  0x7A, 0x00, 0x20, 0xFF
vertex  -6143,   2048,   -818,  23440,      0,  0x7E, 0x00, 0x0B, 0xFF
vertex  -6143,      0,   -818,  23440,    990,  0x7C, 0x00, 0x16, 0xFF
vertex  -6655,   2048,   1024,  25616,      0,  0x7E, 0x00, 0x03, 0xFF
vertex  -6655,      0,   1024,  25616,    990,  0x7B, 0x00, 0xE4, 0xFF

ddd_seg7_dl_07005AF8: # 0x07005AF8 - 0x07005C40
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_0900B800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPLight ddd_seg7_light_07005858, 1
gsSPLight ddd_seg7_light_07005850, 2
gsSPVertex ddd_seg7_vertex_07005868, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  5,  6,  7, 0x0,  5,  4,  6, 0x0
gsSP2Triangles  3,  8,  4, 0x0,  7,  6,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11,  8,  3, 0x0
gsSP2Triangles 11, 12,  8, 0x0,  2, 12, 11, 0x0
gsSP2Triangles  2,  1, 12, 0x0, 13, 14, 15, 0x0
gsSPVertex ddd_seg7_vertex_07005968, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  1,  0, 0x0
gsSP2Triangles  3,  4,  1, 0x0,  5,  4,  3, 0x0
gsSP2Triangles  5,  6,  4, 0x0,  7,  6,  5, 0x0
gsSP2Triangles  7,  8,  6, 0x0,  9,  8,  7, 0x0
gsSP2Triangles  9, 10,  8, 0x0, 11, 10,  9, 0x0
gsSP2Triangles 12, 13, 11, 0x0, 12, 14, 13, 0x0
gsSP1Triangle 15, 14, 12, 0x0
gsSPVertex ddd_seg7_vertex_07005A68, 9, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  1,  0, 0x0
gsSP2Triangles  3,  4,  1, 0x0,  5,  4,  3, 0x0
gsSP2Triangles  5,  6,  4, 0x0,  7,  6,  5, 0x0
gsSP1Triangle  7,  8,  6, 0x0
gsSPEndDisplayList

glabel ddd_seg7_dl_07005C40 # 0x07005C40 - 0x07005CB0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList ddd_seg7_dl_07005AF8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK
gsSPEndDisplayList
