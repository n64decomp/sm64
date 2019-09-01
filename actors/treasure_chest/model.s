# Treasure Chest

treasure_chest_seg6_light_06013F90: # 0x06013F90
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

treasure_chest_seg6_light_06013F98: # 0x06013F98
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

treasure_chest_seg6_texture_06013FA8: # 0x06013FA8
.incbin "actors/treasure_chest/treasure_chest_lock.rgba16"

treasure_chest_seg6_texture_060147A8: # 0x060147A8
.incbin "actors/treasure_chest/treasure_chest_side.rgba16"

treasure_chest_seg6_texture_06014FA8: # 0x06014FA8
.incbin "actors/treasure_chest/treasure_chest_lock_top.rgba16"

treasure_chest_seg6_texture_060157A8: # 0x060157A8
.incbin "actors/treasure_chest/treasure_chest_front.rgba16"

treasure_chest_seg6_vertex_060167A8: # 0x060167A8
vertex     20,    102,     87,    990,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    -19,     72,     87,      0,    990,  0x00, 0x00, 0x7F, 0xFF
vertex     20,     72,     87,    990,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    -19,    102,     87,      0,      0,  0x00, 0x00, 0x7F, 0xFF

treasure_chest_seg6_vertex_060167E8: # 0x060167E8
vertex     20,     72,     77,    990,    990,  0x00, 0x81, 0x00, 0xFF
vertex    -19,     72,     87,      0,      0,  0x00, 0x81, 0x00, 0xFF
vertex    -19,     72,     77,      0,    990,  0x00, 0x81, 0x00, 0xFF
vertex      0,    102,     77,    478,    990,  0x00, 0x7F, 0x00, 0xFF
vertex     20,    102,     87,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex     20,    102,     77,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    -19,    102,     87,    990,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    -19,    102,     77,    990,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    -19,     72,     77,      0,    990,  0x81, 0x00, 0x00, 0xFF
vertex    -19,    102,     87,    990,      0,  0x81, 0x00, 0x00, 0xFF
vertex    -19,    102,     77,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex    -19,     72,     87,    990,    990,  0x81, 0x00, 0x00, 0xFF
vertex     20,     72,     87,    990,      0,  0x00, 0x81, 0x00, 0xFF
vertex     20,    102,     77,    990,      0,  0x7F, 0x00, 0x00, 0xFF
vertex     20,     72,     87,      0,    990,  0x7F, 0x00, 0x00, 0xFF
vertex     20,     72,     77,    990,    990,  0x7F, 0x00, 0x00, 0xFF

treasure_chest_seg6_vertex_060168E8: # 0x060168E8
vertex     20,    102,     77,    990,      0,  0x7F, 0x00, 0x00, 0xFF
vertex     20,    102,     87,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex     20,     72,     87,      0,    990,  0x7F, 0x00, 0x00, 0xFF

treasure_chest_seg6_vertex_06016918: # 0x06016918
vertex     77,    102,    -50,      0,  -1736,  0x81, 0x00, 0x00, 0xFF
vertex     77,     20,    -50,      0,    990,  0x81, 0x00, 0x00, 0xFF
vertex     77,     20,     51,   3374,    990,  0x81, 0x00, 0x00, 0xFF
vertex    -76,     20,    -50,      0,  -2416,  0x00, 0x7F, 0x00, 0xFF
vertex     77,     20,     51,   5078,    990,  0x00, 0x7F, 0x00, 0xFF
vertex     77,     20,    -50,   5078,  -2416,  0x00, 0x7F, 0x00, 0xFF
vertex    -76,     20,     51,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    -76,    102,     51,      0,  -1736,  0x7F, 0x00, 0x00, 0xFF
vertex    -76,     20,    -50,   3374,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    -76,    102,    -50,   3374,  -1736,  0x7F, 0x00, 0x00, 0xFF
vertex    -76,     20,     51,      0,    990,  0x7F, 0x00, 0x00, 0xFF
vertex     77,    102,     51,      0,  -1736,  0x00, 0x00, 0x81, 0xFF
vertex    -76,     20,     51,   5078,    990,  0x00, 0x00, 0x81, 0xFF
vertex    -76,    102,     51,   5078,  -1736,  0x00, 0x00, 0x81, 0xFF
vertex     77,     20,     51,      0,    990,  0x00, 0x00, 0x81, 0xFF

