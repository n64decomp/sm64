bitfs_seg7_vertex_07009258: # 0x07009258 - 0x07009358
vertex    819,    205,    307,   1414,    308,  0x7D, 0x7D, 0x7D, 0xFF
vertex    512,      0,    614,      0,    990,  0x7D, 0x7D, 0x7D, 0xFF
vertex    819,      0,    307,   1414,    990,  0x7D, 0x7D, 0x7D, 0xFF
vertex    819,      0,   -307,      0,    990,  0x7D, 0x7D, 0x7D, 0xFF
vertex    512,    205,   -615,   1414,    308,  0x7D, 0x7D, 0x7D, 0xFF
vertex    819,    205,   -307,      0,    308,  0x7D, 0x7D, 0x7D, 0xFF
vertex    512,      0,   -615,   1414,    990,  0x7D, 0x7D, 0x7D, 0xFF
vertex   -511,    205,   -615,      0,    308,  0x7D, 0x7D, 0x7D, 0xFF
vertex   -511,      0,   -615,      0,    990,  0x7D, 0x7D, 0x7D, 0xFF
vertex   -818,      0,   -307,   1414,    990,  0x7D, 0x7D, 0x7D, 0xFF
vertex   -818,    205,   -307,   1414,    308,  0x7D, 0x7D, 0x7D, 0xFF
vertex   -818,      0,    307,   -454,    990,  0x7D, 0x7D, 0x7D, 0xFF
vertex   -511,    205,    614,    990,    308,  0x7D, 0x7D, 0x7D, 0xFF
vertex   -818,    205,    307,   -454,    308,  0x7D, 0x7D, 0x7D, 0xFF
vertex   -511,      0,    614,    990,    990,  0x7D, 0x7D, 0x7D, 0xFF
vertex    512,    205,    614,      0,    308,  0x7D, 0x7D, 0x7D, 0xFF

bitfs_seg7_vertex_07009358: # 0x07009358 - 0x07009458
vertex   -818,      0,    307,   2016,    990,  0x64, 0x64, 0x64, 0xFF
vertex   -818,    205,   -307,      0,    308,  0x64, 0x64, 0x64, 0xFF
vertex   -818,      0,   -307,      0,    990,  0x64, 0x64, 0x64, 0xFF
vertex   -818,    205,    307,   2016,    308,  0x64, 0x64, 0x64, 0xFF
vertex    819,      0,   -307,   2016,    990,  0x64, 0x64, 0x64, 0xFF
vertex    819,    205,   -307,   2016,    308,  0x64, 0x64, 0x64, 0xFF
vertex    819,    205,    307,      0,    308,  0x64, 0x64, 0x64, 0xFF
vertex    819,      0,    307,      0,    990,  0x64, 0x64, 0x64, 0xFF
vertex   -511,    205,   -615,   3374,    308,  0x8C, 0x8C, 0x8C, 0xFF
vertex    512,    205,   -615,      0,    308,  0x8C, 0x8C, 0x8C, 0xFF
vertex    512,      0,   -615,      0,    990,  0x8C, 0x8C, 0x8C, 0xFF
vertex   -511,      0,   -615,   3374,    990,  0x8C, 0x8C, 0x8C, 0xFF
vertex    512,    205,    614,   3374,    308,  0x8C, 0x8C, 0x8C, 0xFF
vertex   -511,      0,    614,      0,    990,  0x8C, 0x8C, 0x8C, 0xFF
vertex    512,      0,    614,   3374,    990,  0x8C, 0x8C, 0x8C, 0xFF
vertex   -511,    205,    614,      0,    308,  0x8C, 0x8C, 0x8C, 0xFF

bitfs_seg7_vertex_07009458: # 0x07009458 - 0x070094D8
vertex   -818,    205,   -307,    736,   2522,  0xFF, 0xFF, 0xFF, 0xFF
vertex    512,    205,    614,   1246,   -288,  0xFF, 0xFF, 0xFF, 0xFF
vertex    819,    205,    307,   2012,   -288,  0xFF, 0xFF, 0xFF, 0xFF
vertex    819,    205,   -307,   2780,    480,  0xFF, 0xFF, 0xFF, 0xFF
vertex    512,    205,   -615,   2780,   1244,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -511,    205,    614,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -511,    205,   -615,   1502,   2522,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -818,    205,    307,      0,   1754,  0xFF, 0xFF, 0xFF, 0xFF

bitfs_seg7_dl_070094D8: # 0x070094D8 - 0x07009588
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bitfs_seg7_texture_07001800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bitfs_seg7_vertex_07009258, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles 10,  7,  9, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0,  0, 15,  1, 0x0
gsSPVertex bitfs_seg7_vertex_07009358, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 10, 11, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 15, 13, 0x0
gsSPEndDisplayList

bitfs_seg7_dl_07009588: # 0x07009588 - 0x070095E0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09001800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bitfs_seg7_vertex_07009458, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  4, 0x0
gsSP2Triangles  0,  2,  3, 0x0,  0,  5,  1, 0x0
gsSP2Triangles  0,  4,  6, 0x0,  0,  7,  5, 0x0
gsSPEndDisplayList

glabel bitfs_seg7_dl_070095E0 # 0x070095E0 - 0x07009670
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bitfs_seg7_dl_070094D8
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bitfs_seg7_dl_07009588
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
