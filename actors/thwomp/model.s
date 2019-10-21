# Thwomp

thwomp_seg5_light_050098E8: # 0x050098E8
.byte 0x4C, 0x4C, 0x4C, 0x00, 0x4C, 0x4C, 0x4C, 0x00

thwomp_seg5_light_050098F0: # 0x050098F0
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

thwomp_seg5_texture_05009900: # 0x05009900
.incbin "actors/thwomp/thwomp_face.rgba16"

thwomp_seg5_texture_0500A900: # 0x0500A900
.incbin "actors/thwomp/thwomp_surface.rgba16"

thwomp_seg5_vertex_0500B100: # 0x0500B100
vertex    -97,     52,   -141,   3308,    418,  0xCE, 0xCB, 0x99, 0xFF
vertex   -141,     52,    -72,   2910,    418,  0x93, 0xCA, 0xDF, 0xFF
vertex   -156,    252,    -78,   2904,   1584,  0x89, 0x1A, 0xDE, 0xFF
vertex   -105,    252,   -156,   3316,   1584,  0xD0, 0x46, 0xA3, 0xFF
vertex    106,    252,   -156,   4286,   1584,  0x29, 0x39, 0x97, 0xFF
vertex     98,     52,   -141,   4292,    418,  0x45, 0xD0, 0xA2, 0xFF
vertex    157,    252,    -78,   4698,   1584,  0x73, 0x22, 0xD7, 0xFF
vertex    142,     52,    -72,   4692,    418,  0x70, 0xC9, 0xEA, 0xFF
vertex      0,    302,   -101,    460,    -56,  0x00, 0x70, 0xC6, 0xFF
vertex     93,    330,      0,   1000,    540,  0x2C, 0x76, 0x00, 0xFF
vertex    106,    252,   -156,   1080,   -374,  0x29, 0x39, 0x97, 0xFF
vertex    -92,    330,      0,    -80,    540,  0xD4, 0x76, 0x00, 0xFF
vertex      0,    302,    102,    460,   1134,  0x00, 0x70, 0x3A, 0xFF
vertex    106,    252,    157,   1080,   1452,  0x30, 0x46, 0x5D, 0xFF
vertex   -105,    252,   -156,   -160,   -374,  0xD0, 0x46, 0xA3, 0xFF

thwomp_seg5_vertex_0500B1F0: # 0x0500B1F0
vertex   -156,    252,     79,   -452,   1000,  0x8D, 0x22, 0x29, 0xFF
vertex   -105,    252,    157,   -160,   1452,  0xD7, 0x39, 0x69, 0xFF
vertex    -92,    330,      0,    -80,    540,  0xD4, 0x76, 0x00, 0xFF
vertex   -156,    252,    -78,   -452,     78,  0x89, 0x1A, 0xDE, 0xFF
vertex   -105,    252,   -156,   -160,   -374,  0xD0, 0x46, 0xA3, 0xFF
vertex      0,    302,    102,    460,   1134,  0x00, 0x70, 0x3A, 0xFF
vertex    106,    252,    157,   1080,   1452,  0x30, 0x46, 0x5D, 0xFF
vertex    -97,     52,   -141,   -188,   1444,  0xCE, 0xCB, 0x99, 0xFF
vertex     83,      0,    -82,   1042,   1040,  0x1E, 0x8C, 0xD7, 0xFF
vertex    -82,      0,    -82,    -82,   1040,  0xC9, 0x92, 0xE2, 0xFF
vertex     98,     52,   -141,   1148,   1444,  0x45, 0xD0, 0xA2, 0xFF
vertex     83,      0,     83,   1042,    -84,  0x37, 0x92, 0x1E, 0xFF
vertex    -82,      0,     83,    -82,    -84,  0xE2, 0x8C, 0x29, 0xFF
vertex    142,     52,    -72,   1446,    976,  0x70, 0xC9, 0xEA, 0xFF
vertex     98,     52,    142,   1148,   -488,  0x32, 0xCB, 0x67, 0xFF
vertex    -97,     52,    142,   -188,   -488,  0xBB, 0xD0, 0x5E, 0xFF

thwomp_seg5_vertex_0500B2F0: # 0x0500B2F0
vertex    -82,      0,    -82,    -82,   1040,  0xC9, 0x92, 0xE2, 0xFF
vertex    -82,      0,     83,    -82,    -84,  0xE2, 0x8C, 0x29, 0xFF
vertex   -141,     52,     73,   -486,    -18,  0x90, 0xC9, 0x16, 0xFF
vertex    -97,     52,    142,   -188,   -488,  0xBB, 0xD0, 0x5E, 0xFF
vertex    -97,     52,   -141,   -188,   1444,  0xCE, 0xCB, 0x99, 0xFF
vertex   -141,     52,    -72,   -486,    976,  0x93, 0xCA, 0xDF, 0xFF
vertex     83,      0,     83,   1042,    -84,  0x37, 0x92, 0x1E, 0xFF
vertex    142,     52,    -72,   1446,    976,  0x70, 0xC9, 0xEA, 0xFF
vertex    142,     52,     73,   1446,    -18,  0x6D, 0xCA, 0x21, 0xFF
vertex     98,     52,    142,   1148,   -488,  0x32, 0xCB, 0x67, 0xFF
vertex    142,     52,    -72,   4692,    418,  0x70, 0xC9, 0xEA, 0xFF
vertex    157,    252,    -78,   4698,   1584,  0x73, 0x22, 0xD7, 0xFF
vertex    157,    252,     79,   5458,   1584,  0x77, 0x1A, 0x22, 0xFF
vertex    142,     52,     73,   5464,    418,  0x6D, 0xCA, 0x21, 0xFF

