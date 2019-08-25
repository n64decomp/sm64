bitfs_seg7_vertex_07011808: # 0x07011808 - 0x07011908
vertex   -921,      0,   -613,      0,   3236,  0x8C, 0x8C, 0xD8, 0xFF
vertex   -921,      0,    614,   4056,   3236,  0x8C, 0x8C, 0xD8, 0xFF
vertex   -613,     56,    614,   4056,   1996,  0x8C, 0x8C, 0xD8, 0xFF
vertex   -613,     56,   -613,      0,   1996,  0x8C, 0x8C, 0xD8, 0xFF
vertex   -306,      0,   -613,      0,   3236,  0x8C, 0x8C, 0xD8, 0xFF
vertex   -306,      0,    614,   4056,   3236,  0x8C, 0x8C, 0xD8, 0xFF
vertex      0,     56,    614,   4056,   1996,  0x8C, 0x8C, 0xD8, 0xFF
vertex      0,     56,   -613,      0,   1996,  0x8C, 0x8C, 0xD8, 0xFF
vertex    307,      0,   -613,      0,   3236,  0x8C, 0x8C, 0xD8, 0xFF
vertex    614,     56,    614,   4056,   1996,  0x8C, 0x8C, 0xD8, 0xFF
vertex    614,     56,   -613,      0,   1996,  0x8C, 0x8C, 0xD8, 0xFF
vertex    307,      0,    614,   4056,   3236,  0x8C, 0x8C, 0xD8, 0xFF
vertex   -613,     56,   -613,      0,   2012,  0x8C, 0x98, 0xD8, 0xFF
vertex   -613,     56,    614,   4056,   2012,  0x8C, 0x98, 0xD8, 0xFF
vertex   -306,      0,    614,   4056,   3252,  0x8C, 0x98, 0xD8, 0xFF
vertex   -306,      0,   -613,      0,   3252,  0x8C, 0x98, 0xD8, 0xFF

bitfs_seg7_vertex_07011908: # 0x07011908 - 0x07011988
vertex      0,     56,   -613,    990,   1996,  0x8C, 0x98, 0xD8, 0xFF
vertex    307,      0,    614,  -3096,   3236,  0x8C, 0x98, 0xD8, 0xFF
vertex    307,      0,   -613,    990,   3236,  0x8C, 0x98, 0xD8, 0xFF
vertex      0,     56,    614,  -3096,   1996,  0x8C, 0x98, 0xD8, 0xFF
vertex    614,     56,   -613,    990,   2012,  0x8C, 0x98, 0xD8, 0xFF
vertex    614,     56,    614,  -3096,   2012,  0x8C, 0x98, 0xD8, 0xFF
vertex    922,      0,    614,  -3096,   3252,  0x8C, 0x98, 0xD8, 0xFF
vertex    922,      0,   -613,    990,   3252,  0x8C, 0x98, 0xD8, 0xFF

bitfs_seg7_vertex_07011988: # 0x07011988 - 0x07011A68
vertex    307,      0,    614,      0,      0,  0x48, 0x3B, 0x7D, 0xFF
vertex      0,     56,    614,      0,      0,  0x48, 0x3B, 0x7D, 0xFF
vertex   -306,      0,    614,      0,      0,  0x48, 0x3B, 0x7D, 0xFF
vertex    922,      0,    614,      0,      0,  0x48, 0x3B, 0x7D, 0xFF
vertex    614,     56,    614,      0,      0,  0x48, 0x3B, 0x7D, 0xFF
vertex    922,      0,   -613,      0,      0,  0x48, 0x3B, 0x7D, 0xFF
vertex    307,      0,   -613,      0,      0,  0x48, 0x3B, 0x7D, 0xFF
vertex    614,     56,   -613,      0,      0,  0x48, 0x3B, 0x7D, 0xFF
vertex   -306,      0,   -613,      0,      0,  0x48, 0x3B, 0x7D, 0xFF
vertex      0,     56,   -613,      0,      0,  0x48, 0x3B, 0x7D, 0xFF
vertex   -921,      0,   -613,      0,      0,  0x48, 0x3B, 0x7D, 0xFF
vertex   -613,     56,   -613,      0,      0,  0x48, 0x3B, 0x7D, 0xFF
vertex   -613,     56,    614,      0,      0,  0x48, 0x3B, 0x7D, 0xFF
vertex   -921,      0,    614,      0,      0,  0x48, 0x3B, 0x7D, 0xFF

bitfs_seg7_vertex_07011A68: # 0x07011A68 - 0x07011AB8
vertex    307,      0,    614,      0,      0,  0x79, 0x8C, 0xEB, 0xFF
vertex      0,     56,    614,      0,      0,  0x79, 0x8C, 0xEB, 0xFF
vertex   -306,      0,    614,      0,      0,  0x79, 0x8C, 0xEB, 0xFF
vertex   -613,     56,    614,      0,      0,  0x79, 0x8C, 0xEB, 0xFF
vertex   -921,      0,    614,      0,      0,  0x79, 0x8C, 0xEB, 0xFF

bitfs_seg7_dl_07011AB8: # 0x07011AB8 - 0x07011B48
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09002000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex bitfs_seg7_vertex_07011808, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 14, 15, 0x0
gsSPVertex bitfs_seg7_vertex_07011908, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSPEndDisplayList

bitfs_seg7_dl_07011B48: # 0x07011B48 - 0x07011BA0
gsSPVertex bitfs_seg7_vertex_07011988, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  0, 0x0
gsSP2Triangles  5,  6,  7, 0x0,  6,  8,  9, 0x0
gsSP2Triangles  8, 10, 11, 0x0,  2, 12, 13, 0x0
gsSPVertex bitfs_seg7_vertex_07011A68, 5, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  4, 0x0
gsSPEndDisplayList

glabel bitfs_seg7_dl_07011BA0 # 0x07011BA0 - 0x07011C18
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList bitfs_seg7_dl_07011AB8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPDisplayList bitfs_seg7_dl_07011B48
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
