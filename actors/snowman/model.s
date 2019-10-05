# Snowman

# ???
.dword 1

# Unreferenced light
.byte 0x0D, 0x0C, 0x28, 0x00, 0x0D, 0x0C, 0x28, 0x00

.byte 0x35, 0x32, 0xA2, 0x00, 0x35, 0x32, 0xA2, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

# Unreferenced light
.byte 0x3F, 0x00, 0x00, 0x00, 0x3F, 0x00, 0x00, 0x00

.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

# Unreferenced light
.byte 0x08, 0x07, 0x04, 0x00, 0x08, 0x07, 0x04, 0x00

.byte 0x23, 0x1C, 0x12, 0x00, 0x23, 0x1C, 0x12, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

# Unreferenced light
.byte 0x03, 0x03, 0x02, 0x00, 0x03, 0x03, 0x02, 0x00

.byte 0x0E, 0x0D, 0x0B, 0x00, 0x0E, 0x0D, 0x0B, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

snowman_seg5_texture_05008C70: # 0x05008C70
.incbin "actors/snowman/mr_blizzard_mitten.rgba16"

snowman_seg5_texture_05009470: # 0x05009470
.incbin "actors/snowman/mr_blizzard_left_side.rgba16"

snowman_seg5_texture_0500A470: # 0x0500A470
.incbin "actors/snowman/mr_blizzard_right_side.rgba16"

snowman_seg5_texture_0500B470: # 0x0500B470
.incbin "actors/snowman/mr_blizzard_eye.rgba16"

snowman_seg5_texture_0500BC70: # 0x0500BC70
.incbin "actors/snowman/mr_blizzard_mouth.rgba16"

snowman_seg5_light_0500C470: # 0x0500C470
.byte 0x1C, 0x0F, 0x07, 0x00, 0x1C, 0x0F, 0x07, 0x00

snowman_seg5_light_0500C478: # 0x0500C478
.byte 0x38, 0x1E, 0x0E, 0x00, 0x38, 0x1E, 0x0E, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

snowman_seg5_vertex_0500C488: # 0x0500C488
vertex    -23,      1,     -6,      0,      0,  0x82, 0xFD, 0xFD, 0xFF
vertex     76,    -17,     -6,      0,      0,  0xEA, 0x84, 0xF9, 0xFF
vertex     75,     15,     15,      0,      0,  0xE1, 0x36, 0x6E, 0xFF
vertex     75,     17,    -23,      0,      0,  0xE4, 0x42, 0x99, 0xFF

glabel snowman_seg5_dl_0500C4C8 # 0x0500C4C8 - 0x0500C500
gsSPLight snowman_seg5_light_0500C478, 1
gsSPLight snowman_seg5_light_0500C470, 2
gsSPVertex snowman_seg5_vertex_0500C488, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP1Triangle  0,  3,  1, 0x0
gsSPEndDisplayList

glabel snowman_seg5_dl_0500C500 # 0x0500C500 - 0x0500C530
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPDisplayList snowman_seg5_dl_0500C4C8
gsSPEndDisplayList

snowman_seg5_vertex_0500C530: # 0x0500C530
vertex      0,     76,      0,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -76,    -76,      0,      0,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    -76,      0,    990,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -76,     76,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

snowman_seg5_vertex_0500C570: # 0x0500C570
vertex     76,     76,      0,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    -76,      0,      0,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex     76,    -76,      0,    990,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,     76,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

glabel snowman_seg5_dl_0500C5B0 # 0x0500C5B0 - 0x0500C5E8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, snowman_seg5_texture_05009470
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex snowman_seg5_vertex_0500C530, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel snowman_seg5_dl_0500C5E8 # 0x0500C5E8 - 0x0500C620
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, snowman_seg5_texture_0500A470
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex snowman_seg5_vertex_0500C570, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel snowman_seg5_dl_0500C620 # 0x0500C620 - 0x0500C698
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList snowman_seg5_dl_0500C5B0
gsSPDisplayList snowman_seg5_dl_0500C5E8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

snowman_seg5_vertex_0500C698: # 0x0500C698
vertex     69,    191,   -132,   -370,   -440,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -63,    230,      0,   1472,   1328,  0xFF, 0xFF, 0xFF, 0xFF
vertex     69,    230,      0,   1472,   -440,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -63,    191,   -132,   -370,   1328,  0xFF, 0xFF, 0xFF, 0xFF
vertex     69,    230,      0,   -370,   -440,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -63,    191,    133,   1472,   1328,  0xFF, 0xFF, 0xFF, 0xFF
vertex     69,    191,    133,   1472,   -440,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -63,    230,      0,   -370,   1328,  0xFF, 0xFF, 0xFF, 0xFF

glabel snowman_seg5_dl_0500C718 # 0x0500C718 - 0x0500C760
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, snowman_seg5_texture_0500B470
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex snowman_seg5_vertex_0500C698, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

