# Possible Removed Actor File
# It's possible that bubba and bub used to be 2 "actors" in
# one actor file.

.word 0
.word 0 # Bin ID? What is this?

# Bubba

bubba_seg5_texture_05000008: # 0x05000008
.incbin "actors/bubba/bubba_sunglasses.rgba16"

# unused eye texture, assumed leftover from when actor file was copied from bub
bubba_seg5_texture_05000408: # 0x05000408
.incbin "actors/bubba/bubba_eyes_unused.rgba16"

bubba_seg5_texture_05001408: # 0x05001408
.incbin "actors/bubba/bubba_eye_border.rgba16"

bubba_seg5_texture_05001C08: # 0x05001C08
.incbin "actors/bubba/bubba_fins.rgba16"

bubba_seg5_texture_05002408: # 0x05002408
.incbin "actors/bubba/bubba_scales.rgba16"

bubba_seg5_light_05004408: # 0x05004408
.byte 0x48, 0x31, 0x2A, 0x00, 0x48, 0x31, 0x2A, 0x00

bubba_seg5_light_05004410: # 0x05004410
.byte 0xF1, 0xA6, 0x8C, 0x00, 0xF1, 0xA6, 0x8C, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bubba_seg5_light_05004420: # 0x05004420
.byte 0x4C, 0x4C, 0x4C, 0x00, 0x4C, 0x4C, 0x4C, 0x00

bubba_seg5_light_05004428: # 0x05004428
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bubba_seg5_light_05004438: # 0x05004438
.byte 0x10, 0x07, 0x08, 0x00, 0x10, 0x07, 0x08, 0x00

bubba_seg5_light_05004440: # 0x05004440
.byte 0x36, 0x1A, 0x1C, 0x00, 0x36, 0x1A, 0x1C, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bubba_seg5_vertex_05004450: # 0x05004450
vertex    239,   -320,    320,    203,    530,  0x44, 0xAD, 0x42, 0xFF
vertex      6,   -197,    290,    372,    190,  0x00, 0x99, 0x49, 0xFF
vertex      6,   -284,    420,    267,    636,  0x01, 0x07, 0x7E, 0xFF
vertex    123,   -217,    469,    369,    578,  0x09, 0x99, 0x48, 0xFF
vertex      7,   -195,    518,    407,    618,  0x00, 0xAF, 0x61, 0xFF
vertex   -109,   -217,    471,    369,    580,  0xF8, 0x99, 0x48, 0xFF
vertex   -227,   -320,    324,    203,    536,  0xBD, 0xAD, 0x43, 0xFF

bubba_seg5_vertex_050044C0: # 0x050044C0
vertex   -512,   -352,     46,    856,    794,  0xAB, 0xA7, 0xE5, 0xFF
vertex   -248,   -181,    193,     94,    684,  0xF5, 0x65, 0x4B, 0xFF
vertex   -508,   -306,    182,    816,    650,  0xAF, 0x47, 0x41, 0xFF
vertex   -451,   -258,    151,    664,    694,  0xB3, 0x64, 0x08, 0xFF
vertex   -450,   -258,     81,    678,    768,  0xC5, 0x6B, 0xE1, 0xFF
vertex   -352,   -273,    -31,    432,    906,  0xDC, 0x4C, 0xA2, 0xFF
vertex   -269,   -214,     84,    176,    796,  0x6B, 0x1B, 0xC3, 0xFF
vertex      4,    -82,   -352,    384,    704,  0x00, 0xC4, 0x6F, 0xFF
vertex      3,     43,   -352,    554,    698,  0xFF, 0x3C, 0x6F, 0xFF
vertex    -44,    -19,   -501,    458,    800,  0x82, 0xFF, 0xFA, 0xFF
vertex     52,    -18,   -501,    458,    800,  0x7E, 0x01, 0xFA, 0xFF
vertex      6,   -222,   -550,    182,    844,  0x00, 0x85, 0xE1, 0xFF
vertex      1,    184,   -550,    728,    822,  0xFF, 0x7B, 0xE2, 0xFF
vertex      4,    -94,   -615,    348,    880,  0x00, 0xE5, 0x84, 0xFF
vertex      3,     56,   -615,    552,    872,  0x00, 0x1B, 0x84, 0xFF

