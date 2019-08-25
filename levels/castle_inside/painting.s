.include "painting_constants.inc"

inside_castle_seg7_light_07021800: # 0x07021800 - 0x07021808
.byte 0x50, 0x50, 0x50, 0x00, 0x50, 0x50, 0x50, 0x00

inside_castle_seg7_light_07021808: # 0x07021808 - 0x07021818
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x32, 0x32, 0x32, 0x00, 0x00, 0x00, 0x00, 0x00

inside_castle_seg7_vertex_07021818: # 0x07021818 - 0x07021898
vertex      0,      0,      0,    -32,    992,  0x00, 0x00, 0x7F, 0xFF
vertex    614,      0,      0,   2012,    992,  0x00, 0x00, 0x7F, 0xFF
vertex    614,    307,      0,   2012,      0,  0x00, 0x00, 0x7F, 0xFF
vertex      0,    307,      0,    -32,      0,  0x00, 0x00, 0x7F, 0xFF
vertex      0,    307,      0,    -32,    992,  0x00, 0x00, 0x7F, 0xFF
vertex    614,    307,      0,   2012,    992,  0x00, 0x00, 0x7F, 0xFF
vertex    614,    614,      0,   2012,    -28,  0x00, 0x00, 0x7F, 0xFF
vertex      0,    614,      0,    -32,    -28,  0x00, 0x00, 0x7F, 0xFF

inside_castle_seg7_vertex_07021898: # 0x07021898 - 0x07021918
vertex      0,      0,      0,    -32,    992,  0xDD, 0xDD, 0xDD, 0xFF
vertex    614,      0,      0,   2012,    992,  0xDD, 0xDD, 0xDD, 0xFF
vertex    614,    307,      0,   2012,      0,  0xDD, 0xDD, 0xDD, 0xFF
vertex      0,    307,      0,    -32,      0,  0xDD, 0xDD, 0xDD, 0xFF
vertex      0,    307,      0,    -32,    992,  0xDD, 0xDD, 0xDD, 0xFF
vertex    614,    307,      0,   2012,    992,  0xDD, 0xDD, 0xDD, 0xFF
vertex    614,    614,      0,   2012,    -28,  0xDD, 0xDD, 0xDD, 0xFF
vertex      0,    614,      0,    -32,    -28,  0xDD, 0xDD, 0xDD, 0xFF

inside_castle_seg7_vertex_07021918: # 0x07021918 - 0x07021998
vertex  -3046,   -307,  -3724,    -32,    992,  0x00, 0x00, 0x7F, 0xFF
vertex  -2742,   -307,  -4258,   2012,    992,  0x00, 0x00, 0x7F, 0xFF
vertex  -2742,      0,  -4258,   2012,      0,  0x00, 0x00, 0x7F, 0xFF
vertex  -3046,      0,  -3724,    -32,      0,  0x00, 0x00, 0x7F, 0xFF
vertex  -3046,      0,  -3724,    -32,    992,  0x00, 0x00, 0x7F, 0xFF
vertex  -2742,      0,  -4258,   2012,    992,  0x00, 0x00, 0x7F, 0xFF
vertex  -2742,    307,  -4258,   2012,      0,  0x00, 0x00, 0x7F, 0xFF
vertex  -3046,    307,  -3724,    -32,      0,  0x00, 0x00, 0x7F, 0xFF

inside_castle_seg7_vertex_07021998: # 0x07021998 - 0x07021A18
vertex  -1866,   -307,  -4258,    -32,    992,  0x00, 0x00, 0x7F, 0xFF
vertex  -1562,   -307,  -3724,   2012,    992,  0x00, 0x00, 0x7F, 0xFF
vertex  -1562,      0,  -3724,   2012,      0,  0x00, 0x00, 0x7F, 0xFF
vertex  -1866,      0,  -4258,    -32,      0,  0x00, 0x00, 0x7F, 0xFF
vertex  -1866,      0,  -4258,    -32,    992,  0x00, 0x00, 0x7F, 0xFF
vertex  -1562,      0,  -3724,   2012,    992,  0x00, 0x00, 0x7F, 0xFF
vertex  -1562,    307,  -3724,   2012,      0,  0x00, 0x00, 0x7F, 0xFF
vertex  -1866,    307,  -4258,    -32,      0,  0x00, 0x00, 0x7F, 0xFF

inside_castle_seg7_dl_07021A18: # 0x07021A18 - 0x07021A30
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

inside_castle_seg7_dl_07021A30: # 0x07021A30 - 0x07021A48
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSPEndDisplayList

inside_castle_seg7_dl_07021A48: # 0x07021A48 - 0x07021AA0
gsDPPipeSync
gsSPSetGeometryMode G_LIGHTING | G_SHADING_SMOOTH
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPLight inside_castle_seg7_light_07021808, 1
gsSPLight inside_castle_seg7_light_07021800, 2
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPTexture -1, -1, 0, 0, 1
gsSPEndDisplayList

inside_castle_seg7_dl_07021AA0: # 0x07021AA0 - 0x07021AC0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

inside_castle_seg7_painting_dl_07021AC0: # 0x07021AC0 - 0x07021AE0
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPEndDisplayList

inside_castle_seg7_painting_points_07021AE0: # 0x07021AE0 - 0x07021CE0
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

