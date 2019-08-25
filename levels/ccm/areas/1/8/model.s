ccm_seg7_light_0700F800: # 0x0700F800 - 0x0700F808
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

ccm_seg7_light_0700F808: # 0x0700F808 - 0x0700F818
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ccm_seg7_vertex_0700F818: # 0x0700F818 - 0x0700F878
vertex   -177,    102,   -153,   2906,  -3104,  0x00, 0x7F, 0x00, 0xFF
vertex      0,    102,    154,   1832,  -4510,  0x00, 0x7F, 0x00, 0xFF
vertex    177,    102,     51,   1020,  -3890,  0x00, 0x7F, 0x00, 0xFF
vertex   -177,    102,     51,   2776,  -4116,  0x00, 0x7F, 0x00, 0xFF
vertex    177,    102,   -153,   1152,  -2876,  0x00, 0x7F, 0x00, 0xFF
vertex      0,    102,   -255,   2094,  -2482,  0x00, 0x7F, 0x00, 0xFF

ccm_seg7_vertex_0700F878: # 0x0700F878 - 0x0700F968
vertex    177,      0,     51,      0,    990,  0x3F, 0x00, 0x6D, 0xFF
vertex      0,    102,    154,   2012,      0,  0x3F, 0x00, 0x6D, 0xFF
vertex      0,      0,    154,   2012,    990,  0x3F, 0x00, 0x6D, 0xFF
vertex   -177,      0,   -153,   2012,    990,  0xC1, 0x00, 0x92, 0xFF
vertex   -177,    102,   -153,   2012,      0,  0xC1, 0x00, 0x92, 0xFF
vertex      0,    102,   -255,      0,      0,  0xC1, 0x00, 0x92, 0xFF
vertex      0,      0,   -255,      0,    990,  0xC1, 0x00, 0x92, 0xFF
vertex   -177,      0,     51,   2012,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -177,    102,     51,   2012,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -177,    102,   -153,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -177,      0,   -153,      0,    990,  0x81, 0x00, 0x00, 0xFF
vertex      0,      0,    154,   2012,    990,  0xC1, 0x00, 0x6D, 0xFF
vertex   -177,    102,     51,      0,      0,  0xC1, 0x00, 0x6D, 0xFF
vertex   -177,      0,     51,      0,    990,  0xC1, 0x00, 0x6D, 0xFF
vertex      0,    102,    154,   2012,      0,  0xC1, 0x00, 0x6D, 0xFF

ccm_seg7_vertex_0700F968: # 0x0700F968 - 0x0700FA18
vertex      0,      0,   -255,      0,    990,  0x3F, 0x00, 0x92, 0xFF
vertex      0,    102,   -255,      0,      0,  0x3F, 0x00, 0x92, 0xFF
vertex    177,    102,   -153,   2012,      0,  0x3F, 0x00, 0x92, 0xFF
vertex    177,      0,     51,      0,    990,  0x3F, 0x00, 0x6D, 0xFF
vertex    177,    102,     51,      0,      0,  0x3F, 0x00, 0x6D, 0xFF
vertex      0,    102,    154,   2012,      0,  0x3F, 0x00, 0x6D, 0xFF
vertex    177,      0,   -153,      0,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    177,    102,     51,   2012,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    177,      0,     51,   2012,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    177,    102,   -153,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    177,      0,   -153,   2012,    990,  0x3F, 0x00, 0x92, 0xFF

ccm_seg7_dl_0700FA18: # 0x0700FA18 - 0x0700FA70
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, snow_09008000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ccm_seg7_light_0700F808, 1
gsSPLight ccm_seg7_light_0700F800, 2
gsSPVertex ccm_seg7_vertex_0700F818, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  0,  2,  4, 0x0,  0,  4,  5, 0x0
gsSPEndDisplayList

ccm_seg7_dl_0700FA70: # 0x0700FA70 - 0x0700FB00
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, ccm_seg7_texture_07001900
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex ccm_seg7_vertex_0700F878, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 14, 12, 0x0
gsSPVertex ccm_seg7_vertex_0700F968, 11, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  9,  7, 0x0
gsSP1Triangle  0,  2, 10, 0x0
gsSPEndDisplayList

glabel ccm_seg7_dl_0700FB00 # 0x0700FB00 - 0x0700FB78
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ccm_seg7_dl_0700FA18
gsSPDisplayList ccm_seg7_dl_0700FA70
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
