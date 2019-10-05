# Sushi (Shark)

# Could be a duplicate binid of the previous actor, but i'm putting it here for
# macro reasons so I don't have to clutter the macros.inc with a new macro for this
# case.
.dword 1

sushi_seg5_texture_05008ED0: # 0x05008ED0
.incbin "actors/sushi/sushi_snout.rgba16"

sushi_seg5_texture_050096D0: # 0x050096D0
.incbin "actors/sushi/sushi_eye.rgba16"

sushi_seg5_texture_05009AD0: # 0x05009AD0
.incbin "actors/sushi/sushi_tooth.rgba16"

sushi_seg5_vertex_05009B50: # 0x05009B50
vertex      0,      4,   -257,    528,    804,  0xFF, 0xFF, 0xFF, 0xFF
vertex    416,      3,   -203,    694,    704,  0xFF, 0xFF, 0xFF, 0xFF
vertex    416,   -104,   -154,    694,    616,  0xFF, 0xFF, 0xFF, 0xFF
vertex    416,    144,     67,    694,    210,  0xFF, 0xFF, 0xFF, 0xFF
vertex    416,      3,    120,    694,    114,  0xFF, 0xFF, 0xFF, 0xFF
vertex    416,    112,   -154,    694,    616,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    197,   -187,    528,    676,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      4,    161,    528,     40,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    208,     90,    528,    170,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -188,   -187,    528,    676,  0xFF, 0xFF, 0xFF, 0xFF
vertex    416,   -136,     67,    694,    210,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -199,     90,    528,    170,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -82,    188,     76,    494,    194,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -82,      4,    140,    494,     78,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -82,   -178,     76,    494,    194,  0xFF, 0xFF, 0xFF, 0xFF

sushi_seg5_vertex_05009C40: # 0x05009C40
vertex      0,      4,   -257,    528,    804,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -82,      4,   -237,    494,    768,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -82,    178,   -172,    494,    650,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -82,   -169,   -172,    494,    650,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -188,   -187,    528,    676,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    197,   -187,    528,    676,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -82,    188,     76,    494,    194,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -82,   -178,     76,    494,    194,  0xFF, 0xFF, 0xFF, 0xFF

glabel sushi_seg5_dl_05009CC0 # 0x05009CC0 - 0x05009DD0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sushi_seg5_texture_05008ED0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex sushi_seg5_vertex_05009B50, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  4, 0x0
gsSP2Triangles  2,  1,  4, 0x0,  5,  1,  0, 0x0
gsSP2Triangles  1,  5,  3, 0x0,  3,  5,  6, 0x0
gsSP2Triangles  5,  0,  6, 0x0,  7,  4,  3, 0x0
gsSP2Triangles  6,  8,  3, 0x0,  3,  8,  7, 0x0
gsSP2Triangles  9,  2, 10, 0x0,  2,  4, 10, 0x0
gsSP2Triangles  2,  9,  0, 0x0, 10,  4,  7, 0x0
gsSP2Triangles 10, 11,  9, 0x0,  7, 11, 10, 0x0
gsSP2Triangles 12, 13,  7, 0x0,  7, 13, 14, 0x0
gsSP2Triangles  7, 14, 11, 0x0,  8, 12,  7, 0x0
gsSP2Triangles 11, 14,  9, 0x0,  6, 12,  8, 0x0
gsSPVertex sushi_seg5_vertex_05009C40, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  1,  0, 0x0
gsSP2Triangles  4,  3,  0, 0x0,  0,  2,  5, 0x0
gsSP2Triangles  5,  2,  6, 0x0,  7,  3,  4, 0x0
gsSPEndDisplayList

glabel sushi_seg5_dl_05009DD0 # 0x05009DD0 - 0x05009E40
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList sushi_seg5_dl_05009CC0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

sushi_seg5_vertex_05009E40: # 0x05009E40
vertex      0,    112,   -154,    694,    616,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -82,    122,     52,    660,    238,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    144,     67,    694,    210,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -104,   -154,    694,    616,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -84,    -86,   -138,    660,    586,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      3,   -203,    694,    704,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -83,      4,   -181,    660,    664,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -82,     95,   -138,    660,    586,  0xFF, 0xFF, 0xFF, 0xFF
vertex    494,      0,    -79,    890,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex    495,     45,     66,    890,    212,  0xFF, 0xFF, 0xFF, 0xFF
vertex    494,    -44,     66,    890,    212,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      3,    120,    694,    114,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   -136,     67,    694,    210,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -84,   -113,     52,    660,    238,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -83,      4,     97,    660,    156,  0xFF, 0xFF, 0xFF, 0xFF