inside_castle_seg7_painting_triangles_07021CE0: # 0x07021CE0 - 0x07021FFA
.hword 132
.hword   13,    8,    5
.hword    0,    1,    2
.hword    3,    0,    4
.hword    4,    0,    2
.hword    5,    2,    1
.hword    1,    6,    5
.hword    7,    2,    8
.hword    5,    8,    2
.hword    2,    7,    4
.hword    7,    8,    9
.hword   10,    7,    9
.hword   11,    7,   10
.hword    7,   11,    4
.hword   12,    9,    8
.hword    8,   13,   12
.hword   21,   24,   45
.hword   14,    9,   15
.hword   12,   15,    9
.hword    9,   14,   10
.hword   16,   14,   20
.hword   17,   14,   16
.hword   14,   15,   20
.hword   14,   17,   10
.hword   15,   19,   18
.hword   18,   20,   15
.hword   19,   15,   12
.hword   20,   21,   16
.hword   18,   24,   20
.hword   21,   20,   24
.hword   22,   21,   45
.hword   23,   21,   22
.hword   21,   23,   16
.hword   24,   26,   25
.hword   25,   45,   24
.hword   26,   24,   18
.hword    6,   27,   28
.hword    5,    6,   28
.hword   29,   28,   27
.hword   27,   74,   29
.hword   29,   31,   28
.hword   13,   28,   31
.hword   28,   13,    5
.hword   36,   34,   35
.hword   12,   13,   30
.hword   13,   31,   30
.hword   31,   32,   33
.hword   32,   31,   29
.hword   33,   30,   31
.hword   33,   36,   30
.hword   30,   19,   12
.hword   19,   30,   36
.hword   18,   19,   37
.hword   19,   36,   37
.hword   34,   36,   33
.hword   35,   37,   36
.hword   37,   26,   18
.hword   35,   38,   37
.hword   26,   37,   38
.hword   25,   26,   62
.hword   26,   38,   62
.hword   38,   40,   39
.hword   39,   62,   38
.hword   40,   38,   35
.hword   41,   34,   33
.hword   33,   32,   41
.hword   42,   34,   75
.hword   34,   41,   75
.hword   35,   34,   42
.hword   32,   43,   76
.hword   41,   32,   76
.hword   43,   32,   29
.hword   29,   74,   43
.hword   43,   74,   77
.hword   46,   49,   52
.hword   42,   40,   35
.hword   39,   40,   44
.hword   40,   42,   78
.hword   44,   40,   78
.hword   25,   49,   45
.hword   45,   46,   22
.hword   46,   45,   49
.hword   47,   46,   52
.hword   48,   46,   47
.hword   46,   48,   22
.hword   58,   59,   57
.hword   49,   51,   50
.hword   50,   52,   49
.hword   51,   49,   25
.hword   50,   57,   52
.hword   52,   53,   47
.hword   53,   52,   57
.hword   53,   55,   47
.hword   54,   53,   59
.hword   55,   53,   54
.hword   53,   57,   59
.hword   56,   57,   50
.hword   57,   56,   58
.hword   58,   79,   59
.hword   59,   60,   54
.hword   60,   59,   79
.hword   60,   80,   54
.hword   61,   79,   58
.hword   62,   51,   25
.hword   39,   64,   62
.hword   51,   62,   64
.hword   50,   51,   66
.hword   51,   64,   66
.hword   63,   64,   39
.hword   64,   63,   65
.hword   65,   66,   64
.hword   66,   56,   50
.hword   56,   66,   67
.hword   65,   67,   66
.hword   58,   56,   70
.hword   56,   67,   70
.hword   67,   69,   68
.hword   68,   70,   67
.hword   69,   67,   65
.hword   70,   61,   58
.hword   68,   81,   70
.hword   61,   70,   81
.hword   71,   73,   84
.hword   71,   81,   68
.hword   72,   69,   65
.hword   65,   63,   72
.hword   68,   69,   73
.hword   69,   72,   82
.hword   73,   69,   82
.hword   44,   63,   39
.hword   63,   44,   83
.hword   72,   63,   83
.hword   73,   71,   68

.balign 4 # 0x07021FFA - 0x07021FFC

inside_castle_seg7_painting_points_07021FFC: # 0x07021FFC - 0x070221FC
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

inside_castle_seg7_painting_triangles_070221FC: # 0x070221FC - 0x07022516
.hword 132
.hword   10,    7,   13
.hword    0,    1,    2
.hword    3,    0,    2
.hword    4,    0,    3
.hword    5,    2,    6
.hword    2,    5,    3
.hword    7,    8,    9
.hword    8,    7,   10
.hword   11,    7,    9
.hword   12,    7,   11
.hword    7,   12,   13
.hword   13,   14,   10
.hword   14,   73,   10
.hword    5,    6,   15
.hword    5,   16,    3
.hword   16,    5,   17
.hword   17,    5,   15
.hword   14,   15,   73
.hword   15,   14,   17
.hword   18,   14,   13
.hword   14,   18,   17
.hword   19,   74,   20
.hword   19,   20,   23
.hword   28,   27,   22
.hword   21,   41,   22
.hword   22,   23,   21
.hword   20,   21,   23
.hword   23,   24,   19
.hword   22,   27,   23
.hword   24,   23,   27
.hword   19,   24,   75
.hword   25,   75,   24
.hword   25,   24,   29
.hword   24,   27,   29
.hword   26,   29,   27
.hword   27,   28,   26
.hword   31,   36,   77
.hword   26,   34,   29
.hword   29,   30,   25
.hword   30,   29,   34
.hword   25,   30,   76
.hword   31,   76,   30
.hword   31,   30,   35
.hword   30,   34,   35
.hword   32,   34,   26
.hword   33,   35,   34
.hword   34,   32,   33
.hword   35,   36,   31
.hword   33,   39,   35
.hword   36,   35,   39
.hword   37,   36,   56
.hword   36,   39,   56
.hword   37,   77,   36
.hword   28,   16,   43
.hword   38,   56,   39
.hword   39,   40,   38
.hword   40,   39,   33
.hword   22,   41,   42
.hword   41,    4,   42
.hword    3,   42,    4
.hword   42,   28,   22
.hword   28,   42,   16
.hword    3,   16,   42
.hword   26,   28,   43
.hword   17,   43,   16
.hword   43,   32,   26
.hword   32,   43,   18
.hword   17,   18,   43
.hword   33,   32,   44
.hword   32,   18,   44
.hword   13,   44,   18
.hword   13,   12,   44
.hword   44,   40,   33
.hword   40,   44,   12
.hword   38,   40,   45
.hword   40,   12,   45
.hword   11,   45,   12
.hword    9,   46,   11
.hword   46,    9,   78
.hword   47,   49,   48
.hword   48,   49,   51
.hword   49,   79,   51
.hword   50,   80,   48
.hword   51,   50,   48
.hword   57,   56,   60
.hword   46,   53,   11
.hword   52,   46,   54
.hword   53,   46,   52
.hword   46,   78,   54
.hword   54,   50,   52
.hword   50,   54,   80
.hword   50,   55,   52
.hword   55,   50,   51
.hword   38,   60,   56
.hword   56,   57,   37
.hword   58,   57,   62
.hword   57,   60,   62
.hword   58,   81,   57
.hword   37,   57,   81
.hword   59,   60,   38
.hword   60,   59,   61
.hword   61,   62,   60
.hword   62,   63,   58
.hword   63,   62,   66
.hword   61,   66,   62
.hword   63,   66,   69
.hword   58,   63,   82
.hword   64,   82,   63
.hword   64,   63,   69
.hword   45,   59,   38
.hword   65,   66,   61
.hword   66,   65,   67
.hword   67,   69,   66
.hword   68,   69,   83
.hword   69,   68,   64
.hword   67,   83,   69
.hword   64,   68,   84
.hword   70,   83,   67
.hword   11,   53,   45
.hword   59,   45,   53
.hword   59,   53,   71
.hword   61,   59,   71
.hword   52,   71,   53
.hword   52,   55,   71
.hword   65,   71,   55
.hword   71,   65,   61
.hword   65,   55,   72
.hword   67,   65,   72
.hword   51,   72,   55
.hword   70,   72,   79
.hword   51,   79,   72
.hword   72,   70,   67

