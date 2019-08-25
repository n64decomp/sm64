ttm_seg7_light_0700CB60: # 0x0700CB60 - 0x0700CB68
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

ttm_seg7_light_0700CB68: # 0x0700CB68 - 0x0700CB78
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ttm_seg7_light_0700CB78: # 0x0700CB78 - 0x0700CB80
.byte 0x5D, 0x5D, 0x5D, 0x00, 0x5D, 0x5D, 0x5D, 0x00

ttm_seg7_light_0700CB80: # 0x0700CB80 - 0x0700CB90
.byte 0xBB, 0xBB, 0xBB, 0x00, 0xBB, 0xBB, 0xBB, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ttm_seg7_vertex_0700CB90: # 0x0700CB90 - 0x0700CBF0
vertex   -323,   -387,    -61,   8458,  -5948,  0x9C, 0xF1, 0x4B, 0xFF
vertex    -30,    389,    495,   9592,  -7498,  0x9C, 0xF1, 0x4B, 0xFF
vertex   -224,    389,    235,   8972,  -7498,  0x9C, 0xF1, 0x4B, 0xFF
vertex   -323,   -387,    -61,   8458,  -5948,  0xC2, 0xD1, 0x63, 0xFF
vertex    377,    389,    751,  10552,  -7498,  0xC2, 0xD1, 0x63, 0xFF
vertex    -30,    389,    495,   9592,  -7498,  0xC2, 0xD1, 0x63, 0xFF

ttm_seg7_vertex_0700CBF0: # 0x0700CBF0 - 0x0700CC20
vertex   -323,   -387,    -61,    974,  -2960,  0x82, 0x0D, 0x07, 0xFF
vertex   -224,    389,    235,   1654,  -4488,  0x82, 0x0D, 0x07, 0xFF
vertex   -282,    389,   -714,   -132,  -4554,  0x82, 0x0D, 0x07, 0xFF

ttm_seg7_vertex_0700CC20: # 0x0700CC20 - 0x0700CC60
vertex    377,    389,    751,   7672,  -3032,  0x00, 0x7F, 0x00, 0xFF
vertex   -224,    389,    235,   6470,  -4062,  0x00, 0x7F, 0x00, 0xFF
vertex    -30,    389,    495,   6856,  -3544,  0x00, 0x7F, 0x00, 0xFF
vertex   -282,    389,   -714,   6352,  -5960,  0x00, 0x7F, 0x00, 0xFF

ttm_seg7_dl_0700CC60: # 0x0700CC60 - 0x0700CCC8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mountain_09004000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ttm_seg7_light_0700CB68, 1
gsSPLight ttm_seg7_light_0700CB60, 2
gsSPVertex ttm_seg7_vertex_0700CB90, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPLight ttm_seg7_light_0700CB80, 1
gsSPLight ttm_seg7_light_0700CB78, 2
gsSPVertex ttm_seg7_vertex_0700CBF0, 3, 0
gsSP1Triangle  0,  1,  2, 0x0
gsSPEndDisplayList

ttm_seg7_dl_0700CCC8: # 0x0700CCC8 - 0x0700CD10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mountain_09003800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ttm_seg7_light_0700CB68, 1
gsSPLight ttm_seg7_light_0700CB60, 2
gsSPVertex ttm_seg7_vertex_0700CC20, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel ttm_seg7_dl_0700CD10 # 0x0700CD10 - 0x0700CD88
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ttm_seg7_dl_0700CC60
gsSPDisplayList ttm_seg7_dl_0700CCC8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