glabel sushi_seg5_dl_05009F30 # 0x05009F30 - 0x0500A008
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sushi_seg5_texture_05008ED0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex sushi_seg5_vertex_05009E40, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  4,  6,  5, 0x0,  5,  7,  0, 0x0
gsSP2Triangles  8,  3,  5, 0x0,  5,  6,  7, 0x0
gsSP2Triangles  8,  5,  0, 0x0,  0,  7,  1, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8,  0,  9, 0x0
gsSP2Triangles  3,  8, 10, 0x0,  0,  2,  9, 0x0
gsSP2Triangles  9,  2, 11, 0x0, 10,  9, 11, 0x0
gsSP2Triangles  3, 10, 12, 0x0, 11, 12, 10, 0x0
gsSP2Triangles  2,  1, 11, 0x0, 13,  4,  3, 0x0
gsSP2Triangles 11, 13, 12, 0x0,  1, 14, 11, 0x0
gsSP2Triangles 11, 14, 13, 0x0, 12, 13,  3, 0x0
gsSPEndDisplayList

glabel sushi_seg5_dl_0500A008 # 0x0500A008 - 0x0500A078
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList sushi_seg5_dl_05009F30
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

sushi_seg5_vertex_0500A078: # 0x0500A078
vertex      6,    -34,     71,    890,    204,  0xFF, 0xFF, 0xFF, 0xFF
vertex      5,      0,    -89,    890,    498,  0xFF, 0xFF, 0xFF, 0xFF
vertex    241,    -41,      7,    984,    320,  0xFF, 0xFF, 0xFF, 0xFF
vertex      5,     35,     71,    890,    204,  0xFF, 0xFF, 0xFF, 0xFF
vertex    239,     54,      7,    984,    320,  0xFF, 0xFF, 0xFF, 0xFF
vertex    423,     11,   -362,   1056,    994,  0xFF, 0xFF, 0xFF, 0xFF
vertex    462,     12,    649,   1072,   -852,  0xFF, 0xFF, 0xFF, 0xFF

glabel sushi_seg5_dl_0500A0E8 # 0x0500A0E8 - 0x0500A160
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sushi_seg5_texture_05008ED0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex sushi_seg5_vertex_0500A078, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  4, 0x0
gsSP2Triangles  1,  0,  3, 0x0,  1,  4,  5, 0x0
gsSP2Triangles  1,  5,  2, 0x0,  2,  6,  0, 0x0
gsSP2Triangles  6,  3,  0, 0x0,  6,  4,  3, 0x0
gsSP2Triangles  5,  4,  2, 0x0,  4,  6,  2, 0x0
gsSPEndDisplayList

glabel sushi_seg5_dl_0500A160 # 0x0500A160 - 0x0500A1D0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList sushi_seg5_dl_0500A0E8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

sushi_seg5_vertex_0500A1D0: # 0x0500A1D0
vertex    201,   -199,     90,    528,    170,  0xFF, 0xFF, 0xFF, 0xFF
vertex    201,   -188,   -187,    528,    676,  0xFF, 0xFF, 0xFF, 0xFF
vertex    201,      4,   -257,    528,    804,  0xFF, 0xFF, 0xFF, 0xFF
vertex    226,   -558,   -378,    538,   1024,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -206,   -223,   -158,    364,    624,  0xFF, 0xFF, 0xFF, 0xFF
vertex     30,   -123,   -199,    460,    698,  0xFF, 0xFF, 0xFF, 0xFF
vertex    100,   -175,   -123,    486,    558,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -477,     -3,   -355,    256,    982,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -221,     -3,   -300,    358,    882,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -221,   -239,   -200,    358,    700,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -221,    231,   -200,    358,    700,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -221,   -239,    121,    358,    112,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -645,   -214,    120,    188,    114,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -645,   -166,   -144,    188,    598,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -547,     -3,   -300,    228,    882,  0xFF, 0xFF, 0xFF, 0xFF

