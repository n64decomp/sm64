# Mad Piano

# Unreferenced light
.byte 0x05, 0x04, 0x08, 0x00, 0x05, 0x04, 0x08, 0x00

.byte 0x14, 0x13, 0x20, 0x00, 0x14, 0x13, 0x20, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

# Unreferenced light
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

# Unreferenced light
.byte 0x2C, 0x2C, 0x2C, 0x00, 0x2C, 0x2C, 0x2C, 0x00

.byte 0xB2, 0xB2, 0xB2, 0x00, 0xB2, 0xB2, 0xB2, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

# Unreferenced light
.byte 0x30, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00

.byte 0xC3, 0x00, 0x00, 0x00, 0xC3, 0x00, 0x00, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

mad_piano_seg5_texture_05006AF0: # 0x05006AF0
.incbin "actors/mad_piano/mad_piano_tooth.rgba16"

mad_piano_seg5_texture_050072F0: # 0x050072F0
.incbin "actors/mad_piano/mad_piano_body.rgba16"

mad_piano_seg5_texture_050076F0: # 0x050076F0
.incbin "actors/mad_piano/mad_piano_keys_corner.rgba16"

mad_piano_seg5_texture_05007AF0: # 0x05007AF0
.incbin "actors/mad_piano/mad_piano_mouth.rgba16"

mad_piano_seg5_texture_05007EF0: # 0x05007EF0
.incbin "actors/mad_piano/mad_piano_keys.rgba16"

mad_piano_seg5_texture_050082F0: # 0x050082F0
.incbin "actors/mad_piano/mad_piano_keys_edge.rgba16"

mad_piano_seg5_light_050086F0: # 0x050086F0
.byte 0x4C, 0x4C, 0x4C, 0x00, 0x4C, 0x4C, 0x4C, 0x00

mad_piano_seg5_light_050086F8: # 0x050086F8
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

mad_piano_seg5_vertex_05008708: # 0x05008708
vertex      0,      0,    609,     17,    776,  0x00, 0x7E, 0x00, 0xFF
vertex    834,     -2,   -523,    529,    420,  0x00, 0x7E, 0x00, 0xFF
vertex    626,     -1,   -740,    566,    662,  0x00, 0x7E, 0x00, 0xFF
vertex      0,      0,    609,     17,    776,  0x00, 0x7F, 0x00, 0xFF
vertex    201,      0,   -740,    495,   1020,  0x00, 0x7F, 0x00, 0xFF
vertex      0,      0,   -523,    390,   1124,  0x00, 0x7F, 0x00, 0xFF
vertex    201,      0,   -740,    495,   1020,  0x00, 0x7E, 0x00, 0xFF
vertex   1136,     -2,    140,    361,    -38,  0x00, 0x7E, 0x00, 0xFF
vertex    887,     -2,    -47,    381,    228,  0x00, 0x7E, 0x00, 0xFF
vertex   1136,     -2,    609,    206,   -184,  0x00, 0x7E, 0x00, 0xFF

mad_piano_seg5_vertex_050087A8: # 0x050087A8
vertex    641,     -4,    600,   -344,    224,  0x00, 0x00, 0x7F, 0xFF
vertex    721,   -189,    600,    920,    884,  0x00, 0x00, 0x7F, 0xFF
vertex    802,     -5,    600,    536,   -572,  0x00, 0x00, 0x7F, 0xFF
vertex      2,     -2,    600,    998,    390,  0x00, 0x00, 0x7F, 0xFF
vertex     83,   -135,    600,     22,    878,  0x00, 0x00, 0x7F, 0xFF
vertex    163,     -3,    600,    136,   -574,  0x00, 0x00, 0x7F, 0xFF
vertex    160,     -3,    600,    -78,    226,  0x00, 0x00, 0x7F, 0xFF
vertex    241,   -164,    600,   1000,    906,  0x00, 0x00, 0x7F, 0xFF
vertex    321,     -3,    600,    876,   -476,  0x00, 0x00, 0x7F, 0xFF
vertex    320,     -3,    600,   -370,    262,  0x00, 0x00, 0x7F, 0xFF
vertex    401,   -189,    600,   1036,    966,  0x00, 0x00, 0x7F, 0xFF
vertex    482,     -4,    600,    588,   -652,  0x00, 0x00, 0x7F, 0xFF
vertex    479,     -4,    600,   -184,    116,  0x00, 0x00, 0x7F, 0xFF
vertex    559,   -211,    600,    914,    830,  0x00, 0x00, 0x7F, 0xFF
vertex    640,     -4,    600,    566,   -574,  0x00, 0x00, 0x7F, 0xFF

