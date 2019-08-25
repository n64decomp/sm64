wdw_seg7_light_07013238: # 0x07013238 - 0x07013240
.byte 0x99, 0x99, 0x99, 0x00, 0x99, 0x99, 0x99, 0x00

wdw_seg7_light_07013240: # 0x07013240 - 0x07013250
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

wdw_seg7_vertex_07013250: # 0x07013250 - 0x07013340
vertex    193,      0,    193,    990,    990,  0x00, 0x81, 0x00, 0xFF
vertex   -190,      0,    193,    990,  -2076,  0x00, 0x81, 0x00, 0xFF
vertex   -190,      0,   -190,  -2074,  -2076,  0x00, 0x81, 0x00, 0xFF
vertex    193,    128,   -190,      0,    990,  0x00, 0x00, 0x81, 0xFF
vertex    193,      0,   -190,    990,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -190,      0,   -190,    990,  -2076,  0x00, 0x00, 0x81, 0xFF
vertex   -190,    128,   -190,      0,  -2076,  0x00, 0x00, 0x81, 0xFF
vertex    193,    128,    193,    990,  -2076,  0x7F, 0x00, 0x00, 0xFF
vertex    193,      0,    193,      0,  -2076,  0x7F, 0x00, 0x00, 0xFF
vertex    193,      0,   -190,      0,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    193,    128,   -190,    990,    990,  0x7F, 0x00, 0x00, 0xFF
vertex   -190,    128,    193,      0,  -2076,  0x00, 0x00, 0x7F, 0xFF
vertex   -190,      0,    193,    990,  -2076,  0x00, 0x00, 0x7F, 0xFF
vertex    193,      0,    193,    990,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    193,    128,    193,      0,    990,  0x00, 0x00, 0x7F, 0xFF

wdw_seg7_vertex_07013340: # 0x07013340 - 0x070133F0
vertex    193,    128,   -190,  -2074,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   -190,    128,    193,    990,  -2076,  0x00, 0x7F, 0x00, 0xFF
vertex    193,    128,    193,    990,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    193,      0,    193,    990,    990,  0x00, 0x81, 0x00, 0xFF
vertex   -190,      0,   -190,  -2074,  -2076,  0x00, 0x81, 0x00, 0xFF
vertex    193,      0,   -190,  -2074,    990,  0x00, 0x81, 0x00, 0xFF
vertex   -190,    128,   -190,    990,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -190,      0,    193,      0,  -2076,  0x81, 0x00, 0x00, 0xFF
vertex   -190,    128,    193,    990,  -2076,  0x81, 0x00, 0x00, 0xFF
vertex   -190,      0,   -190,      0,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -190,    128,   -190,  -2074,  -2076,  0x00, 0x7F, 0x00, 0xFF

wdw_seg7_dl_070133F0: # 0x070133F0 - 0x07013490
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09006800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight wdw_seg7_light_07013240, 1
gsSPLight wdw_seg7_light_07013238, 2
gsSPVertex wdw_seg7_vertex_07013250, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex wdw_seg7_vertex_07013340, 11, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  9,  7, 0x0
gsSP1Triangle  0, 10,  1, 0x0
gsSPEndDisplayList

glabel wdw_seg7_dl_07013490 # 0x07013490 - 0x07013500
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList wdw_seg7_dl_070133F0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
