rr_seg7_vertex_0701A608: # 0x0701A608 - 0x0701A648
vertex    227,      4,      5,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -79,      0,     -1,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    214,   -397,    947,   2012,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -93,   -402,    940,   2012,    990,  0xFF, 0xFF, 0xFF, 0xFF

rr_seg7_dl_0701A648: # 0x0701A648 - 0x0701A680
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, rr_seg7_texture_07000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPVertex rr_seg7_vertex_0701A608, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSPEndDisplayList

glabel rr_seg7_dl_0701A680 # 0x0701A680 - 0x0701A6F0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList rr_seg7_dl_0701A648
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