mad_piano_seg5_vertex_05008898: # 0x05008898
vertex   1126,     -6,    337,     68,    134,  0x7E, 0xF3, 0x00, 0xFF
vertex   1110,   -157,    267,    728,    892,  0x7E, 0xF3, 0x00, 0xFF
vertex   1126,     -6,    198,    726,   -548,  0x7E, 0xF3, 0x00, 0xFF
vertex    799,     -5,    600,     14,    114,  0x00, 0x00, 0x7F, 0xFF
vertex    880,   -164,    600,    904,    824,  0x00, 0x00, 0x7F, 0xFF
vertex    961,     -5,    600,    868,   -900,  0x00, 0x00, 0x7F, 0xFF
vertex    959,     -5,    600,    -42,    174,  0x00, 0x00, 0x7F, 0xFF
vertex   1040,   -156,    600,    982,    896,  0x00, 0x00, 0x7F, 0xFF
vertex   1120,     -5,    600,    974,   -680,  0x00, 0x00, 0x7F, 0xFF
vertex   1126,     -6,    598,    -22,    132,  0x7E, 0xF3, 0x00, 0xFF
vertex   1110,   -159,    541,    690,    890,  0x7E, 0xF3, 0x00, 0xFF
vertex   1126,     -6,    472,    574,   -626,  0x7E, 0xF3, 0x00, 0xFF
vertex   1126,     -6,    475,    -38,    232,  0x7E, 0xF3, 0x00, 0xFF
vertex   1110,   -152,    405,    764,    754,  0x7E, 0xF3, 0x00, 0xFF
vertex   1126,     -6,    336,    650,   -482,  0x7E, 0xF3, 0x00, 0xFF

mad_piano_seg5_vertex_05008988: # 0x05008988
vertex    435,     -4,   -728,     90,    138,  0x00, 0x00, 0x81, 0xFF
vertex    354,   -123,   -728,    858,    806,  0x00, 0x00, 0x81, 0xFF
vertex    274,     -3,   -728,    978,   -868,  0x00, 0x00, 0x81, 0xFF
vertex   1126,     -6,    201,    120,    -18,  0x6B, 0x03, 0xBC, 0xFF
vertex   1097,   -151,    148,    816,    786,  0x6B, 0x03, 0xBC, 0xFF
vertex   1059,     -5,     96,    662,   -828,  0x6B, 0x03, 0xBC, 0xFF
vertex   1059,     -5,     97,    182,    198,  0x3C, 0x05, 0x91, 0xFF
vertex   1007,   -140,     62,    808,    914,  0x3C, 0x05, 0x91, 0xFF
vertex    933,     -5,     28,    958,   -596,  0x3C, 0x05, 0x91, 0xFF
vertex    935,     -5,     29,    -62,    182,  0x67, 0xFE, 0xB8, 0xFF
vertex    895,   -134,    -23,    834,    682,  0x67, 0xFE, 0xB8, 0xFF
vertex    860,     -5,    -78,    694,   -694,  0x67, 0xFE, 0xB8, 0xFF
vertex    860,     -5,    -78,    128,    310,  0x7E, 0x01, 0xF3, 0xFF
vertex    854,   -119,   -147,    746,    928,  0x7E, 0x01, 0xF3, 0xFF
vertex    845,     -5,   -216,    712,   -528,  0x7E, 0x01, 0xF3, 0xFF

