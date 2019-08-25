ccm_seg7_vertex_07013730: # 0x07013730 - 0x070137B0
vertex    120,     40,    177,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex     41,     40,    200,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    120,    -41,    176,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex     41,    -41,    198,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -119,    -41,    176,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -40,    -41,    198,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -40,     40,    200,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -119,     40,    177,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

ccm_seg7_vertex_070137B0: # 0x070137B0 - 0x070137F0
vertex     51,    -68,    195,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -50,    -68,    195,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -50,   -118,    159,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex     51,   -118,    159,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF

ccm_seg7_dl_070137F0: # 0x070137F0 - 0x07013838
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, ccm_seg7_texture_07002900
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex ccm_seg7_vertex_07013730, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSPEndDisplayList

ccm_seg7_dl_07013838: # 0x07013838 - 0x07013870
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, ccm_seg7_texture_07002100
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex ccm_seg7_vertex_070137B0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel ccm_seg7_dl_07013870 # 0x07013870 - 0x070138E8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ccm_seg7_dl_070137F0
gsSPDisplayList ccm_seg7_dl_07013838
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