.balign 4 # 0x07022516 - 0x07022518

inside_castle_seg7_painting_data_07022518: # 0x07022518
.word inside_castle_seg7_painting_points_07021AE0
.word inside_castle_seg7_painting_points_07021FFC
.word 0x0

.balign 8

inside_castle_seg7_light_07022528: # 0x07022528 - 0x07022530
.byte 0x50, 0x50, 0x50, 0x00, 0x50, 0x50, 0x50, 0x00

inside_castle_seg7_light_07022530: # 0x07022530 - 0x07022540
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x32, 0x32, 0x32, 0x00, 0x00, 0x00, 0x00, 0x00

inside_castle_seg7_light_07022540: # 0x07022540 - 0x07022548
.byte 0x40, 0x40, 0x80, 0x00, 0x40, 0x40, 0x80, 0x00

inside_castle_seg7_light_07022548: # 0x07022548 - 0x07022558
.byte 0x64, 0x64, 0xFF, 0x00, 0x64, 0x64, 0xFA, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

inside_castle_seg7_vertex_07022558: # 0x07022558 - 0x07022598
vertex      0,      0,      0,    -32,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    614,      0,      0,   6100,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    614,    614,      0,   6100,  -5142,  0x00, 0x00, 0x7F, 0xFF
vertex      0,    614,      0,    -32,  -5142,  0x00, 0x00, 0x7F, 0xFF

inside_castle_seg7_vertex_07022598: # 0x07022598 - 0x070225D8
vertex      0,      0,      0,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    614,      0,      0,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    614,    614,      0,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex      0,    614,      0,      0,      0,  0x00, 0x00, 0x7F, 0xFF

# TODO: this is unused
glabel inside_castle_seg7_dl_070225D8 # 0x070225D8 - 0x07022610
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPLight inside_castle_seg7_light_07022530, 1
gsSPLight inside_castle_seg7_light_07022528, 2
gsSPTexture -1, -1, 0, 0, 1
gsSPVertex inside_castle_seg7_vertex_07022558, 4, 0
gsSPEndDisplayList

# TODO: this is unused
glabel inside_castle_seg7_dl_07022610 # 0x07022610 - 0x07022640
gsSP1Triangle  0,  1,  2, 0x0
gsSP1Triangle  0,  2,  3, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

inside_castle_seg7_painting_dl_07022640: # 0x07022640 - 0x07022660
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPEndDisplayList

inside_castle_seg7_painting_points_07022660: # 0x07022660 - 0x07022A10
.hword 157
.hword    0, 6100, -4832
.hword    1, 6100, -5142
.hword    2, 5582, -5142
.hword    3, 5582, -4526
.hword    4, 6100, -4218
.hword    5, 5070, -4832
.hword    6, 5070, -5142
.hword    7, 3030, -5142
.hword    8, 3030, -4832
.hword    9, 3540, -5142
.hword   10, 2520, -5142
.hword   11, 2520, -4526
.hword   12, 3030, -4218
.hword   13, 3540, -4526
.hword   14, 4050, -4832
.hword   15, 4560, -5142
.hword   16, 5070, -4218
.hword   17, 4560, -4526
.hword   18, 4050, -4218
.hword   19, 5582, -2074
.hword   20, 6100, -2380
.hword   21, 5582, -3300
.hword   22, 6100, -2994
.hword   23, 5582, -2686
.hword   24, 5070, -2380
.hword   25, 4560, -2074
.hword   26, 4560, -3300
.hword   27, 5070, -2994
.hword   28, 5070, -3606
.hword   29, 4050, -2380
.hword   30, 4560, -2686
.hword   31, 3540, -2074
.hword   32, 4050, -3606
.hword   33, 3540, -3300
.hword   34, 4050, -2994
.hword   35, 3540, -2686
.hword   36, 3030, -2380
.hword   37, 2520, -2074
.hword   38, 3030, -2994
.hword   39, 2520, -3300
.hword   40, 3030, -3606
.hword   41, 6100, -3606
.hword   42, 5582, -3912
.hword   43, 4560, -3912
.hword   44, 3540, -3912
.hword   45, 2520, -3912
.hword   46, 4050, -1768
.hword   47, 5070, -1768
.hword   48, 3030, -1768
.hword   49, 6100,  684
.hword   50, 6100,  990
.hword   51, 5582,  990
.hword   52, 5582, -236
.hword   53, 6100,   70
.hword   54, 5070,  684
.hword   55, 5582,  378
.hword   56, 4560,  990
.hword   57, 5070,  990
.hword   58, 4560, -236
.hword   59, 5070,   70
.hword   60, 5070, -542
.hword   61, 4050,  684
.hword   62, 4560,  378
.hword   63, 3540,  990
.hword   64, 4050,  990
.hword   65, 4050,   70
.hword   66, 3540, -236
.hword   67, 4050, -542
.hword   68, 3030,  684
.hword   69, 3540,  378
.hword   70, 2520,  990
.hword   71, 3030,  990
.hword   72, 2520, -236
.hword   73, 3030,   70
.hword   74, 3030, -542
.hword   75, 6100, -542
.hword   76, 5582, -1462
.hword   77, 6100, -1154
.hword   78, 5582, -848
.hword   79, 4560, -1462
.hword   80, 5070, -1154
.hword   81, 4560, -848
.hword   82, 3540, -1462
.hword   83, 4050, -1154
.hword   84, 3540, -848
.hword   85, 2520, -1462
.hword   86, 3030, -1154
.hword   87, 2010, -4832
.hword   88,    0, -5142
.hword   89,    0, -4832
.hword   90,  478, -5142
.hword   91,  478, -4526
.hword   92,  988, -4832
.hword   93, 2010, -4218
.hword   94, 1498, -4526
.hword   95, 1498, -5142
.hword   96,  988, -4218
.hword   97, 2520, -2686
.hword   98, 2010, -2380
.hword   99, 1498, -2074
.hword  100, 1498, -3300
.hword  101, 2010, -2994
.hword  102, 2010, -3606
.hword  103, 1498, -2686
.hword  104,  988, -2380
.hword  105,  478, -2074
.hword  106,  478, -3300
.hword  107,  988, -2994
.hword  108,  988, -3606
.hword  109,  478, -2686
.hword  110,    0, -2380
.hword  111,    0, -3606
.hword  112, 1498, -3912
.hword  113,  478, -3912
.hword  114, 1498, -1462
.hword  115,  988, -1768
.hword  116, 2010, -1768
.hword  117,    0, -1768
.hword  118,  478, -1462
.hword  119, 2010,  684
.hword  120, 2520,  378
.hword  121, 2010,  990
.hword  122, 1498,  990
.hword  123, 2010, -542
.hword  124, 2010,   70
.hword  125, 1498, -236
.hword  126,  988,  684
.hword  127, 1498,  378
.hword  128,  988,  990
.hword  129,  478,  990
.hword  130,  478, -236
.hword  131,  988,   70
.hword  132,  988, -542
.hword  133,    0,  684
.hword  134,  478,  378
.hword  135,    0, -542
.hword  136, 2520, -848
.hword  137, 2010, -1154
.hword  138, 1498, -848
.hword  139,  988, -1154
.hword  140,  478, -848
.hword  141, 4050, -5142
.hword  142, 6100, -2074
.hword  143, 6100, -1768
.hword  144, 5070, -2074
.hword  145, 4050, -2074
.hword  146, 3030, -2074
.hword  147, 2010, -5142
.hword  148,    0, -4218
.hword  149,  988, -5142
.hword  150, 2010, -2074
.hword  151,  988, -2074
.hword  152,    0, -2994
.hword  153,    0, -2074
.hword  154,    0, -1154
.hword  155,    0,   70
.hword  156,    0,  990

