# Blue Fish

blue_fish_seg3_light_0301B5C8: # 0x0301B5C8
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

blue_fish_seg3_light_0301B5D0: # 0x0301B5D0
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

blue_fish_seg3_texture_0301B5E0: # 0x0301B5E0
.incbin "actors/blue_fish/blue_fish.rgba16"

blue_fish_seg3_vertex_0301BDE0: # 0x0301BDE0
vertex   -108,      1,      0,     14,    566,  0x89, 0x00, 0xD7, 0xFF
vertex    -44,    -13,    -31,    286,    688,  0xEB, 0x89, 0xDC, 0xFF
vertex    -62,    -19,     12,    210,    502,  0xE8, 0x84, 0x0A, 0xFF
vertex    -44,     16,    -31,    286,    688,  0xEA, 0x77, 0xDC, 0xFF
vertex    -62,     21,     12,    210,    502,  0xE8, 0x7C, 0x0B, 0xFF
vertex    -47,      1,    -64,    274,    830,  0xBD, 0xFF, 0x95, 0xFF
vertex    -97,      1,     23,     62,    462,  0xA2, 0x00, 0x54, 0xFF
vertex     55,      1,    127,    712,     -8,  0x1A, 0x00, 0x7C, 0xFF
vertex     41,     16,     56,    656,    298,  0x43, 0x67, 0x1B, 0xFF
vertex     50,     16,    -43,    692,    722,  0x35, 0x6F, 0xE6, 0xFF
vertex     41,    -14,     56,    656,    298,  0x43, 0x99, 0x1B, 0xFF
vertex     50,    -13,    -43,    692,    722,  0x35, 0x91, 0xE6, 0xFF
vertex     62,      1,    -92,    742,    930,  0x42, 0xFF, 0x94, 0xFF
vertex    101,      1,      1,    910,    520,  0x7E, 0x00, 0x01, 0xFF

glabel blue_fish_seg3_dl_0301BEC0 # 0x0301BEC0 - 0x0301BFB8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, blue_fish_seg3_texture_0301B5E0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight blue_fish_seg3_light_0301B5D0, 1
gsSPLight blue_fish_seg3_light_0301B5C8, 2
gsSPVertex blue_fish_seg3_vertex_0301BDE0, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  4, 0x0
gsSP2Triangles  5,  0,  3, 0x0,  2,  6,  0, 0x0
gsSP2Triangles  0,  6,  4, 0x0,  5,  1,  0, 0x0
gsSP2Triangles  4,  6,  7, 0x0,  6,  2,  7, 0x0
gsSP2Triangles  7,  8,  4, 0x0,  9,  4,  8, 0x0
gsSP2Triangles  9,  3,  4, 0x0,  2, 10,  7, 0x0
gsSP2Triangles  1, 11,  2, 0x0, 11, 10,  2, 0x0
gsSP2Triangles  1,  5, 12, 0x0, 12,  5,  3, 0x0
gsSP2Triangles  9, 11, 12, 0x0,  3,  9, 12, 0x0
gsSP2Triangles 12, 11,  1, 0x0,  8,  7, 10, 0x0
gsSP2Triangles 13,  9,  8, 0x0,  9, 13, 11, 0x0
gsSP2Triangles 11, 13, 10, 0x0, 10, 13,  8, 0x0
gsSPEndDisplayList

glabel blue_fish_seg3_dl_0301BFB8 # 0x0301BFB8 - 0x0301C018
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList blue_fish_seg3_dl_0301BEC0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

blue_fish_seg3_vertex_0301C018: # 0x0301C018
vertex     67,      0,    -58,    736,    728,  0x7A, 0x00, 0xDE, 0xFF
vertex     67,     -3,    -28,    704,    574,  0x53, 0xA3, 0x14, 0xFF
vertex      0,      1,     -3,   1022,    356,  0xA1, 0xF9, 0xAD, 0xFF
vertex     67,      4,     27,    644,    290,  0x3F, 0x6D, 0xF3, 0xFF
vertex     53,      0,      0,    744,    414,  0x7E, 0x00, 0xFE, 0xFF
vertex     67,     -3,     27,    644,    290,  0x40, 0x95, 0xEB, 0xFF
vertex      0,      0,      5,   1016,    312,  0x9E, 0xFD, 0x50, 0xFF
vertex     67,      4,    -28,    704,    574,  0x54, 0x5C, 0x15, 0xFF
vertex     67,      0,     57,    612,    138,  0x7A, 0x00, 0x22, 0xFF

