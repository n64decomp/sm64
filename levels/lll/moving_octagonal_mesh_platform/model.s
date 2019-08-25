lll_seg7_vertex_07017FB0: # 0x07017FB0 - 0x07018090
vertex   -255,    154,    128,   -542,    478,  0x00, 0x81, 0x00, 0xFF
vertex   -255,    154,   -127,   -542,   -544,  0x00, 0x81, 0x00, 0xFF
vertex   -127,    154,   -255,      0,  -1054,  0x00, 0x81, 0x00, 0xFF
vertex   -127,    154,   -255,      0,  -1054,  0x00, 0x7F, 0x00, 0xFF
vertex    256,    154,   -127,   1502,   -544,  0x00, 0x7F, 0x00, 0xFF
vertex    128,    154,   -255,    990,  -1054,  0x00, 0x7F, 0x00, 0xFF
vertex    256,    154,    128,   1502,    478,  0x00, 0x7F, 0x00, 0xFF
vertex    128,    154,    256,    990,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   -127,    154,    256,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   -255,    154,    128,   -542,    478,  0x00, 0x7F, 0x00, 0xFF
vertex   -255,    154,   -127,   -542,   -544,  0x00, 0x7F, 0x00, 0xFF
vertex    128,      0,   -255,      0,    582,  0x59, 0x00, 0xA7, 0xFF
vertex    128,    154,   -255,      0,      0,  0x59, 0x00, 0xA7, 0xFF
vertex    256,    154,   -127,   -542,      0,  0x59, 0x00, 0xA7, 0xFF

lll_seg7_vertex_07018090: # 0x07018090 - 0x07018180
vertex   -127,      0,   -255,    990,    582,  0x00, 0x00, 0x81, 0xFF
vertex    128,    154,   -255,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex    128,      0,   -255,      0,    582,  0x00, 0x00, 0x81, 0xFF
vertex    128,      0,   -255,      0,    582,  0x59, 0x00, 0xA7, 0xFF
vertex    256,    154,   -127,   -542,      0,  0x59, 0x00, 0xA7, 0xFF
vertex    256,      0,   -127,   -542,    582,  0x59, 0x00, 0xA7, 0xFF
vertex   -127,    154,   -255,    990,      0,  0x00, 0x00, 0x81, 0xFF
vertex   -255,      0,   -127,   1502,    582,  0xA7, 0x00, 0xA7, 0xFF
vertex   -127,    154,   -255,    990,      0,  0xA7, 0x00, 0xA7, 0xFF
vertex   -127,      0,   -255,    990,    582,  0xA7, 0x00, 0xA7, 0xFF
vertex   -255,    154,   -127,   1502,      0,  0xA7, 0x00, 0xA7, 0xFF
vertex   -255,      0,    128,    990,    582,  0x81, 0x00, 0x00, 0xFF
vertex   -255,    154,   -127,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -255,      0,   -127,      0,    582,  0x81, 0x00, 0x00, 0xFF
vertex   -255,    154,    128,    990,      0,  0x81, 0x00, 0x00, 0xFF

lll_seg7_vertex_07018180: # 0x07018180 - 0x07018280
vertex    128,      0,    256,    990,    582,  0x00, 0x00, 0x7F, 0xFF
vertex   -127,    154,    256,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -127,      0,    256,      0,    582,  0x00, 0x00, 0x7F, 0xFF
vertex   -127,      0,    256,      0,    582,  0xA7, 0x00, 0x59, 0xFF
vertex   -255,    154,    128,   -542,      0,  0xA7, 0x00, 0x59, 0xFF
vertex   -255,      0,    128,   -542,    582,  0xA7, 0x00, 0x59, 0xFF
vertex   -127,    154,    256,      0,      0,  0xA7, 0x00, 0x59, 0xFF
vertex    256,      0,   -127,    990,    582,  0x7F, 0x00, 0x00, 0xFF
vertex    256,    154,   -127,    990,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    256,    154,    128,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    128,    154,    256,    990,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    256,      0,    128,    990,    582,  0x59, 0x00, 0x59, 0xFF
vertex    256,    154,    128,    990,      0,  0x59, 0x00, 0x59, 0xFF
vertex    128,    154,    256,    268,      0,  0x59, 0x00, 0x59, 0xFF
vertex    128,      0,    256,    268,    582,  0x59, 0x00, 0x59, 0xFF
vertex    256,      0,    128,      0,    582,  0x7F, 0x00, 0x00, 0xFF

lll_seg7_dl_07018280: # 0x07018280 - 0x07018380
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fire_09000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight lll_seg7_light_0700FC08, 1
gsSPLight lll_seg7_light_0700FC00, 2
gsSPVertex lll_seg7_vertex_07017FB0, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  3,  7,  6, 0x0
gsSP2Triangles  3,  8,  7, 0x0,  3,  9,  8, 0x0
gsSP2Triangles  3, 10,  9, 0x0, 11, 12, 13, 0x0
gsSPVertex lll_seg7_vertex_07018090, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  0,  6,  1, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 14, 12, 0x0
gsSPVertex lll_seg7_vertex_07018180, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  0, 10,  1, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 13, 14, 0x0,  7,  9, 15, 0x0
gsSPEndDisplayList

glabel lll_seg7_dl_07018380 # 0x07018380 - 0x070183F0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList lll_seg7_dl_07018280
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsSPEndDisplayList
