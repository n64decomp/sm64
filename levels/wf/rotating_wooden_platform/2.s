wf_seg7_light_0700E7D0: # 0x0700E7D0 - 0x0700E7D8
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

wf_seg7_light_0700E7D8: # 0x0700E7D8 - 0x0700E7E8
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

wf_seg7_vertex_0700E7E8: # 0x0700E7E8 - 0x0700E8E8
vertex    177,      0,   -101,    922,    224,  0x00, 0x7F, 0x00, 0xFF
vertex    177,      0,    102,    922,    734,  0x00, 0x7F, 0x00, 0xFF
vertex    768,      0,    102,   2396,    734,  0x00, 0x7F, 0x00, 0xFF
vertex    768,      0,   -101,   2396,    224,  0x00, 0x7F, 0x00, 0xFF
vertex   -176,      0,    102,   3940,    990,  0x00, 0x81, 0x00, 0xFF
vertex      0,      0,   -204,   3232,   -236,  0x00, 0x81, 0x00, 0xFF
vertex    177,      0,   -101,   2522,    172,  0x00, 0x81, 0x00, 0xFF
vertex    177,      0,    102,   2522,    990,  0x00, 0x81, 0x00, 0xFF
vertex      0,      0,    205,   3232,   1396,  0x00, 0x81, 0x00, 0xFF
vertex   -176,      0,   -101,   3940,    172,  0x00, 0x81, 0x00, 0xFF
vertex    768,      0,   -101,    166,    172,  0x00, 0x81, 0x00, 0xFF
vertex    768,      0,    102,    166,    990,  0x00, 0x81, 0x00, 0xFF
vertex    177,      0,    102,   2524,    990,  0x00, 0x81, 0x00, 0xFF
vertex      0,      0,   -204,    478,      0,  0x00, 0x7F, 0x00, 0xFF
vertex   -176,      0,    102,     36,    734,  0x00, 0x7F, 0x00, 0xFF
vertex      0,      0,    205,    480,    990,  0x00, 0x7F, 0x00, 0xFF

wf_seg7_vertex_0700E8E8: # 0x0700E8E8 - 0x0700E918
vertex      0,      0,   -204,    478,      0,  0x00, 0x7F, 0x00, 0xFF
vertex   -176,      0,   -101,     36,    224,  0x00, 0x7F, 0x00, 0xFF
vertex   -176,      0,    102,     36,    734,  0x00, 0x7F, 0x00, 0xFF

wf_seg7_dl_0700E918: # 0x0700E918 - 0x0700E9B8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09006800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight wf_seg7_light_0700E7D8, 1
gsSPLight wf_seg7_light_0700E7D0, 2
gsSPVertex wf_seg7_vertex_0700E7E8, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  4,  7,  8, 0x0,  4,  9,  5, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 12,  6, 0x0
gsSP2Triangles 13,  1,  0, 0x0, 13, 14, 15, 0x0
gsSP1Triangle 13, 15,  1, 0x0
gsSPVertex wf_seg7_vertex_0700E8E8, 3, 0
gsSP1Triangle  0,  1,  2, 0x0
gsSPEndDisplayList

glabel wf_seg7_dl_0700E9B8 # 0x0700E9B8 - 0x0700EA28
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList wf_seg7_dl_0700E918
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
