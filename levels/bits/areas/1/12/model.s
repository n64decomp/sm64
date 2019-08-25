bits_seg7_vertex_0700B528: # 0x0700B528 - 0x0700B5A8
vertex    836,   -306,    401,   2694,   6438,  0x44, 0x53, 0x41, 0xFF
vertex   -801,   -306,   -417,      0,    990,  0x44, 0x53, 0x41, 0xFF
vertex    836,   -306,   -417,      0,   6438,  0x44, 0x53, 0x41, 0xFF
vertex   -801,   -306,    401,   2694,    990,  0x44, 0x53, 0x41, 0xFF
vertex   -801,      0,    401,   2694,    990,  0xBC, 0xCA, 0xBF, 0xFF
vertex    836,      0,   -417,      0,   6438,  0xBC, 0xCA, 0xBF, 0xFF
vertex   -801,      0,   -417,      0,    990,  0xBC, 0xCA, 0xBF, 0xFF
vertex    836,      0,    401,   2694,   6438,  0xBC, 0xCA, 0xBF, 0xFF

bits_seg7_vertex_0700B5A8: # 0x0700B5A8 - 0x0700B698
vertex    836,      0,   -417,   5076,      0,  0x6E, 0x7C, 0x6C, 0xFF
vertex   -801,   -306,   -417,      0,    990,  0x6E, 0x7C, 0x6C, 0xFF
vertex   -801,      0,   -417,      0,      0,  0x6E, 0x7C, 0x6C, 0xFF
vertex    836,   -306,   -417,   5076,    990,  0x6E, 0x7C, 0x6C, 0xFF
vertex   -801,      0,    401,      0,      0,  0x6E, 0x7C, 0x6C, 0xFF
vertex    836,   -306,    401,   5076,    990,  0x6E, 0x7C, 0x6C, 0xFF
vertex    836,      0,    401,   5076,      0,  0x6E, 0x7C, 0x6C, 0xFF
vertex   -801,   -306,    401,      0,    990,  0x6E, 0x7C, 0x6C, 0xFF
vertex   -801,      0,     -8,   2808,      0,  0x88, 0x98, 0x84, 0xFF
vertex   -801,   -306,    401,    992,    990,  0x88, 0x98, 0x84, 0xFF
vertex   -801,      0,    401,    992,      0,  0x88, 0x98, 0x84, 0xFF
vertex    836,   -306,     -8,   2240,    990,  0x88, 0x98, 0x84, 0xFF
vertex    836,   -306,   -417,   4056,    990,  0x88, 0x98, 0x84, 0xFF
vertex    836,      0,   -417,   4056,      0,  0x88, 0x98, 0x84, 0xFF
vertex    836,      0,     -8,   2240,      0,  0x88, 0x98, 0x84, 0xFF

bits_seg7_vertex_0700B698: # 0x0700B698 - 0x0700B748
vertex    836,      0,    401,    992,      0,  0x88, 0x98, 0x84, 0xFF
vertex    836,   -306,     -8,   2808,    990,  0x88, 0x98, 0x84, 0xFF
vertex    836,      0,     -8,   2808,      0,  0x88, 0x98, 0x84, 0xFF
vertex    836,   -306,    401,    992,    990,  0x88, 0x98, 0x84, 0xFF
vertex   -801,      0,     -8,   2240,      0,  0x88, 0x98, 0x84, 0xFF
vertex   -801,      0,   -417,   4056,      0,  0x88, 0x98, 0x84, 0xFF
vertex   -801,   -306,   -417,   4056,    990,  0x88, 0x98, 0x84, 0xFF
vertex   -801,   -306,     -8,   2240,    990,  0x88, 0x98, 0x84, 0xFF
vertex   -801,      0,     -8,   2808,      0,  0x88, 0x98, 0x84, 0xFF
vertex   -801,   -306,     -8,   2808,    990,  0x88, 0x98, 0x84, 0xFF
vertex   -801,   -306,    401,    992,    990,  0x88, 0x98, 0x84, 0xFF

bits_seg7_dl_0700B748: # 0x0700B748 - 0x0700B790
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09007000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bits_seg7_vertex_0700B528, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

bits_seg7_dl_0700B790: # 0x0700B790 - 0x0700B820
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bits_seg7_texture_07001000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPVertex bits_seg7_vertex_0700B5A8, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex bits_seg7_vertex_0700B698, 11, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP1Triangle  8,  9, 10, 0x0
gsSPEndDisplayList

glabel bits_seg7_dl_0700B820 # 0x0700B820 - 0x0700B8B0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bits_seg7_dl_0700B748
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList bits_seg7_dl_0700B790
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
