ccm_seg7_vertex_0700E790: # 0x0700E790 - 0x0700E850
vertex    433,   -204,   -410,   4566,    224,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -488,    -50,   -410,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    433,    -50,   -410,   4566,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -488,   -204,   -410,      0,    224,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -488,   -204,   -103,   1528,    224,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -488,    -50,   -410,     -6,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -488,   -204,   -410,     -6,    224,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -488,    -50,   -103,   1528,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -488,    -50,    203,    680,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -488,   -204,    357,   1446,    224,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -488,    -50,    357,   1446,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -488,   -204,    203,    680,    224,  0xFF, 0xFF, 0xFF, 0xFF

ccm_seg7_vertex_0700E850: # 0x0700E850 - 0x0700E8D0
vertex    433,     41,   -195,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -355,     -9,   -195,  15708,    -34,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -355,     41,   -195,  15708,    988,  0xFF, 0xFF, 0xFF, 0xFF
vertex    433,     -9,   -195,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -355,     41,   -195,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -355,     -9,   -195,    -40,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -355,     72,    357,  11112,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -355,    123,    357,  11128,    990,  0xFF, 0xFF, 0xFF, 0xFF

ccm_seg7_dl_0700E8D0: # 0x0700E8D0 - 0x0700E928
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, snow_09000000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex ccm_seg7_vertex_0700E790, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSPEndDisplayList

ccm_seg7_dl_0700E928: # 0x0700E928 - 0x0700E970
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, snow_09007000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPVertex ccm_seg7_vertex_0700E850, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSPEndDisplayList

glabel ccm_seg7_dl_0700E970 # 0x0700E970 - 0x0700EA00
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ccm_seg7_dl_0700E8D0
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList ccm_seg7_dl_0700E928
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
