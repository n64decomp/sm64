ttm_seg7_light_0700A1B0: # 0x0700A1B0 - 0x0700A1B8
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

ttm_seg7_light_0700A1B8: # 0x0700A1B8 - 0x0700A1C8
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ttm_seg7_vertex_0700A1C8: # 0x0700A1C8 - 0x0700A268
vertex     80,  -2047,   3563,   3648,   -852,  0x14, 0x00, 0x83, 0xFF
vertex  -1737,  -2149,   3260,      0,     -2,  0x13, 0xD5, 0x8B, 0xFF
vertex  -1737,  -2047,   3260,      0,   -852,  0x14, 0x00, 0x83, 0xFF
vertex  -1771,  -2047,   3462,      0,   -852,  0xEC, 0x00, 0x7D, 0xFF
vertex  -1771,  -2149,   3462,      0,     -2,  0xF1, 0xAA, 0x5B, 0xFF
vertex     46,  -2149,   3765,   3648,     -2,  0xED, 0xD5, 0x75, 0xFF
vertex     46,  -2047,   3765,   3648,   -852,  0xEC, 0x00, 0x7D, 0xFF
vertex     63,  -2201,   3664,   3648,    990,  0xFD, 0x83, 0x14, 0xFF
vertex  -1754,  -2201,   3361,      0,    990,  0x03, 0x83, 0xEC, 0xFF
vertex     80,  -2149,   3563,   3648,     -2,  0x0F, 0xAA, 0xA5, 0xFF

ttm_seg7_dl_0700A268: # 0x0700A268 - 0x0700A2E0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mountain_09005000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ttm_seg7_light_0700A1B8, 1
gsSPLight ttm_seg7_light_0700A1B0, 2
gsSPVertex ttm_seg7_vertex_0700A1C8, 10, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  5,  4, 0x0
gsSP2Triangles  7,  4,  8, 0x0,  9,  8,  1, 0x0
gsSP2Triangles  9,  7,  8, 0x0,  0,  9,  1, 0x0
gsSPEndDisplayList

glabel ttm_seg7_dl_0700A2E0 # 0x0700A2E0 - 0x0700A340
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ttm_seg7_dl_0700A268
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
