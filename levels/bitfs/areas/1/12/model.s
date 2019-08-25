bitfs_seg7_vertex_07009000: # 0x07009000 - 0x07009040
vertex   -588,    154,   -306,   4464,   3440,  0x8C, 0xCC, 0xD8, 0xFF
vertex  -1714,    154,   -306,      0,   3440,  0x8C, 0xCC, 0xD8, 0xFF
vertex  -1714,    154,    307,      0,    990,  0x8C, 0xCC, 0xD8, 0xFF
vertex   -588,    154,    307,   4464,    990,  0x8C, 0xCC, 0xD8, 0xFF

bitfs_seg7_vertex_07009040: # 0x07009040 - 0x07009140
vertex   1664,   -281,   -204,    308,   -372,  0x7D, 0x7D, 0x7D, 0xFF
vertex   1664,   -178,   -204,      0,   -372,  0x7D, 0x7D, 0x7D, 0xFF
vertex   1664,   -178,    205,      0,    990,  0x7D, 0x7D, 0x7D, 0xFF
vertex   1664,   -281,    205,    308,    990,  0x7D, 0x7D, 0x7D, 0xFF
vertex   1664,   -178,   -204,    308,   3372,  0xFF, 0xFF, 0xFF, 0xFF
vertex    947,   -178,    205,   1672,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1664,   -178,    205,   1672,   3372,  0xFF, 0xFF, 0xFF, 0xFF
vertex    947,   -178,   -204,    308,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    947,   -383,   -206,   1332,    990,  0x8C, 0x8C, 0x8C, 0xFF
vertex   1664,   -178,   -206,   2012,   3372,  0x8C, 0x8C, 0x8C, 0xFF
vertex    947,   -178,   -206,   2012,    990,  0x8C, 0x8C, 0x8C, 0xFF
vertex   1664,   -383,   -206,   1332,   3372,  0x8C, 0x8C, 0x8C, 0xFF
vertex    947,   -383,    205,   1332,    990,  0x8C, 0x8C, 0x8C, 0xFF
vertex   1664,   -178,    205,   2012,   3372,  0x8C, 0x8C, 0x8C, 0xFF
vertex    947,   -178,    205,   2012,    990,  0x8C, 0x8C, 0x8C, 0xFF
vertex   1664,   -383,    205,   1332,   3372,  0x8C, 0x8C, 0x8C, 0xFF

bitfs_seg7_dl_07009140: # 0x07009140 - 0x07009178
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bitfs_seg7_texture_07000000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPVertex bitfs_seg7_vertex_07009000, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

bitfs_seg7_dl_07009178: # 0x07009178 - 0x070091E0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09003800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPVertex bitfs_seg7_vertex_07009040, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 15, 13, 0x0
gsSPEndDisplayList

glabel bitfs_seg7_dl_070091E0 # 0x070091E0 - 0x07009258
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList bitfs_seg7_dl_07009140
gsSPDisplayList bitfs_seg7_dl_07009178
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
