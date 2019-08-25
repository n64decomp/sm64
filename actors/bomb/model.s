# Bomb

.balign 8
bomb_seg6_light_06057AA8: # 0x06057AA8
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

bomb_seg6_light_06057AB0: # 0x06057AB0
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bomb_seg6_texture_06057AC0: # 0x06057AC0
.incbin "actors/bomb/bomb_left_side.rgba16"

bomb_seg6_texture_06058AC0: # 0x06058AC0
.incbin "actors/bomb/bomb_right_side.rgba16"

bomb_seg6_texture_06059AC0: # 0x06059AC0
.incbin "actors/bomb/bomb_spike.rgba16"

bomb_seg6_vertex_0605A2C0: # 0x0605A2C0
vertex      0,    120,      0,    992,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -120,   -120,      0,      0,   2016,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -120,      0,    992,   2016,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -120,    120,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

bomb_seg6_vertex_0605A300: # 0x0605A300
vertex    120,    120,      0,    992,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -120,      0,      0,   2016,  0xFF, 0xFF, 0xFF, 0xFF
vertex    120,   -120,      0,    992,   2016,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    120,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

bomb_seg6_vertex_0605A340: # 0x0605A340
vertex      0,    -59,      0,    502,    -18,  0xF7, 0x82, 0xF7, 0xFF
vertex     -9,    -36,      0,     14,    976,  0x8A, 0xD2, 0xFD, 0xFF
vertex      0,    -36,     -8,    938,    980,  0xFD, 0xD7, 0x89, 0xFF
vertex      0,     37,     -8,     -6,    974,  0xFD, 0x29, 0x89, 0xFF
vertex     -9,     37,      0,    972,    964,  0x8A, 0x2E, 0xFD, 0xFF
vertex      0,     60,      0,    434,    -20,  0xF7, 0x7E, 0xF7, 0xFF
vertex     10,     37,      0,    -14,    962,  0x74, 0x32, 0xFD, 0xFF
vertex      0,     37,     -8,    960,    962,  0xFD, 0x29, 0x89, 0xFF
vertex      0,     60,      0,    468,    -16,  0xF7, 0x7E, 0xF7, 0xFF
vertex     -9,     37,      0,     -8,    974,  0x8A, 0x2E, 0xFD, 0xFF
vertex      0,     37,      9,    974,    968,  0xFD, 0x2E, 0x76, 0xFF
vertex      0,     60,      0,    470,     -6,  0xF7, 0x7E, 0xF7, 0xFF
vertex      0,     37,      9,      4,    974,  0xFD, 0x2E, 0x76, 0xFF
vertex     10,     37,      0,    960,    986,  0x74, 0x32, 0xFD, 0xFF
vertex      0,     60,      0,    492,     34,  0xF7, 0x7E, 0xF7, 0xFF

bomb_seg6_vertex_0605A430: # 0x0605A430
vertex      0,     10,     37,    -20,    976,  0xFD, 0x74, 0x32, 0xFF
vertex     -9,      0,     37,    974,    974,  0x8A, 0xF9, 0x2E, 0xFF
vertex      0,      0,     60,    428,      4,  0xF8, 0xEE, 0x7D, 0xFF
vertex      0,    -59,      0,    494,    -12,  0xF7, 0x82, 0xF7, 0xFF
vertex      0,    -36,     -8,     -2,    946,  0xFD, 0xD7, 0x89, 0xFF
vertex     10,    -36,      0,    964,    964,  0x74, 0xCE, 0xFD, 0xFF
vertex      0,    -59,      0,    458,    -18,  0xF7, 0x82, 0xF7, 0xFF
vertex      0,    -36,      9,     10,    944,  0xFD, 0xD2, 0x76, 0xFF
vertex     -9,    -36,      0,    916,    956,  0x8A, 0xD2, 0xFD, 0xFF
vertex      0,    -59,      0,    486,     -6,  0xF7, 0x82, 0xF7, 0xFF
vertex     10,    -36,      0,     -4,    958,  0x74, 0xCE, 0xFD, 0xFF
vertex      0,    -36,      9,    958,    952,  0xFD, 0xD2, 0x76, 0xFF
vertex     10,      0,     37,     -8,    978,  0x74, 0xF9, 0x32, 0xFF
vertex      0,     10,     37,    952,    976,  0xFD, 0x74, 0x32, 0xFF
vertex      0,      0,     60,    428,    -12,  0xF8, 0xEE, 0x7D, 0xFF

