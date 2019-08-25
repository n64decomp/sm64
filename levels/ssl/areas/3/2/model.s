ssl_seg7_light_07021AC8: # 0x07021AC8 - 0x07021AD0
.byte 0x46, 0x46, 0x46, 0x00, 0x46, 0x46, 0x46, 0x00

ssl_seg7_light_07021AD0: # 0x07021AD0 - 0x07021AE0
.byte 0x8C, 0x8C, 0x8C, 0x00, 0x8C, 0x8C, 0x8C, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ssl_seg7_vertex_07021AE0: # 0x07021AE0 - 0x07021BA0
vertex    947,  -3224,  -1855,  -3608,   4668,  0x71, 0x00, 0x38, 0x00
vertex    947,  -3224,  -3954,   4772,   4668,  0x59, 0x00, 0x59, 0x00
vertex    947,  -2200,  -3954,   4772,    582,  0x59, 0x00, 0x59, 0xFF
vertex    947,  -2200,  -1855,  -3608,    582,  0x38, 0x00, 0x71, 0xFF
vertex   -946,  -3224,  -3954,  -3300,   3646,  0x8F, 0x00, 0x38, 0x00
vertex   -946,  -3224,  -1855,   5078,   3646,  0xC8, 0x00, 0x71, 0x00
vertex   -946,  -2200,  -1855,   5078,   -440,  0x8F, 0x00, 0x38, 0xFF
vertex   -946,  -2200,  -3954,  -3300,   -440,  0xC8, 0x00, 0x71, 0xFF
vertex   -946,  -3224,  -1855,  -3096,   4668,  0xC8, 0x00, 0x71, 0x00
vertex    947,  -2200,  -1855,   4464,    582,  0x38, 0x00, 0x71, 0xFF
vertex   -946,  -2200,  -1855,  -3096,    582,  0x8F, 0x00, 0x38, 0xFF
vertex    947,  -3224,  -1855,   4464,   4668,  0x71, 0x00, 0x38, 0x00

ssl_seg7_vertex_07021BA0: # 0x07021BA0 - 0x07021C90
vertex  -2559,  -3224,  -3954,  -9228,   7120,  0x59, 0x00, 0x59, 0x00
vertex   -946,  -3224,  -3954,  -2790,   7120,  0x8F, 0x00, 0x38, 0x00
vertex   -946,  -2200,  -3954,  -2790,   3032,  0xC8, 0x00, 0x71, 0xFF
vertex   2560,  -2200,  -3954,  -6162,    990,  0x8F, 0x00, 0x38, 0xFF
vertex   2560,  -3224,  -3954,  -6162,   5076,  0xC8, 0x00, 0x71, 0x00
vertex   2560,  -3224,   -370,   8144,   5076,  0x8F, 0x00, 0xC8, 0x00
vertex   2560,  -2200,   -370,   8144,    990,  0xC8, 0x00, 0x8F, 0xFF
vertex  -2559,  -2200,   -370,  -7184,   2010,  0x71, 0x00, 0xC8, 0xFF
vertex  -2559,  -3224,   -370,  -7184,   6098,  0x38, 0x00, 0x8F, 0x00
vertex  -2559,  -3224,  -3954,   7122,   6098,  0x59, 0x00, 0x59, 0x00
vertex  -2559,  -2200,  -3954,   7122,   2010,  0x59, 0x00, 0x59, 0xFF
vertex    947,  -2200,  -3954,   4772,   3032,  0x59, 0x00, 0x59, 0xFF
vertex   2560,  -3224,  -3954,  11210,   7120,  0xC8, 0x00, 0x71, 0x00
vertex   2560,  -2200,  -3954,  11210,   3032,  0x8F, 0x00, 0x38, 0xFF
vertex    947,  -3224,  -3954,   4772,   7120,  0x59, 0x00, 0x59, 0x00

ssl_seg7_vertex_07021C90: # 0x07021C90 - 0x07021D00
vertex   2560,  -2200,   -370,  -9228,    990,  0xC8, 0x00, 0x8F, 0xFF
vertex   2560,  -3224,   -370,  -9228,   5076,  0x8F, 0x00, 0xC8, 0x00
vertex  -2559,  -3224,   -370,  11210,   5076,  0x38, 0x00, 0x8F, 0x00
vertex  -2559,  -3224,  -3954,  -9228,   7120,  0x59, 0x00, 0x59, 0x00
vertex   -946,  -2200,  -3954,  -2790,   3032,  0xC8, 0x00, 0x71, 0xFF
vertex  -2559,  -2200,  -3954,  -9228,   3032,  0x59, 0x00, 0x59, 0xFF
vertex  -2559,  -2200,   -370,  11210,    990,  0x71, 0x00, 0xC8, 0xFF

ssl_seg7_dl_07021D00: # 0x07021D00 - 0x07021D68
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, generic_09000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ssl_seg7_light_07021AD0, 1
gsSPLight ssl_seg7_light_07021AC8, 2
gsSPVertex ssl_seg7_vertex_07021AE0, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSPEndDisplayList

ssl_seg7_dl_07021D68: # 0x07021D68 - 0x07021DE8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, generic_09001000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex ssl_seg7_vertex_07021BA0, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 14, 12, 0x0
gsSPVertex ssl_seg7_vertex_07021C90, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP1Triangle  0,  2,  6, 0x0
gsSPEndDisplayList

glabel ssl_seg7_dl_07021DE8 # 0x07021DE8 - 0x07021E50
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ssl_seg7_dl_07021D00
gsSPDisplayList ssl_seg7_dl_07021D68
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
