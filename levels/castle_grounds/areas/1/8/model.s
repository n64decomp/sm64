castle_grounds_seg7_vertex_0700BBF0: # 0x0700BBF0 - 0x0700BC30
vertex   2283,     65,   2072,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2485,     65,   2072,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2485,     65,   1849,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2283,     65,   1849,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF

castle_grounds_seg7_dl_0700BC30: # 0x0700BC30 - 0x0700BC68
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, outside_09005800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex castle_grounds_seg7_vertex_0700BBF0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel castle_grounds_seg7_dl_0700BC68 # 0x0700BC68 - 0x0700BCD8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList castle_grounds_seg7_dl_0700BC30
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