treasure_chest_seg6_vertex_06016A08: # 0x06016A08
vertex    -91,    102,    -76,   5244,    962,  0x00, 0x7F, 0x00, 0xFF
vertex    -76,    102,    -50,   4734,     46,  0x00, 0x7F, 0x00, 0xFF
vertex     77,    102,    -50,   -368,      2,  0x00, 0x7F, 0x00, 0xFF
vertex     77,    102,    -50,      0,  -1736,  0x81, 0x00, 0x00, 0xFF
vertex     77,     20,     51,   3374,    990,  0x81, 0x00, 0x00, 0xFF
vertex     77,    102,     51,   3374,  -1736,  0x81, 0x00, 0x00, 0xFF
vertex    -76,    102,    -50,      0,  -1736,  0x00, 0x00, 0x7F, 0xFF
vertex    -76,     20,    -50,      0,    990,  0x00, 0x00, 0x7F, 0xFF
vertex     77,     20,    -50,   5078,    990,  0x00, 0x00, 0x7F, 0xFF
vertex     77,    102,    -50,   5078,  -1736,  0x00, 0x00, 0x7F, 0xFF
vertex    -76,    102,    -50,   -542,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    -91,    102,    -76,  -1818,     66,  0x00, 0x7F, 0x00, 0xFF
vertex    -91,    102,     77,   5844,     66,  0x00, 0x7F, 0x00, 0xFF
vertex    -76,    102,     51,   4568,    990,  0x00, 0x7F, 0x00, 0xFF
vertex     92,    102,    -76,   -880,    908,  0x00, 0x7F, 0x00, 0xFF

treasure_chest_seg6_vertex_06016AF8: # 0x06016AF8
vertex     92,    102,    -76,   6356,    964,  0x00, 0x7F, 0x00, 0xFF
vertex     77,    102,    -50,   5078,     86,  0x00, 0x7F, 0x00, 0xFF
vertex     77,    102,     51,      0,     34,  0x00, 0x7F, 0x00, 0xFF
vertex     92,    102,     77,  -1308,    886,  0x00, 0x7F, 0x00, 0xFF
vertex     77,    102,     51,   -540,     34,  0x00, 0x7F, 0x00, 0xFF
vertex    -91,    102,     77,   7888,    946,  0x00, 0x7F, 0x00, 0xFF
vertex     92,    102,     77,  -1308,    942,  0x00, 0x7F, 0x00, 0xFF
vertex    -76,    102,     51,   7122,     38,  0x00, 0x7F, 0x00, 0xFF

treasure_chest_seg6_vertex_06016B78: # 0x06016B78
vertex     92,      0,    -68,   2012,    990,  0x7F, 0x00, 0x00, 0xFF
vertex     92,    102,      0,    152,  -2392,  0x7F, 0x00, 0x00, 0xFF
vertex     92,      0,      0,    340,    990,  0x7F, 0x00, 0x00, 0xFF
vertex     92,    102,    -76,   2012,  -2392,  0x7F, 0x00, 0x00, 0xFF
vertex     92,    102,      0,     60,  -2358,  0x7F, 0x00, 0x00, 0xFF
vertex     92,    102,     77,   1976,  -2358,  0x7F, 0x00, 0x00, 0xFF
vertex     92,      0,     69,   2012,    990,  0x7F, 0x00, 0x00, 0xFF
vertex     92,      0,      0,    288,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    -91,    102,      0,     96,  -2410,  0x81, 0x00, 0x00, 0xFF
vertex    -91,    102,    -76,   2012,  -2410,  0x81, 0x00, 0x00, 0xFF
vertex    -91,      0,    -68,   2012,    990,  0x81, 0x00, 0x00, 0xFF
vertex    -91,      0,      0,    288,    990,  0x81, 0x00, 0x00, 0xFF
vertex    -91,      0,    -68,   2012,    990,  0x00, 0xF7, 0x82, 0xFF
vertex    -91,    102,    -76,   2012,  -2416,  0x00, 0xF7, 0x82, 0xFF
vertex      0,    102,    -76,  -1664,  -2416,  0x00, 0xF7, 0x82, 0xFF
vertex      0,      0,    -68,  -1664,    990,  0x00, 0xF7, 0x82, 0xFF