bubba_seg5_vertex_050045B0: # 0x050045B0
vertex    513,   -352,     46,    482,    860,  0x55, 0xA7, 0xE5, 0xFF
vertex    353,   -273,    -31,    896,    900,  0x24, 0x4C, 0xA2, 0xFF
vertex    451,   -258,     81,    626,    798,  0x3B, 0x6B, 0xE1, 0xFF
vertex    452,   -258,    151,    608,    716,  0x4D, 0x64, 0x08, 0xFF
vertex    509,   -306,    182,    458,    698,  0x51, 0x47, 0x41, 0xFF
vertex    270,   -214,     84,   1072,    736,  0x95, 0x1B, 0xC3, 0xFF
vertex    249,   -181,    193,   1098,    600,  0x0B, 0x65, 0x4B, 0xFF

bubba_seg5_vertex_05004620: # 0x05004620
vertex     51,    274,    117,    360,    626,  0x6B, 0x41, 0x12, 0xFF
vertex      5,    317,    341,    -14,    458,  0x00, 0x59, 0x5A, 0xFF
vertex      5,    215,    291,     72,    912,  0x01, 0x59, 0x5A, 0xFF
vertex    -42,    274,    118,    358,    626,  0x96, 0x41, 0x13, 0xFF
vertex      3,    404,    -20,    586,     18,  0x00, 0x7E, 0xF2, 0xFF
vertex      1,    191,   -223,    928,    960,  0x00, 0x6D, 0xBF, 0xFF

bubba_seg5_vertex_05004680: # 0x05004680
vertex    261,    127,    217,      0,  -2344,  0x5F, 0x53, 0x07, 0xFF
vertex    350,   -212,    251,   -196,   -646,  0x7C, 0xF6, 0x18, 0xFF
vertex    222,     29,   -150,   1808,  -1854,  0x68, 0x23, 0xC1, 0xFF
vertex      0,     44,   -355,   2828,  -1928,  0x00, 0x2F, 0x8B, 0xFF
vertex      0,    -85,   -355,   2828,  -1278,  0xFF, 0xE3, 0x85, 0xFF
vertex   -218,     29,   -147,   1788,  -1854,  0x97, 0x23, 0xC3, 0xFF
vertex      1,    191,   -223,   2172,  -2664,  0x00, 0x6D, 0xBF, 0xFF
vertex   -246,   -210,   -101,   1560,   -654,  0xA7, 0xB8, 0xCC, 0xFF
vertex   -251,    127,    221,    -48,  -2344,  0xA1, 0x53, 0x08, 0xFF
vertex   -339,   -212,    257,   -224,   -646,  0x85, 0xF6, 0x1A, 0xFF
vertex      1,   -337,   -197,   2040,    -22,  0x00, 0x95, 0xBD, 0xFF
vertex    251,   -210,   -105,   1580,   -654,  0x58, 0xB8, 0xCA, 0xFF
vertex   -227,   -320,    324,   -560,   -106,  0xBD, 0xAD, 0x43, 0xFF
vertex    230,   -105,    361,   -744,  -1182,  0x5D, 0x15, 0x53, 0xFF
vertex    239,   -320,    320,   -540,   -106,  0x44, 0xAD, 0x42, 0xFF
vertex     51,    274,    117,    468,  -3076,  0x6B, 0x41, 0x12, 0xFF

bubba_seg5_vertex_05004780: # 0x05004780
vertex    -42,    274,    118,    464,  -3076,  0x96, 0x41, 0x13, 0xFF
vertex      1,    191,   -223,   2172,  -2664,  0x00, 0x6D, 0xBF, 0xFF
vertex   -251,    127,    221,    -48,  -2344,  0xA1, 0x53, 0x08, 0xFF
vertex    -58,     79,    436,  -1120,  -2104,  0xE3, 0x42, 0x67, 0xFF
vertex      5,    215,    291,   -396,  -2784,  0x01, 0x59, 0x5A, 0xFF
vertex   -217,   -105,    364,   -760,  -1182,  0xA4, 0x15, 0x54, 0xFF
vertex   -339,   -212,    257,   -224,   -646,  0x85, 0xF6, 0x1A, 0xFF
vertex    230,   -105,    361,   -744,  -1182,  0x5D, 0x15, 0x53, 0xFF
vertex    350,   -212,    251,   -196,   -646,  0x7C, 0xF6, 0x18, 0xFF
vertex    261,    127,    217,      0,  -2344,  0x5F, 0x53, 0x07, 0xFF
vertex     65,     79,    434,  -1108,  -2104,  0x1F, 0x42, 0x67, 0xFF
vertex     51,    274,    117,    468,  -3076,  0x6B, 0x41, 0x12, 0xFF
vertex    239,   -320,    320,   -540,   -106,  0x44, 0xAD, 0x42, 0xFF
vertex    251,   -210,   -105,   1580,   -654,  0x58, 0xB8, 0xCA, 0xFF
vertex   -227,   -320,    324,   -560,   -106,  0xBD, 0xAD, 0x43, 0xFF

