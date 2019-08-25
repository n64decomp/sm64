wdw_seg7_light_07013EB8: # 0x07013EB8 - 0x07013EC0
.byte 0x99, 0x99, 0x99, 0x00, 0x99, 0x99, 0x99, 0x00

wdw_seg7_light_07013EC0: # 0x07013EC0 - 0x07013ED0
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

wdw_seg7_vertex_07013ED0: # 0x07013ED0 - 0x07013FC0
vertex      0,      0,      0,   1738,      0,  0x1F, 0x93, 0xC9, 0xFF
vertex      0,    128,   -255,   1738,  -2076,  0x1F, 0x93, 0xC9, 0xFF
vertex    222,    128,   -127,      0,  -1054,  0x1F, 0x93, 0xC9, 0xFF
vertex      0,    128,   -255,   1738,  -2076,  0x00, 0x7F, 0x00, 0xFF
vertex   -221,    128,   -127,   3508,  -1054,  0x00, 0x7F, 0x00, 0xFF
vertex   -221,    128,    128,   3508,    990,  0x00, 0x7F, 0x00, 0xFF
vertex      0,    128,    256,   1738,   2010,  0x00, 0x7F, 0x00, 0xFF
vertex    222,    128,    128,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    222,    128,   -127,      0,  -1054,  0x00, 0x7F, 0x00, 0xFF
vertex      0,      0,      0,   1738,      0,  0xE1, 0x93, 0xC9, 0xFF
vertex   -221,    128,   -127,   3508,  -1054,  0xE1, 0x93, 0xC9, 0xFF
vertex      0,    128,   -255,   1738,  -2076,  0xE1, 0x93, 0xC9, 0xFF
vertex      0,      0,      0,   1738,      0,  0xC1, 0x93, 0x00, 0xFF
vertex   -221,    128,    128,   3508,    990,  0xC1, 0x93, 0x00, 0xFF
vertex   -221,    128,   -127,   3508,  -1054,  0xC1, 0x93, 0x00, 0xFF

wdw_seg7_vertex_07013FC0: # 0x07013FC0 - 0x07014050
vertex      0,      0,      0,   1738,      0,  0xE1, 0x93, 0x36, 0xFF
vertex      0,    128,    256,   1738,   2010,  0xE1, 0x93, 0x36, 0xFF
vertex   -221,    128,    128,   3508,    990,  0xE1, 0x93, 0x36, 0xFF
vertex      0,      0,      0,   1738,      0,  0x1F, 0x93, 0x36, 0xFF
vertex    222,    128,    128,      0,    990,  0x1F, 0x93, 0x36, 0xFF
vertex      0,    128,    256,   1738,   2010,  0x1F, 0x93, 0x36, 0xFF
vertex      0,      0,      0,   1738,      0,  0x3F, 0x92, 0x00, 0xFF
vertex    222,    128,   -127,      0,  -1054,  0x3F, 0x92, 0x00, 0xFF
vertex    222,    128,    128,      0,    990,  0x3F, 0x92, 0x00, 0xFF

wdw_seg7_dl_07014050: # 0x07014050 - 0x070140E0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09008000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight wdw_seg7_light_07013EC0, 1
gsSPLight wdw_seg7_light_07013EB8, 2
gsSPVertex wdw_seg7_vertex_07013ED0, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  3,  6,  7, 0x0
gsSP2Triangles  3,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPVertex wdw_seg7_vertex_07013FC0, 9, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP1Triangle  6,  7,  8, 0x0
gsSPEndDisplayList

glabel wdw_seg7_dl_070140E0 # 0x070140E0 - 0x07014150
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList wdw_seg7_dl_07014050
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
