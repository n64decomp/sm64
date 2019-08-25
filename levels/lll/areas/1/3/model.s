lll_seg7_vertex_07013830: # 0x07013830 - 0x070138B0
vertex  -3839,    307,   3328,    992,    992,  0x00, 0x7F, 0x00, 0xFF
vertex  -4095,    307,   3328,    992,      0,  0x00, 0x7F, 0x00, 0xFF
vertex  -4095,    307,   3584,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex  -3839,    307,   3584,      0,    992,  0x00, 0x7F, 0x00, 0xFF
vertex   1536,    307,   3584,    992,    992,  0x00, 0x7F, 0x00, 0xFF
vertex   1280,    307,   3840,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex   1536,    307,   3840,      0,    992,  0x00, 0x7F, 0x00, 0xFF
vertex   1280,    307,   3584,    992,      0,  0x00, 0x7F, 0x00, 0xFF

lll_seg7_dl_070138B0: # 0x070138B0 - 0x070138F8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fire_09000000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex lll_seg7_vertex_07013830, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

glabel lll_seg7_dl_070138F8 # 0x070138F8 - 0x07013968
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING | G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList lll_seg7_dl_070138B0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_SHADING_SMOOTH
gsSPEndDisplayList