bubba_seg5_vertex_05004870: # 0x05004870
vertex    129,   -136,    504,      0,      0,  0x48, 0xF3, 0x67, 0xFF
vertex    123,   -217,    469,      0,      0,  0x09, 0x99, 0x48, 0xFF
vertex    239,   -320,    320,      0,      0,  0x44, 0xAD, 0x42, 0xFF
vertex    230,   -105,    361,      0,      0,  0x5D, 0x15, 0x53, 0xFF
vertex      6,   -284,    420,      0,      0,  0x01, 0x07, 0x7E, 0xFF
vertex      6,   -357,    343,      0,      0,  0x00, 0x8D, 0x35, 0xFF
vertex   -227,   -320,    324,      0,      0,  0xBD, 0xAD, 0x43, 0xFF
vertex      7,    -24,    547,      0,      0,  0x00, 0x4B, 0x65, 0xFF
vertex      6,     -7,    415,      0,      0,  0x01, 0x26, 0x78, 0xFF
vertex   -217,   -105,    364,      0,      0,  0xA4, 0x15, 0x54, 0xFF
vertex   -115,   -136,    506,      0,      0,  0xBA, 0xF3, 0x68, 0xFF
vertex      7,   -195,    518,      0,      0,  0x00, 0xAF, 0x61, 0xFF
vertex   -109,   -217,    471,      0,      0,  0xF8, 0x99, 0x48, 0xFF

bubba_seg5_vertex_05004940: # 0x05004940
vertex   -217,   -105,    364,      0,      0,  0xA4, 0x15, 0x54, 0xFF
vertex   -255,    129,    314,      0,      0,  0xA6, 0x42, 0x3B, 0xFF
vertex   -251,    127,    221,      0,      0,  0xA1, 0x53, 0x08, 0xFF
vertex     65,     79,    434,      0,      0,  0x1F, 0x42, 0x67, 0xFF
vertex      6,     -7,    415,      0,      0,  0x01, 0x26, 0x78, 0xFF
vertex    230,   -105,    361,      0,      0,  0x5D, 0x15, 0x53, 0xFF
vertex    267,    129,    309,      0,      0,  0x5B, 0x42, 0x39, 0xFF
vertex    261,    127,    217,      0,      0,  0x5F, 0x53, 0x07, 0xFF
vertex    -58,     79,    436,      0,      0,  0xE3, 0x42, 0x67, 0xFF

bubba_seg5_vertex_050049D0: # 0x050049D0
vertex      4,   -377,    154,      0,      0,  0x00, 0x82, 0xF7, 0xFF
vertex    239,   -320,    320,      0,      0,  0x44, 0xAD, 0x42, 0xFF
vertex      6,   -357,    343,      0,      0,  0x00, 0x8D, 0x35, 0xFF
vertex    251,   -210,   -105,      0,      0,  0x58, 0xB8, 0xCA, 0xFF
vertex   -246,   -210,   -101,      0,      0,  0xA7, 0xB8, 0xCC, 0xFF
vertex      1,   -337,   -197,      0,      0,  0x00, 0x95, 0xBD, 0xFF
vertex   -227,   -320,    324,      0,      0,  0xBD, 0xAD, 0x43, 0xFF

glabel bubba_seg5_dl_05004A40 # 0x05004A40 - 0x05004AA8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bubba_seg5_texture_05000008
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x1FF, 0x200
gsSPLight bubba_seg5_light_05004410, 1
gsSPLight bubba_seg5_light_05004408, 2
gsSPVertex bubba_seg5_vertex_05004450, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  1,  0, 0x0
gsSP2Triangles  4,  1,  3, 0x0,  5,  1,  4, 0x0
gsSP2Triangles  1,  6,  2, 0x0,  5,  6,  1, 0x0
gsSPEndDisplayList

