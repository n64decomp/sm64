lll_seg7_vertex_07018F70: # 0x07018F70 - 0x07018FB0
vertex   -255,    154,     64,    990,  -4120,  0x00, 0x7F, 0x00, 0xFF
vertex    256,    154,     64,      0,  -4120,  0x00, 0x7F, 0x00, 0xFF
vertex    256,    154,    -63,      0,  -3098,  0x00, 0x7F, 0x00, 0xFF
vertex   -255,    154,    -63,    990,  -3098,  0x00, 0x7F, 0x00, 0xFF

lll_seg7_vertex_07018FB0: # 0x07018FB0 - 0x070190B0
vertex    256,      0,     64,   1330,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    256,    154,     64,   1330,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -255,    154,     64,  -2074,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -255,      0,    -63,  -2074,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -255,    154,    -63,  -2074,      0,  0x00, 0x00, 0x81, 0xFF
vertex    256,    154,    -63,   1330,      0,  0x00, 0x00, 0x81, 0xFF
vertex    256,      0,    -63,   1330,    990,  0x00, 0x00, 0x81, 0xFF
vertex    256,    154,    -63,  -9058,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    256,    154,     64, -10250,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    256,      0,     64, -10250,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    256,      0,    -63,  -9058,    990,  0x7F, 0x00, 0x00, 0xFF
vertex   -255,      0,     64,    990,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -255,    154,    -63,   -200,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -255,      0,    -63,   -200,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -255,    154,     64,    990,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -255,      0,     64,  -2074,    990,  0x00, 0x00, 0x7F, 0xFF

lll_seg7_dl_070190B0: # 0x070190B0 - 0x070190F8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fire_0900B800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight lll_seg7_light_0700FC08, 1
gsSPLight lll_seg7_light_0700FC00, 2
gsSPVertex lll_seg7_vertex_07018F70, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

lll_seg7_dl_070190F8: # 0x070190F8 - 0x07019160
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fire_09007800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex lll_seg7_vertex_07018FB0, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0,  0,  2, 15, 0x0
gsSPEndDisplayList

glabel lll_seg7_dl_07019160 # 0x07019160 - 0x070191F0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList lll_seg7_dl_070190B0
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList lll_seg7_dl_070190F8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
