bbh_seg7_vertex_0700BA50: # 0x0700BA50 - 0x0700BB50
vertex   2739,    819,   2166,      0,    172,  0xFF, 0xEC, 0x40, 0x50
vertex   2739,   1203,   2550,      0,    786,  0xFF, 0xEC, 0x40, 0x50
vertex   2739,   1459,   2550,      0,    990,  0xFF, 0xEC, 0x40, 0x50
vertex   2739,      0,   2268,      0,    212,  0xFF, 0xEC, 0x40, 0x50
vertex   2739,    282,   2550,      0,    746,  0xFF, 0xEC, 0x40, 0x50
vertex   2739,    538,   2550,      0,    990,  0xFF, 0xEC, 0x40, 0x50
vertex   2739,      0,   2012,      0,      0,  0xFF, 0xEC, 0x40, 0x50
vertex   2995,      0,   2268,    990,    212,  0xFF, 0xEC, 0x40, 0x50
vertex   2995,    282,   2550,    990,    746,  0xFF, 0xEC, 0x40, 0x50
vertex   2995,    538,   2550,    990,    990,  0xFF, 0xEC, 0x40, 0x50
vertex   2995,      0,   2012,    990,      0,  0xFF, 0xEC, 0x40, 0x50
vertex   2739,    819,   1910,      0,      0,  0xFF, 0xEC, 0x40, 0x50
vertex   2995,    819,   2166,    990,    172,  0xFF, 0xEC, 0x40, 0x50
vertex   2995,    819,   1910,    990,      0,  0xFF, 0xEC, 0x40, 0x50
vertex   2995,   1459,   2550,    990,    990,  0xFF, 0xEC, 0x40, 0x50
vertex   2995,   1203,   2550,    990,    786,  0xFF, 0xEC, 0x40, 0x50

bbh_seg7_dl_0700BB50: # 0x0700BB50 - 0x0700BBF8
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, spooky_0900B000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bbh_seg7_vertex_0700BA50, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  4,  3, 0x0
gsSP2Triangles  7,  8,  4, 0x0,  6,  5,  9, 0x0
gsSP2Triangles  6,  9, 10, 0x0, 10,  8,  7, 0x0
gsSP2Triangles 10,  9,  8, 0x0,  0,  2, 11, 0x0
gsSP2Triangles 12,  1,  0, 0x0, 13, 14, 15, 0x0
gsSP2Triangles 12, 15,  1, 0x0, 11,  2, 14, 0x0
gsSP2Triangles 11, 14, 13, 0x0, 13, 15, 12, 0x0
gsSPEndDisplayList

glabel bbh_seg7_dl_0700BBF8 # 0x0700BBF8 - 0x0700BC68
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bbh_seg7_dl_0700BB50
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
