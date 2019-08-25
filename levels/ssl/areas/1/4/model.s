ssl_seg7_vertex_0700BC88: # 0x0700BC88 - 0x0700BCC8
vertex  -6143,      0,  -4697,    990,      0,  0xFF, 0xFF, 0xFF, 0xC8
vertex  -5836,      0,  -4697,      0,      0,  0xFF, 0xFF, 0xFF, 0xC8
vertex  -5836,      0,  -5004,      0,    990,  0xFF, 0xFF, 0xFF, 0xC8
vertex  -6143,      0,  -5004,    990,    990,  0xFF, 0xFF, 0xFF, 0xC8

ssl_seg7_dl_0700BCC8: # 0x0700BCC8 - 0x0700BD00
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, ssl_seg7_texture_07000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex ssl_seg7_vertex_0700BC88, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel ssl_seg7_dl_0700BD00 # 0x0700BD00 - 0x0700BD70
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ssl_seg7_dl_0700BCC8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
