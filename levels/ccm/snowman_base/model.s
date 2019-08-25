ccm_seg7_light_07011940: # 0x07011940 - 0x07011948
.byte 0xCC, 0xCC, 0xCC, 0x00, 0xCC, 0xCC, 0xCC, 0x00

ccm_seg7_light_07011948: # 0x07011948 - 0x07011958
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ccm_seg7_texture_07011958: # 0x07011958 - 0x07012158
.incbin "levels/ccm/12.rgba16"

ccm_seg7_vertex_07012158: # 0x07012158 - 0x07012258
vertex      0,    -62,    195,    990,   1396,  0x00, 0xD9, 0x78, 0xFF
vertex     92,   -107,    148,   1448,   1980,  0x37, 0xBD, 0x5C, 0xFF
vertex     92,      0,    183,   2012,   1592,  0x3F, 0x00, 0x6D, 0xFF
vertex   -204,      0,      0,   4056,   3032,  0x82, 0x00, 0x00, 0xFF
vertex   -173,      0,    108,   4056,   2312,  0x96, 0x00, 0x44, 0xFF
vertex   -173,    102,     33,   3710,   2820,  0x96, 0x41, 0x14, 0xFF
vertex    -91,    108,    148,   3492,   1980,  0xC0, 0x40, 0x58, 0xFF
vertex    -91,      0,    183,   4056,   1592,  0xC8, 0x00, 0x71, 0xFF
vertex    -91,    174,     57,   3348,   2668,  0xC8, 0x6C, 0x23, 0xFF
vertex    -91,      0,    183,    936,   -202,  0xC8, 0x00, 0x71, 0xFF
vertex      0,    -62,    195,    166,    270,  0x00, 0xD9, 0x78, 0xFF
vertex      0,     63,    195,   1104,    526,  0x00, 0x27, 0x78, 0xFF
vertex     92,      0,    183,    344,    980,  0x3F, 0x00, 0x6D, 0xFF
vertex      0,     63,    195,   3034,   1396,  0x00, 0x27, 0x78, 0xFF
vertex     92,    108,    148,   2576,   1980,  0x38, 0x43, 0x5C, 0xFF
vertex   -173,     63,    -86,   3830,   3604,  0x96, 0x28, 0xC9, 0xFF

ccm_seg7_vertex_07012258: # 0x07012258 - 0x07012358
vertex   -173,    102,     33,   3710,   2820,  0x96, 0x41, 0x14, 0xFF
vertex    -91,    174,    -56,   3348,   3396,  0xC0, 0x68, 0xDF, 0xFF
vertex   -173,     63,    -86,   3830,   3604,  0x96, 0x28, 0xC9, 0xFF
vertex    -91,    174,     57,   3348,   2668,  0xC8, 0x6C, 0x23, 0xFF
vertex    -91,    108,   -147,   3492,   4084,  0xC8, 0x42, 0xA4, 0xFF
vertex      0,    166,    120,   3034,   2214,  0x00, 0x66, 0x4A, 0xFF
vertex      0,    205,      0,   3034,   3032,  0x00, 0x7E, 0x00, 0xFF
vertex     92,    108,    148,   2576,   1980,  0x38, 0x43, 0x5C, 0xFF
vertex     92,    174,     57,   2720,   2668,  0x40, 0x68, 0x21, 0xFF
vertex     92,    174,    -56,   2720,   3396,  0x38, 0x6C, 0xDD, 0xFF
vertex   -204,      0,      0,      0,   3032,  0x82, 0x00, 0x00, 0xFF
vertex   -173,     63,    -86,   -256,   3604,  0x96, 0x28, 0xC9, 0xFF
vertex   -173,    -62,    -86,    194,   3604,  0x96, 0xD8, 0xC9, 0xFF
vertex    -91,      0,   -182,      0,   4472,  0xC0, 0x00, 0x93, 0xFF
vertex    -91,   -107,   -147,    532,   4084,  0xC8, 0xBD, 0xA4, 0xFF
vertex    -91,      0,   -182,   4056,   4472,  0xC0, 0x00, 0x93, 0xFF

