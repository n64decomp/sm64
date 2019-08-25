bitdw_seg7_vertex_0700B290: # 0x0700B290 - 0x0700B380
vertex      0,    102,      0,    990,    -40,  0xB4, 0xEE, 0xFE, 0xFF
vertex    307,      0,    307,      0,   2012,  0xB4, 0xEE, 0xFE, 0xFF
vertex    307,      0,   -306,   2012,   2012,  0xB4, 0xEE, 0xFE, 0xFF
vertex      0,    102,      0,   2012,    -44,  0xB4, 0xEE, 0xFE, 0xFF
vertex    307,      0,   -306,      0,   2012,  0xB4, 0xEE, 0xFE, 0xFF
vertex   -306,      0,   -306,   4056,   2012,  0xB4, 0xEE, 0xFE, 0xFF
vertex      0,   -306,      0,    990,      0,  0x52, 0x77, 0x8D, 0xFF
vertex   -306,      0,    307,   1994,   2012,  0x52, 0x77, 0x8D, 0xFF
vertex   -306,      0,   -306,      0,   2012,  0x52, 0x77, 0x8D, 0xFF
vertex   -306,      0,    307,      0,   2012,  0x55, 0x86, 0x97, 0xFF
vertex      0,   -306,      0,   2032,    -44,  0x55, 0x86, 0x97, 0xFF
vertex    307,      0,    307,   4138,   2012,  0x55, 0x86, 0x97, 0xFF
vertex    307,      0,   -306,   2012,   2012,  0x67, 0x9B, 0xB0, 0xFF
vertex    307,      0,    307,      0,   2012,  0x67, 0x9B, 0xB0, 0xFF
vertex      0,   -306,      0,    990,    -40,  0x67, 0x9B, 0xB0, 0xFF

bitdw_seg7_vertex_0700B380: # 0x0700B380 - 0x0700B410
vertex   -306,      0,   -306,   4056,   2012,  0x67, 0x9B, 0xB0, 0xFF
vertex    307,      0,   -306,      0,   2012,  0x67, 0x9B, 0xB0, 0xFF
vertex      0,   -306,      0,   2012,    -44,  0x67, 0x9B, 0xB0, 0xFF
vertex   -306,      0,   -306,      0,   2012,  0x8C, 0xBF, 0xD8, 0xFF
vertex   -306,      0,    307,   1994,   2012,  0x8C, 0xBF, 0xD8, 0xFF
vertex      0,    102,      0,    990,      0,  0x8C, 0xBF, 0xD8, 0xFF
vertex    307,      0,    307,   4138,   2012,  0x8C, 0xBF, 0xD8, 0xFF
vertex      0,    102,      0,   2032,    -44,  0x8C, 0xBF, 0xD8, 0xFF
vertex   -306,      0,    307,      0,   2012,  0x8C, 0xBF, 0xD8, 0xFF

bitdw_seg7_dl_0700B410: # 0x0700B410 - 0x0700B480
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09002000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex bitdw_seg7_vertex_0700B290, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPVertex bitdw_seg7_vertex_0700B380, 9, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP1Triangle  6,  7,  8, 0x0
gsSPEndDisplayList

glabel bitdw_seg7_dl_0700B480 # 0x0700B480 - 0x0700B4F0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList bitdw_seg7_dl_0700B410
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