glabel blue_fish_seg3_dl_0301C0A8 # 0x0301C0A8 - 0x0301C150
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, blue_fish_seg3_texture_0301B5E0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight blue_fish_seg3_light_0301B5D0, 1
gsSPLight blue_fish_seg3_light_0301B5C8, 2
gsSPVertex blue_fish_seg3_vertex_0301C018, 9, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  4, 0x0
gsSP2Triangles  4,  5,  2, 0x0,  2,  5,  6, 0x0
gsSP2Triangles  2,  1,  4, 0x0,  2,  6,  3, 0x0
gsSP2Triangles  4,  7,  2, 0x0,  2,  7,  0, 0x0
gsSP2Triangles  6,  8,  3, 0x0,  3,  8,  5, 0x0
gsSP2Triangles  3,  5,  4, 0x0,  4,  1,  7, 0x0
gsSP2Triangles  6,  5,  8, 0x0,  1,  0,  7, 0x0
gsSPEndDisplayList

glabel blue_fish_seg3_dl_0301C150 # 0x0301C150 - 0x0301C1B0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList blue_fish_seg3_dl_0301C0A8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

blue_fish_seg3_animvalue_0301C1B0: # 0x0301C1B0
.hword 0x0000, 0xFFF1, 0xFFF1, 0xFFF2, 0xFFF4, 0xFFF7, 0xFFFA, 0xFFFD
.hword 0x0000, 0x0002, 0x0005, 0x0008, 0x000A, 0x000C, 0x000E, 0x000E
.hword 0x000E, 0x000D, 0x000C, 0x000A, 0x0009, 0x0006, 0x0004, 0x0002
.hword 0x0000, 0xFFFD, 0xFFFB, 0xFFF8, 0xFFF6, 0xFFF3, 0xFFF1, 0xC001
.hword 0xF3F6, 0xF61A, 0xFAF7, 0x003A, 0x0390, 0x052A, 0x06BA, 0x0832
.hword 0x0984, 0x0AA1, 0x0B7C, 0x0C06, 0x0C31, 0x0BEE, 0x0B2F, 0x078D
.hword 0x00B3, 0xF9AA, 0xF579, 0xF3FF, 0xF306, 0xF27B, 0xF247, 0xF258
.hword 0xF298, 0xF2F4, 0xF356, 0xF3AB, 0xF3DE, 0xF3DA, 0x461C, 0x4623
.hword 0x462E, 0x4629, 0x4603, 0x45AA, 0x450A, 0x4410, 0x42C9, 0x4151
.hword 0x3FC6, 0x3E45, 0x3CEA, 0x3BD2, 0x3B1B, 0x3ACE, 0x3AD5, 0x3B20
.hword 0x3BA0, 0x3C43, 0x3CFA, 0x3DB5, 0x3E7E, 0x3F66, 0x4066, 0x4177
.hword 0x4292, 0x43AF, 0x44C7, 0x45D4

blue_fish_seg3_animindex_0301C268: # 0x0301C268
.hword 0x001E, 0x0001, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x001F
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x001E, 0x003E, 0x0001, 0x0000, 0x0001, 0x0000, 0x001E, 0x0020

blue_fish_seg3_anim_0301C298: # 0x0301C298
.hword 0
.hword 0
.hword 0
.hword 0
.hword 0x1E
.hword 0x03
.word blue_fish_seg3_animvalue_0301C1B0
.word blue_fish_seg3_animindex_0301C268
.word 0

glabel blue_fish_seg3_anims_0301C2B0 # 0x0301C2B0
.word blue_fish_seg3_anim_0301C298
.word 0