glabel snowman_seg5_dl_0500C760 # 0x0500C760 - 0x0500C7D0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList snowman_seg5_dl_0500C718
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

snowman_seg5_light_0500C7D0: # 0x0500C7D0
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

snowman_seg5_light_0500C7D8: # 0x0500C7D8
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

snowman_seg5_vertex_0500C7E8: # 0x0500C7E8
vertex      3,    -44,    -24,    672,   1148,  0xC1, 0xB9, 0xAD, 0xFF
vertex    105,    -63,    -17,    720,    626,  0x31, 0xCA, 0x99, 0xFF
vertex    116,   -101,     11,    888,    570,  0x2D, 0x8C, 0xEB, 0xFF
vertex     -4,      4,    -29,    458,   1184,  0xAD, 0x03, 0xA1, 0xFF
vertex     96,    -30,    -36,    578,    662,  0x1E, 0xDE, 0x8A, 0xFF
vertex     97,     16,    -36,    364,    654,  0x13, 0x2A, 0x8A, 0xFF
vertex    208,    -42,     25,    588,     84,  0x57, 0xA8, 0x19, 0xFF
vertex    128,    -61,      9,    704,    502,  0x69, 0xBF, 0x1B, 0xFF
vertex     57,    -20,     36,    546,    864,  0x02, 0xF8, 0x7E, 0xFF
vertex    132,     90,     32,     20,    460,  0x13, 0x52, 0x5E, 0xFF
vertex    215,     42,     28,    206,     34,  0x45, 0x40, 0xAC, 0xFF
vertex     69,    -56,     36,    704,    810,  0x04, 0xE8, 0x7C, 0xFF
vertex     -2,     45,    -14,    270,   1168,  0xA1, 0x42, 0xCE, 0xFF
vertex     33,     83,     26,     88,    974,  0xCD, 0x72, 0x0F, 0xFF
vertex    107,     63,     -2,    148,    596,  0x0F, 0x52, 0xA1, 0xFF
vertex     36,    -86,     11,    850,    988,  0xBD, 0xA8, 0x3D, 0xFF

snowman_seg5_vertex_0500C8E8: # 0x0500C8E8
vertex     69,    -56,     36,    704,    810,  0x04, 0xE8, 0x7C, 0xFF
vertex     57,    -20,     36,    546,    864,  0x02, 0xF8, 0x7E, 0xFF
vertex      6,      0,     28,    472,   1124,  0xA3, 0xF5, 0x55, 0xFF
vertex     33,     83,     26,     88,    974,  0xCD, 0x72, 0x0F, 0xFF
vertex     -4,      4,    -29,    458,   1184,  0xAD, 0x03, 0xA1, 0xFF
vertex      3,    -44,    -24,    672,   1148,  0xC1, 0xB9, 0xAD, 0xFF
vertex     -2,     45,    -14,    270,   1168,  0xA1, 0x42, 0xCE, 0xFF
vertex     36,    -86,     11,    850,    988,  0xBD, 0xA8, 0x3D, 0xFF
vertex    116,   -101,     11,    888,    570,  0x2D, 0x8C, 0xEB, 0xFF

glabel snowman_seg5_dl_0500C978 # 0x0500C978 - 0x0500CAA8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, snowman_seg5_texture_05008C70
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight snowman_seg5_light_0500C7D8, 1
gsSPLight snowman_seg5_light_0500C7D0, 2
gsSPVertex snowman_seg5_vertex_0500C7E8, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  4, 0x0
gsSP2Triangles  4,  1,  0, 0x0,  5,  4,  3, 0x0
gsSP2Triangles  5,  6,  4, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  7,  1,  4, 0x0,  7,  6,  8, 0x0
gsSP2Triangles  9,  8,  6, 0x0,  9,  6, 10, 0x0
gsSP2Triangles  5, 10,  6, 0x0,  7,  2,  1, 0x0
gsSP2Triangles  8, 11,  7, 0x0, 11,  2,  7, 0x0
gsSP2Triangles  5, 12, 13, 0x0, 13, 14,  5, 0x0
gsSP2Triangles  5,  3, 12, 0x0,  5, 14, 10, 0x0
gsSP2Triangles 10, 14,  9, 0x0, 13,  9, 14, 0x0
gsSP2Triangles  8,  9, 13, 0x0,  2, 15,  0, 0x0
gsSPVertex snowman_seg5_vertex_0500C8E8, 9, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  2,  1, 0x0
gsSP2Triangles  4,  5,  2, 0x0,  2,  6,  4, 0x0
gsSP2Triangles  2,  5,  7, 0x0,  0,  2,  7, 0x0
gsSP2Triangles  3,  6,  2, 0x0,  7,  8,  0, 0x0
gsSPEndDisplayList

