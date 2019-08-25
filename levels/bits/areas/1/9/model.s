bits_seg7_vertex_07008DB8: # 0x07008DB8 - 0x07008EA8
vertex  -1121,    -50,    147,   -788,    990,  0xFF, 0xD4, 0x00, 0xFF
vertex   -388,     51,   -613,   8758,      0,  0xFF, 0xD4, 0x00, 0xFF
vertex  -1121,     51,    147,   -788,      0,  0xFF, 0xD4, 0x00, 0xFF
vertex   1178,    -50,   -255,   8598,    990,  0xFF, 0xD4, 0x00, 0xFF
vertex   1178,     51,   -255,   8598,      0,  0xFF, 0xD4, 0x00, 0xFF
vertex    465,     51,    761,    582,      0,  0xFF, 0xD4, 0x00, 0xFF
vertex    465,    -50,    761,    582,    990,  0xFF, 0xD4, 0x00, 0xFF
vertex  -1121,    -50,    761,   -644,    990,  0xFF, 0xD4, 0x00, 0xFF
vertex    465,    -50,    761,  10596,    990,  0xFF, 0xD4, 0x00, 0xFF
vertex    465,     51,    761,  10596,      0,  0xFF, 0xD4, 0x00, 0xFF
vertex  -1121,     51,    761,   -644,      0,  0xFF, 0xD4, 0x00, 0xFF
vertex   -388,    -50,   -613,   -644,    990,  0xFF, 0xD4, 0x00, 0xFF
vertex   1178,    -50,   -613,  10596,    990,  0xFF, 0xD4, 0x00, 0xFF
vertex   1178,     51,   -613,  10596,      0,  0xFF, 0xD4, 0x00, 0xFF
vertex   -388,     51,   -613,   -644,      0,  0xFF, 0xD4, 0x00, 0xFF

bits_seg7_vertex_07008EA8: # 0x07008EA8 - 0x07008F58
vertex      4,  -1177,    607,      0,    990,  0xFF, 0xD4, 0x00, 0xFF
vertex    315,  -1177,    607,   3034,    990,  0xFF, 0xD4, 0x00, 0xFF
vertex    315,  -1074,    607,   3034,      0,  0xFF, 0xD4, 0x00, 0xFF
vertex  -1121,    -50,    147,   -788,    990,  0xFF, 0xD4, 0x00, 0xFF
vertex   -388,    -50,   -613,   8758,    990,  0xFF, 0xD4, 0x00, 0xFF
vertex   -388,     51,   -613,   8758,      0,  0xFF, 0xD4, 0x00, 0xFF
vertex      4,  -1177,    299,      0,    990,  0xFF, 0xD4, 0x00, 0xFF
vertex    315,  -1074,    299,   3034,      0,  0xFF, 0xD4, 0x00, 0xFF
vertex      4,  -1074,    299,      0,      0,  0xFF, 0xD4, 0x00, 0xFF
vertex    315,  -1177,    299,   3034,    990,  0xFF, 0xD4, 0x00, 0xFF
vertex      4,  -1074,    607,      0,      0,  0xFF, 0xD4, 0x00, 0xFF

bits_seg7_dl_07008F58: # 0x07008F58 - 0x07008FE8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09005000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bits_seg7_vertex_07008DB8, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  3,  5, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex bits_seg7_vertex_07008EA8, 11, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  9,  7, 0x0
gsSP1Triangle  0,  2, 10, 0x0
gsSPEndDisplayList

glabel bits_seg7_dl_07008FE8 # 0x07008FE8 - 0x07009058
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bits_seg7_dl_07008F58
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
