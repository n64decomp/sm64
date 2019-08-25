.include "painting_constants.inc"

ttm_seg7_light_070122F0: # 0x070122F0 - 0x070122F8
.byte 0x50, 0x50, 0x50, 0x00, 0x50, 0x50, 0x50, 0x00

ttm_seg7_light_070122F8: # 0x070122F8 - 0x07012308
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x32, 0x32, 0x32, 0x00, 0x00, 0x00, 0x00, 0x00

ttm_seg7_vertex_07012308: # 0x07012308 - 0x07012388
vertex      0,      0,      0,    -32,    992,  0x00, 0x00, 0x7F, 0xFF
vertex    614,      0,      0,   2012,    992,  0x00, 0x00, 0x7F, 0xFF
vertex    614,    307,      0,   2012,      0,  0x00, 0x00, 0x7F, 0xFF
vertex      0,    307,      0,    -32,      0,  0x00, 0x00, 0x7F, 0xFF
vertex      0,    307,      0,    -32,    992,  0x00, 0x00, 0x7F, 0xFF
vertex    614,    307,      0,   2012,    992,  0x00, 0x00, 0x7F, 0xFF
vertex    614,    614,      0,   2012,    -28,  0x00, 0x00, 0x7F, 0xFF
vertex      0,    614,      0,    -32,    -28,  0x00, 0x00, 0x7F, 0xFF

glabel ttm_seg7_dl_07012388 # 0x07012388 - 0x070123A0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel ttm_seg7_dl_070123A0 # 0x070123A0 - 0x070123B8
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSPEndDisplayList

glabel ttm_seg7_dl_070123B8 # 0x070123B8 - 0x07012410
gsDPPipeSync
gsSPSetGeometryMode G_LIGHTING | G_SHADING_SMOOTH
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPLight ttm_seg7_light_070122F8, 1
gsSPLight ttm_seg7_light_070122F0, 2
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPTexture -1, -1, 0, 0, 1
gsSPEndDisplayList

glabel ttm_seg7_dl_07012410 # 0x07012410 - 0x07012430
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

ttm_seg7_painting_dl_07012430: # 0x07012430 - 0x07012450
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPEndDisplayList

ttm_seg7_painting_points_07012450: # 0x07012450 - 0x07012650
.hword 85
.hword   49, 2016,  889
.hword   53, 2016,  685
.hword   55, 1843,  787
.hword   50, 2016,  992
.hword   51, 1843,  992
.hword   52, 1843,  583
.hword   75, 2016,  513
.hword   54, 1671,  889
.hword   59, 1671,  685
.hword   62, 1502,  787
.hword   56, 1502,  992
.hword   57, 1671,  992
.hword   58, 1502,  583
.hword   60, 1671,  513
.hword   61, 1330,  889
.hword   65, 1330,  685
.hword   63, 1162,  992
.hword   64, 1330,  992
.hword   66, 1162,  583
.hword   67, 1330,  513
.hword   69, 1162,  787
.hword   68,  989,  889
.hword   70,  821,  992
.hword   71,  989,  992
.hword   73,  989,  685
.hword   72,  821,  583
.hword   74,  989,  513
.hword   77, 2016,  308
.hword   78, 1843,  410
.hword   76, 1843,  204
.hword   81, 1502,  410
.hword   80, 1671,  308
.hword   47, 1671,  102
.hword   79, 1502,  204
.hword   46, 1330,  102
.hword   82, 1162,  204
.hword   83, 1330,  308
.hword   84, 1162,  410
.hword   86,  989,  308
.hword   85,  821,  204
.hword   48,  989,  102
.hword   25, 1502,    0
.hword   31, 1162,    0
.hword   19, 1843,    0
.hword   37,  821,    0
.hword  120,  821,  787
.hword  119,  649,  889
.hword  122,  481,  992
.hword  121,  649,  992
.hword  124,  649,  685
.hword  125,  481,  583
.hword  123,  649,  513
.hword  127,  481,  787
.hword  126,  308,  889
.hword  129,  140,  992
.hword  128,  308,  992
.hword  132,  308,  513
.hword  131,  308,  685
.hword  130,  140,  583
.hword  134,  140,  787
.hword  133,  -32,  889
.hword  135,  -32,  513
.hword  136,  821,  410
.hword  116,  649,  102
.hword  137,  649,  308
.hword  114,  481,  204
.hword  138,  481,  410
.hword  139,  308,  308
.hword  118,  140,  204
.hword  115,  308,  102
.hword  140,  140,  410
.hword  117,  -32,  102
.hword   99,  481,    0
.hword  105,  140,    0
.hword  143, 2016,  102
.hword  145, 1330,    0
.hword  144, 1671,    0
.hword  142, 2016,    0
.hword  146,  989,    0
.hword  155,  -32,  685
.hword  156,  -32,  992
.hword  154,  -32,  308
.hword  151,  308,    0
.hword  150,  649,    0
.hword  153,  -32,    0

