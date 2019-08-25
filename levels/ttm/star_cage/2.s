ttm_seg7_vertex_070134A0: # 0x070134A0 - 0x070135A0
vertex    -76,     77,    -76,      0,    160,  0xFE, 0xFE, 0xFE, 0xFF
vertex     77,    -50,    -76,   2290,    990,  0xFE, 0xFE, 0xFE, 0xFF
vertex    -76,    -50,    -76,      0,    990,  0xFE, 0xFE, 0xFE, 0xFF
vertex     77,     77,     77,    316,    132,  0xFE, 0xFE, 0xFE, 0xFF
vertex     77,    -50,     77,    316,    990,  0xFE, 0xFE, 0xFE, 0xFF
vertex     77,    -50,    -76,   1902,    990,  0xFE, 0xFE, 0xFE, 0xFF
vertex     77,     77,    -76,   1902,    132,  0xFE, 0xFE, 0xFE, 0xFF
vertex    -76,     77,    -76,   1902,    132,  0xFE, 0xFE, 0xFE, 0xFF
vertex    -76,    -50,    -76,   1902,    990,  0xFE, 0xFE, 0xFE, 0xFF
vertex    -76,    -50,     77,    316,    990,  0xFE, 0xFE, 0xFE, 0xFF
vertex    -76,     77,     77,    316,    132,  0xFE, 0xFE, 0xFE, 0xFF
vertex    -76,    -50,     77,      0,    990,  0xFE, 0xFE, 0xFE, 0xFF
vertex     77,     77,     77,   2290,    160,  0xFE, 0xFE, 0xFE, 0xFF
vertex    -76,     77,     77,      0,    160,  0xFE, 0xFE, 0xFE, 0xFF
vertex     77,    -50,     77,   2290,    990,  0xFE, 0xFE, 0xFE, 0xFF
vertex     77,     77,    -76,   2290,    160,  0xFE, 0xFE, 0xFE, 0xFF

ttm_seg7_dl_070135A0: # 0x070135A0 - 0x07013608
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mountain_09008000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex ttm_seg7_vertex_070134A0, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0,  0, 15,  1, 0x0
gsSPEndDisplayList

glabel ttm_seg7_dl_07013608 # 0x07013608 - 0x07013678
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ttm_seg7_dl_070135A0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