sushi_seg5_vertex_0500A2C0: # 0x0500A2C0
vertex   -221,    231,   -200,    358,    700,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -645,    159,   -144,    190,    598,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -645,    207,    120,    190,    114,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -547,     -3,   -300,    228,    882,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -863,     -3,   -194,    102,    688,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1181,     -3,     26,    -24,    286,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1174,     57,     95,    -22,    160,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -645,   -166,   -144,    188,    598,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1174,    -64,     95,    -22,    160,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -645,   -214,    120,    188,    114,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -191,     -4,    172,    370,     18,  0xFF, 0xFF, 0xFF, 0xFF
vertex    266,      4,    552,    554,   -674,  0xFF, 0xFF, 0xFF, 0xFF
vertex    181,     73,    120,    520,    114,  0xFF, 0xFF, 0xFF, 0xFF
vertex    183,    -67,    120,    520,    114,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -645,     -3,    185,    190,     -4,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -221,   -239,    121,    358,    112,  0xFF, 0xFF, 0xFF, 0xFF

sushi_seg5_vertex_0500A3C0: # 0x0500A3C0
vertex   -645,     -3,    185,    190,     -4,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -221,    231,    121,    358,    112,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -645,    207,    120,    190,    114,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -221,   -239,    121,    358,    112,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -221,     -4,    184,    358,     -4,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -221,    231,   -200,    358,    700,  0xFF, 0xFF, 0xFF, 0xFF
vertex    201,    208,     90,    528,    170,  0xFF, 0xFF, 0xFF, 0xFF
vertex    201,      4,   -257,    528,    804,  0xFF, 0xFF, 0xFF, 0xFF
vertex    201,    197,   -187,    528,    676,  0xFF, 0xFF, 0xFF, 0xFF
vertex    201,      4,    161,    528,     40,  0xFF, 0xFF, 0xFF, 0xFF
vertex    106,    176,   -124,    490,    562,  0xFF, 0xFF, 0xFF, 0xFF
vertex     32,    124,   -201,    460,    700,  0xFF, 0xFF, 0xFF, 0xFF
vertex    212,    569,   -380,    532,   1026,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -208,    212,   -160,    364,    626,  0xFF, 0xFF, 0xFF, 0xFF

sushi_seg5_vertex_0500A4A0: # 0x0500A4A0
vertex    212,    569,   -380,    452,    396,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -208,    212,   -160,    340,    640,  0xFF, 0xFF, 0xFF, 0xFF
vertex    106,    176,   -124,    460,    652,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -221,   -239,    121,    358,    112,  0xFF, 0xFF, 0xFF, 0xFF
vertex    201,   -199,     90,    528,    170,  0xFF, 0xFF, 0xFF, 0xFF
vertex    201,      4,    161,    528,     40,  0xFF, 0xFF, 0xFF, 0xFF
vertex    201,      4,   -257,    528,    804,  0xFF, 0xFF, 0xFF, 0xFF
vertex    226,   -558,   -378,    728,    330,  0xFF, 0xFF, 0xFF, 0xFF
vertex    100,   -175,   -123,    524,    612,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -206,   -223,   -158,    728,    548,  0xFF, 0xFF, 0xFF, 0xFF

sushi_seg5_vertex_0500A540: # 0x0500A540
vertex   -221,    231,   -200,      0,      0,  0xFF, 0x00, 0x00, 0xFF
vertex   -477,     -3,   -355,      0,      0,  0xFF, 0x00, 0x00, 0xFF
vertex   -221,   -239,   -200,      0,      0,  0xFF, 0x00, 0x00, 0xFF
vertex   -547,     -3,   -300,      0,      0,  0xFF, 0x00, 0x00, 0xFF

