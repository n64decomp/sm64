wf_seg7_light_0700E440: # 0x0700E440 - 0x0700E448
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

wf_seg7_light_0700E448: # 0x0700E448 - 0x0700E458
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

wf_seg7_vertex_0700E458: # 0x0700E458 - 0x0700E548
vertex    768,   -127,      0,    582,    478,  0x7F, 0x00, 0x00, 0xFF
vertex    768,      0,   -101,    172,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    768,      0,    102,    990,      0,  0x7F, 0x00, 0x00, 0xFF
vertex      0,      0,    205,    990,      0,  0x25, 0x99, 0x3F, 0xFF
vertex      0,   -127,      0,    990,    990,  0x25, 0x99, 0x3F, 0xFF
vertex    177,      0,    102,   1876,    478,  0x25, 0x99, 0x3F, 0xFF
vertex   -176,      0,    102,    104,    478,  0xDB, 0x99, 0x3F, 0xFF
vertex      0,   -127,      0,    990,    990,  0xDB, 0x99, 0x3F, 0xFF
vertex      0,      0,    205,    990,      0,  0xDB, 0x99, 0x3F, 0xFF
vertex   -176,      0,   -101,    104,   1498,  0xB6, 0x9A, 0x00, 0xFF
vertex      0,   -127,      0,    990,    990,  0xB6, 0x9A, 0x00, 0xFF
vertex   -176,      0,    102,    104,    478,  0xB6, 0x9A, 0x00, 0xFF
vertex      0,      0,   -204,    990,   2010,  0xDB, 0x99, 0xC0, 0xFF
vertex      0,   -127,      0,    990,    990,  0xDB, 0x99, 0xC0, 0xFF
vertex   -176,      0,   -101,    104,   1498,  0xDB, 0x99, 0xC0, 0xFF

wf_seg7_vertex_0700E548: # 0x0700E548 - 0x0700E638
vertex    177,      0,   -101,   1876,   1500,  0x25, 0x99, 0xC0, 0xFF
vertex      0,   -127,      0,    990,    990,  0x25, 0x99, 0xC0, 0xFF
vertex      0,      0,   -204,    990,   2010,  0x25, 0x99, 0xC0, 0xFF
vertex      0,   -127,      0,    990,    990,  0x00, 0xB1, 0x63, 0xFF
vertex    768,   -127,      0,   4822,    990,  0x00, 0xB1, 0x63, 0xFF
vertex    768,      0,    102,   4822,    478,  0x00, 0xB1, 0x63, 0xFF
vertex    177,      0,    102,   1876,    480,  0x00, 0xB1, 0x63, 0xFF
vertex    768,   -127,      0,   4822,    990,  0x00, 0xB1, 0x9D, 0xFF
vertex      0,   -127,      0,    990,    990,  0x00, 0xB1, 0x9D, 0xFF
vertex    177,      0,   -101,   1876,   1500,  0x00, 0xB1, 0x9D, 0xFF
vertex    768,      0,   -101,   4822,   1498,  0x00, 0xB1, 0x9D, 0xFF
vertex    177,      0,   -101,    922,    224,  0x00, 0x7F, 0x00, 0xFF
vertex    177,      0,    102,    922,    734,  0x00, 0x7F, 0x00, 0xFF
vertex    768,      0,    102,   2396,    734,  0x00, 0x7F, 0x00, 0xFF
vertex    768,      0,   -101,   2396,    224,  0x00, 0x7F, 0x00, 0xFF

wf_seg7_vertex_0700E638: # 0x0700E638 - 0x0700E698
vertex      0,      0,   -204,    478,      0,  0x00, 0x7F, 0x00, 0xFF
vertex      0,      0,    205,    480,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    177,      0,    102,    922,    734,  0x00, 0x7F, 0x00, 0xFF
vertex   -176,      0,   -101,     36,    224,  0x00, 0x7F, 0x00, 0xFF
vertex   -176,      0,    102,     36,    734,  0x00, 0x7F, 0x00, 0xFF
vertex    177,      0,   -101,    922,    224,  0x00, 0x7F, 0x00, 0xFF

wf_seg7_dl_0700E698: # 0x0700E698 - 0x0700E760
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09006800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight wf_seg7_light_0700E448, 1
gsSPLight wf_seg7_light_0700E440, 2
gsSPVertex wf_seg7_vertex_0700E458, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPVertex wf_seg7_vertex_0700E548, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  3,  5, 0x0,  7,  8,  9, 0x0
gsSP2Triangles 10,  7,  9, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex wf_seg7_vertex_0700E638, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  4, 0x0
gsSP2Triangles  0,  4,  1, 0x0,  0,  2,  5, 0x0
gsSPEndDisplayList

glabel wf_seg7_dl_0700E760 # 0x0700E760 - 0x0700E7D0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList wf_seg7_dl_0700E698
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