thwomp_seg5_vertex_0500B3D0: # 0x0500B3D0
vertex    106,    252,    157,    760,   1584,  0x30, 0x46, 0x5D, 0xFF
vertex     98,     52,    142,    754,    418,  0x32, 0xCB, 0x67, 0xFF
vertex    157,    252,     79,    348,   1584,  0x77, 0x1A, 0x22, 0xFF
vertex    -97,     52,    142,   1738,    418,  0xBB, 0xD0, 0x5E, 0xFF
vertex   -156,    252,     79,   2142,   1584,  0x8D, 0x22, 0x29, 0xFF
vertex   -141,     52,     73,   2136,    418,  0x90, 0xC9, 0x16, 0xFF
vertex   -156,    252,    -78,   2904,   1584,  0x89, 0x1A, 0xDE, 0xFF
vertex   -141,     52,    -72,   2910,    418,  0x93, 0xCA, 0xDF, 0xFF
vertex   -105,    252,    157,   1730,   1584,  0xD7, 0x39, 0x69, 0xFF
vertex    106,    252,   -156,    -24,    628,  0x29, 0x39, 0x97, 0xFF
vertex   -105,    252,   -156,    984,    628,  0xD0, 0x46, 0xA3, 0xFF
vertex      0,    302,   -101,    480,    370,  0x00, 0x70, 0xC6, 0xFF
vertex    157,    252,     79,   1374,   1000,  0x77, 0x1A, 0x22, 0xFF
vertex     93,    330,      0,   1000,    540,  0x2C, 0x76, 0x00, 0xFF
vertex    106,    252,    157,   1080,   1452,  0x30, 0x46, 0x5D, 0xFF
vertex    157,    252,    -78,   1374,     78,  0x73, 0x22, 0xD7, 0xFF

thwomp_seg5_vertex_0500B4D0: # 0x0500B4D0
vertex     98,     52,    142,    754,    418,  0x32, 0xCB, 0x67, 0xFF
vertex    142,     52,     73,    354,    418,  0x6D, 0xCA, 0x21, 0xFF
vertex    157,    252,     79,    348,   1584,  0x77, 0x1A, 0x22, 0xFF
vertex    106,    252,   -156,   1414,    324,  0x29, 0x39, 0x97, 0xFF
vertex     93,    330,      0,    472,    -20,  0x2C, 0x76, 0x00, 0xFF
vertex    157,    252,    -78,    946,    494,  0x73, 0x22, 0xD7, 0xFF

thwomp_seg5_vertex_0500B530: # 0x0500B530
vertex     98,     52,    142,    968,   1976,  0x32, 0xCB, 0x67, 0xFF
vertex    106,    252,    157,   1010,      0,  0x30, 0x46, 0x5D, 0xFF
vertex   -105,    252,    157,    -54,    -12,  0xD7, 0x39, 0x69, 0xFF
vertex    -97,     52,    142,    -16,   1964,  0xBB, 0xD0, 0x5E, 0xFF

glabel thwomp_seg5_dl_0500B570 # 0x0500B570 - 0x0500B718
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, thwomp_seg5_texture_0500A900
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight thwomp_seg5_light_050098F0, 1
gsSPLight thwomp_seg5_light_050098E8, 2
gsSPVertex thwomp_seg5_vertex_0500B100, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  2, 0x0
gsSP2Triangles  0,  3,  4, 0x0,  0,  4,  5, 0x0
gsSP2Triangles  5,  4,  6, 0x0,  5,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSP2Triangles 12, 13,  9, 0x0,  9, 11, 12, 0x0
gsSP1Triangle  8, 14, 11, 0x0
gsSPVertex thwomp_seg5_vertex_0500B1F0, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  2,  4, 0x0
gsSP2Triangles  0,  2,  3, 0x0,  2,  1,  5, 0x0
gsSP2Triangles  1,  6,  5, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0,  8, 11, 12, 0x0
gsSP2Triangles  8, 12,  9, 0x0, 11,  8, 13, 0x0
gsSP2Triangles 13,  8, 10, 0x0, 14, 12, 11, 0x0
gsSP1Triangle 14, 15, 12, 0x0
gsSPVertex thwomp_seg5_vertex_0500B2F0, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  1,  3, 0x0
gsSP2Triangles  4,  0,  5, 0x0,  0,  2,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9,  6,  8, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 12, 13, 0x0
gsSPVertex thwomp_seg5_vertex_0500B3D0, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  5,  4,  6, 0x0,  5,  6,  7, 0x0
gsSP2Triangles  3,  8,  4, 0x0,  9, 10, 11, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 15, 13, 12, 0x0
gsSPVertex thwomp_seg5_vertex_0500B4D0, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPEndDisplayList

glabel thwomp_seg5_dl_0500B718 # 0x0500B718 - 0x0500B750
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, thwomp_seg5_texture_05009900
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex thwomp_seg5_vertex_0500B530, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel thwomp_seg5_dl_0500B750 # 0x0500B750 - 0x0500B7D0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList thwomp_seg5_dl_0500B570
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList thwomp_seg5_dl_0500B718
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