mad_piano_seg5_vertex_05008A78: # 0x05008A78
vertex    845,     -5,   -216,     10,    306,  0x7E, 0x02, 0xF5, 0xFF
vertex    841,   -123,   -288,    828,    886,  0x7E, 0x02, 0xF5, 0xFF
vertex    831,     -5,   -368,    878,   -954,  0x7E, 0x02, 0xF5, 0xFF
vertex    594,     -4,   -728,   -258,    222,  0x00, 0x00, 0x81, 0xFF
vertex    513,   -123,   -728,    840,    686,  0x00, 0x00, 0x81, 0xFF
vertex    433,     -3,   -728,    838,   -766,  0x00, 0x00, 0x81, 0xFF
vertex    707,     -4,   -612,    -84,    164,  0x5A, 0x00, 0xA8, 0xFF
vertex    651,   -123,   -670,    866,    834,  0x5A, 0x00, 0xA8, 0xFF
vertex    594,     -4,   -728,    992,   -908,  0x5A, 0x00, 0xA8, 0xFF
vertex    817,     -5,   -501,   -268,    128,  0x5A, 0x00, 0xA7, 0xFF
vertex    759,   -123,   -559,    872,    820,  0x5A, 0x00, 0xA7, 0xFF
vertex    707,     -4,   -612,    826,   -972,  0x5A, 0x00, 0xA7, 0xFF
vertex    831,     -5,   -368,    166,     88,  0x7E, 0x02, 0xF3, 0xFF
vertex    828,   -123,   -421,    836,    872,  0x7E, 0x02, 0xF3, 0xFF
vertex    817,     -5,   -501,    818,   -724,  0x7E, 0x02, 0xF3, 0xFF

glabel mad_piano_seg5_dl_05008B68 # 0x05008B68 - 0x05008BD0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mad_piano_seg5_texture_050072F0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x1FF, 0x200
gsSPLight mad_piano_seg5_light_050086F8, 1
gsSPLight mad_piano_seg5_light_050086F0, 2
gsSPVertex mad_piano_seg5_vertex_05008708, 10, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  0,  2,  6, 0x0,  0,  7,  8, 0x0
gsSP2Triangles  0,  8,  1, 0x0,  0,  9,  7, 0x0
gsSPEndDisplayList

glabel mad_piano_seg5_dl_05008BD0 # 0x05008BD0 - 0x05008CB0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mad_piano_seg5_texture_05006AF0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex mad_piano_seg5_vertex_050087A8, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPVertex mad_piano_seg5_vertex_05008898, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPVertex mad_piano_seg5_vertex_05008988, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPVertex mad_piano_seg5_vertex_05008A78, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPEndDisplayList

glabel mad_piano_seg5_dl_05008CB0 # 0x05008CB0 - 0x05008D40
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 60, 124
gsSPDisplayList mad_piano_seg5_dl_05008B68
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList mad_piano_seg5_dl_05008BD0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsSPEndDisplayList

mad_piano_seg5_light_05008D40: # 0x05008D40
.byte 0x3D, 0x3D, 0x3D, 0x00, 0x3D, 0x3D, 0x3D, 0x00

mad_piano_seg5_light_05008D48: # 0x05008D48
.byte 0xCC, 0xCC, 0xCC, 0x00, 0xCC, 0xCC, 0xCC, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

mad_piano_seg5_light_05008D58: # 0x05008D58
.byte 0x4C, 0x4C, 0x4C, 0x00, 0x4C, 0x4C, 0x4C, 0x00

mad_piano_seg5_light_05008D60: # 0x05008D60
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

mad_piano_seg5_light_05008D70: # 0x05008D70
.byte 0x26, 0x26, 0x26, 0x00, 0x26, 0x26, 0x26, 0x00

mad_piano_seg5_light_05008D78: # 0x05008D78
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

mad_piano_seg5_light_05008D88: # 0x05008D88
.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

mad_piano_seg5_light_05008D90: # 0x05008D90
.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

