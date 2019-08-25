bbh_seg7_vertex_0701EF58: # 0x0701EF58 - 0x0701F018
vertex  -1561,    538,  -1673,    478,    990,  0xFF, 0xCC, 0x90, 0xFF
vertex  -1535,    614,  -1648,      0,      0,  0xFF, 0xCC, 0x90, 0xFF
vertex  -1535,    538,  -1648,      0,    990,  0xFF, 0xCC, 0x90, 0xFF
vertex  -1561,    614,  -1673,    480,      0,  0xFF, 0xCC, 0x90, 0xFF
vertex  -1586,    538,  -1648,    990,    990,  0xFF, 0xCC, 0x90, 0xFF
vertex  -1561,    538,  -1673,    480,    990,  0xFF, 0xCC, 0x90, 0xFF
vertex  -1586,    614,  -1648,    990,      0,  0xFF, 0xCC, 0x90, 0xFF
vertex  -1561,    614,  -1673,    480,    990,  0xFF, 0xCC, 0x90, 0xFF
vertex  -1586,    614,  -1648,    990,    480,  0xFF, 0xCC, 0x90, 0xFF
vertex  -1535,    614,  -1648,      0,    480,  0xFF, 0xCC, 0x90, 0xFF
vertex  -1586,    538,  -1648,    990,    480,  0xFF, 0xCC, 0x90, 0xFF
vertex  -1535,    538,  -1648,      0,    480,  0xFF, 0xCC, 0x90, 0xFF

bbh_seg7_dl_0701F018: # 0x0701F018 - 0x0701F070
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09006800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bbh_seg7_vertex_0701EF58, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  3,  5, 0x0,  4,  6,  3, 0x0
gsSP2Triangles  7,  8,  9, 0x0, 10,  5, 11, 0x0
gsSPEndDisplayList

glabel bbh_seg7_dl_0701F070 # 0x0701F070 - 0x0701F0E0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bbh_seg7_dl_0701F018
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
