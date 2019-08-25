bbh_seg7_vertex_070175E0: # 0x070175E0 - 0x070176E0
vertex   -229,   1815,    466,      0,    -48,  0xFF, 0xEC, 0x40, 0x84
vertex   -229,   2429,   1080,      0,    974,  0xFF, 0xEC, 0x40, 0x84
vertex   -229,   2619,    909,      0,    990,  0xFF, 0xEC, 0x40, 0x84
vertex   1306,   2005,    295,      0,      0,  0xFF, 0xEC, 0x40, 0x84
vertex   1306,   2619,    909,      0,    990,  0xFF, 0xEC, 0x40, 0x84
vertex   1562,   2619,    909,    990,    990,  0xFF, 0xEC, 0x40, 0x84
vertex   1562,   2005,    295,    990,      0,  0xFF, 0xEC, 0x40, 0x84
vertex   1306,   1815,    466,      0,    -48,  0xFF, 0xEC, 0x40, 0x84
vertex   1306,   2429,   1080,      0,    974,  0xFF, 0xEC, 0x40, 0x84
vertex   1562,   2429,   1080,    990,    974,  0xFF, 0xEC, 0x40, 0x84
vertex   1562,   1815,    466,    990,    -48,  0xFF, 0xEC, 0x40, 0x84
vertex   -229,   2005,    295,      0,      0,  0xFF, 0xEC, 0x40, 0x84
vertex     26,   1815,    466,    990,    -48,  0xFF, 0xEC, 0x40, 0x84
vertex     26,   2005,    295,    990,      0,  0xFF, 0xEC, 0x40, 0x84
vertex     26,   2619,    909,    990,    990,  0xFF, 0xEC, 0x40, 0x84
vertex     26,   2429,   1080,    990,    974,  0xFF, 0xEC, 0x40, 0x84

bbh_seg7_dl_070176E0: # 0x070176E0 - 0x07017788
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, spooky_0900B000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bbh_seg7_vertex_070175E0, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  4,  3, 0x0
gsSP2Triangles  7,  8,  4, 0x0,  6,  5,  9, 0x0
gsSP2Triangles  6,  9, 10, 0x0, 10,  9,  8, 0x0
gsSP2Triangles 10,  8,  7, 0x0,  0,  2, 11, 0x0
gsSP2Triangles 12,  1,  0, 0x0, 13, 14, 15, 0x0
gsSP2Triangles 12, 15,  1, 0x0, 11,  2, 14, 0x0
gsSP2Triangles 11, 14, 13, 0x0, 13, 15, 12, 0x0
gsSPEndDisplayList

glabel bbh_seg7_dl_07017788 # 0x07017788 - 0x070177F8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bbh_seg7_dl_070176E0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