mad_piano_seg5_vertex_05008DA0: # 0x05008DA0
vertex    454,    592,     18,    262,    962,  0x2D, 0x74, 0x17, 0xFF
vertex    -14,    586,    220,    485,    588,  0xFE, 0x09, 0x7E, 0xFF
vertex    454,    592,    220,    485,    962,  0x92, 0x00, 0x3D, 0xFF
vertex    454,    592,     18,    411,   -102,  0x2D, 0x74, 0x17, 0xFF
vertex    454,    592,    220,    160,    118,  0x92, 0x00, 0x3D, 0xFF
vertex    467,   -543,    220,    160,   1024,  0x70, 0xFE, 0x3A, 0xFF
vertex    467,   -543,     18,    411,    804,  0x23, 0x9B, 0x43, 0xFF
vertex   -199,    336,    -92,    138,    418,  0xDA, 0x5F, 0xB6, 0xFF
vertex   -674,    277,    220,    485,     36,  0xFB, 0x08, 0x7E, 0xFF
vertex   -199,    336,    220,    485,    418,  0xFF, 0x0B, 0x7E, 0xFF
vertex   -674,    277,    -92,    138,     36,  0xC9, 0x58, 0xB8, 0xFF
vertex    -14,    586,    -92,    138,    588,  0xCE, 0x62, 0xC3, 0xFF
vertex    454,    592,    -92,    138,    962,  0x00, 0x38, 0x8F, 0xFF

mad_piano_seg5_vertex_05008E70: # 0x05008E70
vertex    393,    432,   -372,    -64,    714,  0x00, 0x00, 0x82, 0xFF
vertex    444,    347,    -92,    456,    672,  0x3D, 0x9A, 0xD6, 0xFF
vertex    294,    431,    -92,    428,    926,  0x89, 0xFF, 0xD6, 0xFF
vertex   -598,   -135,   -372,    -21,    860,  0xFF, 0x00, 0x82, 0xFF
vertex   -549,    -48,    -92,    446,    702,  0x3A, 0x68, 0xD6, 0xFF
vertex   -547,   -221,    -92,    456,    934,  0x3C, 0x9A, 0xD6, 0xFF
vertex   -598,   -135,   -372,    -37,    724,  0xFF, 0x00, 0x82, 0xFF
vertex   -547,   -221,    -92,    417,    570,  0x3C, 0x9A, 0xD6, 0xFF
vertex   -697,   -136,    -92,    425,    938,  0x89, 0xFF, 0xD6, 0xFF
vertex   -598,   -135,   -372,      0,    736,  0xFF, 0x00, 0x82, 0xFF
vertex   -697,   -136,    -92,    428,    620,  0x89, 0xFF, 0xD6, 0xFF
vertex   -549,    -48,    -92,    422,    816,  0x3A, 0x68, 0xD6, 0xFF
vertex    393,    432,   -372,    -42,    728,  0x00, 0x00, 0x82, 0xFF
vertex    442,    519,    -92,    498,    594,  0x3A, 0x68, 0xD6, 0xFF
vertex    444,    347,    -92,    493,    952,  0x3D, 0x9A, 0xD6, 0xFF

mad_piano_seg5_vertex_05008F60: # 0x05008F60
vertex   -884,   -357,    -92,      0,     50,  0x9C, 0xC0, 0xD6, 0xFF
vertex   -665,   -556,    220,    488,    286,  0x05, 0xED, 0x7D, 0xFF
vertex   -884,   -357,    220,    488,     50,  0xF5, 0xFD, 0x7E, 0xFF
vertex    393,    432,   -372,     82,    738,  0x00, 0x00, 0x82, 0xFF
vertex    294,    431,    -92,    472,    582,  0x89, 0xFF, 0xD6, 0xFF
vertex    442,    519,    -92,    462,    838,  0x3A, 0x68, 0xD6, 0xFF
vertex    403,   -384,   -372,    -36,    732,  0x00, 0x00, 0x82, 0xFF
vertex    451,   -297,    -92,    450,    628,  0x3A, 0x68, 0xD6, 0xFF
vertex    453,   -470,    -92,    441,    938,  0x3C, 0x99, 0xD6, 0xFF
vertex    403,   -384,   -372,    -58,    714,  0x00, 0x00, 0x82, 0xFF
vertex    453,   -470,    -92,    495,    672,  0x3C, 0x99, 0xD6, 0xFF
vertex    303,   -385,    -92,    505,    990,  0x89, 0xFF, 0xD6, 0xFF
vertex    403,   -384,   -372,    -47,    688,  0x00, 0x00, 0x82, 0xFF
vertex    303,   -385,    -92,    448,    628,  0x89, 0xFF, 0xD6, 0xFF
vertex    451,   -297,    -92,    480,    948,  0x3A, 0x68, 0xD6, 0xFF

