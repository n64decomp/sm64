thi_seg7_vertex_07007430: # 0x07007430 - 0x070074D0
vertex   1690,   -460,    922,      0,      0,  0x00, 0x00, 0x00, 0xB4
vertex   1690,   -460,    615,      0,    606,  0x00, 0x00, 0x00, 0xB4
vertex   1229,   -460,    922,    926,      0,  0x00, 0x00, 0x00, 0xB4
vertex   1690,   -153,    615,      0,    606,  0x00, 0x00, 0x00, 0xB4
vertex   1229,   -153,    922,    926,      0,  0x00, 0x00, 0x00, 0xB4
vertex   1505,   -153,    430,    352,    990,  0x00, 0x00, 0x00, 0xB4
vertex   1242,    -68,    497,    990,    990,  0x00, 0x00, 0x00, 0xB4
vertex   1198,   -153,    635,    990,    564,  0x00, 0x00, 0x00, 0xB4
vertex   1690,   -153,    430,      0,    990,  0x00, 0x00, 0x00, 0xB4
vertex   1198,   -153,    922,    990,      0,  0x00, 0x00, 0x00, 0xB4

thi_seg7_dl_070074D0: # 0x070074D0 - 0x07007538
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, grass_0900B000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex thi_seg7_vertex_07007430, 10, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  2,  1, 0x0
gsSP2Triangles  3,  4,  2, 0x0,  5,  6,  7, 0x0
gsSP2Triangles  5,  3,  8, 0x0,  5,  4,  3, 0x0
gsSP2Triangles  5,  9,  4, 0x0,  5,  7,  9, 0x0
gsSPEndDisplayList

glabel thi_seg7_dl_07007538 # 0x07007538 - 0x070075A8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList thi_seg7_dl_070074D0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
