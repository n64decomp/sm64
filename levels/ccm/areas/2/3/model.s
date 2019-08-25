ccm_seg7_light_0701E610: # 0x0701E610 - 0x0701E618
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

ccm_seg7_light_0701E618: # 0x0701E618 - 0x0701E628
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ccm_seg7_vertex_0701E628: # 0x0701E628 - 0x0701E668
vertex  -6296,  -5836,  -6501,   3034,    990,  0x00, 0x7F, 0x00, 0xFF
vertex  -6706,  -5836,  -6297,  -1052,  -1054,  0x00, 0x7F, 0x00, 0xFF
vertex  -6296,  -5836,  -6297,   3034,  -1054,  0x00, 0x7F, 0x00, 0xFF
vertex  -6706,  -5836,  -6501,  -1052,    990,  0x00, 0x7F, 0x00, 0xFF

ccm_seg7_dl_0701E668: # 0x0701E668 - 0x0701E6B0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, ccm_seg7_texture_07004B00
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ccm_seg7_light_0701E618, 1
gsSPLight ccm_seg7_light_0701E610, 2
gsSPVertex ccm_seg7_vertex_0701E628, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel ccm_seg7_dl_0701E6B0 # 0x0701E6B0 - 0x0701E720
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ccm_seg7_dl_0701E668
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
