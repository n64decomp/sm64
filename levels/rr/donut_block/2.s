rr_seg7_vertex_0701B8B8: # 0x0701B8B8 - 0x0701B938
vertex     61,    143,    317,    990,      0,  0xC7, 0xA2, 0x68, 0xFF
vertex    -60,     20,    317,      0,    990,  0xC7, 0xA2, 0x68, 0xFF
vertex     61,     20,    317,    990,    990,  0xC7, 0xA2, 0x68, 0xFF
vertex    -60,    143,    317,      0,      0,  0xC7, 0xA2, 0x68, 0xFF
vertex     61,     20,   -316,    990,    990,  0xC7, 0xA2, 0x68, 0xFF
vertex    -60,    143,   -316,      0,      0,  0xC7, 0xA2, 0x68, 0xFF
vertex     61,    143,   -316,    990,      0,  0xC7, 0xA2, 0x68, 0xFF
vertex    -60,     20,   -316,      0,    990,  0xC7, 0xA2, 0x68, 0xFF

rr_seg7_dl_0701B938: # 0x0701B938 - 0x0701B980
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_metal_hole
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex rr_seg7_vertex_0701B8B8, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

glabel rr_seg7_dl_0701B980 # 0x0701B980 - 0x0701B9F0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList rr_seg7_dl_0701B938
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