mad_piano_seg5_vertex_05009050: # 0x05009050
vertex   -674,    277,    -92,    138,     36,  0xC9, 0x58, 0xB8, 0xFF
vertex   -889,     67,    220,    485,   -156,  0xF5, 0x02, 0x7E, 0xFF
vertex   -674,    277,    220,    485,     36,  0xFB, 0x08, 0x7E, 0xFF
vertex   -884,   -357,    -92,      0,     50,  0x9C, 0xC0, 0xD6, 0xFF
vertex   -665,   -556,    -92,      0,    286,  0xF5, 0xBE, 0x95, 0xFF
vertex   -665,   -556,    220,    488,    286,  0x05, 0xED, 0x7D, 0xFF
vertex   -889,     67,    -92,    -60,    754,  0x9D, 0x19, 0xB6, 0xFF
vertex   -884,   -357,    220,    477,    972,  0xF5, 0xFD, 0x7E, 0xFF
vertex   -889,     67,    220,    459,    754,  0xF5, 0x02, 0x7E, 0xFF
vertex   -884,   -357,    -92,    -42,    972,  0x9C, 0xC0, 0xD6, 0xFF
vertex   -665,   -556,    -92,     32,    596,  0xF5, 0xBE, 0x95, 0xFF
vertex    467,   -543,    220,    422,    990,  0x70, 0xFE, 0x3A, 0xFF
vertex   -665,   -556,    220,    422,    596,  0x05, 0xED, 0x7D, 0xFF
vertex    467,   -543,     18,    171,    990,  0x23, 0x9B, 0x43, 0xFF
vertex    467,   -543,    -92,     32,    990,  0x01, 0x97, 0xBA, 0xFF
vertex   -889,     67,    -92,    138,   -156,  0x9D, 0x19, 0xB6, 0xFF

mad_piano_seg5_vertex_05009150: # 0x05009150
vertex   -889,     67,    220,   -124,     16,  0xF5, 0x02, 0x7E, 0xFF
vertex   -855,     64,     46,      0,    936,  0x5A, 0xEA, 0x56, 0xFF
vertex   -655,    253,     38,    884,    936,  0x33, 0xB0, 0x53, 0xFF
vertex    -14,    586,    220,    -53,     10,  0xFE, 0x09, 0x7E, 0xFF
vertex    -10,    556,     46,    -33,    950,  0x37, 0xB5, 0x55, 0xFF
vertex    422,    560,     46,   1395,    942,  0xD3, 0xA3, 0x48, 0xFF
vertex    454,    592,    220,   1493,     -2,  0x92, 0x00, 0x3D, 0xFF
vertex   -199,    336,    220,      3,    -12,  0xFF, 0x0B, 0x7E, 0xFF
vertex    -10,    556,     46,    917,    952,  0x37, 0xB5, 0x55, 0xFF
vertex    -14,    586,    220,    976,      6,  0xFE, 0x09, 0x7E, 0xFF
vertex   -186,    307,     38,    -34,    982,  0x22, 0xA9, 0x54, 0xFF
vertex   -674,    277,    220,    -87,    -28,  0xFB, 0x08, 0x7E, 0xFF
vertex   -655,    253,     38,      0,    990,  0x33, 0xB0, 0x53, 0xFF
vertex   -186,    307,     38,   1537,    990,  0x22, 0xA9, 0x54, 0xFF
vertex   -199,    336,    220,   1506,    -30,  0xFF, 0x0B, 0x7E, 0xFF

