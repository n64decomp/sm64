inside_castle_seg7_vertex_07051370: # 0x07051370 - 0x07051460
vertex   1384,   2765,   7197,   2012,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1384,   2867,   6992,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1384,   2765,   6992,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -760,   3174,   4792,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    352,   3277,   4792,  11210,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -760,   3277,   4792,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    352,   3174,   4792,  11210,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -809,   3174,   4610,   -896,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -760,   3277,   4792,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -809,   3277,   4610,   -896,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -760,   3174,   4792,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    352,   3174,   4792,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    401,   3174,   4610,   1856,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    401,   3277,   4610,   1856,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    352,   3277,   4792,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

inside_castle_seg7_vertex_07051460: # 0x07051460 - 0x07051560
vertex  -1992,   2867,   6310,  -2074,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1793,   2867,   6509,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1793,   2765,   6509,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1384,   2765,   7197,   2012,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1384,   2867,   7197,   2012,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1384,   2867,   6992,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1793,   2765,   6992,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1793,   2867,   7197,  -1052,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1793,   2765,   7197,  -1052,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1793,   2867,   6992,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1793,   2867,   6603,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1793,   2765,   6603,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1992,   2765,   6310,  -2074,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1384,   2765,   6603,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1384,   2867,   6603,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1384,   2867,   6509,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

inside_castle_seg7_vertex_07051560: # 0x07051560 - 0x070515B0
vertex   1384,   2765,   6603,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1384,   2867,   6509,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1384,   2765,   6509,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1583,   2765,   6310,  -2074,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1583,   2867,   6310,  -2074,      0,  0xFF, 0xFF, 0xFF, 0xFF

inside_castle_seg7_dl_070515B0: # 0x070515B0 - 0x07051678
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_09008800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex inside_castle_seg7_vertex_07051370, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex inside_castle_seg7_vertex_07051460, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  9,  7, 0x0
gsSP2Triangles  2,  1, 10, 0x0,  2, 10, 11, 0x0
gsSP2Triangles  0,  2, 12, 0x0, 13, 14, 15, 0x0
gsSPVertex inside_castle_seg7_vertex_07051560, 5, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  1,  4, 0x0
gsSP1Triangle  3,  2,  1, 0x0
gsSPEndDisplayList

glabel inside_castle_seg7_dl_07051678 # 0x07051678 - 0x070516E8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList inside_castle_seg7_dl_070515B0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
