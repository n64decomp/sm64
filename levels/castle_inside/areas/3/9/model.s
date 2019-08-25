inside_castle_seg7_vertex_07066D88: # 0x07066D88 - 0x07066E48
vertex   3731,  -2421,   -665,  -9300,  -2076,  0xFF, 0xFF, 0x00, 0x80
vertex   3731,  -2421,   -357,  -9300,   -542,  0xFF, 0xFF, 0x00, 0x80
vertex   3894,  -2297,   -511,  -8278,  -1310,  0xFF, 0xFF, 0x00, 0x80
vertex   4179,  -2079,   -511,  -6490,  -1310,  0xFF, 0xFF, 0x00, 0x80
vertex   4016,  -2204,   -665,  -7512,  -2076,  0xFF, 0xFF, 0x00, 0x80
vertex   4016,  -2204,   -357,  -7512,   -542,  0xFF, 0xFF, 0x00, 0x80
vertex   2011,  -2405,   -357,    318,   -544,  0xFF, 0xFF, 0x00, 0x80
vertex   2011,  -2405,   -665,    318,  -2076,  0xFF, 0xFF, 0x00, 0x80
vertex   1867,  -2261,   -511,   -702,  -1310,  0xFF, 0xFF, 0x00, 0x80
vertex   1722,  -2116,   -357,  -1724,   -544,  0xFF, 0xFF, 0x00, 0x80
vertex   1722,  -2116,   -665,  -1724,  -2076,  0xFF, 0xFF, 0x00, 0x80
vertex   1577,  -1971,   -511,  -2746,  -1310,  0xFF, 0xFF, 0x00, 0x80

inside_castle_seg7_dl_07066E48: # 0x07066E48 - 0x07066E90
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_0900B000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex inside_castle_seg7_vertex_07066D88, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSPEndDisplayList

glabel inside_castle_seg7_dl_07066E90 # 0x07066E90 - 0x07066F00
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList inside_castle_seg7_dl_07066E48
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