ttm_seg7_painting_triangles_07012650: # 0x07012650 - 0x0701296A
.hword 132
.hword 13,  8,  5
.hword  0,  1,  2
.hword  3,  0,  4
.hword  4,  0,  2
.hword  5,  2,  1
.hword  1,  6,  5
.hword  7,  2,  8
.hword  5,  8,  2
.hword  2,  7,  4
.hword  7,  8,  9
.hword 10,  7,  9
.hword 11,  7, 10
.hword  7, 11,  4
.hword 12,  9,  8
.hword  8, 13, 12
.hword 21, 24, 45
.hword 14,  9, 15
.hword 12, 15,  9
.hword  9, 14, 10
.hword 16, 14, 20
.hword 17, 14, 16
.hword 14, 15, 20
.hword 14, 17, 10
.hword 15, 19, 18
.hword 18, 20, 15
.hword 19, 15, 12
.hword 20, 21, 16
.hword 18, 24, 20
.hword 21, 20, 24
.hword 22, 21, 45
.hword 23, 21, 22
.hword 21, 23, 16
.hword 24, 26, 25
.hword 25, 45, 24
.hword 26, 24, 18
.hword  6, 27, 28
.hword  5,  6, 28
.hword 29, 28, 27
.hword 27, 74, 29
.hword 29, 31, 28
.hword 13, 28, 31
.hword 28, 13,  5
.hword 36, 34, 35
.hword 12, 13, 30
.hword 13, 31, 30
.hword 31, 32, 33
.hword 32, 31, 29
.hword 33, 30, 31
.hword 33, 36, 30
.hword 30, 19, 12
.hword 19, 30, 36
.hword 18, 19, 37
.hword 19, 36, 37
.hword 34, 36, 33
.hword 35, 37, 36
.hword 37, 26, 18
.hword 35, 38, 37
.hword 26, 37, 38
.hword 25, 26, 62
.hword 26, 38, 62
.hword 38, 40, 39
.hword 39, 62, 38
.hword 40, 38, 35
.hword 41, 34, 33
.hword 33, 32, 41
.hword 42, 34, 75
.hword 34, 41, 75
.hword 35, 34, 42
.hword 32, 43, 76
.hword 41, 32, 76
.hword 43, 32, 29
.hword 29, 74, 43
.hword 43, 74, 77
.hword 46, 49, 52
.hword 42, 40, 35
.hword 39, 40, 44
.hword 40, 42, 78
.hword 44, 40, 78
.hword 25, 49, 45
.hword 45, 46, 22
.hword 46, 45, 49
.hword 47, 46, 52
.hword 48, 46, 47
.hword 46, 48, 22
.hword 58, 59, 57
.hword 49, 51, 50
.hword 50, 52, 49
.hword 51, 49, 25
.hword 50, 57, 52
.hword 52, 53, 47
.hword 53, 52, 57
.hword 53, 55, 47
.hword 54, 53, 59
.hword 55, 53, 54
.hword 53, 57, 59
.hword 56, 57, 50
.hword 57, 56, 58
.hword 58, 79, 59
.hword 59, 60, 54
.hword 60, 59, 79
.hword 60, 80, 54
.hword 61, 79, 58
.hword 62, 51, 25
.hword 39, 64, 62
.hword 51, 62, 64
.hword 50, 51, 66
.hword 51, 64, 66
.hword 63, 64, 39
.hword 64, 63, 65
.hword 65, 66, 64
.hword 66, 56, 50
.hword 56, 66, 67
.hword 65, 67, 66
.hword 58, 56, 70
.hword 56, 67, 70
.hword 67, 69, 68
.hword 68, 70, 67
.hword 69, 67, 65
.hword 70, 61, 58
.hword 68, 81, 70
.hword 61, 70, 81
.hword 71, 73, 84
.hword 71, 81, 68
.hword 72, 69, 65
.hword 65, 63, 72
.hword 68, 69, 73
.hword 69, 72, 82
.hword 73, 69, 82
.hword 44, 63, 39
.hword 63, 44, 83
.hword 72, 63, 83
.hword 73, 71, 68

