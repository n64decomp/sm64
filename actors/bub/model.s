# Bub

bub_seg6_light_0600E278: # 0x0600E278
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

bub_seg6_light_0600E280: # 0x0600E280
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bub_seg6_light_0600E290: # 0x0600E290
.byte 0x3F, 0x1D, 0x25, 0x00, 0x3F, 0x1D, 0x25, 0x00

bub_seg6_light_0600E298: # 0x0600E298
.byte 0xFF, 0x75, 0x94, 0x00, 0xFF, 0x75, 0x94, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bub_seg6_texture_0600E2A8: # 0x0600E2A8
.incbin "actors/bub/bub_eye_border.rgba16"

bub_seg6_texture_0600EAA8: # 0x0600EAA8
.incbin "actors/bub/bub_fins.rgba16"

bub_seg6_texture_0600F2A8: # 0x0600F2A8
.incbin "actors/bub/bub_eyes.rgba16"

bub_seg6_texture_060102A8: # 0x060102A8
.incbin "actors/bub/bub_scales.rgba16"

bub_seg6_vertex_060112A8: # 0x060112A8
vertex    -47,     79,     27,     26,    980,  0x00, 0x6B, 0x43, 0xFF
vertex    -94,     80,     38,    928,    968,  0xF7, 0x73, 0x33, 0xFF
vertex    -53,      0,     91,    132,    102,  0x10, 0x01, 0x7D, 0xFF
vertex   -111,     38,    102,   1338,    362,  0xA2, 0x33, 0x43, 0xFF
vertex   -111,    -41,    102,   -428,    296,  0xA4, 0xCA, 0x43, 0xFF
vertex    -92,    -82,     38,    -40,    958,  0xF9, 0x8D, 0x33, 0xFF
vertex    -53,      0,     91,    910,     -4,  0x10, 0x01, 0x7D, 0xFF
vertex    -45,    -81,     27,    940,    960,  0x00, 0x95, 0x43, 0xFF
vertex   -100,    -71,    -23,    302,     68,  0x9F, 0xAF, 0x00, 0xFF
vertex    -45,    -81,     27,    926,    956,  0x00, 0x95, 0x43, 0xFF
vertex    -92,    -82,     38,      4,    956,  0xF9, 0x8D, 0x33, 0xFF
vertex   -111,    -41,    102,    -54,    146,  0xA4, 0xCA, 0x43, 0xFF
vertex    -53,      0,     91,    664,    466,  0x10, 0x01, 0x7D, 0xFF
vertex   -111,     38,    102,    -12,    790,  0xA2, 0x33, 0x43, 0xFF

bub_seg6_vertex_06011388: # 0x06011388
vertex   -102,     68,    -23,    688,     60,  0x9E, 0x4F, 0x00, 0xFF
vertex    -94,     80,     38,    960,    960,  0xF7, 0x73, 0x33, 0xFF
vertex    -47,     79,     27,     16,    968,  0x00, 0x6B, 0x43, 0xFF

bub_seg6_vertex_060113B8: # 0x060113B8
vertex    -17,    -15,     85,    426,   1050,  0xFD, 0x8E, 0x35, 0xFF
vertex     93,      0,     75,   2024,   1040,  0x38, 0x00, 0x71, 0xFF
vertex     30,      0,    126,   1056,   1694,  0x3C, 0x02, 0x6F, 0xFF
vertex    -46,      0,    152,    -72,   1972,  0xA7, 0x04, 0x5A, 0xFF
vertex    -53,      0,     91,    -86,   1094,  0x10, 0x01, 0x7D, 0xFF
vertex    -17,     13,     85,    422,   1050,  0xFE, 0x73, 0x34, 0xFF

