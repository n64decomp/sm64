bits_seg7_vertex_070129A8: # 0x070129A8 - 0x07012AA8
vertex    307,    205,    287,   2012,  -1054,  0xB1, 0xBF, 0xFA, 0xFF
vertex    307,    205,   -286,   3442,    376,  0xB1, 0xBF, 0xFA, 0xFF
vertex   -511,    205,   -286,   1398,   2418,  0xB1, 0xBF, 0xFA, 0xFF
vertex   -511,    205,    287,      0,    990,  0xB1, 0xBF, 0xFA, 0xFF
vertex   -511,    205,    287,   1910,     70,  0x8C, 0x98, 0xD8, 0xFF
vertex   -511,    205,   -286,    478,   1498,  0x8C, 0x98, 0xD8, 0xFF
vertex   -511,      0,   -286,      0,    990,  0x8C, 0x98, 0xD8, 0xFF
vertex   -511,      0,    287,   1398,   -440,  0x8C, 0x98, 0xD8, 0xFF
vertex    307,    205,    287,   2524,   2522,  0x52, 0x61, 0xAC, 0xFF
vertex   -511,      0,    287,      0,    990,  0x52, 0x61, 0xAC, 0xFF
vertex    307,      0,    287,   2012,   3032,  0x52, 0x61, 0xAC, 0xFF
vertex   -511,    205,    287,    480,    480,  0x52, 0x61, 0xAC, 0xFF
vertex    307,      0,   -286,   2012,   3032,  0x52, 0x61, 0xAC, 0xFF
vertex   -511,    205,   -286,    478,    480,  0x52, 0x61, 0xAC, 0xFF
vertex    307,    205,   -286,   2524,   2522,  0x52, 0x61, 0xAC, 0xFF
vertex   -511,      0,   -286,      0,    990,  0x52, 0x61, 0xAC, 0xFF

bits_seg7_dl_07012AA8: # 0x07012AA8 - 0x07012B10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09007000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bits_seg7_vertex_070129A8, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 15, 13, 0x0
gsSPEndDisplayList

glabel bits_seg7_dl_07012B10 # 0x07012B10 - 0x07012B80
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bits_seg7_dl_07012AA8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
