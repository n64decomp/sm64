bitfs_seg7_vertex_070111A8: # 0x070111A8 - 0x070111E8
vertex    307,    307,   -306,   5078,  -4120,  0xE0, 0xF5, 0xC9, 0xFF
vertex   -306,    307,    307,      0,    990,  0xE0, 0xF5, 0xC9, 0xFF
vertex    307,    307,    307,   5078,    990,  0xE0, 0xF5, 0xC9, 0xFF
vertex   -306,    307,   -306,      0,  -4120,  0xE0, 0xF5, 0xC9, 0xFF

bitfs_seg7_vertex_070111E8: # 0x070111E8 - 0x07011298
vertex    307,    307,   -306,      0,   1604,  0xFF, 0x00, 0x00, 0xFF
vertex      0,      0,      0,    990,   -132,  0xFF, 0x00, 0x00, 0xFF
vertex   -306,    307,   -306,   2012,   1604,  0xFF, 0x00, 0x00, 0xFF
vertex      0,      0,      0,    734,   -132,  0xFF, 0x00, 0x00, 0xFF
vertex    307,    307,    307,   1500,   1604,  0xFF, 0x00, 0x00, 0xFF
vertex   -306,    307,    307,      0,   1604,  0xFF, 0x00, 0x00, 0xFF
vertex      0,      0,      0,    990,   -132,  0x96, 0x00, 0x00, 0xFF
vertex    307,    307,   -306,   2012,   1604,  0x96, 0x00, 0x00, 0xFF
vertex    307,    307,    307,      0,   1604,  0x96, 0x00, 0x00, 0xFF
vertex   -306,    307,    307,   2012,   1604,  0x96, 0x00, 0x00, 0xFF
vertex   -306,    307,   -306,      0,   1604,  0x96, 0x00, 0x00, 0xFF

bitfs_seg7_dl_07011298: # 0x07011298 - 0x070112D0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09007800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bitfs_seg7_vertex_070111A8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

bitfs_seg7_dl_070112D0: # 0x070112D0 - 0x07011318
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09002000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex bitfs_seg7_vertex_070111E8, 11, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10,  6, 0x0
gsSPEndDisplayList

glabel bitfs_seg7_dl_07011318 # 0x07011318 - 0x070113A8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bitfs_seg7_dl_07011298
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList bitfs_seg7_dl_070112D0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