bub_seg6_vertex_06011418: # 0x06011418
vertex   -100,    -71,    -23,   2008,   1286,  0x9F, 0xAF, 0x00, 0xFF
vertex    -92,    -82,     38,   2180,    384,  0xF9, 0x8D, 0x33, 0xFF
vertex   -111,    -41,    102,   1576,   -554,  0xA4, 0xCA, 0x43, 0xFF
vertex   -102,     68,    -23,      0,   1286,  0x9E, 0x4F, 0x00, 0xFF
vertex   -111,     38,    102,    404,   -554,  0xA2, 0x33, 0x43, 0xFF
vertex    -94,     80,     38,   -200,    384,  0xF7, 0x73, 0x33, 0xFF
vertex   -113,     -1,      6,    992,    844,  0x87, 0x00, 0x26, 0xFF

bub_seg6_vertex_06011488: # 0x06011488
vertex     69,     68,     18,   1976,   -164,  0x3A, 0x6A, 0x24, 0xFF
vertex     63,     77,    -64,   1872,   1220,  0x35, 0x55, 0xB3, 0xFF
vertex    -62,    106,    -67,   -288,   1334,  0xE7, 0x7B, 0xF2, 0xFF
vertex    134,      0,     22,   3456,     86,  0x77, 0x00, 0x2A, 0xFF
vertex     93,      0,     75,   2620,   -532,  0x38, 0x00, 0x71, 0xFF
vertex     70,    -68,     18,   2152,    990,  0x3B, 0x97, 0x24, 0xFF
vertex    -17,    -15,     85,    528,   -486,  0xFD, 0x8E, 0x35, 0xFF
vertex    -45,    -81,     27,      0,    990,  0x00, 0x95, 0x43, 0xFF
vertex    -53,      0,     91,   -100,   -752,  0x10, 0x01, 0x7D, 0xFF
vertex     93,      0,     75,   2384,  -1138,  0x38, 0x00, 0x71, 0xFF
vertex    134,      0,     22,   3100,   -272,  0x77, 0x00, 0x2A, 0xFF
vertex    -47,     79,     27,    -40,   -258,  0x00, 0x6B, 0x43, 0xFF
vertex    -17,     13,     85,    456,  -1234,  0xFE, 0x73, 0x34, 0xFF
vertex    134,      0,    -17,   3104,    404,  0x7C, 0x00, 0xE7, 0xFF
vertex    -53,      0,     91,   -152,  -1316,  0x10, 0x01, 0x7D, 0xFF

bub_seg6_vertex_06011578: # 0x06011578
vertex    134,      0,    -17,   1744,   1076,  0x7C, 0x00, 0xE7, 0xFF
vertex    134,      0,     22,   1444,    174,  0x77, 0x00, 0x2A, 0xFF
vertex     70,    -68,     18,    124,    848,  0x3B, 0x97, 0x24, 0xFF
vertex    134,      0,    -17,   3680,   -186,  0x7C, 0x00, 0xE7, 0xFF
vertex     70,    -68,     18,   2148,   -526,  0x3B, 0x97, 0x24, 0xFF
vertex     64,    -77,    -64,   2176,    910,  0x36, 0xAC, 0xB3, 0xFF
vertex    -45,    -81,     27,      0,   -416,  0x00, 0x95, 0x43, 0xFF
vertex    -60,   -108,    -67,   -204,   1278,  0xE9, 0x85, 0xF2, 0xFF
vertex     64,    -77,    -64,    616,    104,  0x36, 0xAC, 0xB3, 0xFF
vertex     85,      0,    -97,   1508,    946,  0x43, 0x00, 0x95, 0xFF
vertex    134,      0,    -17,   2204,   -676,  0x7C, 0x00, 0xE7, 0xFF
vertex     63,     77,    -64,   -188,    674,  0x35, 0x55, 0xB3, 0xFF
vertex    134,      0,    -17,   1092,   -116,  0x7C, 0x00, 0xE7, 0xFF
vertex     85,      0,    -97,   1016,   1428,  0x43, 0x00, 0x95, 0xFF