glabel snowman_seg5_dl_0500CAA8 # 0x0500CAA8 - 0x0500CB08
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList snowman_seg5_dl_0500C978
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

snowman_seg5_vertex_0500CB08: # 0x0500CB08
vertex      0,     57,      0,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -57,    -57,      0,      0,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    -57,      0,    990,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -57,     57,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

snowman_seg5_vertex_0500CB48: # 0x0500CB48
vertex     57,     57,      0,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    -57,      0,      0,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex     57,    -57,      0,    990,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,     57,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

glabel snowman_seg5_dl_0500CB88 # 0x0500CB88 - 0x0500CBC0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, snowman_seg5_texture_05009470
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex snowman_seg5_vertex_0500CB08, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel snowman_seg5_dl_0500CBC0 # 0x0500CBC0 - 0x0500CBF8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, snowman_seg5_texture_0500A470
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex snowman_seg5_vertex_0500CB48, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel snowman_seg5_dl_0500CBF8 # 0x0500CBF8 - 0x0500CC70
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList snowman_seg5_dl_0500CB88
gsSPDisplayList snowman_seg5_dl_0500CBC0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

snowman_seg5_vertex_0500CC70: # 0x0500CC70
vertex    -90,    210,    -56,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -134,    182,    -56,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -134,    182,     57,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -90,    210,     57,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF

glabel snowman_seg5_dl_0500CCB0 # 0x0500CCB0 - 0x0500CCE8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, snowman_seg5_texture_0500BC70
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex snowman_seg5_vertex_0500CC70, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel snowman_seg5_dl_0500CCE8 # 0x0500CCE8 - 0x0500CD58
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList snowman_seg5_dl_0500CCB0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

snowman_seg5_animvalue_0500CD58: # 0x0500CD58
.hword 0x0000, 0x00B9, 0x3FFF, 0xFA95, 0xFA9D, 0xFAAF, 0xFAC1, 0xFAC9
.hword 0xFABE, 0xFA95, 0xF8FC, 0xF91A, 0xF966, 0xF9C8, 0xFA2B, 0xFA77
.hword 0xFA95, 0x2242, 0x221B, 0x21C6, 0x2170, 0x214A, 0x2180, 0x2242
.hword 0x29E9, 0x2958, 0x27EE, 0x2616, 0x243E, 0x22D3, 0x2242, 0xF646
.hword 0xF650, 0xF666, 0xF67C, 0xF686, 0xF678, 0xF646, 0xF44B, 0xF471
.hword 0xF4CE, 0xF548, 0xF5C2, 0xF620, 0xF646, 0x0659, 0x04FB, 0x02AF
.hword 0x022D, 0x062B, 0x1BA0, 0x313C, 0x346C, 0x315B, 0x2B7C, 0x223C
.hword 0x15DA, 0x0B01, 0x0659, 0x0107, 0x00AA, 0xFFD3, 0xFEDF, 0xFE2E
.hword 0xFDF1, 0xFE6C, 0x0000, 0x01F7, 0x0322, 0x0303, 0x0244, 0x016D
.hword 0x0107, 0x6136, 0x6531, 0x6D55, 0x73F1, 0x7354, 0x5807, 0x3C79
.hword 0x3DFA, 0x48BA, 0x5228, 0x5776, 0x5C4F, 0x5FD8, 0x6136, 0xE001
.hword 0xC001, 0xE001, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0002
.hword 0x0005, 0x0004, 0x0004, 0x0003, 0x0002, 0x0001, 0x0000, 0x0000
.hword 0x0000, 0xFDB9, 0xF8F1, 0xF4BC, 0xF430, 0x0144, 0x0DDA, 0x0E0C
.hword 0x0C72, 0x09AF, 0x066A, 0x0348, 0x00ED, 0x0000, 0x3FFF, 0x3FFF
.hword 0x3FFF, 0x3FFF, 0x3FFF, 0x4002, 0x4004, 0x4003, 0x4003, 0x4002
.hword 0x4001, 0x4000, 0x3FFF, 0x3FFF

snowman_seg5_animindex_0500CE60: # 0x0500CE60
.hword 0x0001, 0x0000, 0x0001, 0x0001, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0002, 0x0001, 0x0000, 0x000E, 0x005A, 0x000E, 0x0068
.hword 0x000E, 0x0076, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0057, 0x0001, 0x0058
.hword 0x0001, 0x0059, 0x000E, 0x002D, 0x000E, 0x003B, 0x000E, 0x0049
.hword 0x000E, 0x0003, 0x000E, 0x0011, 0x000E, 0x001F, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000

snowman_seg5_anim_0500CED8: # 0x0500CED8
.hword 1
.hword 0
.hword 0
.hword 0
.hword 0x0E
.hword 0x09
.word snowman_seg5_animvalue_0500CD58
.word snowman_seg5_animindex_0500CE60
.word 0

