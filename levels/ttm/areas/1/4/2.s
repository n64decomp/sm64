ttm_seg7_light_0700AFF0: # 0x0700AFF0 - 0x0700AFF8
.byte 0x4C, 0x4C, 0x4C, 0x00, 0x4C, 0x4C, 0x4C, 0x00

ttm_seg7_light_0700AFF8: # 0x0700AFF8 - 0x0700B008
.byte 0x99, 0x99, 0x99, 0x00, 0x99, 0x99, 0x99, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ttm_seg7_vertex_0700B008: # 0x0700B008 - 0x0700B068
vertex    -43,   1523,     95,    990,      0,  0xD3, 0x00, 0x76, 0xFF
vertex    -58,   1523,      9,    510,      0,  0xEB, 0x00, 0x83, 0xFF
vertex    -58,  -1634,      9,    510,    990,  0x89, 0x00, 0xD5, 0xFF
vertex     26,  -1634,     40,      0,    990,  0x7D, 0x00, 0xEC, 0xFF
vertex     26,   1523,     40,      0,      0,  0x7D, 0x00, 0xEC, 0xFF
vertex    -43,  -1634,     95,    990,    990,  0xD3, 0x00, 0x76, 0xFF

ttm_seg7_dl_0700B068: # 0x0700B068 - 0x0700B0D0
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, ttm_seg7_texture_07000000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ttm_seg7_light_0700AFF8, 1
gsSPLight ttm_seg7_light_0700AFF0, 2
gsSPVertex ttm_seg7_vertex_0700B008, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  1,  3, 0x0
gsSP2Triangles  1,  4,  3, 0x0,  3,  4,  0, 0x0
gsSP2Triangles  3,  0,  5, 0x0,  5,  0,  2, 0x0
gsSPEndDisplayList

glabel ttm_seg7_dl_0700B0D0 # 0x0700B0D0 - 0x0700B130
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ttm_seg7_dl_0700B068
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
