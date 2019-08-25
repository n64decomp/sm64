bitdw_seg7_vertex_0700B948: # 0x0700B948 - 0x0700BA48
vertex    205,      0,   -306,   2012,  -2076,  0x3D, 0x41, 0x74, 0xFF
vertex    205,      0,    307,   2012,    990,  0x3D, 0x41, 0x74, 0xFF
vertex   -204,      0,   -306,      0,  -2076,  0x3D, 0x41, 0x74, 0xFF
vertex   -204,      0,    307,      0,    990,  0x3D, 0x41, 0x74, 0xFF
vertex   -204,    102,   -306,      0,  -2076,  0xC7, 0xEE, 0xFF, 0xFF
vertex   -204,    102,    307,      0,    990,  0xC7, 0xEE, 0xFF, 0xFF
vertex    205,    102,   -306,   2012,  -2076,  0xC7, 0xEE, 0xFF, 0xFF
vertex    205,    102,    307,   2012,    990,  0xC7, 0xEE, 0xFF, 0xFF
vertex   -204,    102,   -306,   2012,    990,  0x65, 0x7F, 0xFF, 0xFF
vertex    205,    102,   -306,      0,    990,  0x65, 0x7F, 0xFF, 0xFF
vertex   -204,      0,   -306,   2012,      0,  0x65, 0x7F, 0xFF, 0xFF
vertex    205,      0,   -306,      0,      0,  0x65, 0x7F, 0xFF, 0xFF
vertex    205,    102,    307,      0,    990,  0x65, 0x7F, 0xFF, 0xFF
vertex   -204,    102,    307,  -2074,    990,  0x65, 0x7F, 0xFF, 0xFF
vertex    205,      0,    307,      0,      0,  0x65, 0x7F, 0xFF, 0xFF
vertex   -204,      0,    307,  -2074,      0,  0x65, 0x7F, 0xFF, 0xFF

bitdw_seg7_vertex_0700BA48: # 0x0700BA48 - 0x0700BAC8
vertex   -204,      0,   -306,  -2074,      0,  0x52, 0x61, 0xAC, 0xFF
vertex   -204,      0,    307,    990,      0,  0x52, 0x61, 0xAC, 0xFF
vertex   -204,    102,   -306,  -2074,    990,  0x52, 0x61, 0xAC, 0xFF
vertex   -204,    102,    307,    990,    990,  0x52, 0x61, 0xAC, 0xFF
vertex    205,    102,   -306,   3034,    990,  0x52, 0x61, 0xAC, 0xFF
vertex    205,    102,    307,      0,    990,  0x52, 0x61, 0xAC, 0xFF
vertex    205,      0,   -306,   3034,      0,  0x52, 0x61, 0xAC, 0xFF
vertex    205,      0,    307,      0,      0,  0x52, 0x61, 0xAC, 0xFF

bitdw_seg7_dl_0700BAC8: # 0x0700BAC8 - 0x0700BB58
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bitdw_seg7_texture_07000000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bitdw_seg7_vertex_0700B948, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  5,  7,  6, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  9, 11, 10, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 13, 15, 14, 0x0
gsSPVertex bitdw_seg7_vertex_0700BA48, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  5,  7,  6, 0x0
gsSPEndDisplayList

glabel bitdw_seg7_dl_0700BB58 # 0x0700BB58 - 0x0700BBC8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bitdw_seg7_dl_0700BAC8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
