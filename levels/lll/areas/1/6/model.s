lll_seg7_vertex_07014818: # 0x07014818 - 0x07014908
vertex    256,      0,    768,   2524,    990,  0x00, 0x00, 0x7F, 0xFF
vertex   -255,    307,    768,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -255,      0,    768,      0,    990,  0x00, 0x00, 0x7F, 0xFF
vertex   -767,      0,    256,   2012,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -767,    307,   -255,   -542,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -767,      0,   -255,   -542,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -767,    307,    256,   2012,      0,  0x81, 0x00, 0x00, 0xFF
vertex    768,      0,   -255,   2522,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    768,    307,   -255,   2522,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    768,    307,    256,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    768,      0,    256,      0,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    768,      0,    256,   3582,    990,  0x59, 0x00, 0x59, 0xFF
vertex    256,    307,    768,      0,      0,  0x59, 0x00, 0x59, 0xFF
vertex    256,      0,    768,      0,    990,  0x59, 0x00, 0x59, 0xFF
vertex    768,    307,    256,   3582,      0,  0x59, 0x00, 0x59, 0xFF

lll_seg7_vertex_07014908: # 0x07014908 - 0x070149F8
vertex   -255,      0,   -767,   2524,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -255,    307,   -767,   2524,      0,  0x00, 0x00, 0x81, 0xFF
vertex    256,    307,   -767,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex    256,      0,    768,   2524,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    256,    307,    768,   2524,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -255,    307,    768,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -255,      0,    768,   3034,    990,  0xA7, 0x00, 0x59, 0xFF
vertex   -767,    307,    256,   -578,      0,  0xA7, 0x00, 0x59, 0xFF
vertex   -767,      0,    256,   -578,    990,  0xA7, 0x00, 0x59, 0xFF
vertex   -255,    307,    768,   3034,      0,  0xA7, 0x00, 0x59, 0xFF
vertex   -767,      0,   -255,   3034,    990,  0xA7, 0x00, 0xA7, 0xFF
vertex   -767,    307,   -255,   3034,      0,  0xA7, 0x00, 0xA7, 0xFF
vertex   -255,    307,   -767,   -578,      0,  0xA7, 0x00, 0xA7, 0xFF
vertex   -255,      0,   -767,   -578,    990,  0xA7, 0x00, 0xA7, 0xFF
vertex    256,      0,   -767,      0,    990,  0x00, 0x00, 0x81, 0xFF

lll_seg7_vertex_070149F8: # 0x070149F8 - 0x07014A38
vertex    256,      0,   -767,   3582,    990,  0x59, 0x00, 0xA7, 0xFF
vertex    768,    307,   -255,      0,      0,  0x59, 0x00, 0xA7, 0xFF
vertex    768,      0,   -255,      0,    990,  0x59, 0x00, 0xA7, 0xFF
vertex    256,    307,   -767,   3582,      0,  0x59, 0x00, 0xA7, 0xFF

lll_seg7_vertex_07014A38: # 0x07014A38 - 0x07014AB8
vertex   -255,    307,   -767,   3034,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   -255,    307,    768,   3034,  -5142,  0x00, 0x7F, 0x00, 0xFF
vertex    256,    307,    768,    990,  -5142,  0x00, 0x7F, 0x00, 0xFF
vertex   -767,    307,   -255,   5078,  -1054,  0x00, 0x7F, 0x00, 0xFF
vertex   -767,    307,    256,   5078,  -3098,  0x00, 0x7F, 0x00, 0xFF
vertex    768,    307,   -255,  -1052,  -1054,  0x00, 0x7F, 0x00, 0xFF
vertex    256,    307,   -767,    990,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    768,    307,    256,  -1052,  -3098,  0x00, 0x7F, 0x00, 0xFF

lll_seg7_dl_07014AB8: # 0x07014AB8 - 0x07014B80
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fire_09007800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight lll_seg7_light_0700FC08, 1
gsSPLight lll_seg7_light_0700FC00, 2
gsSPVertex lll_seg7_vertex_07014818, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 14, 12, 0x0
gsSPVertex lll_seg7_vertex_07014908, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  9,  7, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 12, 13, 0x0
gsSP1Triangle  0,  2, 14, 0x0
gsSPVertex lll_seg7_vertex_070149F8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

lll_seg7_dl_07014B80: # 0x07014B80 - 0x07014BD8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, lll_seg7_texture_07002800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex lll_seg7_vertex_07014A38, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  4, 0x0
gsSP2Triangles  0,  4,  1, 0x0,  0,  5,  6, 0x0
gsSP2Triangles  0,  2,  7, 0x0,  0,  7,  5, 0x0
gsSPEndDisplayList

glabel lll_seg7_dl_07014BD8 # 0x07014BD8 - 0x07014C68
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList lll_seg7_dl_07014AB8
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList lll_seg7_dl_07014B80
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
