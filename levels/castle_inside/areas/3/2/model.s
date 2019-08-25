inside_castle_seg7_vertex_0705E138: # 0x0705E138 - 0x0705E238
vertex  -1586,   -972,   1567,  -2074,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1893,   -972,   1567,  -5140,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1893,  -1074,   1567,  -5140,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -439,  -1074,   2816,  10188,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -439,   -972,   1784,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -439,  -1074,   1784,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -439,   -972,   2816,  10188,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -656,  -1074,   1567,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -439,   -972,   1784,   2858,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -656,   -972,   1567,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -439,  -1074,   1784,   2858,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -656,   -972,   1567,   7122,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1177,   -972,   1567,   2012,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1177,  -1074,   1567,   2012,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -656,  -1074,   1567,   7122,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1586,  -1074,   1567,  -2074,    990,  0xFF, 0xFF, 0xFF, 0xFF

inside_castle_seg7_dl_0705E238: # 0x0705E238 - 0x0705E2A0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_09008800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex inside_castle_seg7_vertex_0705E138, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 13, 14, 0x0,  0,  2, 15, 0x0
gsSPEndDisplayList

glabel inside_castle_seg7_dl_0705E2A0 # 0x0705E2A0 - 0x0705E310
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList inside_castle_seg7_dl_0705E238
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
