bbh_seg7_vertex_07013AA0: # 0x07013AA0 - 0x07013B80
vertex   2140,   1126,   -306,    990,    990,  0xFF, 0x00, 0x00, 0x9A
vertex   2140,   1536,   -716,      0,      0,  0xFF, 0x00, 0x00, 0x9A
vertex   2140,   1126,   -716,      0,    990,  0xFF, 0x00, 0x00, 0x9A
vertex   1432,   1280,  -1519,    990,      0,  0xFF, 0x00, 0x00, 0x9A
vertex   1142,   1280,  -1229,      0,      0,  0xFF, 0x00, 0x00, 0x9A
vertex   1142,   1075,  -1229,      0,    480,  0xFF, 0x00, 0x00, 0x9A
vertex   1432,   1075,  -1519,    990,    480,  0xFF, 0x00, 0x00, 0x9A
vertex   1243,    928,  -1129,      0,    990,  0xFF, 0x00, 0x00, 0x9A
vertex   1533,    928,  -1418,    990,    990,  0xFF, 0x00, 0x00, 0x9A
vertex   2140,   1126,   -921,    990,    990,  0xFF, 0x00, 0x00, 0x9A
vertex   2140,   1536,  -1330,      0,      0,  0xFF, 0x00, 0x00, 0x9A
vertex   2140,   1126,  -1330,      0,    990,  0xFF, 0x00, 0x00, 0x9A
vertex   2140,   1536,   -921,    990,      0,  0xFF, 0x00, 0x00, 0x9A
vertex   2140,   1536,   -306,    990,      0,  0xFF, 0x00, 0x00, 0x9A

bbh_seg7_dl_07013B80: # 0x07013B80 - 0x07013BE8
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, spooky_0900A800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bbh_seg7_vertex_07013AA0, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  5,  7,  8, 0x0
gsSP2Triangles  5,  8,  6, 0x0,  9, 10, 11, 0x0
gsSP2Triangles  9, 12, 10, 0x0,  0, 13,  1, 0x0
gsSPEndDisplayList

glabel bbh_seg7_dl_07013BE8 # 0x07013BE8 - 0x07013C58
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bbh_seg7_dl_07013B80
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