inside_castle_seg7_painting_triangles_07022A10: # 0x07022A10 - 0x07023042
.hword 264
.hword    8,   12,   13
.hword    0,    1,    2
.hword    3,    0,    2
.hword    4,    0,    3
.hword    5,    2,    6
.hword    2,    5,    3
.hword    7,    8,    9
.hword    8,    7,   10
.hword   11,    8,   10
.hword   12,    8,   11
.hword    9,    8,   13
.hword   13,   14,    9
.hword   14,  141,    9
.hword    5,    6,   15
.hword    5,   16,    3
.hword   16,    5,   17
.hword   17,    5,   15
.hword   14,   15,  141
.hword   15,   14,   17
.hword   18,   14,   13
.hword   14,   18,   17
.hword   19,  142,   20
.hword   19,   20,   23
.hword   28,   27,   21
.hword   21,   23,   22
.hword   22,   41,   21
.hword   20,   22,   23
.hword   23,   24,   19
.hword   21,   27,   23
.hword   24,   23,   27
.hword   25,  144,   24
.hword   19,   24,  144
.hword   24,   27,   30
.hword   25,   24,   30
.hword   26,   30,   27
.hword   27,   28,   26
.hword   36,   38,   97
.hword   26,   34,   30
.hword   29,   30,   34
.hword   30,   29,   25
.hword   25,   29,  145
.hword   31,  145,   29
.hword   31,   29,   35
.hword   29,   34,   35
.hword   32,   34,   26
.hword   33,   35,   34
.hword   34,   32,   33
.hword   33,   38,   35
.hword   35,   36,   31
.hword   36,   35,   38
.hword   37,   36,   97
.hword   37,  146,   36
.hword   31,   36,  146
.hword   28,   16,   43
.hword   38,   40,   39
.hword   39,   97,   38
.hword   40,   38,   33
.hword   21,   41,   42
.hword   41,    4,   42
.hword    3,   42,    4
.hword   42,   28,   21
.hword   28,   42,   16
.hword    3,   16,   42
.hword   26,   28,   43
.hword   17,   43,   16
.hword   43,   32,   26
.hword   32,   43,   18
.hword   17,   18,   43
.hword   33,   32,   44
.hword   32,   18,   44
.hword   13,   44,   18
.hword   44,   40,   33
.hword   13,   12,   44
.hword   40,   44,   12
.hword   39,   40,   45
.hword   40,   12,   45
.hword   48,   31,  146
.hword   11,   45,   12
.hword   25,   47,  144
.hword   46,   25,  145
.hword   47,   19,  144
.hword   19,  143,  142
.hword   31,   46,  145
.hword   60,   59,   52
.hword   49,   53,   55
.hword   50,   49,   51
.hword   51,   49,   55
.hword   52,   55,   53
.hword   53,   75,   52
.hword   54,   55,   59
.hword   52,   59,   55
.hword   55,   54,   51
.hword   54,   59,   62
.hword   56,   54,   62
.hword   57,   54,   56
.hword   54,   57,   51
.hword   58,   62,   59
.hword   59,   60,   58
.hword   68,   71,   63
.hword   61,   62,   65
.hword   58,   65,   62
.hword   62,   61,   56
.hword   61,   65,   69
.hword   63,   61,   69
.hword   64,   61,   63
.hword   61,   64,   56
.hword   65,   67,   66
.hword   66,   69,   65
.hword   67,   65,   58
.hword   68,   69,   73
.hword   69,   68,   63
.hword   66,   73,   69
.hword   68,   73,  120
.hword   70,   68,  120
.hword   71,   68,   70
.hword   72,  120,   73
.hword   73,   74,   72
.hword   74,   73,   66
.hword   75,   77,   78
.hword   52,   75,   78
.hword   76,   78,   77
.hword   77,  143,   76
.hword   76,   80,   78
.hword   60,   78,   80
.hword   78,   60,   52
.hword   46,   83,   79
.hword   58,   60,   81
.hword   60,   80,   81
.hword   79,   81,   80
.hword   80,   47,   79
.hword   47,   80,   76
.hword   81,   67,   58
.hword   67,   81,   83
.hword   79,   83,   81
.hword   66,   67,   84
.hword   67,   83,   84
.hword   82,   84,   83
.hword   83,   46,   82
.hword   84,   74,   66
.hword   82,   86,   84
.hword   74,   84,   86
.hword   74,   86,  136
.hword   72,   74,  136
.hword   85,  136,   86
.hword   86,   48,   85
.hword   48,   86,   82
.hword   25,   46,   79
.hword   79,   47,   25
.hword   82,   46,   31
.hword   19,   47,   76
.hword   76,  143,   19
.hword   31,   48,   82
.hword   37,   48,  146
.hword   85,   48,   37
.hword   10,   87,   11
.hword   87,   10,  147
.hword   92,   95,  149
.hword   88,   89,   90
.hword   89,  148,   91
.hword   90,   89,   91
.hword   91,   92,   90
.hword   92,  149,   90
.hword   93,   87,   94
.hword   87,   93,   11
.hword   94,   87,   95
.hword   87,  147,   95
.hword   95,   92,   94
.hword   96,   92,   91
.hword   92,   96,   94
.hword   39,  101,   97
.hword   97,   98,   37
.hword   98,   97,  101
.hword   99,   98,  103
.hword   99,  150,   98
.hword   37,   98,  150
.hword   98,  101,  103
.hword  100,  103,  101
.hword  101,  102,  100
.hword  102,  101,   39
.hword  100,  107,  103
.hword  103,  104,   99
.hword  104,  103,  107
.hword  105,  104,  109
.hword  105,  151,  104
.hword   99,  104,  151
.hword  104,  107,  109
.hword  106,  109,  107
.hword  107,  108,  106
.hword  108,  107,  100
.hword  109,  110,  105
.hword  106,  152,  109
.hword  110,  109,  152
.hword  105,  110,  153
.hword  111,  152,  106
.hword   11,   93,   45
.hword  102,   45,   93
.hword   45,  102,   39
.hword  102,   93,  112
.hword  100,  102,  112
.hword   94,  112,   93
.hword  112,  108,  100
.hword  108,  112,   96
.hword   94,   96,  112
.hword  106,  108,  113
.hword  108,   96,  113
.hword   91,  113,   96
.hword   91,  148,  113
.hword  113,  111,  106
.hword  111,  113,  148
.hword  114,  116,   99
.hword   99,  115,  114
.hword  115,   99,  151
.hword   99,  116,  150
.hword   72,  124,  120
.hword  116,   37,  150
.hword   37,  116,   85
.hword  117,  105,  153
.hword  105,  115,  151
.hword  105,  117,  118
.hword  118,  115,  105
.hword  119,  120,  124
.hword  120,  119,   70
.hword  119,  124,  127
.hword  119,  121,   70
.hword  121,  119,  122
.hword  122,  119,  127
.hword  123,  124,   72
.hword  124,  123,  125
.hword  125,  127,  124
.hword  126,  127,  131
.hword  127,  126,  122
.hword  125,  131,  127
.hword  126,  131,  134
.hword  128,  126,  129
.hword  129,  126,  134
.hword  126,  128,  122
.hword  136,  123,   72
.hword  130,  134,  131
.hword  131,  132,  130
.hword  132,  131,  125
.hword  133,  134,  155
.hword  134,  133,  129
.hword  130,  155,  134
.hword  133,  156,  129
.hword  135,  155,  130
.hword  123,  136,  137
.hword   85,  137,  136
.hword  139,  115,  118
.hword  123,  137,  138
.hword  125,  123,  138
.hword  114,  138,  137
.hword  137,  116,  114
.hword  116,  137,   85
.hword  114,  139,  138
.hword  132,  138,  139
.hword  138,  132,  125
.hword  132,  139,  140
.hword  130,  132,  140
.hword  115,  139,  114
.hword  118,  140,  139
.hword  135,  140,  154
.hword  118,  154,  140
.hword  140,  135,  130
.hword  117,  154,  118

