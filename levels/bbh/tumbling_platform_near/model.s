bbh_seg7_light_0701F858: # 0x0701F858 - 0x0701F860
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

bbh_seg7_light_0701F860: # 0x0701F860 - 0x0701F870
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bbh_seg7_vertex_0701F870: # 0x0701F870 - 0x0701F960
vertex    102,   -101,    -50,      0,  -1054,  0x7F, 0x00, 0x00, 0xFF
vertex    102,      0,     51,    990,  -2076,  0x7F, 0x00, 0x00, 0xFF
vertex    102,   -101,     51,      0,  -2076,  0x7F, 0x00, 0x00, 0xFF
vertex   -101,      0,    -50,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex    102,      0,    -50,    990,      0,  0x00, 0x00, 0x81, 0xFF
vertex    102,   -101,    -50,    990,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -101,   -101,    -50,      0,    990,  0x00, 0x00, 0x81, 0xFF
vertex    102,      0,     51,    990,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -101,      0,     51,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -101,   -101,     51,      0,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    102,   -101,     51,    990,    990,  0x00, 0x00, 0x7F, 0xFF
vertex   -101,   -101,     51,      0,  -2076,  0x81, 0x00, 0x00, 0xFF
vertex   -101,      0,     51,    990,  -2076,  0x81, 0x00, 0x00, 0xFF
vertex   -101,      0,    -50,    990,  -1054,  0x81, 0x00, 0x00, 0xFF
vertex   -101,   -101,    -50,      0,  -1054,  0x81, 0x00, 0x00, 0xFF

bbh_seg7_vertex_0701F960: # 0x0701F960 - 0x0701FA10
vertex    102,      0,    -50,    990,   2010,  0x00, 0x7F, 0x00, 0xFF
vertex   -101,      0,     51,      0,   3032,  0x00, 0x7F, 0x00, 0xFF
vertex    102,      0,     51,    990,   3032,  0x00, 0x7F, 0x00, 0xFF
vertex    102,   -101,    -50,      0,  -1054,  0x7F, 0x00, 0x00, 0xFF
vertex    102,      0,    -50,    990,  -1054,  0x7F, 0x00, 0x00, 0xFF
vertex    102,      0,     51,    990,  -2076,  0x7F, 0x00, 0x00, 0xFF
vertex    102,   -101,     51,    990,   3032,  0x00, 0x81, 0x00, 0xFF
vertex   -101,   -101,     51,      0,   3032,  0x00, 0x81, 0x00, 0xFF
vertex   -101,   -101,    -50,      0,   2010,  0x00, 0x81, 0x00, 0xFF
vertex    102,   -101,    -50,    990,   2010,  0x00, 0x81, 0x00, 0xFF
vertex   -101,      0,    -50,      0,   2010,  0x00, 0x7F, 0x00, 0xFF

bbh_seg7_dl_0701FA10: # 0x0701FA10 - 0x0701FAB0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09004800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight bbh_seg7_light_0701F860, 1
gsSPLight bbh_seg7_light_0701F858, 2
gsSPVertex bbh_seg7_vertex_0701F870, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex bbh_seg7_vertex_0701F960, 11, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  8,  9, 0x0
gsSP1Triangle  0, 10,  1, 0x0
gsSPEndDisplayList

glabel bbh_seg7_dl_0701FAB0 # 0x0701FAB0 - 0x0701FB20
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bbh_seg7_dl_0701FA10
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
