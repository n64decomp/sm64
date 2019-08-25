bitfs_seg7_vertex_07011C18: # 0x07011C18 - 0x07011D18
vertex   -511,    179,    307,      0,    990,  0xC8, 0xC8, 0xC8, 0xFF
vertex    512,    179,    307,   1672,   -714,  0xC8, 0xC8, 0xC8, 0xFF
vertex    512,    179,   -306,   2694,    308,  0xC8, 0xC8, 0xC8, 0xFF
vertex   -511,    179,   -306,    990,   2010,  0xC8, 0xC8, 0xC8, 0xFF
vertex    512,     26,    307,   1672,   -714,  0x44, 0x44, 0x44, 0xFF
vertex   -511,     26,    307,      0,    990,  0x44, 0x44, 0x44, 0xFF
vertex   -511,     26,   -306,    990,   2010,  0x44, 0x44, 0x44, 0xFF
vertex    512,     26,   -306,   2694,    308,  0x44, 0x44, 0x44, 0xFF
vertex    512,    179,    307,    478,    478,  0x64, 0x64, 0x64, 0xFF
vertex    512,     26,   -306,   1246,   1754,  0x64, 0x64, 0x64, 0xFF
vertex    512,    179,   -306,   1500,   1498,  0x64, 0x64, 0x64, 0xFF
vertex    512,     26,    307,    224,    734,  0x64, 0x64, 0x64, 0xFF
vertex   -511,    179,    307,    478,    478,  0x64, 0x64, 0x64, 0xFF
vertex   -511,    179,   -306,   1500,   1498,  0x64, 0x64, 0x64, 0xFF
vertex   -511,     26,   -306,   1246,   1754,  0x64, 0x64, 0x64, 0xFF
vertex   -511,     26,    307,    224,    734,  0x64, 0x64, 0x64, 0xFF

bitfs_seg7_vertex_07011D18: # 0x07011D18 - 0x07011D98
vertex   -511,     26,    307,  -1988,  -1480,  0x8C, 0x8C, 0x8C, 0xFF
vertex    512,    179,    307,      0,      0,  0x8C, 0x8C, 0x8C, 0xFF
vertex   -511,    179,    307,  -1734,  -1736,  0x8C, 0x8C, 0x8C, 0xFF
vertex    512,     26,    307,   -286,    224,  0x8C, 0x8C, 0x8C, 0xFF
vertex   -511,    179,   -306,  -1734,  -1736,  0x8C, 0x8C, 0x8C, 0xFF
vertex    512,     26,   -306,   -286,    224,  0x8C, 0x8C, 0x8C, 0xFF
vertex   -511,     26,   -306,  -1988,  -1480,  0x8C, 0x8C, 0x8C, 0xFF
vertex    512,    179,   -306,      0,      0,  0x8C, 0x8C, 0x8C, 0xFF

glabel bitfs_seg7_dl_07011D98 # 0x07011D98 - 0x07011E28
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09001800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bitfs_seg7_vertex_07011C18, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 14, 15, 0x0
gsSPVertex bitfs_seg7_vertex_07011D18, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

glabel bitfs_seg7_dl_07011E28 # 0x07011E28 - 0x07011E98
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bitfs_seg7_dl_07011D98
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
