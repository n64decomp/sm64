.include "painting_constants.inc"

hmc_seg7_light_070241B8: # 0x070241B8 - 0x070241C0
.byte 0x50, 0x50, 0x50, 0x00, 0x50, 0x50, 0x50, 0x00

hmc_seg7_light_070241C0: # 0x070241C0 - 0x070241D0
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x32, 0x32, 0x32, 0x00, 0x00, 0x00, 0x00, 0x00

hmc_seg7_light_070241D0: # 0x070241D0 - 0x070241D8
.byte 0x40, 0x40, 0x80, 0x00, 0x40, 0x40, 0x80, 0x00

hmc_seg7_light_070241D8: # 0x070241D8 - 0x070241E8
.byte 0x64, 0x64, 0xFF, 0x00, 0x64, 0x64, 0xFA, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

# Appears to lock 4 of the sides when shimmering and in use. Unused.
hmc_seg7_vertex_070241E8: # 0x070241E8 - 0x07024228
vertex      0,      0,      0,    -32,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    614,      0,      0,   6100,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    614,    614,      0,   6100,  -5142,  0x00, 0x00, 0x7F, 0xFF
vertex      0,    614,      0,    -32,  -5142,  0x00, 0x00, 0x7F, 0xFF

hmc_seg7_vertex_07024228: # 0x07024228 - 0x07024268
vertex      0,      0,      0,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    614,      0,      0,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    614,    614,      0,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex      0,    614,      0,      0,      0,  0x00, 0x00, 0x7F, 0xFF

# Unused
glabel hmc_seg7_dl_07024268 # 0x07024268 - 0x070242A0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPLight hmc_seg7_light_070241C0, 1
gsSPLight hmc_seg7_light_070241B8, 2
gsSPTexture -1, -1, 0, 0, 1
gsSPVertex hmc_seg7_vertex_070241E8, 4, 0
gsSPEndDisplayList

# Unused
glabel hmc_seg7_dl_070242A0 # 0x070242A0 - 0x070242D0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

hmc_seg7_painting_dl_070242D0: # 0x070242D0 - 0x070242F0
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPEndDisplayList

hmc_seg7_pool_points_070242F0: # 0x070242F0 - 0x70246A0
.hword 157
.hword   0, 6100, -4832
.hword   1, 6100, -5142
.hword   2, 5582, -5142
.hword   3, 5582, -4526
.hword   4, 6100, -4218
.hword   5, 5070, -4832
.hword   6, 5070, -5142
.hword   7, 3030, -5142
.hword   8, 3030, -4832
.hword   9, 3540, -5142
.hword  10, 2520, -5142
.hword  11, 2520, -4526
.hword  12, 3030, -4218
.hword  13, 3540, -4526
.hword  14, 4050, -4832
.hword  15, 4560, -5142
.hword  16, 5070, -4218
.hword  17, 4560, -4526
.hword  18, 4050, -4218
.hword  19, 5582, -2074
.hword  20, 6100, -2380
.hword  21, 5582, -3300
.hword  22, 6100, -2994
.hword  23, 5582, -2686
.hword  24, 5070, -2380
.hword  25, 4560, -2074
.hword  26, 4560, -3300
.hword  27, 5070, -2994
.hword  28, 5070, -3606
.hword  29, 4050, -2380
.hword  30, 4560, -2686
.hword  31, 3540, -2074
.hword  32, 4050, -3606
.hword  33, 3540, -3300
.hword  34, 4050, -2994
.hword  35, 3540, -2686
.hword  36, 3030, -2380
.hword  37, 2520, -2074
.hword  38, 3030, -2994
.hword  39, 2520, -3300
.hword  40, 3030, -3606
.hword  41, 6100, -3606
.hword  42, 5582, -3912
.hword  43, 4560, -3912
.hword  44, 3540, -3912
.hword  45, 2520, -3912
.hword  46, 4050, -1768
.hword  47, 5070, -1768
.hword  48, 3030, -1768
.hword  49, 6100,   684
.hword  50, 6100,   990
.hword  51, 5582,   990
.hword  52, 5582,  -236
.hword  53, 6100,    70
.hword  54, 5070,   684
.hword  55, 5582,   378
.hword  56, 4560,   990
.hword  57, 5070,   990
.hword  58, 4560,  -236
.hword  59, 5070,    70
.hword  60, 5070,  -542
.hword  61, 4050,   684
.hword  62, 4560,   378
.hword  63, 3540,   990
.hword  64, 4050,   990
.hword  65, 4050,    70
.hword  66, 3540,  -236
.hword  67, 4050,  -542
.hword  68, 3030,   684
.hword  69, 3540,   378
.hword  70, 2520,   990
.hword  71, 3030,   990
.hword  72, 2520,  -236
.hword  73, 3030,    70
.hword  74, 3030,  -542
.hword  75, 6100,  -542
.hword  76, 5582, -1462
.hword  77, 6100, -1154
.hword  78, 5582,  -848
.hword  79, 4560, -1462
.hword  80, 5070, -1154
.hword  81, 4560,  -848
.hword  82, 3540, -1462
.hword  83, 4050, -1154
.hword  84, 3540,  -848
.hword  85, 2520, -1462
.hword  86, 3030, -1154
.hword  87, 2010, -4832
.hword  88,    0, -5142
.hword  89,    0, -4832
.hword  90,  478, -5142
.hword  91,  478, -4526
.hword  92,  988, -4832
.hword  93, 2010, -4218
.hword  94, 1498, -4526
.hword  95, 1498, -5142
.hword  96,  988, -4218
.hword  97, 2520, -2686
.hword  98, 2010, -2380
.hword  99, 1498, -2074
.hword 100, 1498, -3300
.hword 101, 2010, -2994
.hword 102, 2010, -3606
.hword 103, 1498, -2686
.hword 104,  988, -2380
.hword 105,  478, -2074
.hword 106,  478, -3300
.hword 107,  988, -2994
.hword 108,  988, -3606
.hword 109,  478, -2686
.hword 110,    0, -2380
.hword 111,    0, -3606
.hword 112, 1498, -3912
.hword 113,  478, -3912
.hword 114, 1498, -1462
.hword 115,  988, -1768
.hword 116, 2010, -1768
.hword 117,    0, -1768
.hword 118,  478, -1462
.hword 119, 2010,   684
.hword 120, 2520,   378
.hword 121, 2010,   990
.hword 122, 1498,   990
.hword 123, 2010,  -542
.hword 124, 2010,    70
.hword 125, 1498,  -236
.hword 126,  988,   684
.hword 127, 1498,   378
.hword 128,  988,   990
.hword 129,  478,   990
.hword 130,  478,  -236
.hword 131,  988,    70
.hword 132,  988,  -542
.hword 133,    0,   684
.hword 134,  478,   378
.hword 135,    0,  -542
.hword 136, 2520,  -848
.hword 137, 2010, -1154
.hword 138, 1498,  -848
.hword 139,  988, -1154
.hword 140,  478,  -848
.hword 141, 4050, -5142
.hword 142, 6100, -2074
.hword 143, 6100, -1768
.hword 144, 5070, -2074
.hword 145, 4050, -2074
.hword 146, 3030, -2074
.hword 147, 2010, -5142
.hword 148,    0, -4218
.hword 149,  988, -5142
.hword 150, 2010, -2074
.hword 151,  988, -2074
.hword 152,    0, -2994
.hword 153,    0, -2074
.hword 154,    0, -1154
.hword 155,    0,    70
.hword 156,    0,   990

