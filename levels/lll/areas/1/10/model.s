lll_seg7_vertex_070162E0: # 0x070162E0 - 0x07016340
vertex      0,    307,   -895,      0,  -3012,  0x00, 0x7F, 0x00, 0xFF
vertex   -767,    307,    384,  -2586,   1244,  0x00, 0x7F, 0x00, 0xFF
vertex      0,    307,    896,      0,   2946,  0x00, 0x7F, 0x00, 0xFF
vertex   -767,    307,   -383,  -2586,  -1310,  0x00, 0x7F, 0x00, 0xFF
vertex    768,    307,    384,   2522,   1244,  0x00, 0x7F, 0x00, 0xFF
vertex    768,    307,   -383,   2524,  -1310,  0x00, 0x7F, 0x00, 0xFF

lll_seg7_vertex_07016340: # 0x07016340 - 0x07016430
vertex   -767,      0,    384,   1160,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -767,    307,   -383,  -3096,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -767,      0,   -383,  -3096,    990,  0x81, 0x00, 0x00, 0xFF
vertex    768,      0,   -383,    330,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    768,    307,   -383,    330,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    768,    307,    384,  -4118,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    768,      0,    384,  -4118,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    768,      0,    384,   4226,    990,  0x46, 0x00, 0x69, 0xFF
vertex    768,    307,    384,   4226,      0,  0x46, 0x00, 0x69, 0xFF
vertex      0,    307,    896,      0,      0,  0x46, 0x00, 0x69, 0xFF
vertex      0,      0,    896,      0,    990,  0x46, 0x00, 0x69, 0xFF
vertex      0,      0,    896,   1160,    990,  0xBA, 0x00, 0x69, 0xFF
vertex   -767,    307,    384,  -3096,      0,  0xBA, 0x00, 0x69, 0xFF
vertex   -767,      0,    384,  -3096,    990,  0xBA, 0x00, 0x69, 0xFF
vertex      0,    307,    896,   1160,      0,  0xBA, 0x00, 0x69, 0xFF

lll_seg7_vertex_07016430: # 0x07016430 - 0x070164E0
vertex      0,      0,   -895,    966,    990,  0x46, 0x00, 0x97, 0xFF
vertex      0,    307,   -895,    966,      0,  0x46, 0x00, 0x97, 0xFF
vertex    768,    307,   -383,  -3096,      0,  0x46, 0x00, 0x97, 0xFF
vertex   -767,      0,    384,   1160,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -767,    307,    384,   1160,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -767,    307,   -383,  -3096,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -767,      0,   -383,   1160,    990,  0xBA, 0x00, 0x97, 0xFF
vertex      0,    307,   -895,  -3096,      0,  0xBA, 0x00, 0x97, 0xFF
vertex      0,      0,   -895,  -3096,    990,  0xBA, 0x00, 0x97, 0xFF
vertex   -767,    307,   -383,   1160,      0,  0xBA, 0x00, 0x97, 0xFF
vertex    768,      0,   -383,  -3096,    990,  0x46, 0x00, 0x97, 0xFF

lll_seg7_dl_070164E0: # 0x070164E0 - 0x07016538
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, lll_seg7_texture_07005800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight lll_seg7_light_0700FC08, 1
gsSPLight lll_seg7_light_0700FC00, 2
gsSPVertex lll_seg7_vertex_070162E0, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  0,  2,  4, 0x0,  0,  4,  5, 0x0
gsSPEndDisplayList

lll_seg7_dl_07016538: # 0x07016538 - 0x070165C8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fire_09007800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex lll_seg7_vertex_07016340, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 14, 12, 0x0
gsSPVertex lll_seg7_vertex_07016430, 11, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  9,  7, 0x0
gsSP1Triangle  0,  2, 10, 0x0
gsSPEndDisplayList

glabel lll_seg7_dl_070165C8 # 0x070165C8 - 0x07016658
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList lll_seg7_dl_070164E0
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList lll_seg7_dl_07016538
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