snowman_seg5_animvalue_0500CEF0: # 0x0500CEF0
.hword 0x0000, 0x00B9, 0x3FFF, 0xFA95, 0xFAD8, 0xFB7D, 0xFC4F, 0xFD19
.hword 0xFDA7, 0xFE0D, 0xFE5E, 0xFE63, 0xFDE7, 0xFC11, 0xF974, 0xF7FE
.hword 0xF937, 0xFB96, 0xFC65, 0xF7D6, 0xF39A, 0xF70A, 0xFB77, 0xFB76
.hword 0xFA95, 0x2242, 0x2280, 0x22B2, 0x2212, 0x1FD7, 0x1B39, 0x11F7
.hword 0x04A5, 0xF6B6, 0xEB9D, 0xE3F2, 0xDF47, 0xDF8A, 0xE5A8, 0xF0B4
.hword 0xFFD0, 0x1C59, 0x33CD, 0x29F0, 0x1A8A, 0x1D4E, 0x2242, 0xF646
.hword 0xF6A5, 0xF796, 0xF8D3, 0xFA17, 0xFB1C, 0xFB8F, 0xFBB4, 0xFC2A
.hword 0xFD93, 0x01C8, 0x074E, 0x09C2, 0x06C0, 0x00AE, 0xFA57, 0xF2FF
.hword 0xEE08, 0xF1E1, 0xF727, 0xF73A, 0xF646, 0x0659, 0x064F, 0x063C
.hword 0x062E, 0x0634, 0x065F, 0x06DF, 0x07A3, 0x0858, 0x08A6, 0x087A
.hword 0x080D, 0x077F, 0x06F2, 0x0685, 0x0659, 0x0659, 0x0659, 0x0659
.hword 0x0659, 0x0659, 0x0659, 0x0107, 0x01D6, 0x038C, 0x0519, 0x056B
.hword 0x0372, 0xFC45, 0xF0F8, 0xE67B, 0xE1BA, 0xE3E1, 0xE9A1, 0xF133
.hword 0xF8CF, 0xFEAE, 0x0107, 0x0107, 0x0107, 0x0107, 0x0107, 0x0107
.hword 0x0107, 0x6136, 0x615C, 0x61AB, 0x61F1, 0x61FC, 0x6198, 0x6037
.hword 0x5E0D, 0x5C0D, 0x5B26, 0x5B92, 0x5CB0, 0x5E27, 0x5F9F, 0x60C2
.hword 0x6136, 0x6136, 0x6136, 0x6136, 0x6136, 0x6136, 0x6136, 0xE001
.hword 0xC001, 0xE001, 0x0000, 0xF883, 0xE899, 0xDA19, 0xD6DA, 0xE383
.hword 0xF9B6, 0x12CB, 0x281A, 0x32F9, 0x3330, 0x2E19, 0x2564, 0x1ABE
.hword 0x0FD6, 0x065D, 0x0000, 0xFD49, 0xFCF2, 0xFDF7, 0xFF53, 0x0000
.hword 0x0000, 0x0180, 0x04B7, 0x07B2, 0x0883, 0x064D, 0x0251, 0xFDC2
.hword 0xF9D5, 0xF7BD, 0xF7A6, 0xF8AB, 0xFA67, 0xFC77, 0xFE76, 0x0000
.hword 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x3FFF, 0x3DDB
.hword 0x395E, 0x356F, 0x34F5, 0x3973, 0x4102, 0x496D, 0x507F, 0x5403
.hword 0x539F, 0x50FC, 0x4CE6, 0x482C, 0x439B, 0x3FFF, 0x3FFF, 0x3FFF
.hword 0x3FFF, 0x3FFF, 0x3FFF, 0x3FFF

snowman_seg5_animindex_0500D088: # 0x0500D088
.hword 0x0001, 0x0000, 0x0001, 0x0001, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0002, 0x0001, 0x0000, 0x0016, 0x008A, 0x0016, 0x00A0
.hword 0x0016, 0x00B6, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0087, 0x0001, 0x0088
.hword 0x0001, 0x0089, 0x0016, 0x0045, 0x0016, 0x005B, 0x0016, 0x0071
.hword 0x0016, 0x0003, 0x0016, 0x0019, 0x0016, 0x002F, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000

snowman_seg5_anim_0500D100: # 0x0500D100
.hword 0
.hword 0
.hword 0
.hword 0
.hword 0x16
.hword 0x09
.word snowman_seg5_animvalue_0500CEF0
.word snowman_seg5_animindex_0500D088
.word 0

glabel snowman_seg5_anims_0500D118 # 0x0500D118
.word snowman_seg5_anim_0500CED8
.word snowman_seg5_anim_0500D100
.word 0
.word 0
