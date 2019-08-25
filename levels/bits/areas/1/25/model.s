bits_seg7_vertex_07013CE8: # 0x07013CE8 - 0x07013DE8
vertex   -460,    102,   -306,    990,    -10,  0x7D, 0x7D, 0x7D, 0xFF
vertex    461,      0,   -306,    990,    968,  0x7D, 0x7D, 0x7D, 0xFF
vertex   -460,      0,   -306,    990,    -10,  0x7D, 0x7D, 0x7D, 0xFF
vertex    461,    102,   -306,    990,    968,  0x7D, 0x7D, 0x7D, 0xFF
vertex   -460,      0,    307,      0,    -10,  0x7D, 0x7D, 0x7D, 0xFF
vertex    461,      0,    307,      0,    968,  0x7D, 0x7D, 0x7D, 0xFF
vertex    461,    102,    307,      0,    968,  0x7D, 0x7D, 0x7D, 0xFF
vertex   -460,    102,    307,      0,    -10,  0x7D, 0x7D, 0x7D, 0xFF
vertex   -460,      0,   -306,    990,    -10,  0x55, 0x55, 0x55, 0xFF
vertex    461,      0,    307,      0,    968,  0x55, 0x55, 0x55, 0xFF
vertex   -460,      0,    307,      0,    -10,  0x55, 0x55, 0x55, 0xFF
vertex    461,      0,   -306,    990,    968,  0x55, 0x55, 0x55, 0xFF
vertex    461,    102,   -306,    990,    968,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -460,    102,   -306,    990,    -10,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -460,    102,    307,      0,    -10,  0xFF, 0xFF, 0xFF, 0xFF
vertex    461,    102,    307,      0,    968,  0xFF, 0xFF, 0xFF, 0xFF

bits_seg7_vertex_07013DE8: # 0x07013DE8 - 0x07013E68
vertex   -460,      0,    307,      0,    -10,  0x96, 0x96, 0x96, 0xFF
vertex   -460,    102,   -306,    990,    -10,  0x96, 0x96, 0x96, 0xFF
vertex   -460,      0,   -306,    990,    -10,  0x96, 0x96, 0x96, 0xFF
vertex   -460,    102,    307,      0,    -10,  0x96, 0x96, 0x96, 0xFF
vertex    461,    102,   -306,    990,    968,  0x96, 0x96, 0x96, 0xFF
vertex    461,      0,    307,      0,    968,  0x96, 0x96, 0x96, 0xFF
vertex    461,      0,   -306,    990,    968,  0x96, 0x96, 0x96, 0xFF
vertex    461,    102,    307,      0,    968,  0x96, 0x96, 0x96, 0xFF

bits_seg7_dl_07013E68: # 0x07013E68 - 0x07013EF8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bits_seg7_texture_07002000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bits_seg7_vertex_07013CE8, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 14, 15, 0x0
gsSPVertex bits_seg7_vertex_07013DE8, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

glabel bits_seg7_dl_07013EF8 # 0x07013EF8 - 0x07013F68
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bits_seg7_dl_07013E68
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
