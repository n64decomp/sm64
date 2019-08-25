bitfs_seg7_vertex_0700FBA8: # 0x0700FBA8 - 0x0700FBE8
vertex    307,    307,   -306,   2420,    990,  0x70, 0x7F, 0x60, 0xFF
vertex   -306,    307,    307,      0,    990,  0x70, 0x7F, 0x60, 0xFF
vertex    307,    307,    307,   1194,   -236,  0x70, 0x7F, 0x60, 0xFF
vertex   -306,    307,   -306,   1194,   2214,  0x70, 0x7F, 0x60, 0xFF

bitfs_seg7_vertex_0700FBE8: # 0x0700FBE8 - 0x0700FC88
vertex    307,    307,   -306,    478,   1498,  0xFF, 0x00, 0x00, 0xFF
vertex      0,      0,      0,      0,    990,  0xFF, 0x00, 0x00, 0xFF
vertex   -306,    307,   -306,    478,    480,  0xFF, 0x00, 0x00, 0xFF
vertex    307,    307,    307,   -540,   1498,  0xFF, 0x00, 0x00, 0xFF
vertex   -306,    307,    307,   -542,    480,  0xFF, 0x00, 0x00, 0xFF
vertex   -306,    307,    307,   -542,    480,  0x96, 0x00, 0x00, 0xFF
vertex   -306,    307,   -306,    478,    480,  0x96, 0x00, 0x00, 0xFF
vertex      0,      0,      0,      0,    990,  0x96, 0x00, 0x00, 0xFF
vertex    307,    307,   -306,    478,   1498,  0x96, 0x00, 0x00, 0xFF
vertex    307,    307,    307,   -540,   1498,  0x96, 0x00, 0x00, 0xFF

bitfs_seg7_dl_0700FC88: # 0x0700FC88 - 0x0700FCC0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09007000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bitfs_seg7_vertex_0700FBA8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

bitfs_seg7_dl_0700FCC0: # 0x0700FCC0 - 0x0700FD08
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bitfs_seg7_texture_07001000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bitfs_seg7_vertex_0700FBE8, 10, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  4, 0x0
gsSP2Triangles  5,  6,  7, 0x0,  7,  8,  9, 0x0
gsSPEndDisplayList

glabel bitfs_seg7_dl_0700FD08 # 0x0700FD08 - 0x0700FD80
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bitfs_seg7_dl_0700FC88
gsSPDisplayList bitfs_seg7_dl_0700FCC0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