ccm_seg7_vertex_07012358: # 0x07012358 - 0x07012458
vertex    -91,    108,   -147,   3492,   4084,  0xC8, 0x42, 0xA4, 0xFF
vertex      0,    166,   -119,   3034,   3850,  0x00, 0x66, 0xB6, 0xFF
vertex      0,     63,   -194,   3034,   4668,  0x00, 0x27, 0x88, 0xFF
vertex     92,    108,   -147,   2576,   4084,  0x3F, 0x40, 0xA8, 0xFF
vertex     92,    174,    -56,   2720,   3396,  0x38, 0x6C, 0xDD, 0xFF
vertex     92,      0,   -182,   2012,   4472,  0x37, 0x00, 0x8E, 0xFF
vertex   -204,      0,      0,      0,   3032,  0x82, 0x00, 0x00, 0xFF
vertex   -173,    -62,    -86,    194,   3604,  0x96, 0xD8, 0xC9, 0xFF
vertex   -173,   -101,     33,    314,   2820,  0x96, 0xBF, 0x14, 0xFF
vertex    -91,   -173,    -56,    676,   3396,  0xC0, 0x98, 0xDF, 0xFF
vertex    -91,   -107,   -147,    532,   4084,  0xC8, 0xBD, 0xA4, 0xFF
vertex    -91,   -173,     57,    676,   2668,  0xC8, 0x94, 0x23, 0xFF
vertex      0,    -62,   -194,    990,   4668,  0x00, 0xD9, 0x88, 0xFF
vertex      0,   -165,   -119,    990,   3850,  0x00, 0x9A, 0xB6, 0xFF
vertex     92,   -107,   -147,   1448,   4084,  0x3F, 0xC0, 0xA8, 0xFF
vertex     92,   -173,    -56,   1304,   3396,  0x38, 0x94, 0xDD, 0xFF

ccm_seg7_vertex_07012458: # 0x07012458 - 0x07012558
vertex   -204,      0,      0,      0,   3032,  0x82, 0x00, 0x00, 0xFF
vertex   -173,   -101,     33,    314,   2820,  0x96, 0xBF, 0x14, 0xFF
vertex   -173,      0,    108,      0,   2312,  0x96, 0x00, 0x44, 0xFF
vertex    -91,   -107,    148,    532,   1980,  0xC1, 0xC0, 0x58, 0xFF
vertex    -91,   -173,     57,    676,   2668,  0xC8, 0x94, 0x23, 0xFF
vertex    -91,      0,    183,      0,   1592,  0xC8, 0x00, 0x71, 0xFF
vertex      0,   -204,      0,    990,   3032,  0x00, 0x82, 0x00, 0xFF
vertex      0,   -165,    120,    990,   2214,  0x00, 0x9A, 0x4A, 0xFF
vertex     92,   -173,     57,   1304,   2668,  0x40, 0x98, 0x21, 0xFF
vertex     92,   -173,    -56,   1304,   3396,  0x38, 0x94, 0xDD, 0xFF
vertex     92,   -107,    148,   1448,   1980,  0x37, 0xBD, 0x5C, 0xFF
vertex    205,      0,      0,   2012,   3032,  0x7E, 0x00, 0x00, 0xFF
vertex    174,      0,   -107,   2012,   3752,  0x6A, 0x00, 0xBC, 0xFF
vertex    174,    102,    -32,   2358,   3244,  0x6A, 0x41, 0xEB, 0xFF
vertex     92,    108,   -147,   2576,   4084,  0x3F, 0x40, 0xA8, 0xFF
vertex     92,      0,   -182,   2012,   4472,  0x37, 0x00, 0x8E, 0xFF

ccm_seg7_vertex_07012558: # 0x07012558 - 0x07012658
vertex    174,    102,    -32,   2358,   3244,  0x6A, 0x41, 0xEB, 0xFF
vertex     92,    108,   -147,   2576,   4084,  0x3F, 0x40, 0xA8, 0xFF
vertex     92,    174,    -56,   2720,   3396,  0x38, 0x6C, 0xDD, 0xFF
vertex     92,      0,   -182,   -264,    390,  0x37, 0x00, 0x8E, 0xFF
vertex      0,    -62,   -194,    802,   1062,  0x00, 0xD9, 0x88, 0xFF
vertex      0,     63,   -194,     -8,    -50,  0x00, 0x27, 0x88, 0xFF
vertex    -91,      0,   -182,   1038,    620,  0xC0, 0x00, 0x93, 0xFF
vertex      0,    -62,   -194,    990,   4668,  0x00, 0xD9, 0x88, 0xFF
vertex    -91,   -107,   -147,    532,   4084,  0xC8, 0xBD, 0xA4, 0xFF
vertex    -91,      0,   -182,      0,   4472,  0xC0, 0x00, 0x93, 0xFF
vertex      0,     63,   -194,   3034,   4668,  0x00, 0x27, 0x88, 0xFF
vertex    -91,      0,   -182,   4056,   4472,  0xC0, 0x00, 0x93, 0xFF
vertex    -91,    108,   -147,   3492,   4084,  0xC8, 0x42, 0xA4, 0xFF
vertex    205,      0,      0,   2012,   3032,  0x7E, 0x00, 0x00, 0xFF
vertex    174,     63,     87,   2238,   2460,  0x6A, 0x28, 0x37, 0xFF
vertex     92,    174,     57,   2720,   2668,  0x40, 0x68, 0x21, 0xFF