glabel bubba_seg5_dl_05004AA8 # 0x05004AA8 - 0x05004BE8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bubba_seg5_texture_05001408
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight bubba_seg5_light_05004428, 1
gsSPLight bubba_seg5_light_05004420, 2
gsSPVertex bubba_seg5_vertex_050044C0, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  0, 0x0
gsSP2Triangles  0,  2,  3, 0x0,  5,  0,  4, 0x0
gsSP2Triangles  5,  6,  0, 0x0,  0,  6,  1, 0x0
gsSP2Triangles  6,  4,  1, 0x0,  1,  4,  3, 0x0
gsSP2Triangles  1,  3,  2, 0x0,  5,  4,  6, 0x0
gsSP2Triangles  7,  8,  9, 0x0, 10,  8,  7, 0x0
gsSP2Triangles  9, 11,  7, 0x0, 10,  7, 11, 0x0
gsSP2Triangles  9,  8, 12, 0x0, 12,  8, 10, 0x0
gsSP2Triangles 13,  9, 14, 0x0,  9, 12, 14, 0x0
gsSP2Triangles 13, 11,  9, 0x0, 12, 10, 14, 0x0
gsSP2Triangles 13, 14, 10, 0x0, 10, 11, 13, 0x0
gsSPVertex bubba_seg5_vertex_050045B0, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  3,  4,  0, 0x0,  0,  5,  1, 0x0
gsSP2Triangles  0,  6,  5, 0x0,  4,  6,  0, 0x0
gsSP2Triangles  6,  2,  5, 0x0,  2,  1,  5, 0x0
gsSP2Triangles  6,  3,  2, 0x0,  3,  6,  4, 0x0
gsSPEndDisplayList

glabel bubba_seg5_dl_05004BE8 # 0x05004BE8 - 0x05004C40
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bubba_seg5_texture_05001C08
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bubba_seg5_vertex_05004620, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  1,  3, 0x0
gsSP2Triangles  1,  4,  3, 0x0,  1,  0,  4, 0x0
gsSP2Triangles  4,  5,  3, 0x0,  4,  0,  5, 0x0
gsSPEndDisplayList

glabel bubba_seg5_dl_05004C40 # 0x05004C40 - 0x05004D48
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bubba_seg5_texture_05002408
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPVertex bubba_seg5_vertex_05004680, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  3,  5, 0x0,  5,  4,  7, 0x0
gsSP2Triangles  5,  8,  6, 0x0,  9,  8,  5, 0x0
gsSP2Triangles  9,  5,  7, 0x0,  2,  4,  3, 0x0
gsSP2Triangles 10,  4, 11, 0x0,  7,  4, 10, 0x0
gsSP2Triangles 11,  4,  2, 0x0,  9,  7, 12, 0x0
gsSP2Triangles  2,  3,  6, 0x0,  0,  2,  6, 0x0
gsSP2Triangles  2,  1, 11, 0x0,  1, 13, 14, 0x0
gsSP1Triangle  0,  6, 15, 0x0
gsSPVertex bubba_seg5_vertex_05004780, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  0, 0x0
gsSP2Triangles  2,  3,  0, 0x0,  5,  2,  6, 0x0
gsSP2Triangles  7,  8,  9, 0x0, 10,  9, 11, 0x0
gsSP2Triangles 11,  4, 10, 0x0, 10,  4,  3, 0x0
gsSP2Triangles 12, 13,  8, 0x0,  5,  6, 14, 0x0
gsSPEndDisplayList

glabel bubba_seg5_dl_05004D48 # 0x05004D48 - 0x05004E80
gsSPLight bubba_seg5_light_05004410, 1
gsSPLight bubba_seg5_light_05004408, 2
gsSPVertex bubba_seg5_vertex_05004870, 13, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  2,  4,  5, 0x0,  4,  6,  5, 0x0
gsSP2Triangles  7,  8,  9, 0x0,  8,  7,  3, 0x0
gsSP2Triangles  7,  9, 10, 0x0,  7, 11,  0, 0x0
gsSP2Triangles 10, 11,  7, 0x0,  3,  7,  0, 0x0
gsSP2Triangles  0, 11,  1, 0x0,  6, 10,  9, 0x0
gsSP2Triangles 12, 10,  6, 0x0, 12, 11, 10, 0x0
gsSPLight bubba_seg5_light_05004440, 1
gsSPLight bubba_seg5_light_05004438, 2
gsSPVertex bubba_seg5_vertex_05004940, 9, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  7, 0x0,  5,  6,  3, 0x0
gsSP2Triangles  3,  8,  4, 0x0,  7,  6,  5, 0x0
gsSP2Triangles  8,  2,  1, 0x0,  8,  1,  0, 0x0
gsSP1Triangle  4,  8,  0, 0x0
gsSPLight bubba_seg5_light_05004428, 1
gsSPLight bubba_seg5_light_05004420, 2
gsSPVertex bubba_seg5_vertex_050049D0, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  0, 0x0,  0,  5,  3, 0x0
gsSP2Triangles  2,  6,  0, 0x0,  6,  4,  0, 0x0
gsSPEndDisplayList

