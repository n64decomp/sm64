jrb_seg7_light_070077F0: # 0x070077F0 - 0x070077F8
.byte 0x32, 0x38, 0x3F, 0x00, 0x32, 0x38, 0x3F, 0x00

jrb_seg7_light_070077F8: # 0x070077F8 - 0x07007808
.byte 0xC8, 0xE1, 0xFF, 0x00, 0xC8, 0xE1, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

jrb_seg7_vertex_07007808: # 0x07007808 - 0x07007908
vertex     32,   -409,   -338,   3096,      0,  0xF9, 0x0A, 0x82, 0xFF
vertex    216,   -808,    -53,   3896,  -1028,  0x4E, 0x9C, 0xFD, 0xFF
vertex      8,   -822,   -218,   3060,  -1064,  0xFD, 0xA7, 0xA7, 0xFF
vertex   -108,     -9,    -53,   2308,    964,  0xC5, 0x5E, 0xC4, 0xFF
vertex   -306,   -409,      0,   2012,      0,  0x87, 0xFD, 0x23, 0xFF
vertex      8,     29,     82,    924,   1060,  0xDC, 0x5A, 0x51, 0xFF
vertex     28,   -142,   -182,   3132,    632,  0x2C, 0x46, 0xA0, 0xFF
vertex    305,   -409,      0,   4056,      0,  0x7D, 0x0B, 0x0A, 0xFF
vertex     84,     29,      7,   4108,   1060,  0x4A, 0x66, 0xFF, 0xFF
vertex    -66,   -822,   -143,   2752,  -1064,  0xB3, 0x9D, 0xF4, 0xFF
vertex   -108,     -9,    -53,   1592,    210,  0xC5, 0x5E, 0xC4, 0xFF
vertex      8,     29,     82,    808,   -332,  0xDC, 0x5A, 0x51, 0xFF
vertex     84,     29,      7,    308,      0,  0x4A, 0x66, 0xFF, 0xFF
vertex     28,   -675,    134,    860,   -696,  0xFE, 0xB5, 0x66, 0xFF
vertex     32,   -409,    264,    912,      0,  0x1C, 0x07, 0x7B, 0xFF
vertex     84,     29,      7,     20,   1060,  0x4A, 0x66, 0xFF, 0xFF

jrb_seg7_vertex_07007908: # 0x07007908 - 0x070079E8
vertex     32,   -409,    264,    912,      0,  0x1C, 0x07, 0x7B, 0xFF
vertex    305,   -409,      0,      0,      0,  0x7D, 0x0B, 0x0A, 0xFF
vertex     84,     29,      7,     20,   1060,  0x4A, 0x66, 0xFF, 0xFF
vertex     28,   -142,   -182,    680,    724,  0x2C, 0x46, 0xA0, 0xFF
vertex   -108,     -9,    -53,   1592,    210,  0xC5, 0x5E, 0xC4, 0xFF
vertex     84,     29,      7,    308,      0,  0x4A, 0x66, 0xFF, 0xFF
vertex     28,   -675,    134,    860,   -696,  0xFE, 0xB5, 0x66, 0xFF
vertex    216,   -808,    -53,   3896,  -1028,  0x4E, 0x9C, 0xFD, 0xFF
vertex    305,   -409,      0,   4056,      0,  0x7D, 0x0B, 0x0A, 0xFF
vertex     28,   -675,    134,   4948,   -696,  0xFE, 0xB5, 0x66, 0xFF
vertex    -66,   -822,   -143,   1312,    570,  0xB3, 0x9D, 0xF4, 0xFF
vertex      8,   -822,   -218,    808,    870,  0xFD, 0xA7, 0xA7, 0xFF
vertex    216,   -808,    -53,   -568,    210,  0x4E, 0x9C, 0xFD, 0xFF
vertex     28,   -675,    134,    680,   -542,  0xFE, 0xB5, 0x66, 0xFF

jrb_seg7_dl_070079E8: # 0x070079E8 - 0x07007AC8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_09001800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPLight jrb_seg7_light_070077F8, 1
gsSPLight jrb_seg7_light_070077F0, 2
gsSPVertex jrb_seg7_vertex_07007808, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  0,  4,  3, 0x0,  3,  6,  0, 0x0
gsSP2Triangles  7,  0,  6, 0x0,  8,  7,  6, 0x0
gsSP2Triangles  9,  4,  0, 0x0,  9,  0,  2, 0x0
gsSP2Triangles  7,  1,  0, 0x0, 10, 11, 12, 0x0
gsSP2Triangles 13, 14,  4, 0x0, 13,  4,  9, 0x0
gsSP2Triangles  4, 14,  5, 0x0,  5, 14, 15, 0x0
gsSPVertex jrb_seg7_vertex_07007908, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  1,  0,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 12, 13, 0x0
gsSPEndDisplayList

glabel jrb_seg7_dl_07007AC8 # 0x07007AC8 - 0x07007B70
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_SURF2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 5, 80, 75, 255
gsSPFogPosition 900, 1000
gsSPSetGeometryMode G_FOG
gsDPSetCombineModeLERP G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList jrb_seg7_dl_070079E8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