ccm_seg7_vertex_07012658: # 0x07012658 - 0x07012758
vertex    174,     63,     87,   2238,   2460,  0x6A, 0x28, 0x37, 0xFF
vertex     92,    174,     57,   2720,   2668,  0x40, 0x68, 0x21, 0xFF
vertex     92,    108,    148,   2576,   1980,  0x38, 0x43, 0x5C, 0xFF
vertex     92,    174,    -56,   2720,   3396,  0x38, 0x6C, 0xDD, 0xFF
vertex      0,    166,   -119,   3034,   3850,  0x00, 0x66, 0xB6, 0xFF
vertex      0,    205,      0,   3034,   3032,  0x00, 0x7E, 0x00, 0xFF
vertex    -91,    174,    -56,   3348,   3396,  0xC0, 0x68, 0xDF, 0xFF
vertex    -91,    108,   -147,   3492,   4084,  0xC8, 0x42, 0xA4, 0xFF
vertex    -91,    174,     57,   3348,   2668,  0xC8, 0x6C, 0x23, 0xFF
vertex    205,      0,      0,   2012,   3032,  0x7E, 0x00, 0x00, 0xFF
vertex    174,    -62,     87,   1786,   2460,  0x6A, 0xD8, 0x37, 0xFF
vertex     92,      0,    183,   2012,   1592,  0x3F, 0x00, 0x6D, 0xFF
vertex     92,   -107,    148,   1448,   1980,  0x37, 0xBD, 0x5C, 0xFF
vertex      0,    166,    120,   3034,   2214,  0x00, 0x66, 0x4A, 0xFF
vertex      0,     63,    195,   3034,   1396,  0x00, 0x27, 0x78, 0xFF
vertex    -91,    108,    148,   3492,   1980,  0xC0, 0x40, 0x58, 0xFF

ccm_seg7_vertex_07012758: # 0x07012758 - 0x07012858
vertex      0,     63,    195,   3034,   1396,  0x00, 0x27, 0x78, 0xFF
vertex    -91,    108,    148,   3492,   1980,  0xC0, 0x40, 0x58, 0xFF
vertex    -91,      0,    183,   4056,   1592,  0xC8, 0x00, 0x71, 0xFF
vertex    205,      0,      0,   2012,   3032,  0x7E, 0x00, 0x00, 0xFF
vertex    174,    -62,     87,   1786,   2460,  0x6A, 0xD8, 0x37, 0xFF
vertex    174,   -101,    -32,   1666,   3244,  0x6A, 0xBF, 0xEC, 0xFF
vertex     92,   -107,    148,   1448,   1980,  0x37, 0xBD, 0x5C, 0xFF
vertex     92,   -173,     57,   1304,   2668,  0x40, 0x98, 0x21, 0xFF
vertex     92,   -173,    -56,   1304,   3396,  0x38, 0x94, 0xDD, 0xFF
vertex      0,    -62,    195,    990,   1396,  0x00, 0xD9, 0x78, 0xFF
vertex      0,   -165,    120,    990,   2214,  0x00, 0x9A, 0x4A, 0xFF
vertex    -91,   -107,    148,    532,   1980,  0xC1, 0xC0, 0x58, 0xFF
vertex    -91,      0,    183,      0,   1592,  0xC8, 0x00, 0x71, 0xFF
vertex    -91,   -173,     57,    676,   2668,  0xC8, 0x94, 0x23, 0xFF
vertex    174,      0,   -107,   2012,   3752,  0x6A, 0x00, 0xBC, 0xFF
vertex     92,   -107,   -147,   1448,   4084,  0x3F, 0xC0, 0xA8, 0xFF

