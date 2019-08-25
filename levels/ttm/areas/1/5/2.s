ttm_seg7_light_0700B590: # 0x0700B590 - 0x0700B598
.byte 0x4C, 0x4C, 0x4C, 0x00, 0x4C, 0x4C, 0x4C, 0x00

ttm_seg7_light_0700B598: # 0x0700B598 - 0x0700B5A8
.byte 0x99, 0x99, 0x99, 0x00, 0x99, 0x99, 0x99, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ttm_seg7_vertex_0700B5A8: # 0x0700B5A8 - 0x0700B608
vertex     29,  -1653,     57,    990,    990,  0x9F, 0x00, 0x51, 0xFF
vertex     14,   1556,    -28,    510,      0,  0x89, 0x00, 0xD5, 0xFF
vertex     14,  -1653,    -28,    510,    990,  0xEA, 0x00, 0x84, 0xFF
vertex     98,   1556,      2,      0,      0,  0x60, 0x00, 0xAE, 0xFF
vertex     98,  -1653,      2,      0,    990,  0x76, 0x00, 0x2E, 0xFF
vertex     29,   1556,     57,    990,      0,  0x12, 0x00, 0x7D, 0xFF

ttm_seg7_dl_0700B608: # 0x0700B608 - 0x0700B670
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, ttm_seg7_texture_07000000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ttm_seg7_light_0700B598, 1
gsSPLight ttm_seg7_light_0700B590, 2
gsSPVertex ttm_seg7_vertex_0700B5A8, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  4, 0x0
gsSP2Triangles  2,  1,  3, 0x0,  0,  5,  1, 0x0
gsSP2Triangles  4,  3,  5, 0x0,  4,  5,  0, 0x0
gsSPEndDisplayList

glabel ttm_seg7_dl_0700B670 # 0x0700B670 - 0x0700B6D0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ttm_seg7_dl_0700B608
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