treasure_chest_seg6_vertex_06016C78: # 0x06016C78
vertex     92,      0,     69,   2012,    990,  0x00, 0xF7, 0x7E, 0xFF
vertex      0,    102,     77,  -1664,  -2416,  0x00, 0xF7, 0x7E, 0xFF
vertex      0,      0,     69,  -1664,    990,  0x00, 0xF7, 0x7E, 0xFF
vertex    -91,      0,     69,   2012,    990,  0x81, 0x00, 0x00, 0xFF
vertex    -91,    102,     77,   2040,  -2428,  0x81, 0x00, 0x00, 0xFF
vertex    -91,    102,      0,    236,  -2428,  0x81, 0x00, 0x00, 0xFF
vertex    -91,      0,      0,    388,    990,  0x81, 0x00, 0x00, 0xFF
vertex      0,    102,    -76,  -1664,  -2416,  0x00, 0xF7, 0x82, 0xFF
vertex     92,    102,    -76,   2012,  -2416,  0x00, 0xF7, 0x82, 0xFF
vertex     92,      0,    -68,   2012,    990,  0x00, 0xF7, 0x82, 0xFF
vertex      0,      0,    -68,  -1664,    990,  0x00, 0xF7, 0x82, 0xFF
vertex    -91,      0,     69,   2012,    990,  0x00, 0xF7, 0x7E, 0xFF
vertex    -91,    102,     77,   2012,  -2416,  0x00, 0xF7, 0x7E, 0xFF
vertex     92,    102,     77,   2012,  -2416,  0x00, 0xF7, 0x7E, 0xFF

glabel treasure_chest_seg6_dl_06016D58 # 0x06016D58 - 0x06016DA0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, treasure_chest_seg6_texture_06013FA8
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight treasure_chest_seg6_light_06013F98, 1
gsSPLight treasure_chest_seg6_light_06013F90, 2
gsSPVertex treasure_chest_seg6_vertex_060167A8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel treasure_chest_seg6_dl_06016DA0 # 0x06016DA0 - 0x06016E18
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, treasure_chest_seg6_texture_06014FA8
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex treasure_chest_seg6_vertex_060167E8, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  3,  7,  6, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSP2Triangles  0, 12,  1, 0x0, 13, 14, 15, 0x0
gsSPVertex treasure_chest_seg6_vertex_060168E8, 3, 0
gsSP1Triangle  0,  1,  2, 0x0
gsSPEndDisplayList

glabel treasure_chest_seg6_dl_06016E18 # 0x06016E18 - 0x06016EE0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, treasure_chest_seg6_texture_060147A8
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex treasure_chest_seg6_vertex_06016918, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 14, 12, 0x0
gsSPVertex treasure_chest_seg6_vertex_06016A08, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  8,  9, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 12, 13, 0x0
gsSP1Triangle  0,  2, 14, 0x0
gsSPVertex treasure_chest_seg6_vertex_06016AF8, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

glabel treasure_chest_seg6_dl_06016EE0 # 0x06016EE0 - 0x06016F90
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, treasure_chest_seg6_texture_060157A8
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPVertex treasure_chest_seg6_vertex_06016B78, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 10, 11, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 14, 15, 0x0
gsSPVertex treasure_chest_seg6_vertex_06016C78, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0,  1, 11,  2, 0x0
gsSP2Triangles  1, 12, 11, 0x0,  0, 13,  1, 0x0
gsSPEndDisplayList

glabel treasure_chest_seg6_dl_06016F90 # 0x06016F90 - 0x06017030
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList treasure_chest_seg6_dl_06016D58
gsSPDisplayList treasure_chest_seg6_dl_06016DA0
gsSPDisplayList treasure_chest_seg6_dl_06016E18
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList treasure_chest_seg6_dl_06016EE0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

