bits_seg7_vertex_07007B60: # 0x07007B60 - 0x07007BE0
vertex   -716,      0,   -306,    480,    990,  0xFF, 0xD4, 0x00, 0xFF
vertex    717,      0,   -306,  14788,    990,  0xFF, 0xD4, 0x00, 0xFF
vertex    717,    102,   -306,  14788,      0,  0xFF, 0xD4, 0x00, 0xFF
vertex   -716,    102,   -306,    480,      0,  0xFF, 0xD4, 0x00, 0xFF
vertex   -716,      0,    307,    480,    990,  0xFF, 0xD4, 0x00, 0xFF
vertex    717,      0,    307,  14788,    990,  0xFF, 0xD4, 0x00, 0xFF
vertex    717,    102,    307,  14788,      0,  0xFF, 0xD4, 0x00, 0xFF
vertex   -716,    102,    307,    480,      0,  0xFF, 0xD4, 0x00, 0xFF

bits_seg7_dl_07007BE0: # 0x07007BE0 - 0x07007C28
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09005000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bits_seg7_vertex_07007B60, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSPEndDisplayList

glabel bits_seg7_dl_07007C28 # 0x07007C28 - 0x07007C98
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bits_seg7_dl_07007BE0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
