thi_seg7_vertex_070079D0: # 0x070079D0 - 0x07007AB0
vertex   -101,   2458,    102,    376,    990,  0xFF, 0xFF, 0xFF, 0x80
vertex    102,   3072,    102,      0,    744,  0xFF, 0xFF, 0xFF, 0x80
vertex    102,   2458,    102,      0,    990,  0xFF, 0xFF, 0xFF, 0x80
vertex    614,   1024,   2048,    274,    662,  0xFF, 0xFF, 0xFF, 0x80
vertex    614,   1229,   2048,     70,    662,  0xFF, 0xFF, 0xFF, 0x80
vertex    717,   1331,   1229,      0,    990,  0xFF, 0xFF, 0xFF, 0x80
vertex    717,    922,   1229,    376,    990,  0xFF, 0xFF, 0xFF, 0x80
vertex    307,   1331,   1229,      0,    990,  0xFF, 0xFF, 0xFF, 0x80
vertex    410,   1024,   2048,    274,    662,  0xFF, 0xFF, 0xFF, 0x80
vertex    307,    922,   1229,    376,    990,  0xFF, 0xFF, 0xFF, 0x80
vertex    410,   1229,   2048,     70,    662,  0xFF, 0xFF, 0xFF, 0x80
vertex    614,   1229,   2048,     70,    716,  0xFF, 0xFF, 0xFF, 0x80
vertex    410,   1229,   2048,    274,    716,  0xFF, 0xFF, 0xFF, 0x80
vertex    307,   1331,   1229,    376,    990,  0xFF, 0xFF, 0xFF, 0x80

thi_seg7_vertex_07007AB0: # 0x07007AB0 - 0x07007B80
vertex    102,   2458,    102,    376,    990,  0xFF, 0xFF, 0xFF, 0x80
vertex    102,   3072,   -101,     70,    762,  0xFF, 0xFF, 0xFF, 0x80
vertex    102,   2458,   -101,      0,    990,  0xFF, 0xFF, 0xFF, 0x80
vertex   -101,   2458,    102,    376,    990,  0xFF, 0xFF, 0xFF, 0x80
vertex   -101,   3072,    102,    376,    744,  0xFF, 0xFF, 0xFF, 0x80
vertex    102,   3072,    102,      0,    744,  0xFF, 0xFF, 0xFF, 0x80
vertex    102,   3072,   -101,      0,    744,  0xFF, 0xFF, 0xFF, 0x80
vertex   -101,   3072,   -101,    376,    744,  0xFF, 0xFF, 0xFF, 0x80
vertex   -101,   2458,   -101,    376,    990,  0xFF, 0xFF, 0xFF, 0x80
vertex   -101,   3072,   -101,    274,    762,  0xFF, 0xFF, 0xFF, 0x80
vertex   -101,   3072,    102,     70,    762,  0xFF, 0xFF, 0xFF, 0x80
vertex   -101,   2458,    102,      0,    990,  0xFF, 0xFF, 0xFF, 0x80
vertex    102,   3072,    102,    274,    762,  0xFF, 0xFF, 0xFF, 0x80

thi_seg7_dl_07007B80: # 0x07007B80 - 0x07007C20
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, grass_0900B800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex thi_seg7_vertex_070079D0, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  3,  5, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0,  5, 11, 12, 0x0
gsSP1Triangle  5, 12, 13, 0x0
gsSPVertex thi_seg7_vertex_07007AB0, 13, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  2,  6,  7, 0x0,  2,  7,  8, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 10, 11, 0x0
gsSP1Triangle  0, 12,  1, 0x0
gsSPEndDisplayList

glabel thi_seg7_dl_07007C20 # 0x07007C20 - 0x07007C90
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList thi_seg7_dl_07007B80
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