glabel sushi_seg5_dl_0500A580 # 0x0500A580 - 0x0500A748
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sushi_seg5_texture_05008ED0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex sushi_seg5_vertex_0500A1D0, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  5,  6,  3, 0x0,  7,  8,  9, 0x0
gsSP2Triangles 10,  8,  7, 0x0,  8,  2,  9, 0x0
gsSP2Triangles  2,  8, 10, 0x0,  1,  9,  2, 0x0
gsSP2Triangles  1,  0,  9, 0x0,  9, 11, 12, 0x0
gsSP2Triangles 12, 13,  9, 0x0, 11,  9,  0, 0x0
gsSP1Triangle 13, 14,  9, 0x0
gsSPVertex sushi_seg5_vertex_0500A2C0, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  1,  3,  4, 0x0,  4,  5,  1, 0x0
gsSP2Triangles  2,  1,  6, 0x0,  5,  6,  1, 0x0
gsSP2Triangles  7,  4,  3, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  5,  7,  8, 0x0,  8,  7,  9, 0x0
gsSP2Triangles  5,  8,  6, 0x0, 10, 11, 12, 0x0
gsSP2Triangles 10, 13, 11, 0x0, 12, 11, 13, 0x0
gsSP2Triangles  9, 14,  8, 0x0,  8, 14,  6, 0x0
gsSP2Triangles  6, 14,  2, 0x0, 15, 14,  9, 0x0
gsSPVertex sushi_seg5_vertex_0500A3C0, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  4, 0x0
gsSP2Triangles  4,  1,  0, 0x0,  2,  1,  5, 0x0
gsSP2Triangles  6,  5,  1, 0x0,  7,  5,  8, 0x0
gsSP2Triangles  5,  6,  8, 0x0,  7,  8,  6, 0x0
gsSP2Triangles  6,  9,  7, 0x0,  9,  6,  1, 0x0
gsSP2Triangles  1,  4,  9, 0x0,  3,  9,  4, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 12, 11, 13, 0x0
gsSPVertex sushi_seg5_vertex_0500A4A0, 10, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  5,  4, 0x0,  7,  8,  9, 0x0
gsSPEndDisplayList

glabel sushi_seg5_dl_0500A748 # 0x0500A748 - 0x0500A768
gsSPVertex sushi_seg5_vertex_0500A540, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel sushi_seg5_dl_0500A768 # 0x0500A768 - 0x0500A7E0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList sushi_seg5_dl_0500A580
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPDisplayList sushi_seg5_dl_0500A748
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

sushi_seg5_vertex_0500A7E0: # 0x0500A7E0
vertex   -645,    221,    120,    -24,  -2137,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -221,    246,    121,   1672,   -830,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -221,    246,   -200,    678,    847,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -645,    173,   -144,   -906,   -738,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -645,   -220,    120,    -24,  -2137,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -645,   -172,   -144,   -906,   -738,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -221,   -245,   -200,    678,    847,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -221,   -245,    121,   1672,   -830,  0xFF, 0xFF, 0xFF, 0xFF

glabel sushi_seg5_dl_0500A860 # 0x0500A860 - 0x0500A8A8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sushi_seg5_texture_050096D0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x1FF, 0x100
gsSPVertex sushi_seg5_vertex_0500A7E0, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  0, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  6,  7,  4, 0x0
gsSPEndDisplayList

glabel sushi_seg5_dl_0500A8A8 # 0x0500A8A8 - 0x0500A918
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 60
gsSPDisplayList sushi_seg5_dl_0500A860
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

sushi_seg5_vertex_0500A918: # 0x0500A918
vertex   -505,      0,   -304,    -32,      2,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -221,    231,   -200,   1592,    -14,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -477,     -3,   -355,      0,    166,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -221,   -239,   -200,   1592,    -14,  0xFF, 0xFF, 0xFF, 0xFF

glabel sushi_seg5_dl_0500A958 # 0x0500A958 - 0x0500A990
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sushi_seg5_texture_05009AD0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x03F, 0x400
gsSPVertex sushi_seg5_vertex_0500A918, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  2, 0x0
gsSPEndDisplayList

glabel sushi_seg5_dl_0500A990 # 0x0500A990 - 0x0500AA00
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 2, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 3, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 3, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 28, 28
gsSPDisplayList sushi_seg5_dl_0500A958
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList

