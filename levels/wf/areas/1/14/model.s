wf_seg7_light_07009E30: # 0x07009E30 - 0x07009E38
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

wf_seg7_light_07009E38: # 0x07009E38 - 0x07009E48
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

wf_seg7_vertex_07009E48: # 0x07009E48 - 0x07009F48
vertex     15,      0,      0,   1502,    990,  0x6F, 0x00, 0x3C, 0xFF
vertex      8,   2100,     13,    990, -19972,  0x6F, 0x00, 0x3C, 0xFF
vertex      8,      0,     13,    990,    990,  0x6F, 0x00, 0x3C, 0xFF
vertex     -7,   2100,    -12,    156,   1020,  0x00, 0x7F, 0x00, 0xFF
vertex    -14,   2100,      0,    768,   1020,  0x00, 0x7F, 0x00, 0xFF
vertex     -7,   2100,     13,   1076,    490,  0x00, 0x7F, 0x00, 0xFF
vertex      8,   2100,     13,    768,    -40,  0x00, 0x7F, 0x00, 0xFF
vertex     15,   2100,      0,    156,    -40,  0x00, 0x7F, 0x00, 0xFF
vertex      8,   2100,    -12,   -150,    490,  0x00, 0x7F, 0x00, 0xFF
vertex      8,      0,     13,    990,    990,  0x00, 0x00, 0x7F, 0xFF
vertex     -7,   2100,     13,    480, -19972,  0x00, 0x00, 0x7F, 0xFF
vertex     -7,      0,     13,    480,    990,  0x00, 0x00, 0x7F, 0xFF
vertex     -7,      0,     13,    480,    990,  0x91, 0x00, 0x3C, 0xFF
vertex    -14,   2100,      0,      0, -19972,  0x91, 0x00, 0x3C, 0xFF
vertex    -14,      0,      0,      0,    990,  0x91, 0x00, 0x3C, 0xFF
vertex     -7,   2100,     13,    480, -19972,  0x91, 0x00, 0x3C, 0xFF

wf_seg7_vertex_07009F48: # 0x07009F48 - 0x0700A048
vertex      8,      0,     13,    990,    990,  0x00, 0x00, 0x7F, 0xFF
vertex      8,   2100,     13,    990, -19972,  0x00, 0x00, 0x7F, 0xFF
vertex     -7,   2100,     13,    480, -19972,  0x00, 0x00, 0x7F, 0xFF
vertex    -14,      0,      0,   3034,    990,  0x93, 0x00, 0xC1, 0xFF
vertex    -14,   2100,      0,   3034, -19972,  0x93, 0x00, 0xC1, 0xFF
vertex     -7,   2100,    -12,   2524, -19972,  0x93, 0x00, 0xC1, 0xFF
vertex     15,      0,      0,   1502,    990,  0x6F, 0x00, 0x3C, 0xFF
vertex     15,   2100,      0,   1502, -19972,  0x6F, 0x00, 0x3C, 0xFF
vertex      8,   2100,     13,    990, -19972,  0x6F, 0x00, 0x3C, 0xFF
vertex      8,      0,    -12,   2012,    990,  0x6D, 0x00, 0xC1, 0xFF
vertex     15,   2100,      0,   1502, -19972,  0x6D, 0x00, 0xC1, 0xFF
vertex     15,      0,      0,   1502,    990,  0x6D, 0x00, 0xC1, 0xFF
vertex      8,   2100,    -12,   2012, -19972,  0x6D, 0x00, 0xC1, 0xFF
vertex     -7,      0,    -12,   2524,    990,  0x00, 0x00, 0x81, 0xFF
vertex      8,   2100,    -12,   2012, -19972,  0x00, 0x00, 0x81, 0xFF
vertex      8,      0,    -12,   2012,    990,  0x00, 0x00, 0x81, 0xFF

wf_seg7_vertex_0700A048: # 0x0700A048 - 0x0700A0A8
vertex     -7,      0,    -12,   2524,    990,  0x00, 0x00, 0x81, 0xFF
vertex     -7,   2100,    -12,   2524, -19972,  0x00, 0x00, 0x81, 0xFF
vertex      8,   2100,    -12,   2012, -19972,  0x00, 0x00, 0x81, 0xFF
vertex    -14,      0,      0,   3034,    990,  0x93, 0x00, 0xC1, 0xFF
vertex     -7,   2100,    -12,   2524, -19972,  0x93, 0x00, 0xC1, 0xFF
vertex     -7,      0,    -12,   2524,    990,  0x93, 0x00, 0xC1, 0xFF

wf_seg7_dl_0700A0A8: # 0x0700A0A8 - 0x0700A170
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09007800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight wf_seg7_light_07009E38, 1
gsSPLight wf_seg7_light_07009E30, 2
gsSPVertex wf_seg7_vertex_07009E48, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  3,  6,  7, 0x0
gsSP2Triangles  3,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 15, 13, 0x0
gsSPVertex wf_seg7_vertex_07009F48, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP2Triangles  9, 12, 10, 0x0, 13, 14, 15, 0x0
gsSPVertex wf_seg7_vertex_0700A048, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPEndDisplayList

glabel wf_seg7_dl_0700A170 # 0x0700A170 - 0x0700A1E0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList wf_seg7_dl_0700A0A8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