.balign 4

inside_castle_seg7_painting_data_07023044: # 0x07023044 - 0x07023050
.word inside_castle_seg7_painting_points_07022660, 0x00000000, 0x00000000

inside_castle_seg7_painting_dl_07023050: # 0x07023050 - 0x070230B0
gsSPDisplayList inside_castle_seg7_dl_07021A48
gsSPVertex inside_castle_seg7_vertex_07021818, 8, 0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_0700B800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList inside_castle_seg7_dl_07021A18
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_0700A800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList inside_castle_seg7_dl_07021A30
gsSPDisplayList inside_castle_seg7_dl_07021AA0
gsSPEndDisplayList

inside_castle_seg7_painting_dl_070230B0: # 0x070230B0 - 0x07023110
gsSPDisplayList inside_castle_seg7_dl_07021A48
gsSPVertex inside_castle_seg7_vertex_07021818, 8, 0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_0700D800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList inside_castle_seg7_dl_07021A18
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_0700C800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList inside_castle_seg7_dl_07021A30
gsSPDisplayList inside_castle_seg7_dl_07021AA0
gsSPEndDisplayList

inside_castle_seg7_painting_dl_07023110: # 0x07023110 - 0x07023170
gsSPDisplayList inside_castle_seg7_dl_07021A48
gsSPVertex inside_castle_seg7_vertex_07021818, 8, 0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_0700F800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList inside_castle_seg7_dl_07021A18
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_0700E800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList inside_castle_seg7_dl_07021A30
gsSPDisplayList inside_castle_seg7_dl_07021AA0
gsSPEndDisplayList

inside_castle_seg7_painting_dl_07023170: # 0x07023170 - 0x070231D0
gsSPDisplayList inside_castle_seg7_dl_07021A48
gsSPVertex inside_castle_seg7_vertex_07021818, 8, 0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_07011800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList inside_castle_seg7_dl_07021A18
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_07010800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList inside_castle_seg7_dl_07021A30
gsSPDisplayList inside_castle_seg7_dl_07021AA0
gsSPEndDisplayList

inside_castle_seg7_painting_dl_070231D0: # 0x070231D0 - 0x07023230
gsSPDisplayList inside_castle_seg7_dl_07021A48
gsSPVertex inside_castle_seg7_vertex_07021818, 8, 0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_07012800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList inside_castle_seg7_dl_07021A18
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_07013800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList inside_castle_seg7_dl_07021A30
gsSPDisplayList inside_castle_seg7_dl_07021AA0
gsSPEndDisplayList

inside_castle_seg7_painting_dl_07023230: # 0x07023230 - 0x07023290
gsSPDisplayList inside_castle_seg7_dl_07021A48
gsSPVertex inside_castle_seg7_vertex_07021818, 8, 0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_07015800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList inside_castle_seg7_dl_07021A18
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_07014800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList inside_castle_seg7_dl_07021A30
gsSPDisplayList inside_castle_seg7_dl_07021AA0
gsSPEndDisplayList

inside_castle_seg7_painting_dl_07023290: # 0x07023290 - 0x070232F0
gsSPDisplayList inside_castle_seg7_dl_07021A48
gsSPVertex inside_castle_seg7_vertex_07021818, 8, 0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_07018800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList inside_castle_seg7_dl_07021A18
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_07017800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList inside_castle_seg7_dl_07021A30
gsSPDisplayList inside_castle_seg7_dl_07021AA0
gsSPEndDisplayList

inside_castle_seg7_painting_dl_070232F0: # 0x070232F0 - 0x07023350
gsSPDisplayList inside_castle_seg7_dl_07021A48
gsSPVertex inside_castle_seg7_vertex_07021818, 8, 0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_0701A800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList inside_castle_seg7_dl_07021A18
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_07019800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList inside_castle_seg7_dl_07021A30
gsSPDisplayList inside_castle_seg7_dl_07021AA0
gsSPEndDisplayList

inside_castle_seg7_painting_dl_07023350: # 0x07023350 - 0x070233B0
gsSPDisplayList inside_castle_seg7_dl_07021A48
gsSPVertex inside_castle_seg7_vertex_07021818, 8, 0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_0701C800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList inside_castle_seg7_dl_07021A18
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_0701B800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList inside_castle_seg7_dl_07021A30
gsSPDisplayList inside_castle_seg7_dl_07021AA0
gsSPEndDisplayList

inside_castle_seg7_painting_dl_070233B0: # 0x070233B0 - 0x07023410
gsSPDisplayList inside_castle_seg7_dl_07021A48
gsSPVertex inside_castle_seg7_vertex_07021818, 8, 0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_0701E800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList inside_castle_seg7_dl_07021A18
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_0701D800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList inside_castle_seg7_dl_07021A30
gsSPDisplayList inside_castle_seg7_dl_07021AA0
gsSPEndDisplayList