mad_piano_seg5_vertex_05009240: # 0x05009240
vertex    467,   -543,    220,   -137,      6,  0x70, 0xFE, 0x3A, 0xFF
vertex   -666,   -525,     46,   3633,    936,  0x1C, 0x6C, 0x3B, 0xFF
vertex   -665,   -556,    220,   3631,      6,  0x05, 0xED, 0x7D, 0xFF
vertex   -889,     67,    220,   -124,     16,  0xF5, 0x02, 0x7E, 0xFF
vertex   -655,    253,     38,    884,    936,  0x33, 0xB0, 0x53, 0xFF
vertex   -674,    277,    220,    876,      0,  0xFB, 0x08, 0x7E, 0xFF
vertex   -884,   -357,    220,    -99,      4,  0xF5, 0xFD, 0x7E, 0xFF
vertex   -855,     64,     46,   1302,    936,  0x5A, 0xEA, 0x56, 0xFF
vertex   -889,     67,    220,   1313,      4,  0xF5, 0x02, 0x7E, 0xFF
vertex   -850,   -336,     46,      0,    936,  0x4F, 0x30, 0x55, 0xFF
vertex   -665,   -556,    220,    -90,     14,  0x05, 0xED, 0x7D, 0xFF
vertex   -850,   -336,     46,    626,    936,  0x4F, 0x30, 0x55, 0xFF
vertex   -884,   -357,    220,    648,      4,  0xF5, 0xFD, 0x7E, 0xFF
vertex   -666,   -525,     46,      0,    936,  0x1C, 0x6C, 0x3B, 0xFF
vertex    435,   -512,     46,      0,    936,  0xDC, 0x12, 0x78, 0xFF

mad_piano_seg5_vertex_05009330: # 0x05009330
vertex    454,    592,    220,   -204,      6,  0x92, 0x00, 0x3D, 0xFF
vertex    435,   -512,     46,   5439,   1010,  0xDC, 0x12, 0x78, 0xFF
vertex    467,   -543,    220,   5605,     44,  0x70, 0xFE, 0x3A, 0xFF
vertex    422,    560,     46,    -44,    978,  0xD3, 0xA3, 0x48, 0xFF
vertex    435,   -512,     46,     67,    870,  0xDC, 0x12, 0x78, 0xFF
vertex   -655,    253,     38,    340,    166,  0x33, 0xB0, 0x53, 0xFF
vertex   -855,     64,     46,    406,    246,  0x5A, 0xEA, 0x56, 0xFF
vertex   -186,    307,     38,    204,    224,  0x22, 0xA9, 0x54, 0xFF
vertex   -850,   -336,     46,    425,    502,  0x4F, 0x30, 0x55, 0xFF
vertex   -666,   -525,     46,    382,    658,  0x1C, 0x6C, 0x3B, 0xFF
vertex    422,    560,     46,     18,    184,  0xD3, 0xA3, 0x48, 0xFF
vertex    -10,    556,     46,    141,    100,  0x37, 0xB5, 0x55, 0xFF

mad_piano_seg5_vertex_050093F0: # 0x050093F0
vertex    678,   -541,    -92,      0,    479,  0x55, 0xD7, 0xAC, 0xFF
vertex    665,    594,     18,   4504,    -77,  0x54, 0x2B, 0x54, 0xFF
vertex    678,   -541,     18,      0,    -77,  0x34, 0x99, 0x33, 0xFF
vertex    665,    594,    -92,   4504,    479,  0x32, 0x68, 0xCD, 0xFF

mad_piano_seg5_vertex_05009430: # 0x05009430
vertex    467,   -543,     18,    -40,   -224,  0x23, 0x9B, 0x43, 0xFF
vertex    665,    594,     18,   4504,    436,  0x54, 0x2B, 0x54, 0xFF
vertex    454,    592,     18,   4494,   -268,  0x2D, 0x74, 0x17, 0xFF
vertex    678,   -541,     18,      0,    479,  0x34, 0x99, 0x33, 0xFF

mad_piano_seg5_vertex_05009470: # 0x05009470
vertex    454,    592,     18,    972,    -27,  0x2D, 0x74, 0x17, 0xFF
vertex    665,    594,     18,      0,    -27,  0x54, 0x2B, 0x54, 0xFF
vertex    665,    594,    -92,      0,    479,  0x32, 0x68, 0xCD, 0xFF
vertex    454,    592,    -92,    972,    479,  0x00, 0x38, 0x8F, 0xFF
vertex    467,   -543,    -92,    942,    479,  0x01, 0x97, 0xBA, 0xFF
vertex    678,   -541,     18,      0,    -27,  0x34, 0x99, 0x33, 0xFF
vertex    467,   -543,     18,    942,    -27,  0x23, 0x9B, 0x43, 0xFF
vertex    678,   -541,    -92,      0,    479,  0x55, 0xD7, 0xAC, 0xFF