bomb_seg6_vertex_0605A520: # 0x0605A520
vertex     37,      0,     -9,     10,    960,  0x2E, 0xF9, 0x8A, 0xFF
vertex     37,     10,      0,    928,    972,  0x32, 0x74, 0xFD, 0xFF
vertex     60,      0,      0,    494,     -4,  0x7D, 0xEE, 0xF8, 0xFF
vertex      0,     -8,     37,    -10,    976,  0xFD, 0x89, 0x29, 0xFF
vertex     10,      0,     37,    956,    980,  0x74, 0xF9, 0x32, 0xFF
vertex      0,      0,     60,    428,    -12,  0xF8, 0xEE, 0x7D, 0xFF
vertex     -9,      0,     37,    -24,    978,  0x8A, 0xF9, 0x2E, 0xFF
vertex      0,     -8,     37,    974,    976,  0xFD, 0x89, 0x29, 0xFF
vertex      0,      0,     60,    476,     -6,  0xF8, 0xEE, 0x7D, 0xFF
vertex     37,     -8,      0,    -20,    968,  0x29, 0x89, 0xFD, 0xFF
vertex     37,      0,     -9,    954,    972,  0x2E, 0xF9, 0x8A, 0xFF
vertex     60,      0,      0,    402,    -10,  0x7D, 0xEE, 0xF8, 0xFF
vertex     37,     10,      0,     -8,    964,  0x32, 0x74, 0xFD, 0xFF
vertex     37,      0,     10,    978,    962,  0x32, 0xF9, 0x74, 0xFF
vertex     60,      0,      0,    462,    -18,  0x7D, 0xEE, 0xF8, 0xFF

bomb_seg6_vertex_0605A610: # 0x0605A610
vertex    -59,      0,      0,    452,     20,  0x83, 0xEE, 0xF8, 0xFF
vertex    -36,      0,     -9,     -4,    974,  0xD2, 0xF9, 0x8A, 0xFF
vertex    -36,     -8,      0,    948,    980,  0xD7, 0x89, 0xFD, 0xFF
vertex     37,      0,     10,    -10,    970,  0x32, 0xF9, 0x74, 0xFF
vertex     37,     -8,      0,    960,    966,  0x29, 0x89, 0xFD, 0xFF
vertex     60,      0,      0,    488,     -8,  0x7D, 0xEE, 0xF8, 0xFF
vertex    -59,      0,      0,    370,     10,  0x83, 0xEE, 0xF8, 0xFF
vertex    -36,      0,     10,     -6,    964,  0xCE, 0xF9, 0x74, 0xFF
vertex    -36,     10,      0,    950,    968,  0xCE, 0x74, 0xFD, 0xFF
vertex    -59,      0,      0,    428,     12,  0x83, 0xEE, 0xF8, 0xFF
vertex    -36,     10,      0,      8,    968,  0xCE, 0x74, 0xFD, 0xFF
vertex    -36,      0,     -9,    938,    974,  0xD2, 0xF9, 0x8A, 0xFF
vertex    -59,      0,      0,    464,    -18,  0x83, 0xEE, 0xF8, 0xFF
vertex    -36,     -8,      0,     -4,    966,  0xD7, 0x89, 0xFD, 0xFF
vertex    -36,      0,     10,    964,    974,  0xCE, 0xF9, 0x74, 0xFF

bomb_seg6_vertex_0605A700: # 0x0605A700
vertex      0,      0,    -59,    464,      4,  0xF8, 0xEE, 0x83, 0xFF
vertex      0,     10,    -36,    -14,    968,  0xFD, 0x74, 0xCE, 0xFF
vertex     10,      0,    -36,    942,    976,  0x74, 0xF9, 0xCE, 0xFF
vertex      0,      0,    -59,    480,    -20,  0xF8, 0xEE, 0x83, 0xFF
vertex     -9,      0,    -36,     20,    962,  0x8A, 0xF9, 0xD2, 0xFF
vertex      0,     10,    -36,    946,    966,  0xFD, 0x74, 0xCE, 0xFF
vertex      0,      0,    -59,    412,      6,  0xF8, 0xEE, 0x83, 0xFF
vertex     10,      0,    -36,    -16,    970,  0x74, 0xF9, 0xCE, 0xFF
vertex      0,     -8,    -36,    968,    968,  0xFD, 0x89, 0xD7, 0xFF
vertex      0,      0,    -59,    402,      8,  0xF8, 0xEE, 0x83, 0xFF
vertex      0,     -8,    -36,      0,    970,  0xFD, 0x89, 0xD7, 0xFF
vertex     -9,      0,    -36,    952,    964,  0x8A, 0xF9, 0xD2, 0xFF

glabel bomb_seg6_dl_0605A7C0 # 0x0605A7C0 - 0x0605A7F8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bomb_seg6_texture_06057AC0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex bomb_seg6_vertex_0605A2C0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel bomb_seg6_dl_0605A7F8 # 0x0605A7F8 - 0x0605A830
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bomb_seg6_texture_06058AC0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex bomb_seg6_vertex_0605A300, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel bomb_seg6_dl_0605A830 # 0x0605A830 - 0x0605A8A8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList bomb_seg6_dl_0605A7C0
gsSPDisplayList bomb_seg6_dl_0605A7F8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

glabel bomb_seg6_dl_0605A8A8 # 0x0605A8A8 - 0x0605A9C0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bomb_seg6_texture_06059AC0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight bomb_seg6_light_06057AB0, 1
gsSPLight bomb_seg6_light_06057AA8, 2
gsSPVertex bomb_seg6_vertex_0605A340, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPVertex bomb_seg6_vertex_0605A430, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPVertex bomb_seg6_vertex_0605A520, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPVertex bomb_seg6_vertex_0605A610, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPVertex bomb_seg6_vertex_0605A700, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSPEndDisplayList

glabel bomb_seg6_dl_0605A9C0 # 0x0605A9C0 - 0x0605AA20
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bomb_seg6_dl_0605A8A8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