glabel bubba_seg5_dl_05004E80 # 0x05004E80 - 0x05004F30
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 60, 124
gsSPDisplayList bubba_seg5_dl_05004A40
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bubba_seg5_dl_05004AA8
gsSPDisplayList bubba_seg5_dl_05004BE8
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList bubba_seg5_dl_05004C40
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPDisplayList bubba_seg5_dl_05004D48
gsSPEndDisplayList

bubba_seg5_light_05004F30: # 0x05004F30
.byte 0x48, 0x31, 0x2A, 0x00, 0x48, 0x31, 0x2A, 0x00

bubba_seg5_light_05004F38: # 0x05004F38
.byte 0xF1, 0xA6, 0x8C, 0x00, 0xF1, 0xA6, 0x8C, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bubba_seg5_light_05004F48: # 0x05004F48
.byte 0x4C, 0x4C, 0x4C, 0x00, 0x4C, 0x4C, 0x4C, 0x00

bubba_seg5_light_05004F50: # 0x05004F50
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bubba_seg5_light_05004F60: # 0x05004F60
.byte 0x0A, 0x07, 0x08, 0x00, 0x0A, 0x07, 0x08, 0x00

bubba_seg5_light_05004F68: # 0x05004F68
.byte 0x22, 0x1A, 0x1C, 0x00, 0x22, 0x1A, 0x1C, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bubba_seg5_vertex_05004F78: # 0x05004F78
vertex      6,   -194,     96,    405,     48,  0x00, 0xBF, 0x6D, 0xFF
vertex   -227,   -437,    270,    201,    516,  0xBA, 0xB3, 0x47, 0xFF
vertex      6,   -401,    385,    222,    642,  0x00, 0x0B, 0x7E, 0xFF
vertex      7,    -58,    559,    485,    556,  0x00, 0xB2, 0x64, 0xFF
vertex    123,    -93,    488,    461,    492,  0xF6, 0xA6, 0x58, 0xFF
vertex    239,   -437,    266,    201,    512,  0x47, 0xB3, 0x46, 0xFF
vertex   -108,    -93,    488,    461,    492,  0x0C, 0xA5, 0x57, 0xFF

bubba_seg5_vertex_05004FE8: # 0x05004FE8
vertex    513,   -352,     46,    482,    860,  0x55, 0xA7, 0xE5, 0xFF
vertex    451,   -258,     81,    626,    798,  0x3B, 0x6B, 0xE1, 0xFF
vertex    452,   -258,    151,    608,    716,  0x4D, 0x64, 0x08, 0xFF
vertex    270,   -214,     84,   1072,    736,  0x95, 0x1B, 0xC3, 0xFF
vertex    353,   -273,    -31,    896,    900,  0x24, 0x4C, 0xA2, 0xFF
vertex    249,   -181,    193,   1098,    600,  0x0B, 0x65, 0x4B, 0xFF
vertex    509,   -306,    182,    458,    698,  0x51, 0x47, 0x41, 0xFF
vertex      1,    184,   -550,    728,    822,  0xFF, 0x7B, 0xE2, 0xFF
vertex      3,     43,   -352,    554,    698,  0xFF, 0x3C, 0x6F, 0xFF
vertex     52,    -18,   -501,    458,    800,  0x7E, 0x01, 0xFA, 0xFF
vertex      4,    -94,   -615,    348,    880,  0x00, 0xE5, 0x84, 0xFF
vertex      3,     56,   -615,    552,    872,  0x00, 0x1B, 0x84, 0xFF
vertex      4,    -82,   -352,    384,    704,  0x00, 0xC4, 0x6F, 0xFF
vertex      6,   -222,   -550,    182,    844,  0x00, 0x85, 0xE1, 0xFF
vertex    -44,    -19,   -501,    458,    800,  0x82, 0xFF, 0xFA, 0xFF

bubba_seg5_vertex_050050D8: # 0x050050D8
vertex   -512,   -352,     46,    856,    794,  0xAB, 0xA7, 0xE5, 0xFF
vertex   -508,   -306,    182,    816,    650,  0xAF, 0x47, 0x41, 0xFF
vertex   -451,   -258,    151,    664,    694,  0xB3, 0x64, 0x08, 0xFF
vertex   -450,   -258,     81,    678,    768,  0xC5, 0x6B, 0xE1, 0xFF
vertex   -248,   -181,    193,     94,    684,  0xF5, 0x65, 0x4B, 0xFF
vertex   -352,   -273,    -31,    432,    906,  0xDC, 0x4C, 0xA2, 0xFF
vertex   -269,   -214,     84,    176,    796,  0x6B, 0x1B, 0xC3, 0xFF

