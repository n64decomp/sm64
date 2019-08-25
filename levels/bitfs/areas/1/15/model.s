bitfs_seg7_vertex_0700AA78: # 0x0700AA78 - 0x0700AB38
vertex    410,     51,   -306,   2012,   1340,  0xAF, 0xAF, 0xAF, 0xFF
vertex     72,    205,    307,      0,      0,  0xAF, 0xAF, 0xAF, 0xFF
vertex    410,     51,    307,      0,   1340,  0xAF, 0xAF, 0xAF, 0xFF
vertex     72,    205,   -306,   2012,      0,  0xAF, 0xAF, 0xAF, 0xFF
vertex   -409,    205,    307,      0,   -542,  0xC8, 0xC8, 0xC8, 0xFF
vertex     72,    205,    307,      0,    990,  0xC8, 0xC8, 0xC8, 0xFF
vertex     72,    205,   -306,   2012,    990,  0xC8, 0xC8, 0xC8, 0xFF
vertex   -409,    205,   -306,   2012,   -544,  0xC8, 0xC8, 0xC8, 0xFF
vertex    410,      0,   -306,   1500,  -1258,  0x7D, 0x7D, 0x7D, 0xFF
vertex    410,     51,    307,   2012,    786,  0x7D, 0x7D, 0x7D, 0xFF
vertex    410,      0,    307,   1500,    786,  0x7D, 0x7D, 0x7D, 0xFF
vertex    410,     51,   -306,   2012,  -1258,  0x7D, 0x7D, 0x7D, 0xFF

bitfs_seg7_dl_0700AB38: # 0x0700AB38 - 0x0700AB90
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09003800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPVertex bitfs_seg7_vertex_0700AA78, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSPEndDisplayList

glabel bitfs_seg7_dl_0700AB90 # 0x0700AB90 - 0x0700AC00
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList bitfs_seg7_dl_0700AB38
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
