ddd_seg7_vertex_07009190: # 0x07009190 - 0x070091D0
vertex   4941,  -1015,  -4187,   1118,   -288,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2893,  -1015,  -4187,   -158,   -288,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2893,  -3063,  -4187,   -158,   2264,  0xFF, 0xFF, 0xFF, 0xFF
vertex   4941,  -3063,  -4187,   1118,   2264,  0xFF, 0xFF, 0xFF, 0xFF

ddd_seg7_dl_070091D0: # 0x070091D0 - 0x07009208
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, ddd_seg7_texture_07000000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex ddd_seg7_vertex_07009190, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel ddd_seg7_dl_07009208 # 0x07009208 - 0x07009288
gsDPPipeSync
gsDPSetEnvColor 255, 255, 255, 128
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_ENVIRONMENT, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList ddd_seg7_dl_070091D0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsDPSetEnvColor 255, 255, 255, 255
gsSPEndDisplayList