.balign 4

ttm_seg7_painting_points_0701296C: # 0x0701296C - 0x07012B6C
.hword 85
.hword    0, 2016,   72
.hword    1, 2016,    0
.hword    2, 1843,    0
.hword    3, 1843,  174
.hword    4, 2016,  276
.hword    5, 1671,   72
.hword    6, 1671,    0
.hword    8,  989,   72
.hword    7,  989,    0
.hword   10,  821,    0
.hword    9, 1162,    0
.hword   11,  821,  174
.hword   12,  989,  276
.hword   13, 1162,  174
.hword   14, 1330,   72
.hword   15, 1502,    0
.hword   16, 1671,  276
.hword   17, 1502,  174
.hword   18, 1330,  276
.hword   19, 1843,  992
.hword   20, 2016,  889
.hword   22, 2016,  685
.hword   21, 1843,  583
.hword   23, 1843,  787
.hword   24, 1671,  889
.hword   25, 1502,  992
.hword   26, 1502,  583
.hword   27, 1671,  685
.hword   28, 1671,  481
.hword   30, 1502,  787
.hword   29, 1330,  889
.hword   31, 1162,  992
.hword   32, 1330,  481
.hword   33, 1162,  583
.hword   34, 1330,  685
.hword   35, 1162,  787
.hword   36,  989,  889
.hword   37,  821,  992
.hword   39,  821,  583
.hword   38,  989,  685
.hword   40,  989,  481
.hword   41, 2016,  481
.hword   42, 1843,  378
.hword   43, 1502,  378
.hword   44, 1162,  378
.hword   45,  821,  378
.hword   87,  649,   72
.hword   88,  -32,    0
.hword   90,  140,    0
.hword   89,  -32,   72
.hword   92,  308,   72
.hword   91,  140,  174
.hword   94,  481,  174
.hword   93,  649,  276
.hword   95,  481,    0
.hword   96,  308,  276
.hword   97,  821,  787
.hword   98,  649,  889
.hword   99,  481,  992
.hword  102,  649,  481
.hword  101,  649,  685
.hword  100,  481,  583
.hword  103,  481,  787
.hword  104,  308,  889
.hword  105,  140,  992
.hword  108,  308,  481
.hword  107,  308,  685
.hword  106,  140,  583
.hword  110,  -32,  889
.hword  109,  140,  787
.hword  111,  -32,  481
.hword  112,  481,  378
.hword  113,  140,  378
.hword  141, 1330,    0
.hword  142, 2016,  992
.hword  144, 1671,  992
.hword  145, 1330,  992
.hword  146,  989,  992
.hword  147,  649,    0
.hword  148,  -32,  276
.hword  149,  308,    0
.hword  150,  649,  992
.hword  151,  308,  992
.hword  152,  -32,  685
.hword  153,  -32,  992

.balign 4

