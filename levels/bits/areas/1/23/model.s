bits_seg7_vertex_07013610: # 0x07013610 - 0x07013710
vertex   -204,    102,   -306,     38,   2968,  0xB1, 0xBF, 0xFA, 0xFF
vertex   -204,    102,    307,     38,   1052,  0xB1, 0xBF, 0xFA, 0xFF
vertex    205,    102,    307,   1448,   1052,  0xB1, 0xBF, 0xFA, 0xFF
vertex    205,    102,   -306,   1448,   2968,  0xB1, 0xBF, 0xFA, 0xFF
vertex    205,      0,   -306,   1448,   2968,  0x3D, 0x3C, 0x76, 0xFF
vertex    205,      0,    307,   1448,   1052,  0x3D, 0x3C, 0x76, 0xFF
vertex   -204,      0,    307,     38,   1052,  0x3D, 0x3C, 0x76, 0xFF
vertex   -204,      0,   -306,     38,   2968,  0x3D, 0x3C, 0x76, 0xFF
vertex   -204,      0,   -306,     38,   2968,  0x79, 0x8C, 0xEB, 0xFF
vertex   -204,    102,    307,     38,   1052,  0x79, 0x8C, 0xEB, 0xFF
vertex   -204,    102,   -306,     38,   2968,  0x79, 0x8C, 0xEB, 0xFF
vertex   -204,      0,    307,     38,   1052,  0x79, 0x8C, 0xEB, 0xFF
vertex    205,    102,   -306,   1448,   2968,  0x65, 0x7F, 0xFF, 0xFF
vertex    205,    102,    307,   1448,   1052,  0x65, 0x7F, 0xFF, 0xFF
vertex    205,      0,    307,   1448,   1052,  0x65, 0x7F, 0xFF, 0xFF
vertex    205,      0,   -306,   1448,   2968,  0x65, 0x7F, 0xFF, 0xFF

bits_seg7_vertex_07013710: # 0x07013710 - 0x07013790
vertex   -204,      0,    307,     38,   1052,  0x52, 0x61, 0xAC, 0xFF
vertex    205,      0,    307,   1448,   1052,  0x52, 0x61, 0xAC, 0xFF
vertex    205,    102,    307,   1448,   1052,  0x52, 0x61, 0xAC, 0xFF
vertex   -204,    102,    307,     38,   1052,  0x52, 0x61, 0xAC, 0xFF
vertex    205,      0,   -306,   1448,   2968,  0x52, 0x61, 0xAC, 0xFF
vertex   -204,    102,   -306,     38,   2968,  0x52, 0x61, 0xAC, 0xFF
vertex    205,    102,   -306,   1448,   2968,  0x52, 0x61, 0xAC, 0xFF
vertex   -204,      0,   -306,     38,   2968,  0x52, 0x61, 0xAC, 0xFF

bits_seg7_dl_07013790: # 0x07013790 - 0x07013820
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09008000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bits_seg7_vertex_07013610, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 14, 15, 0x0
gsSPVertex bits_seg7_vertex_07013710, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

glabel bits_seg7_dl_07013820 # 0x07013820 - 0x07013890
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bits_seg7_dl_07013790
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