ccm_seg7_vertex_07012858: # 0x07012858 - 0x070128E8
vertex      0,   -165,   -119,    990,   3850,  0x00, 0x9A, 0xB6, 0xFF
vertex    -91,   -173,    -56,    676,   3396,  0xC0, 0x98, 0xDF, 0xFF
vertex    -91,   -107,   -147,    532,   4084,  0xC8, 0xBD, 0xA4, 0xFF
vertex    174,      0,   -107,   2012,   3752,  0x6A, 0x00, 0xBC, 0xFF
vertex     92,   -107,   -147,   1448,   4084,  0x3F, 0xC0, 0xA8, 0xFF
vertex     92,      0,   -182,   2012,   4472,  0x37, 0x00, 0x8E, 0xFF
vertex     92,   -173,    -56,   1304,   3396,  0x38, 0x94, 0xDD, 0xFF
vertex      0,   -204,      0,    990,   3032,  0x00, 0x82, 0x00, 0xFF
vertex    -91,   -173,     57,    676,   2668,  0xC8, 0x94, 0x23, 0xFF

ccm_seg7_dl_070128E8: # 0x070128E8 - 0x07012BD8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, ccm_seg7_texture_07011958
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ccm_seg7_light_07011948, 1
gsSPLight ccm_seg7_light_07011940, 2
gsSPVertex ccm_seg7_vertex_07012158, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  4,  6,  5, 0x0,  4,  7,  6, 0x0
gsSP2Triangles  5,  6,  8, 0x0,  9, 10, 11, 0x0
gsSP2Triangles 10, 12, 11, 0x0, 13,  2, 14, 0x0
gsSP1Triangle  3,  5, 15, 0x0
gsSPVertex ccm_seg7_vertex_07012258, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  2,  1,  4, 0x0,  3,  5,  6, 0x0
gsSP2Triangles  5,  7,  8, 0x0,  5,  8,  6, 0x0
gsSP2Triangles  6,  8,  9, 0x0, 10, 11, 12, 0x0
gsSP2Triangles 11, 13, 12, 0x0, 12, 13, 14, 0x0
gsSP1Triangle  2,  4, 15, 0x0
gsSPVertex ccm_seg7_vertex_07012358, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP2Triangles  1,  4,  3, 0x0,  2,  3,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  7,  9,  8, 0x0
gsSP2Triangles  7, 10,  9, 0x0,  8,  9, 11, 0x0
gsSP2Triangles 10, 12, 13, 0x0, 12, 14, 13, 0x0
gsSP2Triangles 12,  5, 14, 0x0, 13, 14, 15, 0x0
gsSPVertex ccm_seg7_vertex_07012458, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP2Triangles  1,  4,  3, 0x0,  2,  3,  5, 0x0
gsSP2Triangles  4,  6,  7, 0x0,  6,  8,  7, 0x0
gsSP2Triangles  6,  9,  8, 0x0,  7,  8, 10, 0x0
gsSP2Triangles 11, 12, 13, 0x0, 12, 14, 13, 0x0
gsSP1Triangle 12, 15, 14, 0x0
gsSPVertex ccm_seg7_vertex_07012558, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  4,  6,  5, 0x0,  7,  8,  9, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 13,  0, 14, 0x0
gsSP2Triangles  0, 15, 14, 0x0,  0,  2, 15, 0x0
gsSPVertex ccm_seg7_vertex_07012658, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  4,  6,  5, 0x0,  4,  7,  6, 0x0
gsSP2Triangles  5,  6,  8, 0x0,  9,  0, 10, 0x0
gsSP2Triangles  0, 11, 10, 0x0,  0,  2, 11, 0x0
gsSP2Triangles 10, 11, 12, 0x0,  2, 13, 14, 0x0
gsSP2Triangles 13, 15, 14, 0x0, 13,  8, 15, 0x0
gsSPVertex ccm_seg7_vertex_07012758, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  4,  6,  7, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  5,  7,  8, 0x0,  6,  9, 10, 0x0
gsSP2Triangles  9, 11, 10, 0x0,  9, 12, 11, 0x0
gsSP2Triangles 10, 11, 13, 0x0,  3,  5, 14, 0x0
gsSP2Triangles  5, 15, 14, 0x0,  5,  8, 15, 0x0
gsSPVertex ccm_seg7_vertex_07012858, 9, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  0, 0x0,  7,  1,  0, 0x0
gsSP1Triangle  7,  8,  1, 0x0
gsSPEndDisplayList

glabel ccm_seg7_dl_07012BD8 # 0x07012BD8 - 0x07012C38
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ccm_seg7_dl_070128E8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
