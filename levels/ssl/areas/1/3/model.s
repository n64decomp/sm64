ssl_seg7_light_0700BAD8: # 0x0700BAD8 - 0x0700BAE0
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

ssl_seg7_light_0700BAE0: # 0x0700BAE0 - 0x0700BAF0
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ssl_seg7_vertex_0700BAF0: # 0x0700BAF0 - 0x0700BBB0
vertex  -1023,      0,   2048,      0,  -5142,  0x6D, 0x00, 0x3F, 0xFF
vertex  -1535,    768,   2935,   8144,    990,  0x6D, 0x00, 0x3F, 0xFF
vertex  -1535,      0,   2935,   8144,  -5142,  0x6D, 0x00, 0x3F, 0xFF
vertex  -1023,    768,   2048,      0,    990,  0x6D, 0x00, 0x3F, 0xFF
vertex  -1535,      0,   2935,      0,  -5142,  0x6D, 0x00, 0xC1, 0xFF
vertex  -1023,    768,   3822,   8144,    990,  0x6D, 0x00, 0xC1, 0xFF
vertex  -1023,      0,   3822,   8144,  -5142,  0x6D, 0x00, 0xC1, 0xFF
vertex  -1535,    768,   2935,      0,    990,  0x6D, 0x00, 0xC1, 0xFF
vertex  -1023,      0,   2048,   8144,   2010,  0x7F, 0x00, 0x00, 0xFF
vertex  -1023,    256,   1024,      0,   4054,  0x7F, 0x00, 0x00, 0xFF
vertex  -1023,    768,   2048,   8144,   8142,  0x7F, 0x00, 0x00, 0xFF
vertex  -1023,   -255,   1024,      0,      0,  0x7F, 0x00, 0x00, 0xFF

ssl_seg7_dl_0700BBB0: # 0x0700BBB0 - 0x0700BC18
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, generic_09000000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ssl_seg7_light_0700BAE0, 1
gsSPLight ssl_seg7_light_0700BAD8, 2
gsSPVertex ssl_seg7_vertex_0700BAF0, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSPEndDisplayList

glabel ssl_seg7_dl_0700BC18 # 0x0700BC18 - 0x0700BC88
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ssl_seg7_dl_0700BBB0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsSPEndDisplayList
