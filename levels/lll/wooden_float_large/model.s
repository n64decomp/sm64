lll_seg7_vertex_07018D08: # 0x07018D08 - 0x07018D88
vertex    768,      0,    384,  10188,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    768,    154,    384,  10188,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -767,    154,    384,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -767,      0,    384,      0,    990,  0x00, 0x00, 0x7F, 0xFF
vertex   -767,      0,   -383,    990,    990,  0x00, 0x00, 0x81, 0xFF
vertex    768,    154,   -383,  -9228,      0,  0x00, 0x00, 0x81, 0xFF
vertex    768,      0,   -383,  -9228,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -767,    154,   -383,    990,      0,  0x00, 0x00, 0x81, 0xFF

lll_seg7_vertex_07018D88: # 0x07018D88 - 0x07018E48
vertex    768,    154,   -383,      0,  -9230,  0x00, 0x7F, 0x00, 0xFF
vertex   -767,    154,   -383,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   -767,    154,    384,    990,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    768,    154,    384,    990,  -9230,  0x00, 0x7F, 0x00, 0xFF
vertex    768,      0,   -383,    990,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    768,    154,   -383,    990,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    768,    154,    384,  -4118,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    768,      0,    384,  -4118,    990,  0x7F, 0x00, 0x00, 0xFF
vertex   -767,      0,    384,    990,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -767,    154,   -383,  -4118,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -767,      0,   -383,  -4118,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -767,    154,    384,    990,      0,  0x81, 0x00, 0x00, 0xFF

lll_seg7_dl_07018E48: # 0x07018E48 - 0x07018EA0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, lll_seg7_texture_07000000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight lll_seg7_light_0700FC08, 1
gsSPLight lll_seg7_light_0700FC00, 2
gsSPVertex lll_seg7_vertex_07018D08, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

lll_seg7_dl_07018EA0: # 0x07018EA0 - 0x07018EF8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, lll_seg7_texture_07001000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex lll_seg7_vertex_07018D88, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSPEndDisplayList

glabel lll_seg7_dl_07018EF8 # 0x07018EF8 - 0x07018F70
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList lll_seg7_dl_07018E48
gsSPDisplayList lll_seg7_dl_07018EA0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