mad_piano_seg5_vertex_050094F0: # 0x050094F0
vertex   -665,   -556,    -92,      0,      0,  0xF5, 0xBE, 0x95, 0xFF
vertex    -14,    586,    -92,      0,      0,  0xCE, 0x62, 0xC3, 0xFF
vertex    454,    592,    -92,      0,      0,  0x00, 0x38, 0x8F, 0xFF
vertex    467,   -543,    -92,      0,      0,  0x01, 0x97, 0xBA, 0xFF
vertex    678,   -541,    -92,      0,      0,  0x55, 0xD7, 0xAC, 0xFF
vertex    665,    594,    -92,      0,      0,  0x32, 0x68, 0xCD, 0xFF
vertex   -199,    336,    -92,      0,      0,  0xDA, 0x5F, 0xB6, 0xFF
vertex   -674,    277,    -92,      0,      0,  0xC9, 0x58, 0xB8, 0xFF
vertex   -889,     67,    -92,      0,      0,  0x9D, 0x19, 0xB6, 0xFF
vertex   -884,   -357,    -92,      0,      0,  0x9C, 0xC0, 0xD6, 0xFF

glabel mad_piano_seg5_dl_05009590 # 0x05009590 - 0x050096C8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mad_piano_seg5_texture_050072F0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x1FF, 0x200
gsSPLight mad_piano_seg5_light_05008D48, 1
gsSPLight mad_piano_seg5_light_05008D40, 2
gsSPVertex mad_piano_seg5_vertex_05008DA0, 13, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11,  7,  9, 0x0
gsSP2Triangles 11,  9,  1, 0x0,  0, 12, 11, 0x0
gsSP1Triangle  0, 11,  1, 0x0
gsSPLight mad_piano_seg5_light_05008D60, 1
gsSPLight mad_piano_seg5_light_05008D58, 2
gsSPVertex mad_piano_seg5_vertex_05008E70, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPVertex mad_piano_seg5_vertex_05008F60, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPVertex mad_piano_seg5_vertex_05009050, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  9,  7, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 13, 11, 0x0
gsSP2Triangles 10, 14, 13, 0x0,  0, 15,  1, 0x0
gsSPEndDisplayList

glabel mad_piano_seg5_dl_050096C8 # 0x050096C8 - 0x050097B0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mad_piano_seg5_texture_05007AF0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x1FF, 0x200
gsSPVertex mad_piano_seg5_vertex_05009150, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex mad_piano_seg5_vertex_05009240, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  9,  7, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 13, 11, 0x0
gsSP1Triangle  0, 14,  1, 0x0
gsSPVertex mad_piano_seg5_vertex_05009330, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  4,  6,  8, 0x0,  4,  8,  9, 0x0
gsSP2Triangles  4, 10, 11, 0x0,  4, 11,  7, 0x0
gsSPEndDisplayList

glabel mad_piano_seg5_dl_050097B0 # 0x050097B0 - 0x050097F8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mad_piano_seg5_texture_050082F0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x1FF, 0x100
gsSPLight mad_piano_seg5_light_05008D78, 1
gsSPLight mad_piano_seg5_light_05008D70, 2
gsSPVertex mad_piano_seg5_vertex_050093F0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel mad_piano_seg5_dl_050097F8 # 0x050097F8 - 0x05009840
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mad_piano_seg5_texture_05007EF0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x1FF, 0x100
gsSPLight mad_piano_seg5_light_05008D48, 1
gsSPLight mad_piano_seg5_light_05008D40, 2
gsSPVertex mad_piano_seg5_vertex_05009430, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel mad_piano_seg5_dl_05009840 # 0x05009840 - 0x05009888
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mad_piano_seg5_texture_050076F0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x1FF, 0x100
gsSPVertex mad_piano_seg5_vertex_05009470, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