bubba_seg5_vertex_05005148: # 0x05005148
vertex      5,    465,    287,    -14,    458,  0x00, 0x43, 0x6B, 0xFF
vertex     51,    274,    117,    360,    626,  0x6A, 0x44, 0x06, 0xFF
vertex      3,    404,    -20,    586,     18,  0x00, 0x71, 0xC7, 0xFF
vertex      5,    317,    249,     72,    912,  0x01, 0x5D, 0x56, 0xFF
vertex    -42,    274,    118,    358,    626,  0x96, 0x44, 0x07, 0xFF
vertex      1,    191,   -223,    928,    960,  0x00, 0x6B, 0xBD, 0xFF

bubba_seg5_vertex_050051A8: # 0x050051A8
vertex   -339,   -241,    257,   -224,   -646,  0x83, 0xF8, 0x14, 0xFF
vertex   -251,    216,    243,    -48,  -2344,  0xA6, 0x59, 0xFE, 0xFF
vertex   -218,     29,   -147,   1788,  -1854,  0x98, 0x20, 0xC0, 0xFF
vertex      0,    -85,   -355,   2828,  -1278,  0xFF, 0xE7, 0x84, 0xFF
vertex   -246,   -210,   -101,   1560,   -654,  0xA0, 0xCA, 0xC2, 0xFF
vertex      1,   -356,   -213,   2040,    -22,  0x00, 0xA4, 0xA9, 0xFF
vertex   -227,   -437,    270,   -560,   -106,  0xBA, 0xB3, 0x47, 0xFF
vertex    222,     29,   -150,   1808,  -1854,  0x67, 0x20, 0xBE, 0xFF
vertex      0,     44,   -355,   2828,  -1928,  0x00, 0x2F, 0x8B, 0xFF
vertex    251,   -210,   -105,   1580,   -654,  0x5F, 0xCA, 0xC0, 0xFF
vertex    239,   -437,    266,   -540,   -106,  0x47, 0xB3, 0x46, 0xFF
vertex    350,   -241,    251,   -196,   -646,  0x7D, 0xF9, 0x11, 0xFF
vertex   -217,     18,    383,   -760,  -1182,  0xA0, 0x13, 0x4F, 0xFF
vertex    -42,    274,    118,    464,  -3076,  0x96, 0x44, 0x07, 0xFF
vertex      1,    191,   -223,   2172,  -2664,  0x00, 0x6B, 0xBD, 0xFF
vertex    -58,    168,    458,  -1120,  -2104,  0xDF, 0x49, 0x61, 0xFF

bubba_seg5_vertex_050052A8: # 0x050052A8
vertex    350,   -241,    251,   -196,   -646,  0x7D, 0xF9, 0x11, 0xFF
vertex    230,     18,    380,   -744,  -1182,  0x61, 0x14, 0x4E, 0xFF
vertex    239,   -437,    266,   -540,   -106,  0x47, 0xB3, 0x46, 0xFF
vertex    261,    216,    239,      0,  -2344,  0x5A, 0x59, 0xFD, 0xFF
vertex    222,     29,   -150,   1808,  -1854,  0x67, 0x20, 0xBE, 0xFF
vertex      0,     44,   -355,   2828,  -1928,  0x00, 0x2F, 0x8B, 0xFF
vertex      1,    191,   -223,   2172,  -2664,  0x00, 0x6B, 0xBD, 0xFF
vertex     65,    168,    456,  -1108,  -2104,  0x23, 0x49, 0x61, 0xFF
vertex     51,    274,    117,    468,  -3076,  0x6A, 0x44, 0x06, 0xFF
vertex      5,    317,    249,   -396,  -2784,  0x01, 0x5D, 0x56, 0xFF
vertex    -58,    168,    458,  -1120,  -2104,  0xDF, 0x49, 0x61, 0xFF
vertex    -42,    274,    118,    464,  -3076,  0x96, 0x44, 0x07, 0xFF

