bitdw_seg7_vertex_07009078: # 0x07009078 - 0x07009168
vertex     39,    178,    -60,    794,      0,  0xE4, 0xFF, 0xFF, 0xFF
vertex    -37,    178,    -60,    204,      0,  0xE4, 0xFF, 0xFF, 0xFF
vertex      0,    256,      0,    494,    476,  0xE4, 0xFF, 0xFF, 0xFF
vertex    -37,    178,     62,    204,    990,  0xE4, 0xFF, 0xFF, 0xFF
vertex     39,    178,     62,    794,    990,  0xE4, 0xFF, 0xFF, 0xFF
vertex      0,    256,      0,    494,    476,  0xC7, 0xEE, 0xFF, 0xFF
vertex    -66,    178,      0,    -24,    476,  0xC7, 0xEE, 0xFF, 0xFF
vertex    -37,    178,     62,    204,    990,  0xC7, 0xEE, 0xFF, 0xFF
vertex     67,    178,      0,   1010,    476,  0xC7, 0xEE, 0xFF, 0xFF
vertex     39,    178,    -60,    794,      0,  0xC7, 0xEE, 0xFF, 0xFF
vertex    -37,    178,    -60,    204,      0,  0xA0, 0xD8, 0xFF, 0xFF
vertex    -66,    178,      0,    -24,    476,  0xA0, 0xD8, 0xFF, 0xFF
vertex      0,    256,      0,    494,    476,  0xA0, 0xD8, 0xFF, 0xFF
vertex     39,    178,     62,    794,    990,  0xA0, 0xD8, 0xFF, 0xFF
vertex     67,    178,      0,   1010,    476,  0xA0, 0xD8, 0xFF, 0xFF

bitdw_seg7_vertex_07009168: # 0x07009168 - 0x07009268
vertex    -37,    178,     62,    204,    990,  0x82, 0xC2, 0xFF, 0xFF
vertex    -17,     25,     37,    356,    786,  0x82, 0xC2, 0xFF, 0xFF
vertex     20,     25,     37,    648,    786,  0x82, 0xC2, 0xFF, 0xFF
vertex     39,    178,     62,    794,    990,  0x82, 0xC2, 0xFF, 0xFF
vertex     39,    178,    -60,    794,      0,  0x82, 0xC2, 0xFF, 0xFF
vertex     20,     25,    -36,    648,    172,  0x82, 0xC2, 0xFF, 0xFF
vertex    -17,     25,    -36,    356,    172,  0x82, 0xC2, 0xFF, 0xFF
vertex    -37,    178,    -60,    204,      0,  0x82, 0xC2, 0xFF, 0xFF
vertex     39,    178,     62,    794,    990,  0x69, 0xB4, 0xFF, 0xFF
vertex     43,     25,      0,    824,    474,  0x69, 0xB4, 0xFF, 0xFF
vertex     67,    178,      0,   1010,    476,  0x69, 0xB4, 0xFF, 0xFF
vertex     20,     25,     37,    648,    786,  0x69, 0xB4, 0xFF, 0xFF
vertex    -37,    178,    -60,    204,      0,  0x69, 0xB4, 0xFF, 0xFF
vertex    -40,     25,      0,    180,    474,  0x69, 0xB4, 0xFF, 0xFF
vertex    -66,    178,      0,    -24,    476,  0x69, 0xB4, 0xFF, 0xFF
vertex    -17,     25,    -36,    356,    172,  0x69, 0xB4, 0xFF, 0xFF

bitdw_seg7_vertex_07009268: # 0x07009268 - 0x070092E8
vertex     43,     25,      0,    824,    474,  0x5F, 0x9C, 0xFF, 0xFF
vertex     20,     25,    -36,    648,    172,  0x5F, 0x9C, 0xFF, 0xFF
vertex     39,    178,    -60,    794,      0,  0x5F, 0x9C, 0xFF, 0xFF
vertex     67,    178,      0,   1010,    476,  0x5F, 0x9C, 0xFF, 0xFF
vertex    -40,     25,      0,    180,    474,  0x5F, 0x9C, 0xFF, 0xFF
vertex    -17,     25,     37,    356,    786,  0x5F, 0x9C, 0xFF, 0xFF
vertex    -37,    178,     62,    204,    990,  0x5F, 0x9C, 0xFF, 0xFF
vertex    -66,    178,      0,    -24,    476,  0x5F, 0x9C, 0xFF, 0xFF

bitdw_seg7_dl_070092E8: # 0x070092E8 - 0x070093B0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bitdw_seg7_texture_07001800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bitdw_seg7_vertex_07009078, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  4, 0x0
gsSP2Triangles  5,  6,  7, 0x0,  5,  8,  9, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 12, 13, 14, 0x0
gsSPVertex bitdw_seg7_vertex_07009168, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 15, 13, 0x0
gsSPVertex bitdw_seg7_vertex_07009268, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  2, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  7,  4,  6, 0x0
gsSPEndDisplayList

glabel bitdw_seg7_dl_070093B0 # 0x070093B0 - 0x07009430
gsDPPipeSync
gsDPSetEnvColor 255, 255, 255, 180
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bitdw_seg7_dl_070092E8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetEnvColor 255, 255, 255, 255
gsSPEndDisplayList