ttm_seg7_painting_triangles_07012B6C: # 0x07012B6C - 0x07012E84
.hword 132
.hword 10,  7, 13
.hword  0,  1,  2
.hword  3,  0,  2
.hword  4,  0,  3
.hword  5,  2,  6
.hword  2,  5,  3
.hword  7,  8,  9
.hword  8,  7, 10
.hword 11,  7,  9
.hword 12,  7, 11
.hword  7, 12, 13
.hword 13, 14, 10
.hword 14, 73, 10
.hword  5,  6, 15
.hword  5, 16,  3
.hword 16,  5, 17
.hword 17,  5, 15
.hword 14, 15, 73
.hword 15, 14, 17
.hword 18, 14, 13
.hword 14, 18, 17
.hword 19, 74, 20
.hword 19, 20, 23
.hword 28, 27, 22
.hword 21, 41, 22
.hword 22, 23, 21
.hword 20, 21, 23
.hword 23, 24, 19
.hword 22, 27, 23
.hword 24, 23, 27
.hword 19, 24, 75
.hword 25, 75, 24
.hword 25, 24, 29
.hword 24, 27, 29
.hword 26, 29, 27
.hword 27, 28, 26
.hword 31, 36, 77
.hword 26, 34, 29
.hword 29, 30, 25
.hword 30, 29, 34
.hword 25, 30, 76
.hword 31, 76, 30
.hword 31, 30, 35
.hword 30, 34, 35
.hword 32, 34, 26
.hword 33, 35, 34
.hword 34, 32, 33
.hword 35, 36, 31
.hword 33, 39, 35
.hword 36, 35, 39
.hword 37, 36, 56
.hword 36, 39, 56
.hword 37, 77, 36
.hword 28, 16, 43
.hword 38, 56, 39
.hword 39, 40, 38
.hword 40, 39, 33
.hword 22, 41, 42
.hword 41,  4, 42
.hword  3, 42,  4
.hword 42, 28, 22
.hword 28, 42, 16
.hword  3, 16, 42
.hword 26, 28, 43
.hword 17, 43, 16
.hword 43, 32, 26
.hword 32, 43, 18
.hword 17, 18, 43
.hword 33, 32, 44
.hword 32, 18, 44
.hword 13, 44, 18
.hword 13, 12, 44
.hword 44, 40, 33
.hword 40, 44, 12
.hword 38, 40, 45
.hword 40, 12, 45
.hword 11, 45, 12
.hword  9, 46, 11
.hword 46,  9, 78
.hword 47, 49, 48
.hword 48, 49, 51
.hword 49, 79, 51
.hword 50, 80, 48
.hword 51, 50, 48
.hword 57, 56, 60
.hword 46, 53, 11
.hword 52, 46, 54
.hword 53, 46, 52
.hword 46, 78, 54
.hword 54, 50, 52
.hword 50, 54, 80
.hword 50, 55, 52
.hword 55, 50, 51
.hword 38, 60, 56
.hword 56, 57, 37
.hword 58, 57, 62
.hword 57, 60, 62
.hword 58, 81, 57
.hword 37, 57, 81
.hword 59, 60, 38
.hword 60, 59, 61
.hword 61, 62, 60
.hword 62, 63, 58
.hword 63, 62, 66
.hword 61, 66, 62
.hword 63, 66, 69
.hword 58, 63, 82
.hword 64, 82, 63
.hword 64, 63, 69
.hword 45, 59, 38
.hword 65, 66, 61
.hword 66, 65, 67
.hword 67, 69, 66
.hword 68, 69, 83
.hword 69, 68, 64
.hword 67, 83, 69
.hword 64, 68, 84
.hword 70, 83, 67
.hword 11, 53, 45
.hword 59, 45, 53
.hword 59, 53, 71
.hword 61, 59, 71
.hword 52, 71, 53
.hword 52, 55, 71
.hword 65, 71, 55
.hword 71, 65, 61
.hword 65, 55, 72
.hword 67, 65, 72
.hword 51, 72, 55
.hword 70, 72, 79
.hword 51, 79, 72
.hword 72, 70, 67

.balign 4

ttm_seg7_painting_data_07012E88: # 0x07012E88
.word ttm_seg7_painting_points_07012450
.word ttm_seg7_painting_points_0701296C
.word 0x0

.balign 8

ttm_seg7_painting_dl_07012E98: # 0x07012E98 - 0x07012EF8
gsSPDisplayList ttm_seg7_dl_070123B8
gsSPVertex ttm_seg7_vertex_07012308, 8, 0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, ttm_seg7_texture_07004000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList ttm_seg7_dl_07012388
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, ttm_seg7_texture_07003000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList ttm_seg7_dl_070123A0
gsSPDisplayList ttm_seg7_dl_07012410
gsSPEndDisplayList

ttm_seg7_painting_textures_07012EF8: # 0x07012EF8 - 0x07012F78
.word ttm_seg7_texture_07004000, ttm_seg7_texture_07003000

glabel ttm_slide_painting # 0x07012F00 (PaintingData)
/* id */ .hword 0x0000
/* Face Count */ .byte 0x02
/* Ripple Shape */ .byte RIPPLE_SHAPE_WAVE
/* Floor Status */ .byte 0x00, 0x00, 0x00 /* which of the painting's nearby special floors Mario's on */
/* Ripple Status */ .byte 0x00
/* Rotation */ .float    0.0,   90.0
/* Position */ .float 3072.0, 921.6, -819.2
/* Ripple Magnitude */ .float    0.0,   20.0,  80.0
.float    1.0, 0.9608, 0.9524
.float    0.0
.float   0.24,   0.14,    0.0,  40.0
.float   30.0,    0.0,    0.0,   0.0
.word ttm_seg7_painting_dl_07012E98
.word ttm_seg7_painting_data_07012E88
.word ttm_seg7_painting_textures_07012EF8
.hword 64, 32
.word ttm_seg7_painting_dl_07012430
.byte RIPPLE_TRIGGER_PROXIMITY, 0xFF, 0x00, 0x00, 0x00
.byte 0x00, 0x00, 0x00
.float 460.8
