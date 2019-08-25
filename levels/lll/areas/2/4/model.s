lll_seg7_vertex_07025648: # 0x07025648 - 0x07025708
vertex   -425,   7373,    246,    -46,    622,  0xFF, 0xFF, 0xFF, 0xFF
vertex    246,   7373,   -425,    622,    -48,  0xFF, 0xFF, 0xFF, 0xFF
vertex    426,   7373,   -245,    802,    132,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   7373,   -491,    376,   -114,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -425,   7373,   -245,    -46,    132,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -245,   7373,   -425,    132,    -48,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -491,   7373,      0,   -112,    376,  0xFF, 0xFF, 0xFF, 0xFF
vertex    246,   7373,    426,    622,    802,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,   7373,    492,    376,    868,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -245,   7373,    426,    132,    802,  0xFF, 0xFF, 0xFF, 0xFF
vertex    426,   7373,    246,    802,    622,  0xFF, 0xFF, 0xFF, 0xFF
vertex    492,   7373,      0,    868,    376,  0xFF, 0xFF, 0xFF, 0xFF

lll_seg7_vertex_07025708: # 0x07025708 - 0x07025808
vertex    532,   7168,    307,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    307,   7168,    532,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    102,   7168,    177,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex   -613,   7168,      0,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex   -181,   7168,    -92,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex   -204,   7168,      0,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex   -531,   7168,   -306,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex   -176,   7168,    102,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex   -531,   7168,    307,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex   -306,   7168,    532,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex   -101,   7168,    177,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex      0,   7168,    614,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex      0,   7168,    205,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex   -306,   7168,   -531,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex      0,   7168,   -204,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex   -101,   7168,   -176,      0,      0,  0x00, 0x00, 0x00, 0xFF

lll_seg7_vertex_07025808: # 0x07025808 - 0x070258F8
vertex    532,   7168,    307,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    102,   7168,    177,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    177,   7168,    102,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    614,   7168,      0,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    205,   7168,      0,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    532,   7168,   -306,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    177,   7168,   -101,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    307,   7168,   -531,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex    102,   7168,   -176,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex      0,   7168,   -613,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex      0,   7168,   -204,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex   -306,   7168,   -531,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex   -531,   7168,   -306,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex   -101,   7168,   -176,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex   -181,   7168,    -92,      0,      0,  0x00, 0x00, 0x00, 0xFF

lll_seg7_dl_070258F8: # 0x070258F8 - 0x07025970
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fire_09009000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex lll_seg7_vertex_07025648, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  0,  4,  5, 0x0,  0,  5,  3, 0x0
gsSP2Triangles  0,  6,  4, 0x0,  0,  7,  8, 0x0
gsSP2Triangles  0,  8,  9, 0x0,  0, 10,  7, 0x0
gsSP2Triangles  0, 11, 10, 0x0,  0,  2, 11, 0x0
gsSPEndDisplayList

lll_seg7_dl_07025970: # 0x07025970 - 0x07025A48
gsSPVertex lll_seg7_vertex_07025708, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  3,  7,  8, 0x0
gsSP2Triangles  3,  5,  7, 0x0,  9,  8,  7, 0x0
gsSP2Triangles  9,  7, 10, 0x0, 11,  9, 10, 0x0
gsSP2Triangles 11, 10, 12, 0x0,  1, 11, 12, 0x0
gsSP2Triangles  1, 12,  2, 0x0, 13, 14, 15, 0x0
gsSPVertex lll_seg7_vertex_07025808, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  2, 0x0
gsSP2Triangles  3,  2,  4, 0x0,  5,  3,  4, 0x0
gsSP2Triangles  5,  4,  6, 0x0,  7,  5,  6, 0x0
gsSP2Triangles  7,  6,  8, 0x0,  9,  7,  8, 0x0
gsSP2Triangles  9,  8, 10, 0x0, 11,  9, 10, 0x0
gsSP2Triangles 12, 11, 13, 0x0, 12, 13, 14, 0x0
gsSPEndDisplayList

glabel lll_seg7_dl_07025A48 # 0x07025A48 - 0x07025AC0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList lll_seg7_dl_070258F8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPDisplayList lll_seg7_dl_07025970
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