bub_seg6_vertex_06011658: # 0x06011658
vertex    -60,   -108,    -67,   1920,    450,  0xE9, 0x85, 0xF2, 0xFF
vertex    -45,    -81,     27,   2056,  -1674,  0x00, 0x95, 0x43, 0xFF
vertex   -100,    -71,    -23,    852,   -280,  0x9F, 0xAF, 0x00, 0xFF
vertex   -102,     68,    -23,    700,   -344,  0x9E, 0x4F, 0x00, 0xFF
vertex    -47,     79,     27,   1968,  -1410,  0x00, 0x6B, 0x43, 0xFF
vertex    -62,    106,    -67,   1876,    472,  0xE7, 0x7B, 0xF2, 0xFF
vertex     63,     77,    -64,   1884,    272,  0x35, 0x55, 0xB3, 0xFF
vertex    -77,     71,    -91,   -540,   1024,  0xC0, 0x30, 0x9E, 0xFF
vertex    -62,    106,    -67,   -288,    328,  0xE7, 0x7B, 0xF2, 0xFF
vertex    -60,   -108,    -67,   -228,   -428,  0xE9, 0x85, 0xF2, 0xFF
vertex    -76,    -73,    -91,   -344,    416,  0xC1, 0xCF, 0x9E, 0xFF
vertex     64,    -77,    -64,   2188,   -424,  0x36, 0xAC, 0xB3, 0xFF

bub_seg6_vertex_06011718: # 0x06011718
vertex    -76,    -73,    -91,      0,      0,  0xC1, 0xCF, 0x9E, 0xFF
vertex   -107,     -1,    -79,      0,      0,  0x83, 0x00, 0xEF, 0xFF
vertex    -83,     -1,   -102,      0,      0,  0xCB, 0x00, 0x8D, 0xFF
vertex    -89,     -1,    -52,      0,      0,  0x8E, 0x00, 0xCA, 0xFF
vertex    -77,     71,    -91,      0,      0,  0xC0, 0x30, 0x9E, 0xFF
vertex   -138,     -1,    -51,      0,      0,  0xA1, 0x00, 0xAD, 0xFF
vertex   -102,     68,    -23,      0,      0,  0x9E, 0x4F, 0x00, 0xFF
vertex    -62,    106,    -67,      0,      0,  0xE7, 0x7B, 0xF2, 0xFF
vertex   -100,    -71,    -23,      0,      0,  0x9F, 0xAF, 0x00, 0xFF
vertex   -113,     -1,      6,      0,      0,  0x87, 0x00, 0x26, 0xFF
vertex   -147,     -1,    -24,      0,      0,  0x87, 0x00, 0x24, 0xFF
vertex    -60,   -108,    -67,      0,      0,  0xE9, 0x85, 0xF2, 0xFF

bub_seg6_vertex_060117D8: # 0x060117D8
vertex     63,     77,    -64,      0,      0,  0x35, 0x55, 0xB3, 0xFF
vertex     85,      0,    -97,      0,      0,  0x43, 0x00, 0x95, 0xFF
vertex    -24,      0,   -108,      0,      0,  0x07, 0x00, 0x82, 0xFF
vertex    -83,     -1,   -102,      0,      0,  0xCB, 0x00, 0x8D, 0xFF
vertex    -77,     71,    -91,      0,      0,  0xC0, 0x30, 0x9E, 0xFF
vertex     64,    -77,    -64,      0,      0,  0x36, 0xAC, 0xB3, 0xFF
vertex    -76,    -73,    -91,      0,      0,  0xC1, 0xCF, 0x9E, 0xFF

glabel bub_seg6_dl_06011848 # 0x06011848 - 0x060118C0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bub_seg6_texture_0600E2A8
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight bub_seg6_light_0600E280, 1
gsSPLight bub_seg6_light_0600E278, 2
gsSPVertex bub_seg6_vertex_060112A8, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  5,  7,  6, 0x0
gsSP2Triangles  8,  9, 10, 0x0, 11, 12, 13, 0x0
gsSPVertex bub_seg6_vertex_06011388, 3, 0
gsSP1Triangle  0,  1,  2, 0x0
gsSPEndDisplayList

