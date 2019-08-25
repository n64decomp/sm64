bbh_seg7_light_0701E5D8: # 0x0701E5D8 - 0x0701E5E0
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

bbh_seg7_light_0701E5E0: # 0x0701E5E0 - 0x0701E5F0
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bbh_seg7_vertex_0701E5F0: # 0x0701E5F0 - 0x0701E6E0
vertex   5530,   1843,  -1945, -10250,  -1054,  0x81, 0x00, 0x00, 0xFF
vertex   5530,   -204,  -1945, -10250,   5758,  0x81, 0x00, 0x00, 0xFF
vertex   5530,   -204,   4710,  11210,   5758,  0x81, 0x00, 0x00, 0xFF
vertex  -4197,   1843,  -1945,  -4118,  -1054,  0x59, 0x00, 0x59, 0xFF
vertex  -2149,   -204,  -3993,   5078,   5758,  0x59, 0x00, 0x59, 0xFF
vertex  -2149,   1843,  -3993,   5078,  -1054,  0x59, 0x00, 0x59, 0xFF
vertex  -4197,   -204,  -1945,  -4118,   5758,  0x59, 0x00, 0x59, 0xFF
vertex  -2149,   1843,  -3993,  -8206,      0,  0x00, 0x00, 0x7F, 0xFF
vertex  -2149,   -204,  -3993,  -8206,   6780,  0x00, 0x00, 0x7F, 0xFF
vertex   3482,   -204,  -3993,  10188,   6780,  0x00, 0x00, 0x7F, 0xFF
vertex   3482,   1843,  -3993,  10188,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   3482,   1843,  -3993,  -4118,  -1054,  0xA7, 0x00, 0x59, 0xFF
vertex   3482,   -204,  -3993,  -4118,   5758,  0xA7, 0x00, 0x59, 0xFF
vertex   5530,   -204,  -1945,   5078,   5758,  0xA7, 0x00, 0x59, 0xFF
vertex   5530,   1843,  -1945,   5078,  -1054,  0xA7, 0x00, 0x59, 0xFF

bbh_seg7_vertex_0701E6E0: # 0x0701E6E0 - 0x0701E7D0
vertex   5530,   1843,   4710,  -4118,      0,  0xA7, 0x00, 0xA7, 0xFF
vertex   5530,   -204,   4710,  -4118,   6780,  0xA7, 0x00, 0xA7, 0xFF
vertex   3482,   -204,   6758,   5070,   6780,  0xA7, 0x00, 0xA7, 0xFF
vertex   5530,   1843,  -1945, -10250,  -1054,  0x81, 0x00, 0x00, 0xFF
vertex   5530,   -204,   4710,  11210,   5758,  0x81, 0x00, 0x00, 0xFF
vertex   5530,   1843,   4710,  11210,  -1054,  0x81, 0x00, 0x00, 0xFF
vertex  -4197,   1843,   4710, -10250,  -1054,  0x7F, 0x00, 0x00, 0xFF
vertex  -4197,   -204,   4710, -10250,   5758,  0x7F, 0x00, 0x00, 0xFF
vertex  -4197,   -204,  -1945,  11210,   5758,  0x7F, 0x00, 0x00, 0xFF
vertex  -4197,   1843,  -1945,  11210,  -1054,  0x7F, 0x00, 0x00, 0xFF
vertex  -2149,   1843,   6758,  -4118,  -2076,  0x59, 0x00, 0xA7, 0xFF
vertex  -4197,   -204,   4710,   5078,   4736,  0x59, 0x00, 0xA7, 0xFF
vertex  -4197,   1843,   4710,   5078,  -2076,  0x59, 0x00, 0xA7, 0xFF
vertex  -2149,   -204,   6758,  -4118,   4736,  0x59, 0x00, 0xA7, 0xFF
vertex   3482,   1843,   6758,   5070,      0,  0xA7, 0x00, 0xA7, 0xFF

bbh_seg7_vertex_0701E7D0: # 0x0701E7D0 - 0x0701E810
vertex  -2149,   1843,   6758,   9166,      0,  0x00, 0x00, 0x81, 0xFF
vertex   3482,   1843,   6758,  -9228,      0,  0x00, 0x00, 0x81, 0xFF
vertex   3482,   -204,   6758,  -9228,   6780,  0x00, 0x00, 0x81, 0xFF
vertex  -2149,   -204,   6758,   9166,   6780,  0x00, 0x00, 0x81, 0xFF

bbh_seg7_dl_0701E810: # 0x0701E810 - 0x0701E8D8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bbh_seg7_texture_07001800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight bbh_seg7_light_0701E5E0, 1
gsSPLight bbh_seg7_light_0701E5D8, 2
gsSPVertex bbh_seg7_vertex_0701E5F0, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex bbh_seg7_vertex_0701E6E0, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  8,  9, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 13, 11, 0x0
gsSP1Triangle  0,  2, 14, 0x0
gsSPVertex bbh_seg7_vertex_0701E7D0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel bbh_seg7_dl_0701E8D8 # 0x0701E8D8 - 0x0701E948
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bbh_seg7_dl_0701E810
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsSPEndDisplayList
