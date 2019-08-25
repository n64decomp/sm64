lll_seg7_vertex_07013968: # 0x07013968 - 0x070139E8
vertex   -767,    307,   -767,  -1198,  -2222,  0x00, 0x7F, 0x00, 0xFF
vertex   1152,    307,    384,   4276,   1062,  0x00, 0x7F, 0x00, 0xFF
vertex   1152,    307,   -383,   4276,  -1128,  0x00, 0x7F, 0x00, 0xFF
vertex    768,    307,    768,   3180,   2156,  0x00, 0x7F, 0x00, 0xFF
vertex    768,    307,   -767,   3180,  -2222,  0x00, 0x7F, 0x00, 0xFF
vertex  -1151,    307,    384,  -2294,   1062,  0x00, 0x7F, 0x00, 0xFF
vertex   -767,    307,    768,  -1198,   2156,  0x00, 0x7F, 0x00, 0xFF
vertex  -1151,    307,   -383,  -2294,  -1128,  0x00, 0x7F, 0x00, 0xFF

lll_seg7_vertex_070139E8: # 0x070139E8 - 0x07013AD8
vertex   1152,      0,    384,   2012,    990,  0x59, 0x00, 0x59, 0xFF
vertex   1152,    307,    384,   2012,      0,  0x59, 0x00, 0x59, 0xFF
vertex    768,    307,    768,   -394,      0,  0x59, 0x00, 0x59, 0xFF
vertex   -767,      0,   -767,   7634,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -767,    307,   -767,   7634,      0,  0x00, 0x00, 0x81, 0xFF
vertex    768,    307,   -767,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex    768,      0,   -767,      0,    990,  0x00, 0x00, 0x81, 0xFF
vertex    768,      0,   -767,   2376,    990,  0x59, 0x00, 0xA7, 0xFF
vertex    768,    307,   -767,   2376,      0,  0x59, 0x00, 0xA7, 0xFF
vertex   1152,    307,   -383,      0,      0,  0x59, 0x00, 0xA7, 0xFF
vertex   1152,      0,   -383,      0,    990,  0x59, 0x00, 0xA7, 0xFF
vertex   1152,      0,   -383,   3374,    990,  0x7F, 0x00, 0x00, 0xFF
vertex   1152,    307,   -383,   3374,      0,  0x7F, 0x00, 0x00, 0xFF
vertex   1152,    307,    384,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex   1152,      0,    384,      0,    990,  0x7F, 0x00, 0x00, 0xFF

lll_seg7_vertex_07013AD8: # 0x07013AD8 - 0x07013BC8
vertex  -1151,      0,    384,   3374,    990,  0x81, 0x00, 0x00, 0xFF
vertex  -1151,    307,   -383,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex  -1151,      0,   -383,      0,    990,  0x81, 0x00, 0x00, 0xFF
vertex   1152,      0,    384,   2012,    990,  0x59, 0x00, 0x59, 0xFF
vertex    768,    307,    768,   -394,      0,  0x59, 0x00, 0x59, 0xFF
vertex    768,      0,    768,   -394,    990,  0x59, 0x00, 0x59, 0xFF
vertex    768,      0,    768,   7122,    990,  0x00, 0x00, 0x7F, 0xFF
vertex   -767,    307,    768,   -542,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -767,      0,    768,   -542,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    768,    307,    768,   7122,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -767,      0,    768,   2012,    990,  0xA7, 0x00, 0x59, 0xFF
vertex   -767,    307,    768,   2012,      0,  0xA7, 0x00, 0x59, 0xFF
vertex  -1151,    307,    384,   -394,      0,  0xA7, 0x00, 0x59, 0xFF
vertex  -1151,      0,    384,   -394,    990,  0xA7, 0x00, 0x59, 0xFF
vertex  -1151,    307,    384,   3374,      0,  0x81, 0x00, 0x00, 0xFF

lll_seg7_vertex_07013BC8: # 0x07013BC8 - 0x07013C08
vertex  -1151,      0,   -383,   2376,    990,  0xA7, 0x00, 0xA7, 0xFF
vertex  -1151,    307,   -383,   2376,      0,  0xA7, 0x00, 0xA7, 0xFF
vertex   -767,    307,   -767,      0,      0,  0xA7, 0x00, 0xA7, 0xFF
vertex   -767,      0,   -767,      0,    990,  0xA7, 0x00, 0xA7, 0xFF

lll_seg7_dl_07013C08: # 0x07013C08 - 0x07013C70
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fire_0900A800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight lll_seg7_light_0700FC08, 1
gsSPLight lll_seg7_light_0700FC00, 2
gsSPVertex lll_seg7_vertex_07013968, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  0,  2,  4, 0x0,  0,  5,  6, 0x0
gsSP2Triangles  0,  7,  5, 0x0,  0,  6,  3, 0x0
gsSPEndDisplayList

lll_seg7_dl_07013C70: # 0x07013C70 - 0x07013D28
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fire_09007800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex lll_seg7_vertex_070139E8, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex lll_seg7_vertex_07013AD8, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  9,  7, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 12, 13, 0x0
gsSP1Triangle  0, 14,  1, 0x0
gsSPVertex lll_seg7_vertex_07013BC8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel lll_seg7_dl_07013D28 # 0x07013D28 - 0x07013DB8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList lll_seg7_dl_07013C08
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList lll_seg7_dl_07013C70
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