glabel bub_seg6_dl_060118C0 # 0x060118C0 - 0x06011918
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bub_seg6_texture_0600EAA8
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bub_seg6_vertex_060113B8, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  0, 0x0
gsSP2Triangles  0,  3,  4, 0x0,  5,  2,  1, 0x0
gsSP2Triangles  5,  3,  2, 0x0,  4,  3,  5, 0x0
gsSPEndDisplayList

glabel bub_seg6_dl_06011918 # 0x06011918 - 0x06011968
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bub_seg6_texture_0600F2A8
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPVertex bub_seg6_vertex_06011418, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  4,  3,  6, 0x0,  6,  2,  4, 0x0
gsSP1Triangle  6,  0,  2, 0x0
gsSPEndDisplayList

glabel bub_seg6_dl_06011968 # 0x06011968 - 0x06011A50
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bub_seg6_texture_060102A8
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPVertex bub_seg6_vertex_06011488, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  4,  6,  7, 0x0,  7,  5,  4, 0x0
gsSP2Triangles  7,  6,  8, 0x0,  9, 10,  0, 0x0
gsSP2Triangles  9,  0, 11, 0x0, 11, 12,  9, 0x0
gsSP2Triangles 10, 13,  0, 0x0, 13,  1,  0, 0x0
gsSP2Triangles  2, 11,  0, 0x0, 11, 14, 12, 0x0
gsSPVertex bub_seg6_vertex_06011578, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  4,  6,  7, 0x0,  5,  4,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0, 11, 12, 13, 0x0
gsSPVertex bub_seg6_vertex_06011658, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSPEndDisplayList

glabel bub_seg6_dl_06011A50 # 0x06011A50 - 0x06011B28
gsSPLight bub_seg6_light_0600E298, 1
gsSPLight bub_seg6_light_0600E290, 2
gsSPVertex bub_seg6_vertex_06011718, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  1,  4,  2, 0x0,  1,  3,  4, 0x0
gsSP2Triangles  3,  5,  4, 0x0,  0,  5,  3, 0x0
gsSP2Triangles  6,  7,  4, 0x0,  4,  5,  6, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8,  5,  0, 0x0
gsSP2Triangles  0, 11,  8, 0x0,  8, 10,  5, 0x0
gsSP2Triangles  5, 10,  6, 0x0, 10,  9,  6, 0x0
gsSPLight bub_seg6_light_0600E280, 1
gsSPLight bub_seg6_light_0600E278, 2
gsSPVertex bub_seg6_vertex_060117D8, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  4, 0x0
gsSP2Triangles  2,  1,  5, 0x0,  2,  5,  6, 0x0
gsSP2Triangles  2,  6,  3, 0x0,  0,  2,  4, 0x0
gsSPEndDisplayList

glabel bub_seg6_dl_06011B28 # 0x06011B28 - 0x06011BD8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bub_seg6_dl_06011848
gsSPDisplayList bub_seg6_dl_060118C0
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList bub_seg6_dl_06011918
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList bub_seg6_dl_06011968
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPDisplayList bub_seg6_dl_06011A50
gsSPEndDisplayList

bub_seg6_vertex_06011BD8: # 0x06011BD8
vertex     45,     16,      2,    488,    418,  0x04, 0x7E, 0x00, 0xFF
vertex     61,      1,    -60,    996,    234,  0x1D, 0xFF, 0x85, 0xFF
vertex      0,      0,    -16,    634,    976,  0x91, 0xFE, 0xC4, 0xFF
vertex      0,      0,     22,    320,    974,  0x90, 0xFE, 0x3B, 0xFF
vertex     61,      1,     66,    -16,    226,  0x1E, 0xFF, 0x7B, 0xFF
vertex     81,      1,     26,    306,    -18,  0x7C, 0x00, 0x1A, 0xFF
vertex     81,      1,    -20,    682,    -16,  0x7C, 0x00, 0xE5, 0xFF
vertex     46,    -14,      2,    488,    412,  0x07, 0x82, 0x00, 0xFF