hmc_seg7_triangles_070246A0: # 0x070246A0 - 0x07024CD2
.hword 264
.hword   8,  12,  13
.hword   0,   1,   2
.hword   3,   0,   2
.hword   4,   0,   3
.hword   5,   2,   6
.hword   2,   5,   3
.hword   7,   8,   9
.hword   8,   7,  10
.hword  11,   8,  10
.hword  12,   8,  11
.hword   9,   8,  13
.hword  13,  14,   9
.hword  14, 141,   9
.hword   5,   6,  15
.hword   5,  16,   3
.hword  16,   5,  17
.hword  17,   5,  15
.hword  14,  15, 141
.hword  15,  14,  17
.hword  18,  14,  13
.hword  14,  18,  17
.hword  19, 142,  20
.hword  19,  20,  23
.hword  28,  27,  21
.hword  21,  23,  22
.hword  22,  41,  21
.hword  20,  22,  23
.hword  23,  24,  19
.hword  21,  27,  23
.hword  24,  23,  27
.hword  25, 144,  24
.hword  19,  24, 144
.hword  24,  27,  30
.hword  25,  24,  30
.hword  26,  30,  27
.hword  27,  28,  26
.hword  36,  38,  97
.hword  26,  34,  30
.hword  29,  30,  34
.hword  30,  29,  25
.hword  25,  29, 145
.hword  31, 145,  29
.hword  31,  29,  35
.hword  29,  34,  35
.hword  32,  34,  26
.hword  33,  35,  34
.hword  34,  32,  33
.hword  33,  38,  35
.hword  35,  36,  31
.hword  36,  35,  38
.hword  37,  36,  97
.hword  37, 146,  36
.hword  31,  36, 146
.hword  28,  16,  43
.hword  38,  40,  39
.hword  39,  97,  38
.hword  40,  38,  33
.hword  21,  41,  42
.hword  41,   4,  42
.hword   3,  42,   4
.hword  42,  28,  21
.hword  28,  42,  16
.hword   3,  16,  42
.hword  26,  28,  43
.hword  17,  43,  16
.hword  43,  32,  26
.hword  32,  43,  18
.hword  17,  18,  43
.hword  33,  32,  44
.hword  32,  18,  44
.hword  13,  44,  18
.hword  44,  40,  33
.hword  13,  12,  44
.hword  40,  44,  12
.hword  39,  40,  45
.hword  40,  12,  45
.hword  48,  31, 146
.hword  11,  45,  12
.hword  25,  47, 144
.hword  46,  25, 145
.hword  47,  19, 144
.hword  19, 143, 142
.hword  31,  46, 145
.hword  60,  59,  52
.hword  49,  53,  55
.hword  50,  49,  51
.hword  51,  49,  55
.hword  52,  55,  53
.hword  53,  75,  52
.hword  54,  55,  59
.hword  52,  59,  55
.hword  55,  54,  51
.hword  54,  59,  62
.hword  56,  54,  62
.hword  57,  54,  56
.hword  54,  57,  51
.hword  58,  62,  59
.hword  59,  60,  58
.hword  68,  71,  63
.hword  61,  62,  65
.hword  58,  65,  62
.hword  62,  61,  56
.hword  61,  65,  69
.hword  63,  61,  69
.hword  64,  61,  63
.hword  61,  64,  56
.hword  65,  67,  66
.hword  66,  69,  65
.hword  67,  65,  58
.hword  68,  69,  73
.hword  69,  68,  63
.hword  66,  73,  69
.hword  68,  73, 120
.hword  70,  68, 120
.hword  71,  68,  70
.hword  72, 120,  73
.hword  73,  74,  72
.hword  74,  73,  66
.hword  75,  77,  78
.hword  52,  75,  78
.hword  76,  78,  77
.hword  77, 143,  76
.hword  76,  80,  78
.hword  60,  78,  80
.hword  78,  60,  52
.hword  46,  83,  79
.hword  58,  60,  81
.hword  60,  80,  81
.hword  79,  81,  80
.hword  80,  47,  79
.hword  47,  80,  76
.hword  81,  67,  58
.hword  67,  81,  83
.hword  79,  83,  81
.hword  66,  67,  84
.hword  67,  83,  84
.hword  82,  84,  83
.hword  83,  46,  82
.hword  84,  74,  66
.hword  82,  86,  84
.hword  74,  84,  86
.hword  74,  86, 136
.hword  72,  74, 136
.hword  85, 136,  86
.hword  86,  48,  85
.hword  48,  86,  82
.hword  25,  46,  79
.hword  79,  47,  25
.hword  82,  46,  31
.hword  19,  47,  76
.hword  76, 143,  19
.hword  31,  48,  82
.hword  37,  48, 146
.hword  85,  48,  37
.hword  10,  87,  11
.hword  87,  10, 147
.hword  92,  95, 149
.hword  88,  89,  90
.hword  89, 148,  91
.hword  90,  89,  91
.hword  91,  92,  90
.hword  92, 149,  90
.hword  93,  87,  94
.hword  87,  93,  11
.hword  94,  87,  95
.hword  87, 147,  95
.hword  95,  92,  94
.hword  96,  92,  91
.hword  92,  96,  94
.hword  39, 101,  97
.hword  97,  98,  37
.hword  98,  97, 101
.hword  99,  98, 103
.hword  99, 150,  98
.hword  37,  98, 150
.hword  98, 101, 103
.hword 100, 103, 101
.hword 101, 102, 100
.hword 102, 101,  39
.hword 100, 107, 103
.hword 103, 104,  99
.hword 104, 103, 107
.hword 105, 104, 109
.hword 105, 151, 104
.hword  99, 104, 151
.hword 104, 107, 109
.hword 106, 109, 107
.hword 107, 108, 106
.hword 108, 107, 100
.hword 109, 110, 105
.hword 106, 152, 109
.hword 110, 109, 152
.hword 105, 110, 153
.hword 111, 152, 106
.hword  11,  93,  45
.hword 102,  45,  93
.hword  45, 102,  39
.hword 102,  93, 112
.hword 100, 102, 112
.hword  94, 112,  93
.hword 112, 108, 100
.hword 108, 112,  96
.hword  94,  96, 112
.hword 106, 108, 113
.hword 108,  96, 113
.hword  91, 113,  96
.hword  91, 148, 113
.hword 113, 111, 106
.hword 111, 113, 148
.hword 114, 116,  99
.hword  99, 115, 114
.hword 115,  99, 151
.hword  99, 116, 150
.hword  72, 124, 120
.hword 116,  37, 150
.hword  37, 116,  85
.hword 117, 105, 153
.hword 105, 115, 151
.hword 105, 117, 118
.hword 118, 115, 105
.hword 119, 120, 124
.hword 120, 119,  70
.hword 119, 124, 127
.hword 119, 121,  70
.hword 121, 119, 122
.hword 122, 119, 127
.hword 123, 124,  72
.hword 124, 123, 125
.hword 125, 127, 124
.hword 126, 127, 131
.hword 127, 126, 122
.hword 125, 131, 127
.hword 126, 131, 134
.hword 128, 126, 129
.hword 129, 126, 134
.hword 126, 128, 122
.hword 136, 123,  72
.hword 130, 134, 131
.hword 131, 132, 130
.hword 132, 131, 125
.hword 133, 134, 155
.hword 134, 133, 129
.hword 130, 155, 134
.hword 133, 156, 129
.hword 135, 155, 130
.hword 123, 136, 137
.hword  85, 137, 136
.hword 139, 115, 118
.hword 123, 137, 138
.hword 125, 123, 138
.hword 114, 138, 137
.hword 137, 116, 114
.hword 116, 137,  85
.hword 114, 139, 138
.hword 132, 138, 139
.hword 138, 132, 125
.hword 132, 139, 140
.hword 130, 132, 140
.hword 115, 139, 114
.hword 118, 140, 139
.hword 135, 140, 154
.hword 118, 154, 140
.hword 140, 135, 130
.hword 117, 154, 118