treasure_chest_seg6_vertex_06017030: # 0x06017030
vertex     92,      0,    154,      0,    990,  0x7F, 0x00, 0x00, 0xFF
vertex     92,      0,      0,   5078,    990,  0x7F, 0x00, 0x00, 0xFF
vertex     92,     30,     27,   4184,  -1022,  0x7F, 0x00, 0x00, 0xFF
vertex     92,     46,     77,   2524,  -2028,  0x7F, 0x00, 0x00, 0xFF
vertex     92,     30,    127,    862,  -1022,  0x7F, 0x00, 0x00, 0xFF
vertex    -91,     30,     27,   1310,   -988,  0x81, 0x00, 0x00, 0xFF
vertex    -91,     30,    127,   6292,   -988,  0x81, 0x00, 0x00, 0xFF
vertex    -91,     46,     77,   3800,  -1978,  0x81, 0x00, 0x00, 0xFF
vertex    -91,      0,      0,      0,    990,  0x81, 0x00, 0x00, 0xFF
vertex    -91,      0,    154,   7632,    990,  0x81, 0x00, 0x00, 0xFF
vertex    -73,     20,    127,   6100,  -2332,  0x00, 0x81, 0x00, 0xFF
vertex    -73,     20,     27,   6100,    990,  0x00, 0x81, 0x00, 0xFF
vertex     74,     20,     27,      0,    990,  0x00, 0x81, 0x00, 0xFF
vertex     74,     20,    127,      0,  -2332,  0x00, 0x81, 0x00, 0xFF

treasure_chest_seg6_vertex_06017110: # 0x06017110
vertex    -91,      0,      0,  -1564,     36,  0x00, 0x81, 0x00, 0xFF
vertex     74,      0,     15,   6714,    752,  0x00, 0x81, 0x00, 0xFF
vertex    -73,      0,     15,   -644,    752,  0x00, 0x81, 0x00, 0xFF
vertex    -91,      0,      0,   6180,     34,  0x00, 0x81, 0x00, 0xFF
vertex    -73,      0,     15,   5466,    902,  0x00, 0x81, 0x00, 0xFF
vertex    -73,      0,    138,   -274,    894,  0x00, 0x81, 0x00, 0xFF
vertex    -91,      0,    154,   -994,     24,  0x00, 0x81, 0x00, 0xFF
vertex    -91,      0,    154,  -2176,    946,  0x00, 0x81, 0x00, 0xFF
vertex    -73,      0,    138,  -1256,     82,  0x00, 0x81, 0x00, 0xFF
vertex     74,      0,    138,   6100,    -14,  0x00, 0x81, 0x00, 0xFF
vertex     92,      0,    154,   7020,    828,  0x00, 0x81, 0x00, 0xFF
vertex     74,      0,     15,   5590,     32,  0x00, 0x81, 0x00, 0xFF
vertex     92,      0,      0,   6356,    894,  0x00, 0x81, 0x00, 0xFF
vertex     92,      0,    154,  -1308,    894,  0x00, 0x81, 0x00, 0xFF
vertex     74,      0,    138,   -542,     32,  0x00, 0x81, 0x00, 0xFF

treasure_chest_seg6_vertex_06017200: # 0x06017200
vertex     74,      0,    138,  -3720,     10,  0x81, 0x00, 0x00, 0xFF
vertex     74,     20,     27,   1206,    974,  0x81, 0x00, 0x00, 0xFF
vertex     74,      0,     15,   1730,     30,  0x81, 0x00, 0x00, 0xFF
vertex    -91,      0,      0,  -1564,     36,  0x00, 0x81, 0x00, 0xFF
vertex     92,      0,      0,   7632,     36,  0x00, 0x81, 0x00, 0xFF
vertex     74,      0,     15,   6714,    752,  0x00, 0x81, 0x00, 0xFF
vertex    -73,      0,     15,  -4772,     20,  0x7F, 0x00, 0x00, 0xFF
vertex    -73,     20,     27,  -4174,    962,  0x7F, 0x00, 0x00, 0xFF
vertex    -73,     20,    127,    948,    986,  0x7F, 0x00, 0x00, 0xFF
vertex    -73,      0,    138,   1532,     50,  0x7F, 0x00, 0x00, 0xFF
vertex     74,      0,     15,  -3914,     60,  0x00, 0xBF, 0x6C, 0xFF
vertex    -73,     20,     27,    990,    990,  0x00, 0xBF, 0x6C, 0xFF
vertex    -73,      0,     15,    990,     60,  0x00, 0xBF, 0x6C, 0xFF
vertex     74,     20,     27,  -3914,    990,  0x00, 0xBF, 0x6C, 0xFF
vertex     74,     20,    127,  -3222,    958,  0x81, 0x00, 0x00, 0xFF