sushi_seg5_animvalue_0500AA00: # 0x0500AA00
.hword 0x0000, 0x0192, 0x0190, 0x018A, 0x0180, 0x0173, 0x0162, 0x014F
.hword 0x0139, 0x0120, 0x0106, 0x00E9, 0x00CB, 0x00AB, 0x0089, 0x0067
.hword 0x0044, 0x0021, 0xFFFE, 0xFFDB, 0xFFB8, 0xFF95, 0xFF73, 0xFF51
.hword 0xFF31, 0xFF13, 0xFEF6, 0xFEDC, 0xFEC3, 0xFEAD, 0xFE9A, 0xFE89
.hword 0xFE7C, 0xFE72, 0xFE6C, 0xFE6A, 0xFE6C, 0xFE72, 0xFE7A, 0xFE86
.hword 0xFE95, 0xFEA6, 0xFEBA, 0xFED0, 0xFEE9, 0xFF03, 0xFF1F, 0xFF3C
.hword 0xFF5A, 0xFF7A, 0xFF9A, 0xFFBB, 0xFFDD, 0xFFFE, 0x001F, 0x0041
.hword 0x0062, 0x0082, 0x00A2, 0x00C0, 0x00DD, 0x00F9, 0x0113, 0x012C
.hword 0x0142, 0x0156, 0x0167, 0x0176, 0x0182, 0x018A, 0x0190, 0x0054
.hword 0xFFDE, 0xC001, 0x14C7, 0x1587, 0x1627, 0x16A5, 0x1701, 0x173A
.hword 0x174F, 0x1740, 0x170B, 0x16B0, 0x162E, 0x1584, 0x14B1, 0x13B5
.hword 0x128F, 0x113E, 0x0FB0, 0x0DDB, 0x0BC8, 0x097F, 0x0708, 0x046D
.hword 0x01B6, 0xFEEE, 0xFC1A, 0xF944, 0xF676, 0xF3B7, 0xF111, 0xEE8D
.hword 0xEC33, 0xEA0B, 0xE81F, 0xE677, 0xE51D, 0xE3FB, 0xE2F9, 0xE217
.hword 0xE156, 0xE0B6, 0xE037, 0xDFDA, 0xDF9F, 0xDF88, 0xDF93, 0xDFC3
.hword 0xE016, 0xE08F, 0xE12C, 0xE1EF, 0xE2D8, 0xE3E7, 0xE51D, 0xE69C
.hword 0xE87F, 0xEAB8, 0xED3C, 0xEFFD, 0xF2EF, 0xF607, 0xF937, 0xFC74
.hword 0xFFB0, 0x02DF, 0x05F6, 0x08E7, 0x0BA6, 0x0E28, 0x105E, 0x123E
.hword 0x0E68, 0x0ECB, 0x0F1C, 0x0F5B, 0x0F87, 0x0F9F, 0x0FA3, 0x0F92
.hword 0x0F6B, 0x0F2E, 0x0ED9, 0x0E6E, 0x0DEA, 0x0D4E, 0x0C98, 0x0BC8
.hword 0x0AD4, 0x09B3, 0x086B, 0x0702, 0x057D, 0x03E3, 0x0238, 0x0082
.hword 0xFEC8, 0xFD0D, 0xFB57, 0xF9AD, 0xF814, 0xF690, 0xF529, 0xF3E4
.hword 0xF2C5, 0xF1D3, 0xF113, 0xF07B, 0xEFFE, 0xEF9A, 0xEF4F, 0xEF1D
.hword 0xEF01, 0xEEFD, 0xEF0F, 0xEF37, 0xEF73, 0xEFC3, 0xF027, 0xF09D
.hword 0xF125, 0xF1BF, 0xF269, 0xF323, 0xF3EC, 0xF4DD, 0xF609, 0xF768
.hword 0xF8F2, 0xFA9F, 0xFC66, 0xFE40, 0x0024, 0x020B, 0x03ED, 0x05C1
.hword 0x077F, 0x0920, 0x0A9A, 0x0BE7, 0x0CFD, 0x0DD6, 0x0BD0, 0x0BC0
.hword 0x0B91, 0x0B44, 0x0ADD, 0x0A5C, 0x09C4, 0x0916, 0x0855, 0x0783
.hword 0x06A1, 0x05B1, 0x04B6, 0x03B1, 0x02A4, 0x0192, 0x007B, 0xFF64
.hword 0xFE4C, 0xFD35, 0xFC23, 0xFB16, 0xFA11, 0xF916, 0xF826, 0xF744
.hword 0xF672, 0xF5B1, 0xF503, 0xF46B, 0xF3EA, 0xF383, 0xF336, 0xF307
.hword 0xF2F7, 0xF305, 0xF330, 0xF374, 0xF3D1, 0xF445, 0xF4CE, 0xF56B
.hword 0xF61A, 0xF6D9, 0xF7A7, 0xF882, 0xF968, 0xFA59, 0xFB51, 0xFC50
.hword 0xFD54, 0xFE5B, 0xFF64, 0x006C, 0x0173, 0x0277, 0x0376, 0x046E
.hword 0x055F, 0x0645, 0x0720, 0x07EE, 0x08AD, 0x095C, 0x09F9, 0x0A82
.hword 0x0AF6, 0x0B53, 0x0B97, 0x0BC2, 0x3B39, 0x3A67, 0x399B, 0x38D8
.hword 0x381E, 0x3770, 0x36D1, 0x3643, 0x35C7, 0x3560, 0x3510, 0x34D9
.hword 0x34BE, 0x34C0, 0x34E2, 0x3525, 0x358B, 0x3611, 0x36B3, 0x376F
.hword 0x3842, 0x3929, 0x3A20, 0x3B25, 0x3C35, 0x3D4C, 0x3E68, 0x3F86
.hword 0x40A2, 0x41BA, 0x42CA, 0x43D0, 0x44C8, 0x45B0, 0x4684, 0x4757
.hword 0x4839, 0x4928, 0x4A1D, 0x4B16, 0x4C0D, 0x4CFF, 0x4DE6, 0x4EBF
.hword 0x4F85, 0x5034, 0x50C8, 0x513C, 0x518C, 0x51B4, 0x51AE, 0x5178
.hword 0x510D, 0x506F, 0x4FA5, 0x4EB2, 0x4D9C, 0x4C68, 0x4B1C, 0x49BC
.hword 0x484D, 0x46D4, 0x4558, 0x43DC, 0x4266, 0x40FA, 0x3F9F, 0x3E59
.hword 0x3D2E, 0x3C21, 0x3B39, 0x3A67, 0x399B, 0x38D8, 0x381E, 0x3770
.hword 0x36D1, 0x3643, 0x35C7, 0x3560, 0x3510, 0x34D9, 0x34BE, 0x34C0
.hword 0x34E2, 0x3525, 0x358B, 0x3611, 0x36B3, 0x376F, 0x3842, 0x3929
.hword 0x3A20, 0x3B25, 0x3C35, 0x3D4C, 0x3E68, 0x3F86, 0x40A2, 0x41BA
.hword 0x42CA, 0x43D0, 0x44C8, 0x45B0, 0x4684, 0x4757, 0x4839, 0x4928
.hword 0x4A1D, 0x4B16, 0x4C0D, 0x4CFF, 0x4DE6, 0x4EBF, 0x4F85, 0x5034
.hword 0x50C8, 0x513C, 0x518C, 0x51B4, 0x51AE, 0x5178, 0x510D, 0x506F
.hword 0x4FA5, 0x4EB2, 0x4D9C, 0x4C68, 0x4B1C, 0x49BC, 0x484D, 0x46D4
.hword 0x4558, 0x43DC, 0x4266, 0x40FA, 0x3F9F, 0x3E59, 0x3D2E, 0x3C21
.hword 0x3B39, 0x3A67, 0x399B, 0x38D8, 0x381E, 0x3770, 0x36D1, 0x3643
.hword 0x35C7, 0x3560, 0x3510, 0x34D9, 0x34BE, 0x34C0, 0x34E2, 0x3525
.hword 0x358B, 0x3611, 0x36B3, 0x376F, 0x3842, 0x3929, 0x3A20, 0x3B25
.hword 0x3C35, 0x3D4C, 0x3E68, 0x3F86, 0x40A2, 0x41BA, 0x42CA, 0x43D0
.hword 0x44C8, 0x45B0, 0x4684, 0x4757, 0x4839, 0x4928, 0x4A1D, 0x4B16
.hword 0x4C0D, 0x4CFF, 0x4DE6, 0x4EBF, 0x4F85, 0x5034, 0x50C8, 0x513C
.hword 0x518C, 0x51B4, 0x51AE, 0x5178, 0x510D, 0x506F, 0x4FA5, 0x4EB2
.hword 0x4D9C, 0x4C68, 0x4B1C, 0x49BC, 0x484D, 0x46D4, 0x4558, 0x43DC
.hword 0x4266, 0x40FA, 0x3F9F, 0x3E59, 0x3D2E, 0x3C21

sushi_seg5_animindex_0500ADDC: # 0x0500ADDC
.hword 0x0046, 0x0001, 0x0001, 0x0047, 0x0001, 0x0048, 0x0001, 0x0049
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0046, 0x01A8, 0x0001, 0x0000, 0x0001, 0x0000, 0x0046, 0x00D6
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0046, 0x0090, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0046, 0x004A, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0046, 0x0162, 0x0001, 0x0000, 0x0001, 0x0000, 0x0046, 0x011C

sushi_seg5_anim_0500AE3C: # 0x0500AE3C
.hword 0
.hword 0
.hword 0
.hword 0
.hword 0x46
.hword 0x07
.word sushi_seg5_animvalue_0500AA00
.word sushi_seg5_animindex_0500ADDC
.word 0

glabel sushi_seg5_anims_0500AE54 # 0x0500AE54
.word sushi_seg5_anim_0500AE3C
