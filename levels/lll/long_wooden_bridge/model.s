lll_seg7_vertex_070191F0: # 0x070191F0 - 0x07019230
vertex   -255,    154,   -575,    998,   1012,  0x00, 0x7F, 0x00, 0xFF
vertex   -255,    154,    576,    998,  -8258,  0x00, 0x7F, 0x00, 0xFF
vertex    256,    154,    576,      0,  -8258,  0x00, 0x7F, 0x00, 0xFF
vertex    256,    154,   -575,      0,   1012,  0x00, 0x7F, 0x00, 0xFF

lll_seg7_vertex_07019230: # 0x07019230 - 0x07019330
vertex   -255,      0,   -575,   3374,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -255,    154,   -575,   3374,      0,  0x00, 0x00, 0x81, 0xFF
vertex    256,    154,   -575,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex   -255,      0,    576,   7634,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -255,    154,   -575,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -255,      0,   -575,      0,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -255,    154,    576,   7634,      0,  0x81, 0x00, 0x00, 0xFF
vertex    256,      0,    576,   3374,    990,  0x00, 0x00, 0x7F, 0xFF
vertex   -255,    154,    576,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -255,      0,    576,      0,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    256,    154,    576,   3374,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    256,      0,   -575,   7122,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    256,    154,    576,   -540,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    256,      0,    576,   -540,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    256,    154,   -575,   7122,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    256,      0,   -575,      0,    990,  0x00, 0x00, 0x81, 0xFF

lll_seg7_dl_07019330: # 0x07019330 - 0x07019378
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fire_0900B800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight lll_seg7_light_0700FC08, 1
gsSPLight lll_seg7_light_0700FC00, 2
gsSPVertex lll_seg7_vertex_070191F0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

lll_seg7_dl_07019378: # 0x07019378 - 0x070193E0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fire_09007800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex lll_seg7_vertex_07019230, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0,  0,  2, 15, 0x0
gsSPEndDisplayList

glabel lll_seg7_dl_070193E0 # 0x070193E0 - 0x07019470
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList lll_seg7_dl_07019330
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList lll_seg7_dl_07019378
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