bubba_seg5_vertex_05005368: # 0x05005368
vertex   -227,   -437,    270,      0,      0,  0xBA, 0xB3, 0x47, 0xFF
vertex   -133,    -12,    525,      0,      0,  0xBB, 0xED, 0x68, 0xFF
vertex   -217,     18,    383,      0,      0,  0xA0, 0x13, 0x4F, 0xFF
vertex      6,   -401,    385,      0,      0,  0x00, 0x0B, 0x7E, 0xFF
vertex      6,   -503,    295,      0,      0,  0x00, 0x8B, 0x30, 0xFF
vertex      7,    111,    588,      0,      0,  0x00, 0x5B, 0x57, 0xFF
vertex      7,    -58,    559,      0,      0,  0x00, 0xB2, 0x64, 0xFF
vertex      6,     81,    437,      0,      0,  0x01, 0x31, 0x74, 0xFF
vertex    239,   -437,    266,      0,      0,  0x47, 0xB3, 0x46, 0xFF
vertex    150,    -12,    523,      0,      0,  0x47, 0xEE, 0x67, 0xFF
vertex    123,    -93,    488,      0,      0,  0xF6, 0xA6, 0x58, 0xFF
vertex   -108,    -93,    488,      0,      0,  0x0C, 0xA5, 0x57, 0xFF
vertex    230,     18,    380,      0,      0,  0x61, 0x14, 0x4E, 0xFF

bubba_seg5_vertex_05005438: # 0x05005438
vertex   -217,     18,    383,      0,      0,  0xA0, 0x13, 0x4F, 0xFF
vertex   -255,    217,    336,      0,      0,  0xA5, 0x40, 0x3C, 0xFF
vertex   -251,    216,    243,      0,      0,  0xA6, 0x59, 0xFE, 0xFF
vertex     65,    168,    456,      0,      0,  0x23, 0x49, 0x61, 0xFF
vertex    267,    217,    332,      0,      0,  0x5B, 0x41, 0x3A, 0xFF
vertex    261,    216,    239,      0,      0,  0x5A, 0x59, 0xFD, 0xFF
vertex    230,     18,    380,      0,      0,  0x61, 0x14, 0x4E, 0xFF
vertex      6,     81,    437,      0,      0,  0x01, 0x31, 0x74, 0xFF
vertex    -58,    168,    458,      0,      0,  0xDF, 0x49, 0x61, 0xFF

bubba_seg5_vertex_050054C8: # 0x050054C8
vertex      4,   -488,     81,      0,      0,  0x00, 0x88, 0xD8, 0xFF
vertex    239,   -437,    266,      0,      0,  0x47, 0xB3, 0x46, 0xFF
vertex      6,   -503,    295,      0,      0,  0x00, 0x8B, 0x30, 0xFF
vertex   -227,   -437,    270,      0,      0,  0xBA, 0xB3, 0x47, 0xFF
vertex    251,   -210,   -105,      0,      0,  0x5F, 0xCA, 0xC0, 0xFF
vertex   -246,   -210,   -101,      0,      0,  0xA0, 0xCA, 0xC2, 0xFF
vertex      1,   -356,   -213,      0,      0,  0x00, 0xA4, 0xA9, 0xFF

glabel bubba_seg5_dl_05005538 # 0x05005538 - 0x050055A0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bubba_seg5_texture_05000008
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x1FF, 0x200
gsSPLight bubba_seg5_light_05004F38, 1
gsSPLight bubba_seg5_light_05004F30, 2
gsSPVertex bubba_seg5_vertex_05004F78, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  4, 0x0
gsSP2Triangles  4,  0,  5, 0x0,  5,  0,  2, 0x0
gsSP2Triangles  6,  0,  3, 0x0,  1,  0,  6, 0x0
gsSPEndDisplayList

glabel bubba_seg5_dl_050055A0 # 0x050055A0 - 0x050056E0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bubba_seg5_texture_05001408
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight bubba_seg5_light_05004F50, 1
gsSPLight bubba_seg5_light_05004F48, 2
gsSPVertex bubba_seg5_vertex_05004FE8, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  4, 0x0
gsSP2Triangles  0,  5,  3, 0x0,  6,  5,  0, 0x0
gsSP2Triangles  0,  4,  1, 0x0,  2,  6,  0, 0x0
gsSP2Triangles  5,  2,  1, 0x0,  5,  1,  3, 0x0
gsSP2Triangles  1,  4,  3, 0x0,  2,  5,  6, 0x0
gsSP2Triangles  7,  8,  9, 0x0, 10, 11,  9, 0x0
gsSP2Triangles  9,  8, 12, 0x0,  7,  9, 11, 0x0
gsSP2Triangles  9, 13, 10, 0x0,  9, 12, 13, 0x0
gsSP2Triangles 12,  8, 14, 0x0, 14, 13, 12, 0x0
gsSP2Triangles 10, 13, 14, 0x0, 10, 14, 11, 0x0
gsSP2Triangles 14,  8,  7, 0x0, 14,  7, 11, 0x0
gsSPVertex bubba_seg5_vertex_050050D8, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  0, 0x0
gsSP2Triangles  4,  2,  1, 0x0,  4,  3,  2, 0x0
gsSP2Triangles  5,  0,  3, 0x0,  5,  3,  6, 0x0
gsSP2Triangles  6,  3,  4, 0x0,  0,  4,  1, 0x0
gsSP2Triangles  0,  6,  4, 0x0,  5,  6,  0, 0x0
gsSPEndDisplayList

