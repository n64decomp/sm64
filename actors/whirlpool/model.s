# Whirlpool

whirlpool_seg5_texture_05012848: # 0x05012848
.incbin "actors/whirlpool/whirlpool.ia16"

whirlpool_seg5_vertex_05013848: # 0x05013848
vertex     93,    129,    161,    650,   1708,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    129,    185,    480,   1708,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,      0,    564,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex    161,    129,     93,    820,   1708,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,      0,    734,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex    189,    802,    328,    650,    128,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    802,    379,    480,    128,  0xFF, 0xFF, 0xFF, 0xFF
vertex    328,    802,    189,    820,    128,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -92,    129,    161,    308,   1708,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -188,    802,    328,    308,    128,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,      0,    394,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex    185,    129,      0,    990,   1708,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,      0,    904,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex    379,    802,      0,    990,    128,  0xFF, 0xFF, 0xFF, 0xFF

whirlpool_seg5_vertex_05013928: # 0x05013928
vertex    -92,    129,   -160,   1672,   1708,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -188,    802,   -327,   1672,    128,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    802,   -378,   1502,    128,  0xFF, 0xFF, 0xFF, 0xFF
vertex    161,    129,    -92,   1160,   1708,  0xFF, 0xFF, 0xFF, 0xFF
vertex    379,    802,      0,    990,    128,  0xFF, 0xFF, 0xFF, 0xFF
vertex    185,    129,      0,    990,   1708,  0xFF, 0xFF, 0xFF, 0xFF
vertex    328,    802,   -188,   1160,    128,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,      0,   1076,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex     93,    129,   -160,   1330,   1708,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,      0,   1246,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex    189,    802,   -327,   1330,    128,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    129,   -184,   1502,   1708,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,      0,   1416,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -92,    129,    161,    308,   1708,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -160,    129,     93,    138,   1708,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,      0,    224,   2012,  0xFF, 0xFF, 0xFF, 0xFF

whirlpool_seg5_vertex_05013A28: # 0x05013A28
vertex    -92,    129,   -160,   1672,   1708,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    129,   -184,   1502,   1708,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,      0,   1586,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -160,    129,    -92,   1842,   1708,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,      0,   1756,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -188,    802,   -327,   1672,    128,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -327,    802,   -188,   1842,    128,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -184,    129,      0,   2012,   1708,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,      0,   1926,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -378,    802,      0,   2012,    128,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -160,    129,     93,    138,   1708,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -184,    129,      0,      0,   1708,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,      0,     54,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -378,    802,      0,      0,    128,  0xFF, 0xFF, 0xFF, 0xFF

whirlpool_seg5_vertex_05013B08: # 0x05013B08
vertex    -92,    129,    161,    308,   1708,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -188,    802,    328,    308,    128,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -327,    802,    189,    138,    128,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -160,    129,     93,    138,   1708,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -378,    802,      0,      0,    128,  0xFF, 0xFF, 0xFF, 0xFF

glabel whirlpool_seg5_dl_05013B58 # 0x05013B58 - 0x05013CB8
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, whirlpool_seg5_texture_05012848
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex whirlpool_seg5_vertex_05013848, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  4, 0x0
gsSP2Triangles  0,  5,  6, 0x0,  0,  6,  1, 0x0
gsSP2Triangles  3,  5,  0, 0x0,  3,  7,  5, 0x0
gsSP2Triangles  1,  6,  8, 0x0,  6,  9,  8, 0x0
gsSP2Triangles  1,  8, 10, 0x0, 11,  3, 12, 0x0
gsSP2Triangles 11, 13,  3, 0x0, 13,  7,  3, 0x0
gsSPVertex whirlpool_seg5_vertex_05013928, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  3,  5,  7, 0x0
gsSP2Triangles  8,  3,  9, 0x0,  8,  6,  3, 0x0
gsSP2Triangles  8, 10,  6, 0x0, 11,  8, 12, 0x0
gsSP2Triangles  2, 10,  8, 0x0, 11,  2,  8, 0x0
gsSP2Triangles  0,  2, 11, 0x0, 13, 14, 15, 0x0
gsSPVertex whirlpool_seg5_vertex_05013A28, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  4, 0x0
gsSP2Triangles  3,  5,  0, 0x0,  3,  6,  5, 0x0
gsSP2Triangles  7,  3,  8, 0x0,  9,  6,  3, 0x0
gsSP2Triangles  7,  9,  3, 0x0, 10, 11, 12, 0x0
gsSP1Triangle 10, 13, 11, 0x0
gsSPVertex whirlpool_seg5_vertex_05013B08, 5, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP1Triangle  3,  2,  4, 0x0
gsSPEndDisplayList

glabel whirlpool_seg5_dl_05013CB8 # 0x05013CB8 - 0x05013D28
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList whirlpool_seg5_dl_05013B58
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