treasure_chest_seg6_vertex_060172F0: # 0x060172F0
vertex    -73,      0,    138,  -6024,    156,  0x00, 0xC3, 0x91, 0xFF
vertex     74,     20,    127,   1162,    896,  0x00, 0xC3, 0x91, 0xFF
vertex     74,      0,    138,   1212,    112,  0x00, 0xC3, 0x91, 0xFF
vertex    -73,     20,    127,  -6072,    940,  0x00, 0xC3, 0x91, 0xFF

treasure_chest_seg6_vertex_06017330: # 0x06017330
vertex    -19,     20,    136,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex     20,     20,    154,    990,    990,  0x00, 0x7F, 0x00, 0xFF
vertex     20,     20,    136,    990,      0,  0x00, 0x7F, 0x00, 0xFF
vertex     20,     20,    154,    990,      0,  0x00, 0x38, 0x71, 0xFF
vertex    -19,     20,    154,      0,      0,  0x00, 0x38, 0x71, 0xFF
vertex    -19,      0,    164,      0,    990,  0x00, 0x38, 0x71, 0xFF
vertex     20,      0,    164,    990,    990,  0x00, 0x38, 0x71, 0xFF
vertex     20,      0,    154,    -28,    -80,  0x00, 0x81, 0x00, 0xFF
vertex     20,      0,    164,      0,    984,  0x00, 0x81, 0x00, 0xFF
vertex    -19,      0,    164,    968,    998,  0x00, 0x81, 0x00, 0xFF
vertex    -19,      0,    154,    974,    -64,  0x00, 0x81, 0x00, 0xFF
vertex     20,     20,    136,    996,    -44,  0x7F, 0x00, 0x00, 0xFF
vertex     20,      0,    164,      0,    990,  0x7F, 0x00, 0x00, 0xFF
vertex     20,      0,    154,    524,    980,  0x7F, 0x00, 0x00, 0xFF
vertex     20,     20,    154,     10,    -24,  0x7F, 0x00, 0x00, 0xFF

treasure_chest_seg6_vertex_06017420: # 0x06017420
vertex    -19,      0,    154,    480,    990,  0x81, 0x00, 0x00, 0xFF
vertex    -19,      0,    164,    990,    990,  0x81, 0x00, 0x00, 0xFF
vertex    -19,     20,    154,    990,      0,  0x81, 0x00, 0x00, 0xFF
vertex    -19,     20,    136,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    -19,     20,    154,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex     20,     20,    154,    990,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    -19,     20,    136,     86,      0,  0x81, 0x00, 0x00, 0xFF

treasure_chest_seg6_vertex_06017490: # 0x06017490
vertex    -91,     46,     77,   2012,  -1036,  0x00, 0x78, 0x26, 0xFF
vertex      0,     30,    127,  -1664,    990,  0x00, 0x78, 0x26, 0xFF
vertex      0,     46,     77,  -1664,  -1036,  0x00, 0x78, 0x26, 0xFF
vertex      0,      0,    154,  -1664,   1992,  0x00, 0x54, 0x5E, 0xFF
vertex     92,     30,    127,   2012,      0,  0x00, 0x54, 0x5E, 0xFF
vertex      0,     30,    127,  -1664,      0,  0x00, 0x54, 0x5E, 0xFF
vertex     92,      0,    154,   2012,   1992,  0x00, 0x54, 0x5E, 0xFF
vertex    -91,     30,    127,   2012,      0,  0x00, 0x54, 0x5E, 0xFF
vertex    -91,      0,    154,   2012,   1992,  0x00, 0x54, 0x5E, 0xFF
vertex      0,     30,    127,  -1664,   1028,  0x00, 0x78, 0x26, 0xFF
vertex     92,     30,    127,   2012,   1028,  0x00, 0x78, 0x26, 0xFF
vertex     92,     46,     77,   2012,  -1066,  0x00, 0x78, 0x26, 0xFF
vertex      0,     46,     77,  -1664,  -1066,  0x00, 0x78, 0x26, 0xFF
vertex      0,     30,     27,  -1664,      0,  0x00, 0x54, 0xA2, 0xFF
vertex     92,     30,     27,   2012,      0,  0x00, 0x54, 0xA2, 0xFF
vertex     92,      0,      0,   2012,   1992,  0x00, 0x54, 0xA2, 0xFF

