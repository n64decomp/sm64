ttm_seg7_light_0700B130: # 0x0700B130 - 0x0700B138
.byte 0x4C, 0x4C, 0x4C, 0x00, 0x4C, 0x4C, 0x4C, 0x00

ttm_seg7_light_0700B138: # 0x0700B138 - 0x0700B148
.byte 0x99, 0x99, 0x99, 0x00, 0x99, 0x99, 0x99, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ttm_seg7_vertex_0700B148: # 0x0700B148 - 0x0700B248
vertex    189,   1503,   -188,    114,   1692,  0x4B, 0x00, 0x9B, 0xFF
vertex    288,   1603,    -23,    404,   1134,  0x76, 0x2A, 0xEF, 0xFF
vertex    288,   1503,    -23,    114,   1134,  0x7D, 0x00, 0xEE, 0xFF
vertex    189,   1604,   -188,    406,   1692,  0x3A, 0x51, 0xB2, 0xFF
vertex   -161,   1503,   -136,    810,    684,  0x9B, 0x00, 0xB5, 0xFF
vertex      3,   1604,   -235,    534,    478,  0xEE, 0x2A, 0x8A, 0xFF
vertex      3,   1503,   -235,    534,    682,  0xEE, 0x00, 0x83, 0xFF
vertex   -161,   1604,   -136,    810,    480,  0xAF, 0x4D, 0xC4, 0xFF
vertex    189,   1503,   -188,    142,    684,  0x4B, 0x00, 0x9B, 0xFF
vertex    189,   1604,   -188,    142,    480,  0x3A, 0x51, 0xB2, 0xFF
vertex   -144,   1653,     45,   -110,    234,  0xD4, 0x76, 0x06, 0xFF
vertex   -208,   1606,     49,     18,    292,  0x89, 0x26, 0x11, 0xFF
vertex   -109,   1606,    214,    174,   -216,  0xC7, 0x3E, 0x5D, 0xFF
vertex   -161,   1604,   -136,   -130,    802,  0xAF, 0x4D, 0xC4, 0xFF
vertex   -161,   1503,   -136,    156,    890,  0x9B, 0x00, 0xB5, 0xFF
vertex   -208,   1503,     49,    312,    382,  0x83, 0x00, 0x12, 0xFF

ttm_seg7_vertex_0700B248: # 0x0700B248 - 0x0700B338
vertex   -109,   1503,    214,    468,   -126,  0xA8, 0x00, 0x5A, 0xFF
vertex   -208,   1606,     49,     18,    292,  0x89, 0x26, 0x11, 0xFF
vertex   -208,   1503,     49,    312,    382,  0x83, 0x00, 0x12, 0xFF
vertex   -109,   1606,    214,    174,   -216,  0xC7, 0x3E, 0x5D, 0xFF
vertex    241,   1503,    162,   1068,    752,  0x6F, 0x00, 0x3D, 0xFF
vertex    241,   1605,    162,   1068,    480,  0x50, 0x42, 0x48, 0xFF
vertex     76,   1503,    261,    586,    752,  0x12, 0x00, 0x7D, 0xFF
vertex     76,   1605,    261,    586,    480,  0x0F, 0x3B, 0x6E, 0xFF
vertex   -109,   1606,    214,    104,    480,  0xC7, 0x3E, 0x5D, 0xFF
vertex   -109,   1503,    214,    104,    752,  0xA8, 0x00, 0x5A, 0xFF
vertex    206,   1653,     -5,    346,   -154,  0x27, 0x78, 0xFB, 0xFF
vertex    241,   1605,    162,   -102,     68,  0x50, 0x42, 0x48, 0xFF
vertex    288,   1603,    -23,    454,     74,  0x76, 0x2A, 0xEF, 0xFF
vertex    241,   1503,    162,   -104,    332,  0x6F, 0x00, 0x3D, 0xFF
vertex    288,   1503,    -23,    454,    332,  0x7D, 0x00, 0xEE, 0xFF

ttm_seg7_vertex_0700B338: # 0x0700B338 - 0x0700B3F8
vertex      5,   1653,   -155,    458,     40,  0xFB, 0x7A, 0xDF, 0xFF
vertex   -161,   1604,   -136,     32,     24,  0xAF, 0x4D, 0xC4, 0xFF
vertex   -144,   1653,     45,      8,    492,  0xD4, 0x76, 0x06, 0xFF
vertex    189,   1604,   -188,    936,     24,  0x3A, 0x51, 0xB2, 0xFF
vertex      3,   1604,   -235,    484,   -162,  0xEE, 0x2A, 0x8A, 0xFF
vertex    206,   1653,     -5,    910,    492,  0x27, 0x78, 0xFB, 0xFF
vertex     57,   1653,    195,    458,    942,  0x04, 0x79, 0x24, 0xFF
vertex   -109,   1606,    214,     32,    928,  0xC7, 0x3E, 0x5D, 0xFF
vertex   -208,   1606,     49,   -154,    476,  0x89, 0x26, 0x11, 0xFF
vertex     76,   1605,    261,    484,   1112,  0x0F, 0x3B, 0x6E, 0xFF
vertex    241,   1605,    162,    936,    928,  0x50, 0x42, 0x48, 0xFF
vertex    288,   1603,    -23,   1122,    476,  0x76, 0x2A, 0xEF, 0xFF

ttm_seg7_dl_0700B3F8: # 0x0700B3F8 - 0x0700B530
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mountain_09004800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ttm_seg7_light_0700B138, 1
gsSPLight ttm_seg7_light_0700B130, 2
gsSPVertex ttm_seg7_vertex_0700B148, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  5,  8,  6, 0x0,  5,  9,  8, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 11, 13, 14, 0x0
gsSP1Triangle 11, 14, 15, 0x0
gsSPVertex ttm_seg7_vertex_0700B248, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  5,  7,  6, 0x0
gsSP2Triangles  6,  8,  9, 0x0,  6,  7,  8, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 12, 13, 14, 0x0
gsSP1Triangle 12, 11, 13, 0x0
gsSPVertex ttm_seg7_vertex_0700B338, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  4, 0x0
gsSP2Triangles  5,  3,  0, 0x0,  0,  6,  5, 0x0
gsSP2Triangles  0,  2,  6, 0x0,  0,  4,  1, 0x0
gsSP2Triangles  2,  7,  6, 0x0,  2,  1,  8, 0x0
gsSP2Triangles  6,  9, 10, 0x0,  6, 10,  5, 0x0
gsSP2Triangles  6,  7,  9, 0x0,  5, 11,  3, 0x0
gsSPEndDisplayList

glabel ttm_seg7_dl_0700B530 # 0x0700B530 - 0x0700B590
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ttm_seg7_dl_0700B3F8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