glabel bubba_seg5_dl_050056E0 # 0x050056E0 - 0x05005738
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bubba_seg5_texture_05001C08
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bubba_seg5_vertex_05005148, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  0,  3, 0x0
gsSP2Triangles  0,  2,  4, 0x0,  3,  0,  4, 0x0
gsSP2Triangles  2,  1,  5, 0x0,  2,  5,  4, 0x0
gsSPEndDisplayList

glabel bubba_seg5_dl_05005738 # 0x05005738 - 0x05005840
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bubba_seg5_texture_05002408
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPVertex bubba_seg5_vertex_050051A8, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  4, 0x0
gsSP2Triangles  4,  3,  5, 0x0,  0,  4,  6, 0x0
gsSP2Triangles  0,  2,  4, 0x0,  7,  3,  8, 0x0
gsSP2Triangles  5,  3,  9, 0x0,  8,  3,  2, 0x0
gsSP2Triangles  9,  3,  7, 0x0, 10,  9, 11, 0x0
gsSP2Triangles  7, 11,  9, 0x0, 12,  1,  0, 0x0
gsSP2Triangles 12,  0,  6, 0x0, 13, 14,  1, 0x0
gsSP2Triangles  2,  1, 14, 0x0,  1, 15, 13, 0x0
gsSP1Triangle 14,  8,  2, 0x0
gsSPVertex bubba_seg5_vertex_050052A8, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  4, 0x0
gsSP2Triangles  1,  0,  3, 0x0,  4,  5,  6, 0x0
gsSP2Triangles  3,  4,  6, 0x0,  7,  3,  8, 0x0
gsSP2Triangles  3,  6,  8, 0x0,  7,  9, 10, 0x0
gsSP2Triangles  8,  9,  7, 0x0, 10,  9, 11, 0x0
gsSPEndDisplayList

glabel bubba_seg5_dl_05005840 # 0x05005840 - 0x05005978
gsSPLight bubba_seg5_light_05004F38, 1
gsSPLight bubba_seg5_light_05004F30, 2
gsSPVertex bubba_seg5_vertex_05005368, 13, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  4, 0x0
gsSP2Triangles  5,  2,  1, 0x0,  1,  6,  5, 0x0
gsSP2Triangles  5,  7,  2, 0x0,  8,  3,  4, 0x0
gsSP2Triangles  9,  6, 10, 0x0,  5,  6,  9, 0x0
gsSP2Triangles 11,  6,  1, 0x0,  9, 10,  8, 0x0
gsSP2Triangles 12,  5,  9, 0x0,  7,  5, 12, 0x0
gsSP2Triangles  9,  8, 12, 0x0,  0, 11,  1, 0x0
gsSPLight bubba_seg5_light_05004F68, 1
gsSPLight bubba_seg5_light_05004F60, 2
gsSPVertex bubba_seg5_vertex_05005438, 9, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  5,  4,  6, 0x0,  6,  4,  3, 0x0
gsSP2Triangles  3,  7,  6, 0x0,  3,  8,  7, 0x0
gsSP2Triangles  7,  8,  0, 0x0,  8,  1,  0, 0x0
gsSP1Triangle  8,  2,  1, 0x0
gsSPLight bubba_seg5_light_05004F50, 1
gsSPLight bubba_seg5_light_05004F48, 2
gsSPVertex bubba_seg5_vertex_050054C8, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  0, 0x0
gsSP2Triangles  0,  4,  1, 0x0,  5,  6,  0, 0x0
gsSP2Triangles  3,  5,  0, 0x0,  0,  6,  4, 0x0
gsSPEndDisplayList

glabel bubba_seg5_dl_05005978 # 0x05005978 - 0x05005A28
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 60, 124
gsSPDisplayList bubba_seg5_dl_05005538
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bubba_seg5_dl_050055A0
gsSPDisplayList bubba_seg5_dl_050056E0
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList bubba_seg5_dl_05005738
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPDisplayList bubba_seg5_dl_05005840
gsSPEndDisplayList