inside_castle_seg7_painting_dl_07023410: # 0x07023410 - 0x070234C0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPTexture -1, -1, 0, 0, 1
gsSPVertex inside_castle_seg7_vertex_07021898, 8, 0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_07020800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList inside_castle_seg7_dl_07021A18
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_0701F800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList inside_castle_seg7_dl_07021A30
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

glabel inside_castle_seg7_dl_070234C0 # 0x070234C0 - 0x07023520
gsSPDisplayList inside_castle_seg7_dl_07021A48
gsSPVertex inside_castle_seg7_vertex_07021918, 8, 0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_0700D800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList inside_castle_seg7_dl_07021A18
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_0700C800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList inside_castle_seg7_dl_07021A30
gsSPDisplayList inside_castle_seg7_dl_07021AA0
gsSPEndDisplayList

glabel inside_castle_seg7_dl_07023520 # 0x07023520 - 0x07023580
gsSPDisplayList inside_castle_seg7_dl_07021A48
gsSPVertex inside_castle_seg7_vertex_07021998, 8, 0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_0700D800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList inside_castle_seg7_dl_07021A18
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_0700C800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList inside_castle_seg7_dl_07021A30
gsSPDisplayList inside_castle_seg7_dl_07021AA0
gsSPEndDisplayList

inside_castle_seg7_painting_dl_07023580: # 0x07023580 - 0x070235B8
gsDPPipeSync
gsSPLight inside_castle_seg7_light_07022548, 1
gsSPLight inside_castle_seg7_light_07022540, 2
gsSPVertex inside_castle_seg7_vertex_07022598, 4, 0
gsSP1Triangle  0,  1,  2, 0x0
gsSP1Triangle  0,  2,  3, 0x0
gsSPEndDisplayList

inside_castle_seg7_painting_dl_070235B8: # 0x070235B8 - 0x070235C0
gsSPBranchList inside_castle_seg7_painting_dl_07023580

inside_castle_seg7_painting_textures_070235C0:
.word inside_castle_seg7_texture_0700B800, inside_castle_seg7_texture_0700A800
inside_castle_seg7_painting_textures_070235C8:
.word inside_castle_seg7_texture_0700D800, inside_castle_seg7_texture_0700C800
inside_castle_seg7_painting_textures_070235D0:
.word inside_castle_seg7_texture_0700F800, inside_castle_seg7_texture_0700E800
inside_castle_seg7_painting_textures_070235D8:
.word inside_castle_seg7_texture_07011800, inside_castle_seg7_texture_07010800
inside_castle_seg7_painting_textures_070235E0:
.word inside_castle_seg7_texture_07012800, inside_castle_seg7_texture_07013800
inside_castle_seg7_painting_textures_070235E8:
.word inside_castle_seg7_texture_07015800, inside_castle_seg7_texture_07014800
inside_castle_seg7_painting_textures_070235F0:
.word inside_castle_seg7_texture_07016800
inside_castle_seg7_painting_textures_070235F4:
.word inside_castle_seg7_texture_07017000
inside_castle_seg7_painting_textures_070235F8:
.word inside_castle_seg7_texture_07018800, inside_castle_seg7_texture_07017800
inside_castle_seg7_painting_textures_07023600:
.word inside_castle_seg7_texture_0701A800, inside_castle_seg7_texture_07019800
inside_castle_seg7_painting_textures_07023608:
.word inside_castle_seg7_texture_0701C800, inside_castle_seg7_texture_0701B800
inside_castle_seg7_painting_textures_07023610:
.word inside_castle_seg7_texture_0701E800, inside_castle_seg7_texture_0701D800
inside_castle_seg7_painting_textures_07023618:
.word inside_castle_seg7_texture_07020800, inside_castle_seg7_texture_0701F800

glabel bob_painting # 0x07023620 - 0x07023698
/* id */ .hword 0x0000
/* Face Count */ .byte 0x02
/* Ripple Shape */ .byte RIPPLE_SHAPE_WAVE
/* Floor Status */ .byte 0x00, 0x00, 0x00 /* which of the painting's nearby special floors Mario's on */
/* Ripple Status */ .byte 0x00
/* Rotation */ .float     0.0,    90.0
/* Position */ .float -5222.4,   409.6,   -153.6
/* Ripple Magnitude */ .float     0.0,    20.0,    80.0
.float     1.0,  0.9608,  0.9524
.float     0.0,    0.24,    0.14,     0.0,   40.0
.float    30.0,     0.0,     0.0,    0.0
.word inside_castle_seg7_painting_dl_07023050
.word inside_castle_seg7_painting_data_07022518
.word inside_castle_seg7_painting_textures_070235C0
.hword 64, 32
.word inside_castle_seg7_painting_dl_07021AC0
.byte RIPPLE_TRIGGER_PROXIMITY, 0xFF, 0x00, 0x00, 0x00
.byte 0x00, 0x00, 0x00
.float 614.0

glabel ccm_painting # 0x07023698 - 0x07023710
/* id */ .hword 0x0001
/* Face Count */ .byte 0x02
/* Ripple Shape */ .byte RIPPLE_SHAPE_WAVE
/* Floor Status */ .byte 0x00, 0x00, 0x00 /* which of the painting's nearby special floors Mario's on */
/* Ripple Status */ .byte 0x00
/* Rotation */ .float     0.0,     0.0
/* Position */ .float -2611.2,  -307.2, -4352.0
/* Ripple Magnitude */ .float     0.0,    20.0,    80.0
.float     1.0,  0.9608,  0.9524
.float     0.0
.float    0.24,    0.14,     0.0,    40.0
.float    30.0,     0.0,     0.0,     0.0
.word inside_castle_seg7_painting_dl_070230B0
.word inside_castle_seg7_painting_data_07022518
.word inside_castle_seg7_painting_textures_070235C8
.hword 64, 32
.word inside_castle_seg7_painting_dl_07021AC0
.byte RIPPLE_TRIGGER_PROXIMITY, 0xFF, 0x00, 0x00, 0x00
.byte 0x00, 0x00, 0x00
.float 614.0