.balign 4
hmc_seg7_painting_data_07024CD4: # 0x07024CD4
.word hmc_seg7_pool_points_070242F0
.word 0

.balign 8

hmc_seg7_texture_07024CE0: # 0x07024CE0 - 0x070254E0
.incbin "levels/hmc/7.rgba16"

hmc_seg7_painting_dl_070254E0: # 0x070254E0 - 0x07025518
gsDPPipeSync
gsSPLight hmc_seg7_light_070241D8, 1
gsSPLight hmc_seg7_light_070241D0, 2
gsSPVertex hmc_seg7_vertex_07024228, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel hmc_seg7_painting_textures_07025518 # 0x07025518 - 0x07025594
.word hmc_seg7_texture_07024CE0

glabel cotmc_painting # 0x0702551C (PaintingData)
/* id */ .hword 0x000E
/* Face Count */ .byte 0x01
/* Ripple Shape */ .byte RIPPLE_SHAPE_CONCENTRIC
/* Floor Status */ .byte 0x00, 0x00 , 0x00 /* which of the painting's nearby special floors Mario's on */
/* Ripple Status */ .byte 0x00
/* Rotation */ .float 270.0,  0.0
/* Position */ .float 2989.055908, -4485.120117, 5135.359863
/* Ripple Magnitude */ .float 0.0,  10.0,  30.0
.float 1.0,  1.0,  0.98
.float 0.0
.float 0.05,  0.05,  0.0,  15.0
.float 15.0,  0.0,  0.0,  0.0
.word hmc_seg7_painting_dl_070254E0
.word hmc_seg7_painting_data_07024CD4
.word hmc_seg7_painting_textures_07025518
.hword 32, 32
.word hmc_seg7_painting_dl_070242D0
.byte RIPPLE_TRIGGER_CONTINUOUS, 0xFF, 0x00, 0x00, 0x00
.byte 0x00, 0x00, 0x00
.float 723.968018
