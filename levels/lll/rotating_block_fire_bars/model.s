lll_seg7_vertex_07018708: # 0x07018708 - 0x07018808
vertex   -165,      0,      0,      0,    514,  0x95, 0x1A, 0xC2, 0xFF
vertex   -115,    205,      0,    168,  -1014,  0x95, 0x1A, 0xC2, 0xFF
vertex    -57,    205,   -100,   1098,  -1014,  0x95, 0x1A, 0xC2, 0xFF
vertex    -82,      0,   -143,   1296,    514,  0x95, 0x1A, 0xC2, 0xFF
vertex    -57,    205,   -100,   -496,   -838,  0x00, 0x7F, 0x00, 0xFF
vertex   -115,    205,      0,   -960,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    -57,    205,    101,   -496,    774,  0x00, 0x7F, 0x00, 0xFF
vertex     58,    205,    101,    434,    774,  0x00, 0x7F, 0x00, 0xFF
vertex    116,    205,      0,    898,      0,  0x00, 0x7F, 0x00, 0xFF
vertex     58,    205,   -100,    434,   -838,  0x00, 0x7F, 0x00, 0xFF
vertex    -82,      0,    144,   1190,   1638,  0x95, 0x1A, 0x3E, 0xFF
vertex    -57,    205,    101,    990,      0,  0x95, 0x1A, 0x3E, 0xFF
vertex   -165,      0,      0,   -138,   1638,  0x95, 0x1A, 0x3E, 0xFF
vertex    -57,    205,    101,    990,      0,  0x95, 0x1A, 0x3D, 0xFF
vertex   -115,    205,      0,     60,      0,  0x95, 0x1A, 0x3D, 0xFF
vertex   -165,      0,      0,   -138,   1638,  0x95, 0x1A, 0x3D, 0xFF

lll_seg7_vertex_07018808: # 0x07018808 - 0x07018908
vertex    -82,      0,   -143,  -1358,    514,  0x00, 0x1A, 0x84, 0xFF
vertex    -57,    205,   -100,  -1160,  -1014,  0x00, 0x1A, 0x84, 0xFF
vertex     58,    205,   -100,   -230,  -1014,  0x00, 0x1A, 0x84, 0xFF
vertex     83,      0,    144,      0,    990,  0x00, 0x1A, 0x7C, 0xFF
vertex    -57,    205,    101,  -1160,   -682,  0x00, 0x1A, 0x7C, 0xFF
vertex    -82,      0,    144,  -1358,    990,  0x00, 0x1A, 0x7C, 0xFF
vertex     58,    205,    101,   -230,   -682,  0x00, 0x1A, 0x7C, 0xFF
vertex    166,      0,      0,   1296,    990,  0x6B, 0x1A, 0x3D, 0xFF
vertex    116,    205,      0,   1098,   -682,  0x6B, 0x1A, 0x3D, 0xFF
vertex     58,    205,    101,    168,   -682,  0x6B, 0x1A, 0x3D, 0xFF
vertex    166,      0,      0,   1296,    990,  0x6B, 0x1A, 0x3E, 0xFF
vertex     58,    205,    101,    168,   -682,  0x6B, 0x1A, 0x3E, 0xFF
vertex     83,      0,    144,      0,    990,  0x6B, 0x1A, 0x3E, 0xFF
vertex     83,      0,   -143,   -138,   1162,  0x6B, 0x1A, 0xC2, 0xFF
vertex     58,    205,   -100,     60,   -364,  0x6B, 0x1A, 0xC2, 0xFF
vertex    116,    205,      0,    990,   -364,  0x6B, 0x1A, 0xC2, 0xFF

lll_seg7_vertex_07018908: # 0x07018908 - 0x07018968
vertex     83,      0,   -143,   -138,   1162,  0x6B, 0x1A, 0xC2, 0xFF
vertex    116,    205,      0,    990,   -364,  0x6B, 0x1A, 0xC2, 0xFF
vertex    166,      0,      0,   1190,   1162,  0x6B, 0x1A, 0xC2, 0xFF
vertex    -82,      0,   -143,  -1358,    514,  0x00, 0x1A, 0x84, 0xFF
vertex     58,    205,   -100,   -230,  -1014,  0x00, 0x1A, 0x84, 0xFF
vertex     83,      0,   -143,      0,    514,  0x00, 0x1A, 0x84, 0xFF

lll_seg7_dl_07018968: # 0x07018968 - 0x07018A30
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, lll_seg7_texture_07004000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight lll_seg7_light_0700FC08, 1
gsSPLight lll_seg7_light_0700FC00, 2
gsSPVertex lll_seg7_vertex_07018708, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  4,  7,  8, 0x0,  4,  8,  9, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 13, 14, 15, 0x0
gsSPVertex lll_seg7_vertex_07018808, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 13, 14, 15, 0x0
gsSPVertex lll_seg7_vertex_07018908, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPEndDisplayList

glabel lll_seg7_dl_07018A30 # 0x07018A30 - 0x07018AA0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList lll_seg7_dl_07018968
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