glabel bub_seg6_dl_06011C58 # 0x06011C58 - 0x06011CF0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bub_seg6_texture_0600EAA8
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight bub_seg6_light_0600E280, 1
gsSPLight bub_seg6_light_0600E278, 2
gsSPVertex bub_seg6_vertex_06011BD8, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  2, 0x0
gsSP2Triangles  4,  5,  0, 0x0,  0,  5,  6, 0x0
gsSP2Triangles  6,  1,  0, 0x0,  4,  0,  3, 0x0
gsSP2Triangles  6,  5,  7, 0x0,  5,  4,  7, 0x0
gsSP2Triangles  7,  1,  6, 0x0,  2,  7,  3, 0x0
gsSP2Triangles  3,  7,  4, 0x0,  1,  7,  2, 0x0
gsSPEndDisplayList

glabel bub_seg6_dl_06011CF0 # 0x06011CF0 - 0x06011D50
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bub_seg6_dl_06011C58
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

bub_seg6_vertex_06011D50: # 0x06011D50
vertex    113,     -7,      0,    586,    220,  0x4B, 0x9B, 0x0C, 0xFF
vertex    113,     12,      0,    584,    220,  0x33, 0x73, 0xF7, 0xFF
vertex     84,      7,     42,    120,    132,  0x37, 0x30, 0x67, 0xFF
vertex     -9,      0,      0,    182,    954,  0xB1, 0x00, 0x63, 0xFF
vertex     84,     -2,     42,    120,    132,  0x17, 0xBD, 0x69, 0xFF
vertex     69,      1,    -51,    900,    814,  0x48, 0x00, 0x98, 0xFF
vertex     18,      1,    -30,    540,    978,  0xBB, 0xFE, 0x96, 0xFF

glabel bub_seg6_dl_06011DC0 # 0x06011DC0 - 0x06011E48
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bub_seg6_texture_0600EAA8
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight bub_seg6_light_0600E280, 1
gsSPLight bub_seg6_light_0600E278, 2
gsSPVertex bub_seg6_vertex_06011D50, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  2, 0x0
gsSP2Triangles  2,  4,  0, 0x0,  3,  2,  1, 0x0
gsSP2Triangles  3,  0,  4, 0x0,  0,  5,  1, 0x0
gsSP2Triangles  6,  5,  0, 0x0,  3,  6,  0, 0x0
gsSP2Triangles  1,  5,  6, 0x0,  6,  3,  1, 0x0
gsSPEndDisplayList

glabel bub_seg6_dl_06011E48 # 0x06011E48 - 0x06011EA8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bub_seg6_dl_06011DC0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

bub_seg6_vertex_06011EA8: # 0x06011EA8
vertex    127,      8,      0,    454,    956,  0x4A, 0x65, 0x0D, 0xFF
vertex     31,      0,    -30,    138,      4,  0xBB, 0x01, 0x96, 0xFF
vertex      3,      0,      0,    518,    -40,  0xB3, 0x00, 0x64, 0xFF
vertex     82,      0,    -52,   -152,    282,  0x4A, 0x00, 0x99, 0xFF
vertex    127,    -10,      0,    454,    956,  0x34, 0x8D, 0xF8, 0xFF
vertex     97,      4,     41,    974,    972,  0x17, 0x43, 0x69, 0xFF
vertex     97,     -5,     41,    974,    972,  0x36, 0xD1, 0x68, 0xFF

glabel bub_seg6_dl_06011F18 # 0x06011F18 - 0x06011FA0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bub_seg6_texture_0600EAA8
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight bub_seg6_light_0600E280, 1
gsSPLight bub_seg6_light_0600E278, 2
gsSPVertex bub_seg6_vertex_06011EA8, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  3,  0, 0x0,  0,  5,  6, 0x0
gsSP2Triangles  5,  0,  2, 0x0,  6,  4,  0, 0x0
gsSP2Triangles  6,  5,  2, 0x0,  4,  6,  2, 0x0
gsSP2Triangles  4,  2,  1, 0x0,  1,  3,  4, 0x0
gsSPEndDisplayList

