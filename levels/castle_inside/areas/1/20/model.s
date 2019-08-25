inside_castle_seg7_light_070379F8: # 0x070379F8 - 0x07037A00
.byte 0x5F, 0x5F, 0x5F, 0x00, 0x5F, 0x5F, 0x5F, 0x00

inside_castle_seg7_light_07037A00: # 0x07037A00 - 0x07037A10
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

inside_castle_seg7_vertex_07037A10: # 0x07037A10 - 0x07037B10
vertex   4301,   1229,   -716,   1204,   2804,  0xBF, 0x9B, 0x26, 0xFF
vertex   3789,   1638,   -504,   1304,   2510,  0xD3, 0x8B, 0x0B, 0xFF
vertex   3065,   1638,  -1228,   1046,   2070,  0xE9, 0x8B, 0x28, 0xFF
vertex   1229,   1229,    256,   1688,   1030,  0x41, 0x9B, 0xDA, 0xFF
vertex   1741,   1638,     44,   1588,   1324,  0x19, 0x84, 0xFA, 0xFF
vertex   2465,   1638,    768,   1846,   1764,  0x1D, 0x90, 0xCE, 0xFF
vertex   1229,   1229,   -716,   1310,   1006,  0x49, 0x9B, 0x13, 0xFF
vertex   1741,   1638,   -504,   1374,   1312,  0x32, 0x90, 0x1D, 0xFF
vertex   3789,   1638,     44,   1518,   2522,  0xDC, 0x88, 0xF2, 0xFF
vertex   3065,   1638,    768,   1826,   2114,  0xED, 0x8D, 0xD0, 0xFF
vertex   2465,   1638,  -1228,   1068,   1718,  0x0B, 0x8B, 0x2D, 0xFF
vertex   2253,   1229,  -1740,    874,   1582,  0x26, 0x9B, 0x41, 0xFF
vertex   3277,   1229,  -1740,    840,   2182,  0xED, 0x9B, 0x49, 0xFF
vertex   2253,   1229,   1280,   2054,   1652,  0x13, 0x9B, 0xB7, 0xFF
vertex   4301,   1229,    256,   1584,   2826,  0xBB, 0x9A, 0xE4, 0xFF
vertex   3277,   1229,   1280,   2018,   2250,  0xE4, 0x9A, 0xBB, 0xFF

inside_castle_seg7_dl_07037B10: # 0x07037B10 - 0x07037BF8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_09008000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight inside_castle_seg7_light_07037A00, 1
gsSPLight inside_castle_seg7_light_070379F8, 2
gsSPVertex inside_castle_seg7_vertex_07037A10, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  4,  3, 0x0,  6,  7,  4, 0x0
gsSP2Triangles  4,  8,  9, 0x0,  4,  1,  8, 0x0
gsSP2Triangles  4,  2,  1, 0x0,  4, 10,  2, 0x0
gsSP2Triangles  4,  7, 10, 0x0,  4,  9,  5, 0x0
gsSP2Triangles 11,  7,  6, 0x0, 11, 10,  7, 0x0
gsSP2Triangles 12, 10, 11, 0x0, 12,  2, 10, 0x0
gsSP2Triangles  0,  2, 12, 0x0,  3,  5, 13, 0x0
gsSP2Triangles 14,  1,  0, 0x0, 14,  8,  1, 0x0
gsSP2Triangles  9,  8, 14, 0x0, 13,  5,  9, 0x0
gsSP2Triangles 15,  9, 14, 0x0, 13,  9, 15, 0x0
gsSPEndDisplayList

glabel inside_castle_seg7_dl_07037BF8 # 0x07037BF8 - 0x07037C58
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList inside_castle_seg7_dl_07037B10
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
