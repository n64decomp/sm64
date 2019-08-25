bits_seg7_vertex_07007C98: # 0x07007C98 - 0x07007D18
vertex    717,      0,    307,   6270,   6268,  0x44, 0x53, 0x41, 0xFF
vertex   -716,      0,    307,   3886,   3884,  0x44, 0x53, 0x41, 0xFF
vertex   -716,      0,   -306,   2864,   4906,  0x44, 0x53, 0x41, 0xFF
vertex    717,      0,   -306,   5248,   7290,  0x44, 0x53, 0x41, 0xFF
vertex    717,    205,   -306,   1842,   3884,  0xBC, 0xCA, 0xBF, 0xFF
vertex   -716,    205,    307,    480,    480,  0xBC, 0xCA, 0xBF, 0xFF
vertex    717,    205,    307,   2864,   2862,  0xBC, 0xCA, 0xBF, 0xFF
vertex   -716,    205,   -306,   -540,   1500,  0xBC, 0xCA, 0xBF, 0xFF

bits_seg7_vertex_07007D18: # 0x07007D18 - 0x07007E18
vertex    717,    205,   -306,      0,      0,  0x6E, 0x7C, 0x6C, 0xFF
vertex    717,      0,   -306,      0,    990,  0x6E, 0x7C, 0x6C, 0xFF
vertex   -716,      0,   -306,   6120,    990,  0x6E, 0x7C, 0x6C, 0xFF
vertex   -716,    205,   -306,   6120,      0,  0x6E, 0x7C, 0x6C, 0xFF
vertex   -716,    205,    307,      0,      0,  0x6E, 0x7C, 0x6C, 0xFF
vertex    717,      0,    307,   6120,    990,  0x6E, 0x7C, 0x6C, 0xFF
vertex    717,    205,    307,   6120,      0,  0x6E, 0x7C, 0x6C, 0xFF
vertex   -716,      0,    307,      0,    990,  0x6E, 0x7C, 0x6C, 0xFF
vertex   -716,    205,   -306,  -1048,      0,  0x88, 0x98, 0x84, 0xFF
vertex   -716,      0,   -306,  -1052,    990,  0x88, 0x98, 0x84, 0xFF
vertex   -716,      0,    307,   2012,    990,  0x88, 0x98, 0x84, 0xFF
vertex   -716,    205,    307,   2012,      0,  0x88, 0x98, 0x84, 0xFF
vertex    717,    205,    307,      0,      0,  0x88, 0x98, 0x84, 0xFF
vertex    717,      0,   -306,   3036,    990,  0x88, 0x98, 0x84, 0xFF
vertex    717,    205,   -306,   3036,      0,  0x88, 0x98, 0x84, 0xFF
vertex    717,      0,    307,      0,    990,  0x88, 0x98, 0x84, 0xFF

bits_seg7_dl_07007E18: # 0x07007E18 - 0x07007E60
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09007000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bits_seg7_vertex_07007C98, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

bits_seg7_dl_07007E60: # 0x07007E60 - 0x07007EC8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bits_seg7_texture_07001000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPVertex bits_seg7_vertex_07007D18, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 10, 11, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 15, 13, 0x0
gsSPEndDisplayList

glabel bits_seg7_dl_07007EC8 # 0x07007EC8 - 0x07007F58
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bits_seg7_dl_07007E18
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList bits_seg7_dl_07007E60
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
