ttm_seg7_light_0700BB30: # 0x0700BB30 - 0x0700BB38
.byte 0x4C, 0x4C, 0x4C, 0x00, 0x4C, 0x4C, 0x4C, 0x00

ttm_seg7_light_0700BB38: # 0x0700BB38 - 0x0700BB48
.byte 0x99, 0x99, 0x99, 0x00, 0x99, 0x99, 0x99, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ttm_seg7_vertex_0700BB48: # 0x0700BB48 - 0x0700BBA8
vertex    -13,  -1627,     28,    990,    990,  0xD3, 0x00, 0x76, 0xFF
vertex    -28,   1580,    -57,    510,      0,  0xAF, 0x00, 0x9F, 0xFF
vertex    -28,  -1627,    -57,    510,    990,  0xAF, 0x00, 0x9F, 0xFF
vertex    -13,   1580,     28,    990,      0,  0xD3, 0x00, 0x76, 0xFF
vertex     56,  -1627,    -26,      0,    990,  0x61, 0x00, 0xAF, 0xFF
vertex     56,   1580,    -26,      0,      0,  0x75, 0x00, 0x2F, 0xFF

ttm_seg7_dl_0700BBA8: # 0x0700BBA8 - 0x0700BC10
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, ttm_seg7_texture_07000000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ttm_seg7_light_0700BB38, 1
gsSPLight ttm_seg7_light_0700BB30, 2
gsSPVertex ttm_seg7_vertex_0700BB48, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  2,  1,  4, 0x0,  1,  5,  4, 0x0
gsSP2Triangles  4,  5,  0, 0x0,  5,  3,  0, 0x0
gsSPEndDisplayList

glabel ttm_seg7_dl_0700BC10 # 0x0700BC10 - 0x0700BC70
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ttm_seg7_dl_0700BBA8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
