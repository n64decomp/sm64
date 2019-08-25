ccm_seg7_light_07010A60: # 0x07010A60 - 0x07010A68
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

ccm_seg7_light_07010A68: # 0x07010A68 - 0x07010A78
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ccm_seg7_vertex_07010A78: # 0x07010A78 - 0x07010AF8
vertex    -55,    540,    574,   -912,   4482,  0x01, 0x7E, 0x00, 0xFF
vertex  -1163,    553,    677,    308,    990,  0x01, 0x7E, 0x00, 0xFF
vertex  -1120,    553,    770,      0,    990,  0x01, 0x7E, 0x00, 0xFF
vertex    -12,    540,    667,  -1254,   4482,  0x01, 0x7E, 0x00, 0xFF
vertex  -1799,    553,    517,   1672,   -714,  0x00, 0x7F, 0x00, 0xFF
vertex  -1120,    553,    770,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex  -1333,    553,    304,   1672,    990,  0x00, 0x7F, 0x00, 0xFF
vertex  -1586,    553,    983,      0,   -714,  0x00, 0x7F, 0x00, 0xFF

ccm_seg7_dl_07010AF8: # 0x07010AF8 - 0x07010B50
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, snow_09000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ccm_seg7_light_07010A68, 1
gsSPLight ccm_seg7_light_07010A60, 2
gsSPVertex ccm_seg7_vertex_07010A78, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

glabel ccm_seg7_dl_07010B50 # 0x07010B50 - 0x07010BD0
gsDPPipeSync
gsDPSetEnvColor 255, 255, 255, 90
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ccm_seg7_dl_07010AF8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetEnvColor 255, 255, 255, 255
gsSPEndDisplayList