glabel mad_piano_seg5_dl_05009888 # 0x05009888 - 0x050098E8
gsSPLight mad_piano_seg5_light_05008D90, 1
gsSPLight mad_piano_seg5_light_05008D88, 2
gsSPVertex mad_piano_seg5_vertex_050094F0, 10, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  2,  4,  3, 0x0,  2,  5,  4, 0x0
gsSP2Triangles  0,  6,  1, 0x0,  0,  7,  6, 0x0
gsSP2Triangles  0,  8,  7, 0x0,  0,  9,  8, 0x0
gsSPEndDisplayList

glabel mad_piano_seg5_dl_050098E8 # 0x050098E8 - 0x050099B8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 60, 124
gsSPDisplayList mad_piano_seg5_dl_05009590
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 60, 124
gsSPDisplayList mad_piano_seg5_dl_050096C8
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 60
gsSPDisplayList mad_piano_seg5_dl_050097B0
gsSPDisplayList mad_piano_seg5_dl_050097F8
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 60
gsSPDisplayList mad_piano_seg5_dl_05009840
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPDisplayList mad_piano_seg5_dl_05009888
gsSPEndDisplayList

mad_piano_seg5_animvalue_050099B8: # 0x050099B8
.hword 0x0000, 0xFFEF, 0x0175, 0x00C4, 0xC001, 0x3FFF, 0x4077, 0xBF89

mad_piano_seg5_animindex_050099C8: # 0x050099C8
.hword 0x0001, 0x0001, 0x0001, 0x0002, 0x0001, 0x0003, 0x0001, 0x0004
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0007, 0x0001, 0x0005, 0x0001, 0x0000, 0x0001, 0x0006
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000

mad_piano_seg5_anim_05009A04: # 0x05009A04
.hword 0
.hword 0
.hword 0
.hword 0
.hword 0x64
.hword 0x04
.word mad_piano_seg5_animvalue_050099B8
.word mad_piano_seg5_animindex_050099C8
.word 0

mad_piano_seg5_animvalue_05009A1C: # 0x05009A1C
.hword 0x0000, 0xFFEF, 0x01DC, 0x01EA, 0x01EE, 0x01CB, 0x019C, 0x0184
.hword 0x019A, 0x01C7, 0x01E3, 0x01C8, 0x01A8, 0x01AD, 0x01BA, 0x01CA
.hword 0x01D7, 0x00C4, 0xC001, 0x0000, 0x03F9, 0x0881, 0x0D05, 0x10F3
.hword 0x13BA, 0x14C7, 0x11F7, 0x0B8D, 0x048E, 0x0000, 0x001F, 0x02CB
.hword 0x047B, 0x0246, 0x3FFF, 0x4077, 0x0006, 0xFFA5, 0xFEBC, 0xFDA6
.hword 0xFCBD, 0xFC5B, 0xFCA3, 0xFD69, 0xFE93, 0x0005, 0x0296, 0x05B9
.hword 0x0741, 0x0561, 0x01E6, 0xF843, 0xF89B, 0xF986, 0xFADA, 0xFC6C
.hword 0xFE12, 0x006A, 0x0370, 0x05FE, 0x06ED, 0x0496, 0x000D, 0xFC42
.hword 0xFA23, 0xF8C1, 0xBF89, 0xBF89, 0xBF89, 0xBF89, 0xBF89, 0xBF89
.hword 0xBF89, 0xBF89, 0xBF8A, 0xBF8A, 0xBF8A, 0xBF89, 0xBF89, 0xBF89
.hword 0xBF89, 0x0000

mad_piano_seg5_animindex_05009AC0: # 0x05009AC0
.hword 0x0001, 0x0001, 0x000F, 0x0002, 0x0001, 0x0011, 0x0001, 0x0012
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x000F, 0x0024, 0x000F, 0x0033
.hword 0x000F, 0x0042, 0x0001, 0x0022, 0x0001, 0x0000, 0x0001, 0x0023
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x000F, 0x0013

mad_piano_seg5_anim_05009AFC: # 0x05009AFC
.hword 0
.hword 0
.hword 0
.hword 0
.hword 0x0F
.hword 0x04
.word mad_piano_seg5_animvalue_05009A1C
.word mad_piano_seg5_animindex_05009AC0
.word 0

glabel mad_piano_seg5_anims_05009B14 # 0x05009B14
.word mad_piano_seg5_anim_05009A04
.word mad_piano_seg5_anim_05009AFC
.word 0
