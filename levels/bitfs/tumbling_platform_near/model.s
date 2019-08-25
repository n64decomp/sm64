bitfs_seg7_vertex_0700FD80: # 0x0700FD80 - 0x0700FE80
vertex    -63,      0,    307,   9678,   -542,  0xB2, 0x45, 0x00, 0xFF
vertex    -63,    154,   -306,   9678,    480,  0xB2, 0x45, 0x00, 0xFF
vertex    -63,      0,   -306,   9678,    480,  0xB2, 0x45, 0x00, 0xFF
vertex    -63,    154,    307,   9678,   -542,  0xB2, 0x45, 0x00, 0xFF
vertex     64,      0,   -306,  10700,    480,  0xB2, 0x45, 0x00, 0xFF
vertex     64,    154,   -306,  10700,    480,  0xB2, 0x45, 0x00, 0xFF
vertex     64,    154,    307,  10700,   -542,  0xB2, 0x45, 0x00, 0xFF
vertex     64,      0,    307,  10700,   -542,  0xB2, 0x45, 0x00, 0xFF
vertex     64,    154,    307,  10700,   -542,  0xD3, 0x53, 0x00, 0xFF
vertex    -63,    154,    307,   9678,   -542,  0xD3, 0x53, 0x00, 0xFF
vertex    -63,      0,    307,   9678,   -542,  0xD3, 0x53, 0x00, 0xFF
vertex     64,      0,    307,  10700,   -542,  0xD3, 0x53, 0x00, 0xFF
vertex    -63,      0,   -306,   9678,    480,  0xD3, 0x53, 0x00, 0xFF
vertex     64,    154,   -306,  10700,    480,  0xD3, 0x53, 0x00, 0xFF
vertex     64,      0,   -306,  10700,    480,  0xD3, 0x53, 0x00, 0xFF
vertex    -63,    154,   -306,   9678,    480,  0xD3, 0x53, 0x00, 0xFF

bitfs_seg7_vertex_0700FE80: # 0x0700FE80 - 0x0700FF00
vertex     64,      0,   -306,  10700,    480,  0x78, 0x16, 0x01, 0xFF
vertex     64,      0,    307,  10700,   -542,  0x78, 0x16, 0x01, 0xFF
vertex    -63,      0,    307,   9678,   -542,  0x78, 0x16, 0x01, 0xFF
vertex    -63,      0,   -306,   9678,    480,  0x78, 0x16, 0x01, 0xFF
vertex    -63,    154,   -306,   9678,    480,  0xFE, 0xA5, 0x39, 0xFF
vertex    -63,    154,    307,   9678,   -542,  0xFE, 0xA5, 0x39, 0xFF
vertex     64,    154,    307,  10700,   -542,  0xFE, 0xA5, 0x39, 0xFF
vertex     64,    154,   -306,  10700,    480,  0xFE, 0xA5, 0x39, 0xFF

bitfs_seg7_dl_0700FF00: # 0x0700FF00 - 0x0700FF90
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bitfs_seg7_texture_07001000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bitfs_seg7_vertex_0700FD80, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 10, 11, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 15, 13, 0x0
gsSPVertex bitfs_seg7_vertex_0700FE80, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSPEndDisplayList

glabel bitfs_seg7_dl_0700FF90 # 0x0700FF90 - 0x07010000
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bitfs_seg7_dl_0700FF00
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