glabel wf_painting # 0x07023710 - 0x07023788
/* id */ .hword 0x0002
/* Face Count */ .byte 0x02
/* Ripple Shape */ .byte RIPPLE_SHAPE_WAVE
/* Floor Status */ .byte 0x00, 0x00, 0x00 /* which of the painting's nearby special floors Mario's on */
/* Ripple Status */ .byte 0x00
/* Rotation */ .float     0.0,     0.0
/* Position */ .float   -51.2,  -204.8, -4505.6
/* Ripple Magnitude */ .float     0.0,    20.0,    80.0
.float     1.0,  0.9608,  0.9524
.float     0.0
.float    0.24,    0.14,     0.0,    40.0
.float    30.0,     0.0,     0.0,     0.0
.word inside_castle_seg7_painting_dl_07023110
.word inside_castle_seg7_painting_data_07022518
.word inside_castle_seg7_painting_textures_070235D0
.hword 64, 32
.word inside_castle_seg7_painting_dl_07021AC0
.byte RIPPLE_TRIGGER_PROXIMITY, 0xFF, 0x00, 0x00, 0x00
.byte 0x00, 0x00, 0x00
.float 614.0

glabel jrb_painting # 0x07023788 - 0x07023800
/* id */ .hword 0x0003
/* Face Count */ .byte 0x02
/* Ripple Shape */ .byte RIPPLE_SHAPE_WAVE
/* Floor Status */ .byte 0x00, 0x00, 0x00 /* which of the painting's nearby special floors Mario's on */
/* Ripple Status */ .byte 0x00
/* Rotation */ .float     0.0,   270.0
/* Position */ .float  4300.8,   409.6,  -537.6
/* Ripple Magnitude */ .float     0.0,    20.0,    80.0
.float     1.0,  0.9608,  0.9524
.float     0.0
.float    0.24,    0.14,     0.0,   40.0
.float    30.0,     0.0,     0.0,    0.0
.word inside_castle_seg7_painting_dl_07023170
.word inside_castle_seg7_painting_data_07022518
.word inside_castle_seg7_painting_textures_070235D8
.hword 64, 32
.word inside_castle_seg7_painting_dl_07021AC0
.byte RIPPLE_TRIGGER_PROXIMITY, 0xFF, 0x00, 0x00, 0x00
.byte 0x00, 0x00, 0x00
.float 614.0

glabel lll_painting # 0x07023800 - 0x07023878
/* id */ .hword 0x0004
/* Face Count */ .byte 0x02
/* Ripple Shape */ .byte RIPPLE_SHAPE_WAVE
/* Floor Status */ .byte 0x00, 0x00, 0x00 /* which of the painting's nearby special floors Mario's on */
/* Ripple Status */ .byte 0x00
/* Rotation */ .float     0.0,     0.0
/* Position */ .float -1689.6, -1126.4, -3942.4
/* Ripple Magnitude */ .float     0.0,    20.0,    80.0
.float     1.0,  0.9608,  0.9524
.float     0.0
.float    0.24,    0.14,     0.0,    40.0
.float    30.0,     0.0,     0.0,     0.0
.word inside_castle_seg7_painting_dl_070231D0
.word inside_castle_seg7_painting_data_07022518
.word inside_castle_seg7_painting_textures_070235E0
.hword 64, 32
.word inside_castle_seg7_painting_dl_07021AC0
.byte RIPPLE_TRIGGER_PROXIMITY, 0xFF, 0x00, 0x00, 0x00
.byte 0x00, 0x00, 0x00
.float 614.0

glabel ssl_painting # 0x07023878 - 0x070238F0
/* id */ .hword 0x0005
/* Face Count */ .byte 0x02
/* Ripple Shape */ .byte RIPPLE_SHAPE_WAVE
/* Floor Status */ .byte 0x00, 0x00, 0x00 /* which of the painting's nearby special floors Mario's on */
/* Ripple Status */ .byte 0x00
/* Rotation */ .float     0.0,   180.0
/* Position */ .float -2611.2, -1177.6, -1075.2
/* Ripple Magnitude */ .float     0.0,    20.0,    80.0
.float     1.0,  0.9608,  0.9524
.float     0.0
.float    0.24,    0.14,     0.0,    40.0
.float    30.0,     0.0,     0.0,     0.0
.word inside_castle_seg7_painting_dl_07023230
.word inside_castle_seg7_painting_data_07022518
.word inside_castle_seg7_painting_textures_070235E8
.hword 64, 32
.word inside_castle_seg7_painting_dl_07021AC0
.byte RIPPLE_TRIGGER_PROXIMITY, 0xFF, 0x00, 0x00, 0x00
.byte 0x00, 0x00, 0x00
.float 614.0

glabel hmc_painting # 0x070238F0 - 0x07023968
/* id */ .hword 0x000E
/* Face Count */ .byte 0x01
/* Ripple Shape */ .byte RIPPLE_SHAPE_CONCENTRIC
/* Floor Status */ .byte 0x00, 0x00, 0x00 /* which of the painting's nearby special floors Mario's on */
/* Ripple Status */ .byte 0x00
/* Rotation */ .float   270.0,   0.0
/* Position */ .float  2099.2, -1484.8, -2278.4
/* Ripple Magnitude */ .float     0.0,    10.0,    30.0
.float     1.0,     1.0,    0.98
.float     0.0
.float    0.05,    0.05,     0.0,    15.0
.float    15.0,     0.0,     0.0,     0.0
.word inside_castle_seg7_painting_dl_07023580
.word inside_castle_seg7_painting_data_07023044
.word inside_castle_seg7_painting_textures_070235F0
.hword 32, 32
.word inside_castle_seg7_painting_dl_07022640
.byte RIPPLE_TRIGGER_CONTINUOUS, 0xFF, 0x00, 0x00, 0x00
.byte 0x00, 0x00, 0x00
.float 768.0

glabel ddd_painting # 0x07023968 - 0x070239E0
/* id */ .hword 0x0007
/* Face Count */ .byte 0x01
/* Ripple Shape */ .byte RIPPLE_SHAPE_CONCENTRIC
/* Floor Status */ .byte 0x00, 0x00, 0x00 /* which of the painting's nearby special floors Mario's on */
/* Ripple Status */ .byte 0x00
/* Rotation */ .float    0.0, 270.0
/* Position */ .float 3456.0, -1075.2, 1587.2
/* Ripple Magnitude */ .float    0.0,   10.0,    30.0
.float    1.0,   1.0,   0.98
.float    0.0
.float   0.05,  0.05  ,  0.0,    15.0
.float   15.0,   0.0,    0.0,     0.0
.word inside_castle_seg7_painting_dl_070235B8
.word inside_castle_seg7_painting_data_07023044
.word inside_castle_seg7_painting_textures_070235F4
.hword 32, 32
.word inside_castle_seg7_painting_dl_07022640
.byte RIPPLE_TRIGGER_CONTINUOUS, 0xB4, 0x00, 0x00, 0x00
.byte 0x00, 0x00, 0x00
.float 819.2

glabel wdw_painting # 0x070239E0 - 0x07023A58
/* id */ .hword 0x0008
/* Face Count */ .byte 0x02
/* Ripple Shape */ .byte RIPPLE_SHAPE_WAVE
/* Floor Status */ .byte 0x00, 0x00, 0x00 /* which of the painting's nearby special floors Mario's on */
/* Ripple Status */ .byte 0x00
/* Rotation */ .float     0.0,     0.0
/* Position */ .float -966.656, 1305.6, -143.36
/* Ripple Magnitude */ .float     0.0,     20.0,   80.0
.float     1.0,  0.9608,   0.9524
.float     0.0
.float    0.24,    0.14,      0.0,   40.0
.float    30.0,     0.0,      0.0,    0.0
.word inside_castle_seg7_painting_dl_07023290
.word inside_castle_seg7_painting_data_07022518
.word inside_castle_seg7_painting_textures_070235F8
.hword 64, 32
.word inside_castle_seg7_painting_dl_07021AC0
.byte RIPPLE_TRIGGER_PROXIMITY, 0xFF, 0x00, 0x00, 0x00
.byte 0x00, 0x00, 0x00
.float 614.0

glabel thi_tiny_painting # 0x07023A58 - 0x07023AD0
/* id */ .hword 0x0009
/* Face Count */ .byte 0x02
/* Ripple Shape */ .byte RIPPLE_SHAPE_WAVE
/* Floor Status */ .byte 0x00, 0x00, 0x00 /* which of the painting's nearby special floors Mario's on */
/* Ripple Status */ .byte 0x00
/* Rotation */ .float     0.0,   180.0
/* Position */ .float -4598.7842, 1354.752, 3005.44
/* Ripple Magnitude */ .float     0.0,       20.0,     80.0
.float     1.0,  0.9608,     0.9524
.float     0.0
.float    0.24,    0.14,        0.0,     40.0
.float    30.0,     0.0,        0.0,      0.0
.word inside_castle_seg7_painting_dl_070232F0
.word inside_castle_seg7_painting_data_07022518
.word inside_castle_seg7_painting_textures_07023600
.hword 64, 32
.word inside_castle_seg7_painting_dl_07021AC0
.byte RIPPLE_TRIGGER_PROXIMITY, 0xFF, 0x00, 0x00, 0x00
.byte 0x00, 0x00, 0x00
.float 393.216

glabel ttm_painting # 0x07023AD0 - 0x07023B48
/* id */ .hword 0x000A
/* Face Count */ .byte 0x02
/* Ripple Shape */ .byte RIPPLE_SHAPE_WAVE
/* Floor Status */ .byte 0x00, 0x00, 0x00 /* which of the painting's nearby special floors Mario's on */
/* Ripple Status */ .byte 0x00
/* Rotation */ .float      0.0,   180.0
/* Position */ .float -546.816, 1356.8, 3813.376
/* Ripple Magnitude */ .float      0.0,     20.0,   80.0
.float      1.0,  0.9608,   0.9524,    0.0
.float     0.24,    0.14,      0.0,   40.0
.float     30.0,     0.0,      0.0,    0.0
.word inside_castle_seg7_painting_dl_07023350
.word inside_castle_seg7_painting_data_07022518
.word inside_castle_seg7_painting_textures_07023608
.hword 64, 32
.word inside_castle_seg7_painting_dl_07021AC0
.byte RIPPLE_TRIGGER_PROXIMITY, 0xFF, 0x00, 0x00, 0x00
.byte 0x00, 0x00, 0x00
.float 256.0

glabel ttc_painting # 0x07023B48 - 0x07023BC0
/* id */ .hword 0x000B
/* Face Count */ .byte 0x02
/* Ripple Shape */ .byte RIPPLE_SHAPE_WAVE
/* Floor Status */ .byte 0x00, 0x00, 0x00 /* which of the painting's nearby special floors Mario's on */
/* Ripple Status */ .byte 0x00
/* Rotation */ .float       0.0,   180.0
/* Position */ .float 0.0, 2713.6, 7232.5122
/* Ripple Magnitude */ .float       0.0,   20.0,   80.0
.float       1.0,  0.9608, 0.9524,    0.0
.float      0.24,    0.14,    0.0,   40.0
.float      30.0,     0.0,    0.0,    0.0
.word inside_castle_seg7_painting_dl_070233B0
.word inside_castle_seg7_painting_data_07022518
.word inside_castle_seg7_painting_textures_07023610
.hword 64, 32
.word inside_castle_seg7_painting_dl_07021AC0
.byte RIPPLE_TRIGGER_PROXIMITY, 0xFF, 0x00, 0x00, 0x00
.byte 0x00, 0x00, 0x00
.float 409.6

glabel sl_painting # 0x07023BC0 - 0x07023C38
/* id */ .hword 0x000C
/* Face Count */ .byte 0x02
/* Ripple Shape */ .byte RIPPLE_SHAPE_WAVE
/* Floor Status */ .byte 0x00, 0x00, 0x00 /* which of the painting's nearby special floors Mario's on */
/* Ripple Status */ .byte 0x00
/* Rotation */ .float     0.0,     0.0
/* Position */ .float 3179.52, 1408.0, -271.36
/* Ripple Magnitude */ .float     0.0,    20.0,   80.0
.float     1.0,  0.9608,  0.9524,    0.0
.float    0.24,    0.14,     0.0,   40.0
.float    30.0,     0.0,     0.0,    0.0
.word inside_castle_seg7_painting_dl_07023410
.word inside_castle_seg7_painting_data_07022518
.word inside_castle_seg7_painting_textures_07023618
.hword 64, 32
.word inside_castle_seg7_painting_dl_07021AC0
.byte RIPPLE_TRIGGER_PROXIMITY, 0xFF, 0x00, 0x00, 0x00
.byte 0x00, 0x00, 0x00
.float 716.8

glabel thi_huge_painting # 0x07023C38 - 0x07023CB0
/* id */ .hword 0x000D
/* Face Count */ .byte 0x02
/* Ripple Shape */ .byte RIPPLE_SHAPE_WAVE
/* Floor Status */ .byte 0x00, 0x00, 0x00 /* which of the painting's nearby special floors Mario's on */
/* Ripple Status */ .byte 0x00
/* Rotation */ .float      0.0,     0.0
/* Position */ .float -5614.5918, 1510.4, -3292.16
/* Ripple Magnitude */ .float      0.0,       40.0,  160.0
.float      1.0,  0.9608,     0.9524,    0.0
.float     0.12,    0.07,        0.0,   80.0
.float     60.0,     0.0,        0.0,    0.0
.word inside_castle_seg7_painting_dl_070232F0
.word inside_castle_seg7_painting_data_07022518
.word inside_castle_seg7_painting_textures_07023600
.hword 64, 32
.word inside_castle_seg7_painting_dl_07021AC0
.byte RIPPLE_TRIGGER_PROXIMITY, 0xFF, 0x00, 0x00, 0x00
.byte 0x00, 0x00, 0x00
.float 1638.4
