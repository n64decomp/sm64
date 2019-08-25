ttm_seg7_light_0700A928: # 0x0700A928 - 0x0700A930
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

ttm_seg7_light_0700A930: # 0x0700A930 - 0x0700A940
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ttm_seg7_vertex_0700A940: # 0x0700A940 - 0x0700A9C0
vertex     80,    654,   -199,    308,    138,  0x39, 0xF5, 0x70, 0xFF
vertex    -22,    654,   -199,    308,    138,  0x8F, 0xFB, 0x38, 0xFF
vertex    -22,  -1719,    -97,      0,    990,  0xC8, 0x04, 0x71, 0xFF
vertex     80,  -1719,    -97,      0,    990,  0x71, 0x02, 0x38, 0xFF
vertex     80,    654,   -302,    650,    138,  0x65, 0x03, 0xB5, 0xFF
vertex    -22,  -1719,   -199,    308,    990,  0xA7, 0xFD, 0xA7, 0xFF
vertex    -22,    654,   -302,    650,    138,  0xBA, 0x0F, 0x98, 0xFF
vertex     80,  -1719,   -199,    308,    990,  0x59, 0xFD, 0xA7, 0xFF

ttm_seg7_vertex_0700A9C0: # 0x0700A9C0 - 0x0700AA40
vertex     80,    654,   -302,      0,      0,  0x65, 0x03, 0xB5, 0xFF
vertex     80,   1473,      5,      0,      0,  0x71, 0xF3, 0x37, 0xFF
vertex     80,    654,   -199,      0,      0,  0x39, 0xF5, 0x70, 0xFF
vertex    -22,   1473,      5,      0,      0,  0xC8, 0xE5, 0x6E, 0xFF
vertex    -22,    654,   -199,      0,      0,  0x8F, 0xFB, 0x38, 0xFF
vertex     80,   1473,    -97,      0,      0,  0x38, 0x1B, 0x92, 0xFF
vertex    -22,   1473,    -97,      0,      0,  0x8F, 0x0D, 0xC9, 0xFF
vertex    -22,    654,   -302,      0,      0,  0xBA, 0x0F, 0x98, 0xFF

ttm_seg7_dl_0700AA40: # 0x0700AA40 - 0x0700AAB8
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, ttm_seg7_texture_07000000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ttm_seg7_light_0700A930, 1
gsSPLight ttm_seg7_light_0700A928, 2
gsSPVertex ttm_seg7_vertex_0700A940, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  2, 0x0
gsSP2Triangles  4,  0,  3, 0x0,  2,  1,  5, 0x0
gsSP2Triangles  1,  6,  5, 0x0,  7,  4,  3, 0x0
gsSP2Triangles  5,  6,  4, 0x0,  5,  4,  7, 0x0
gsSPEndDisplayList

ttm_seg7_dl_0700AAB8: # 0x0700AAB8 - 0x0700AB08
gsSPVertex ttm_seg7_vertex_0700A9C0, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  1,  3, 0x0
gsSP2Triangles  2,  3,  4, 0x0,  0,  5,  1, 0x0
gsSP2Triangles  4,  3,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  7,  5,  0, 0x0,  7,  6,  5, 0x0
gsSPEndDisplayList

glabel ttm_seg7_dl_0700AB08 # 0x0700AB08 - 0x0700AB70
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ttm_seg7_dl_0700AA40
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPDisplayList ttm_seg7_dl_0700AAB8
gsSPEndDisplayList
