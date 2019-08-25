lll_seg7_vertex_07017938: # 0x07017938 - 0x070179F8
vertex   -127,      0,   -127,    990,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -127,    307,   -127,    990,      0,  0x00, 0x00, 0x81, 0xFF
vertex    128,    307,   -127,    138,      0,  0x00, 0x00, 0x81, 0xFF
vertex    128,      0,   -127,    138,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -127,      0,    128,    820,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -127,    307,    128,    820,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -127,    307,   -127,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -127,      0,   -127,      0,    990,  0x81, 0x00, 0x00, 0xFF
vertex    128,      0,   -127,    820,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    128,    307,    128,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    128,      0,    128,      0,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    128,    307,   -127,    820,      0,  0x7F, 0x00, 0x00, 0xFF

lll_seg7_vertex_070179F8: # 0x070179F8 - 0x07017A38
vertex   -127,    307,   -127,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    128,    307,    128,    820,    820,  0x00, 0x7F, 0x00, 0xFF
vertex    128,    307,   -127,    820,      0,  0x00, 0x7F, 0x00, 0xFF
vertex   -127,    307,    128,      0,    820,  0x00, 0x7F, 0x00, 0xFF

lll_seg7_vertex_07017A38: # 0x07017A38 - 0x07017A78
vertex    128,      0,    128,    990,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    128,    307,    128,    990,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -127,    307,    128,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -127,      0,    128,      0,    990,  0x00, 0x00, 0x7F, 0xFF

lll_seg7_dl_07017A78: # 0x07017A78 - 0x07017AE0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fire_09006800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight lll_seg7_light_0700FC08, 1
gsSPLight lll_seg7_light_0700FC00, 2
gsSPVertex lll_seg7_vertex_07017938, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSPEndDisplayList

lll_seg7_dl_07017AE0: # 0x07017AE0 - 0x07017B18
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fire_09006000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex lll_seg7_vertex_070179F8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

lll_seg7_dl_07017B18: # 0x07017B18 - 0x07017B50
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fire_09008800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex lll_seg7_vertex_07017A38, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel lll_seg7_dl_07017B50 # 0x07017B50 - 0x07017BE8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList lll_seg7_dl_07017A78
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList lll_seg7_dl_07017AE0
gsSPDisplayList lll_seg7_dl_07017B18
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
