bits_seg7_vertex_07012B80: # 0x07012B80 - 0x07012C80
vertex    563,    205,   -204,    990,   2112,  0xFF, 0x7C, 0x00, 0xFF
vertex   -460,      0,   -204,      0,     72,  0xFF, 0x7C, 0x00, 0xFF
vertex   -460,    205,   -204,    990,     72,  0xFF, 0x7C, 0x00, 0xFF
vertex    563,      0,   -204,      0,   2112,  0xFF, 0x7C, 0x00, 0xFF
vertex   -460,    205,    205,    990,     72,  0xFF, 0x7C, 0x00, 0xFF
vertex   -460,      0,    205,      0,     72,  0xFF, 0x7C, 0x00, 0xFF
vertex    563,      0,    205,      0,   2112,  0xFF, 0x7C, 0x00, 0xFF
vertex    563,    205,    205,    990,   2112,  0xFF, 0x7C, 0x00, 0xFF
vertex   -460,    205,   -204,    990,     72,  0xFF, 0x8B, 0x18, 0xFF
vertex   -460,      0,   -204,      0,     72,  0xFF, 0x8B, 0x18, 0xFF
vertex   -460,      0,    205,      0,     72,  0xFF, 0x8B, 0x18, 0xFF
vertex   -460,    205,    205,    990,     72,  0xFF, 0x8B, 0x18, 0xFF
vertex   -460,    205,    205,    990,     72,  0xFF, 0xB4, 0x4C, 0xFF
vertex    563,    205,    205,    990,   2112,  0xFF, 0xB4, 0x4C, 0xFF
vertex    563,    205,   -204,    990,   2112,  0xFF, 0xB4, 0x4C, 0xFF
vertex   -460,    205,   -204,    990,     72,  0xFF, 0xB4, 0x4C, 0xFF

bits_seg7_vertex_07012C80: # 0x07012C80 - 0x07012CC0
vertex    563,      0,    205,      0,   2112,  0x78, 0x3C, 0x00, 0xFF
vertex   -460,      0,    205,      0,     72,  0x78, 0x3C, 0x00, 0xFF
vertex   -460,      0,   -204,      0,     72,  0x78, 0x3C, 0x00, 0xFF
vertex    563,      0,   -204,      0,   2112,  0x78, 0x3C, 0x00, 0xFF

bits_seg7_dl_07012CC0: # 0x07012CC0 - 0x07012D40
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09002000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex bits_seg7_vertex_07012B80, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 10, 11, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 14, 15, 0x0
gsSPVertex bits_seg7_vertex_07012C80, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel bits_seg7_dl_07012D40 # 0x07012D40 - 0x07012DB0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList bits_seg7_dl_07012CC0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
