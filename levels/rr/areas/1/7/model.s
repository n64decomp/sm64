rr_seg7_vertex_07007EF0: # 0x07007EF0 - 0x07007FF0
vertex  -2405,    -76,   -741,  -4260,   8996,  0x8C, 0x8C, 0x8C, 0xFF
vertex  -2815,    128,   -537,  -5140,   8908,  0x8C, 0x8C, 0x8C, 0xFF
vertex  -2405,    128,   -741,  -4374,   8654,  0x8C, 0x8C, 0x8C, 0xFF
vertex   2406,    -76,    589,   -144,    648,  0x8C, 0x8C, 0x8C, 0xFF
vertex   2816,    128,    384,    734,    734,  0x8C, 0x8C, 0x8C, 0xFF
vertex   2406,    128,    589,      0,    990,  0x8C, 0x8C, 0x8C, 0xFF
vertex   2816,    -76,    384,    620,    392,  0x8C, 0x8C, 0x8C, 0xFF
vertex   2406,    128,   -741,   1628,   2648,  0x8C, 0x8C, 0x8C, 0xFF
vertex   2816,    128,   -537,   1884,   1882,  0x8C, 0x8C, 0x8C, 0xFF
vertex   2816,    -76,   -537,   2228,   1996,  0x8C, 0x8C, 0x8C, 0xFF
vertex   2406,    -76,   -741,   1972,   2764,  0x8C, 0x8C, 0x8C, 0xFF
vertex  -2405,    128,    589,  -6034,   6992,  0x8C, 0x8C, 0x8C, 0xFF
vertex  -2815,    -76,    384,  -6632,   7644,  0x8C, 0x8C, 0x8C, 0xFF
vertex  -2405,    -76,    589,  -6378,   6878,  0x8C, 0x8C, 0x8C, 0xFF
vertex  -2815,    128,    384,  -6290,   7758,  0x8C, 0x8C, 0x8C, 0xFF
vertex  -2815,    -76,   -537,  -5026,   9252,  0x8C, 0x8C, 0x8C, 0xFF

rr_seg7_vertex_07007FF0: # 0x07007FF0 - 0x070080F0
vertex  -2405,    128,   -741,  -4374,   8654,  0x96, 0x96, 0x96, 0xFF
vertex   2406,    -76,   -741,   1884,   2904,  0x96, 0x96, 0x96, 0xFF
vertex  -2405,    -76,   -741,  -4118,   8908,  0x96, 0x96, 0x96, 0xFF
vertex   2406,    128,   -741,   1628,   2648,  0x96, 0x96, 0x96, 0xFF
vertex  -2405,    -76,    589,  -6290,   6736,  0x96, 0x96, 0x96, 0xFF
vertex   2406,    128,    589,      0,    990,  0x96, 0x96, 0x96, 0xFF
vertex  -2405,    128,    589,  -6034,   6992,  0x96, 0x96, 0x96, 0xFF
vertex   2406,    -76,    589,   -286,    734,  0x96, 0x96, 0x96, 0xFF
vertex   2816,    -76,    384,    990,    478,  0x7D, 0x7D, 0x7D, 0xFF
vertex   2816,    128,   -537,   1884,   1882,  0x7D, 0x7D, 0x7D, 0xFF
vertex   2816,    128,    384,    734,    734,  0x7D, 0x7D, 0x7D, 0xFF
vertex   2816,    -76,   -537,   2140,   1626,  0x7D, 0x7D, 0x7D, 0xFF
vertex  -2815,    128,    384,  -6290,   7758,  0x7D, 0x7D, 0x7D, 0xFF
vertex  -2815,    128,   -537,  -5140,   8908,  0x7D, 0x7D, 0x7D, 0xFF
vertex  -2815,    -76,   -537,  -5396,   9164,  0x7D, 0x7D, 0x7D, 0xFF
vertex  -2815,    -76,    384,  -6546,   8014,  0x7D, 0x7D, 0x7D, 0xFF

rr_seg7_vertex_070080F0: # 0x070080F0 - 0x07008170
vertex  -2405,    128,   -741,  -4374,   8654,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2405,    128,    589,  -6034,   6992,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2406,    128,    589,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2815,    128,   -537,  -5140,   8908,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2815,    128,    384,  -6290,   7758,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2816,    128,    384,    734,    734,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2816,    128,   -537,   1884,   1882,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2406,    128,   -741,   1628,   2648,  0xFF, 0xFF, 0xFF, 0xFF

rr_seg7_dl_07008170: # 0x07008170 - 0x07008258
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09001800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex rr_seg7_vertex_07007EF0, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0,  0, 15,  1, 0x0
gsSPVertex rr_seg7_vertex_07007FF0, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 14, 15, 0x0
gsSPVertex rr_seg7_vertex_070080F0, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  4, 0x0
gsSP2Triangles  0,  4,  1, 0x0,  0,  2,  5, 0x0
gsSP2Triangles  0,  5,  6, 0x0,  0,  6,  7, 0x0
gsSPEndDisplayList

glabel rr_seg7_dl_07008258 # 0x07008258 - 0x070082C8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList rr_seg7_dl_07008170
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
