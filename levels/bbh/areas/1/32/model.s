bbh_seg7_vertex_0701A008: # 0x0701A008 - 0x0701A048
vertex    640,  -1433,   1536,  -1564,  -2588,  0xFF, 0xFF, 0xFF, 0xFF
vertex    640,  -2354,   1536,   3034,   2010,  0xFF, 0xFF, 0xFF, 0xFF
vertex    640,  -2354,   2048,    480,   4564,  0xFF, 0xFF, 0xFF, 0xFF
vertex    640,  -1433,   2048,  -4118,      0,  0xFF, 0xFF, 0xFF, 0xFF

bbh_seg7_dl_0701A048: # 0x0701A048 - 0x0701A080
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09000000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bbh_seg7_vertex_0701A008, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel bbh_seg7_dl_0701A080 # 0x0701A080 - 0x0701A0F0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bbh_seg7_dl_0701A048
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
