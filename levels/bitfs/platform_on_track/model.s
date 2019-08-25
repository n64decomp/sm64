bitfs_seg7_vertex_070115D8: # 0x070115D8 - 0x070116D8
vertex    307,    205,   -306,   4056,   5076,  0xAD, 0xBB, 0xD1, 0xFF
vertex   -306,    205,   -306,      0,   5076,  0xAD, 0xBB, 0xD1, 0xFF
vertex   -306,    205,    307,      0,    990,  0xAD, 0xBB, 0xD1, 0xFF
vertex    307,    205,    307,   4056,    990,  0xAD, 0xBB, 0xD1, 0xFF
vertex    307,      0,   -306,      0,    990,  0x8C, 0x98, 0xD8, 0xFF
vertex   -306,    205,   -306,   4056,      0,  0x8C, 0x98, 0xD8, 0xFF
vertex    307,    205,   -306,      0,      0,  0x8C, 0x98, 0xD8, 0xFF
vertex   -306,      0,   -306,   4056,    990,  0x8C, 0x98, 0xD8, 0xFF
vertex    307,    205,    307,   4056,      0,  0x8C, 0x98, 0xD8, 0xFF
vertex   -306,      0,    307,      0,    990,  0x8C, 0x98, 0xD8, 0xFF
vertex    307,      0,    307,   4056,    990,  0x8C, 0x98, 0xD8, 0xFF
vertex   -306,    205,    307,      0,      0,  0x8C, 0x98, 0xD8, 0xFF
vertex    307,      0,   -306,   4056,    990,  0x52, 0x61, 0xAC, 0xFF
vertex    307,    205,    307,      0,      0,  0x52, 0x61, 0xAC, 0xFF
vertex    307,      0,    307,      0,    990,  0x52, 0x61, 0xAC, 0xFF
vertex    307,    205,   -306,   4056,      0,  0x52, 0x61, 0xAC, 0xFF

bitfs_seg7_vertex_070116D8: # 0x070116D8 - 0x07011718
vertex   -306,      0,    307,      0,    990,  0x52, 0x61, 0xAC, 0xFF
vertex   -306,    205,    307,      0,      0,  0x52, 0x61, 0xAC, 0xFF
vertex   -306,    205,   -306,   4056,      0,  0x52, 0x61, 0xAC, 0xFF
vertex   -306,      0,   -306,   4056,    990,  0x52, 0x61, 0xAC, 0xFF

bitfs_seg7_dl_07011718: # 0x07011718 - 0x07011798
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bitfs_seg7_texture_07000000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPVertex bitfs_seg7_vertex_070115D8, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 15, 13, 0x0
gsSPVertex bitfs_seg7_vertex_070116D8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel bitfs_seg7_dl_07011798 # 0x07011798 - 0x07011808
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList bitfs_seg7_dl_07011718
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