treasure_chest_seg6_vertex_06017590: # 0x06017590
vertex    -91,     46,     77,   2012,  -1036,  0x00, 0x78, 0x26, 0xFF
vertex    -91,     30,    127,   2012,    990,  0x00, 0x78, 0x26, 0xFF
vertex      0,     30,    127,  -1664,    990,  0x00, 0x78, 0x26, 0xFF
vertex      0,     46,     77,  -1664,  -1022,  0x00, 0x78, 0xDA, 0xFF
vertex     92,     30,     27,   2012,    990,  0x00, 0x78, 0xDA, 0xFF
vertex      0,     30,     27,  -1664,    990,  0x00, 0x78, 0xDA, 0xFF
vertex     92,     46,     77,   2012,  -1022,  0x00, 0x78, 0xDA, 0xFF
vertex    -91,     30,     27,   2012,    990,  0x00, 0x78, 0xDA, 0xFF
vertex    -91,     46,     77,   2012,  -1052,  0x00, 0x78, 0xDA, 0xFF
vertex      0,     46,     77,  -1664,  -1052,  0x00, 0x78, 0xDA, 0xFF
vertex      0,     30,     27,  -1664,      0,  0x00, 0x54, 0xA2, 0xFF
vertex     92,      0,      0,   2012,   1992,  0x00, 0x54, 0xA2, 0xFF
vertex      0,      0,      0,  -1664,   1992,  0x00, 0x54, 0xA2, 0xFF
vertex    -91,      0,      0,   2012,   1992,  0x00, 0x54, 0xA2, 0xFF
vertex    -91,     30,     27,   2012,      0,  0x00, 0x54, 0xA2, 0xFF

glabel treasure_chest_seg6_dl_06017680 # 0x06017680 - 0x06017790
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, treasure_chest_seg6_texture_060147A8
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight treasure_chest_seg6_light_06013F98, 1
gsSPLight treasure_chest_seg6_light_06013F90, 2
gsSPVertex treasure_chest_seg6_vertex_06017030, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  0,  3,  4, 0x0,  5,  6,  7, 0x0
gsSP2Triangles  5,  8,  9, 0x0,  5,  9,  6, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 12, 13, 0x0
gsSPVertex treasure_chest_seg6_vertex_06017110, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 14, 11, 13, 0x0
gsSPVertex treasure_chest_seg6_vertex_06017200, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  8,  9, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 13, 11, 0x0
gsSP1Triangle  0, 14,  1, 0x0
gsSPVertex treasure_chest_seg6_vertex_060172F0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel treasure_chest_seg6_dl_06017790 # 0x06017790 - 0x06017810
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, treasure_chest_seg6_texture_06014FA8
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex treasure_chest_seg6_vertex_06017330, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 14, 12, 0x0
gsSPVertex treasure_chest_seg6_vertex_06017420, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP1Triangle  0,  2,  6, 0x0
gsSPEndDisplayList

glabel treasure_chest_seg6_dl_06017810 # 0x06017810 - 0x060178C0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, treasure_chest_seg6_texture_060157A8
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPVertex treasure_chest_seg6_vertex_06017490, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  3,  5, 0x0
gsSP2Triangles  7,  8,  3, 0x0,  9, 10, 11, 0x0
gsSP2Triangles  9, 11, 12, 0x0, 13, 14, 15, 0x0
gsSPVertex treasure_chest_seg6_vertex_06017590, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9,  5, 0x0, 10, 11, 12, 0x0
gsSP2Triangles 13, 10, 12, 0x0, 13, 14, 10, 0x0
gsSPEndDisplayList

glabel treasure_chest_seg6_dl_060178C0 # 0x060178C0 - 0x06017958
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList treasure_chest_seg6_dl_06017680
gsSPDisplayList treasure_chest_seg6_dl_06017790
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList treasure_chest_seg6_dl_06017810
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