glabel bub_seg6_dl_06011FA0 # 0x06011FA0 - 0x06012000
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bub_seg6_dl_06011F18
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

bub_seg6_animvalue_06012000: # 0x06012000
.hword 0x0000, 0xFFF3, 0xFFF3, 0xFFF3, 0xFFF4, 0xFFF6, 0xFFF7, 0xFFF9
.hword 0xFFFB, 0xFFFD, 0xFFFF, 0x0001, 0x0003, 0x0005, 0x0007, 0x0009
.hword 0x000A, 0x000B, 0x000C, 0x000D, 0x000D, 0x000D, 0x000D, 0x000C
.hword 0x000B, 0x000A, 0x0009, 0x0008, 0x0006, 0x0005, 0x0003, 0x0001
.hword 0x0000, 0xFFFF, 0xFFFD, 0xFFFB, 0xFFF9, 0xFFF7, 0xFFF6, 0xFFF4
.hword 0xFFF3, 0xC001, 0x1696, 0x16AB, 0x16E5, 0x173B, 0x17A3, 0x1814
.hword 0x1886, 0x18EE, 0x1944, 0x197E, 0x1993, 0x1979, 0x1933, 0x18CD
.hword 0x1854, 0x17D5, 0x175C, 0x16F6, 0x16B0, 0x1696, 0x16A2, 0x16C5
.hword 0x16F8, 0x1736, 0x177A, 0x17BE, 0x17FC, 0x182F, 0x1853, 0x1860
.hword 0x1858, 0x1841, 0x181D, 0x17EF, 0x17BA, 0x1780, 0x1745, 0x170A
.hword 0x16D3, 0x16A2, 0x1881, 0x186A, 0x182C, 0x17D0, 0x1762, 0x16E9
.hword 0x1670, 0x1601, 0x15A6, 0x1568, 0x1551, 0x156D, 0x15B8, 0x1625
.hword 0x16A5, 0x172D, 0x17AD, 0x181A, 0x1865, 0x1881, 0x1874, 0x1851
.hword 0x181F, 0x17E1, 0x179E, 0x175B, 0x171D, 0x16EA, 0x16C7, 0x16BA
.hword 0x16C1, 0x16D9, 0x16FC, 0x172A, 0x175F, 0x1798, 0x17D3, 0x180D
.hword 0x1844, 0x1874, 0xF776, 0xF79E, 0xF80B, 0xF8AC, 0xF96F, 0xFA43
.hword 0xFB17, 0xFBDA, 0xFC7A, 0xFCE7, 0xFD0F, 0xFCDE, 0xFC5B, 0xFB9C
.hword 0xFABA, 0xF9CC, 0xF8EA, 0xF82B, 0xF7A7, 0xF776, 0xF78E, 0xF7CD
.hword 0xF82A, 0xF89C, 0xF917, 0xF993, 0xFA04, 0xFA62, 0xFAA2, 0xFABB
.hword 0xFAAC, 0xFA82, 0xFA40, 0xF9EC, 0xF98B, 0xF922, 0xF8B6, 0xF84B
.hword 0xF7E6, 0xF78E, 0xEBCF, 0xEBAF, 0xEB59, 0xEADD, 0xEA4A, 0xE9AF
.hword 0xE91B, 0xE89F, 0xE849, 0xE829, 0xE843, 0xE88A, 0xE8F3, 0xE972
.hword 0xE9FC, 0xEA86, 0xEB05, 0xEB6E, 0xEBB5, 0xEBCF, 0xEBBD, 0xEB8A
.hword 0xEB40, 0xEAE6, 0xEA83, 0xEA21, 0xE9C7, 0xE97C, 0xE949, 0xE935
.hword 0xE941, 0xE963, 0xE997, 0xE9DA, 0xEA27, 0xEA7B, 0xEAD1, 0xEB26
.hword 0xEB76, 0xEBBD, 0x1CE8, 0x1CD0, 0x1C90, 0x1C33, 0x1BC5, 0x1B51
.hword 0x1AE2, 0x1A85, 0x1A45, 0x1A2D, 0x1A41, 0x1A76, 0x1AC4, 0x1B23
.hword 0x1B8B, 0x1BF2, 0x1C51, 0x1C9F, 0x1CD5, 0x1CE8, 0x1CDB, 0x1CB7
.hword 0x1C82, 0x1C42, 0x1BFC, 0x1BB7, 0x1B76, 0x1B41, 0x1B1D, 0x1B0F
.hword 0x1B17, 0x1B2F, 0x1B54, 0x1B84, 0x1BBB, 0x1BF6, 0x1C34, 0x1C70
.hword 0x1CA9, 0x1CDB, 0x87BA, 0x8787, 0x86FE, 0x8638, 0x854D, 0x8455
.hword 0x836A, 0x82A4, 0x821B, 0x81E7, 0x8211, 0x8282, 0x8329, 0x83F4
.hword 0x84D1, 0x85AD, 0x8678, 0x871F, 0x8790, 0x87BA, 0x879D, 0x874E
.hword 0x86D9, 0x864A, 0x85AF, 0x8515, 0x8486, 0x8410, 0x83C0, 0x83A1
.hword 0x83B3, 0x83E9, 0x843B, 0x84A4, 0x851E, 0x85A2, 0x862A, 0x86B0
.hword 0x872E, 0x879D, 0x3FFF, 0xC054, 0x3FFF, 0xC054, 0xF11C, 0xF15F
.hword 0xF21D, 0xF34A, 0xF4D6, 0xF6B6, 0xF8DA, 0xFB35, 0xFDB9, 0x0057
.hword 0x0303, 0x05B0, 0x084E, 0x0AD0, 0x0D29, 0x0F49, 0x1125, 0x12AD
.hword 0x13D5, 0x148D, 0x1482, 0x1385, 0x11C5, 0x0F6F, 0x0CB2, 0x09BC
.hword 0x06BA, 0x03DA, 0x014B, 0xFF3B, 0xFD6A, 0xFB89, 0xF9A6, 0xF7D1
.hword 0xF619, 0xF48F, 0xF341, 0xF23F, 0xF199, 0xF15E, 0x421D, 0x4234
.hword 0x4271, 0x42C9, 0x432F, 0x439A, 0x43FC, 0x444C, 0x447D, 0x4484
.hword 0x4456, 0x43DD, 0x431B, 0x4223, 0x410A, 0x3FE5, 0x3EC7, 0x3DC6
.hword 0x3CF5, 0x3C69, 0x3C18, 0x3BE5, 0x3BCE, 0x3BCF, 0x3BE5, 0x3C0B
.hword 0x3C3F, 0x3C7D, 0x3CC2, 0x3D09, 0x3D5B, 0x3DC0, 0x3E34, 0x3EB5
.hword 0x3F3F, 0x3FCE, 0x405F, 0x40F0, 0x417B, 0x4200

bub_seg6_animindex_060122DC: # 0x060122DC
.hword 0x0028, 0x0001, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0029
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0028, 0x0146, 0x0001, 0x0000, 0x0001, 0x0000, 0x0028, 0x011E
.hword 0x0001, 0x011C, 0x0001, 0x0000, 0x0001, 0x011D, 0x0028, 0x002A
.hword 0x0028, 0x0052, 0x0028, 0x007A, 0x0001, 0x011A, 0x0001, 0x0000
.hword 0x0001, 0x011B, 0x0028, 0x00A2, 0x0028, 0x00CA, 0x0028, 0x00F2

bub_seg6_anim_0601233C: # 0x0601233C
.hword 0
.hword 0
.hword 0
.hword 0
.hword 0x28
.hword 0x07
.word bub_seg6_animvalue_06012000
.word bub_seg6_animindex_060122DC
.word 0

glabel bub_seg6_anims_06012354 # 0x06012354
.word bub_seg6_anim_0601233C
.word 0
.word 0
