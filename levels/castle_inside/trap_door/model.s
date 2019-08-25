inside_castle_seg7_light_0703BAB0: # 0x0703BAB0 - 0x0703BAB8
.byte 0x5F, 0x5F, 0x5F, 0x00, 0x5F, 0x5F, 0x5F, 0x00

inside_castle_seg7_light_0703BAB8: # 0x0703BAB8 - 0x0703BAC8
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

inside_castle_seg7_vertex_0703BAC8: # 0x0703BAC8 - 0x0703BBB8
vertex    358,      0,    307,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    358,   -101,    307,      0,    480,  0x7F, 0x00, 0x00, 0xFF
vertex    358,   -101,   -306,   3034,    480,  0x7F, 0x00, 0x00, 0xFF
vertex    358,      0,   -306,   1756,      0,  0x00, 0x00, 0x81, 0xFF
vertex    358,   -101,   -306,   1756,    478,  0x00, 0x00, 0x81, 0xFF
vertex      0,   -101,   -306,      0,    478,  0x00, 0x00, 0x81, 0xFF
vertex      0,      0,   -306,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex      0,      0,   -306,   3034,      0,  0x81, 0x00, 0x00, 0xFF
vertex      0,   -101,   -306,   3034,    480,  0x81, 0x00, 0x00, 0xFF
vertex      0,   -101,    307,      0,    480,  0x81, 0x00, 0x00, 0xFF
vertex      0,      0,    307,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex      0,      0,    307,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    358,   -101,    307,   1756,    478,  0x00, 0x00, 0x7F, 0xFF
vertex    358,      0,    307,   1756,      0,  0x00, 0x00, 0x7F, 0xFF
vertex      0,   -101,    307,      0,    478,  0x00, 0x00, 0x7F, 0xFF

inside_castle_seg7_vertex_0703BBB8: # 0x0703BBB8 - 0x0703BC28
vertex    358,      0,   -306,   1756,  -2076,  0x00, 0x7F, 0x00, 0xFF
vertex      0,      0,    307,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    358,      0,    307,   1756,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    358,      0,    307,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    358,   -101,   -306,   3034,    480,  0x7F, 0x00, 0x00, 0xFF
vertex    358,      0,   -306,   3034,      0,  0x7F, 0x00, 0x00, 0xFF
vertex      0,      0,   -306,      0,  -2076,  0x00, 0x7F, 0x00, 0xFF

inside_castle_seg7_dl_0703BC28: # 0x0703BC28 - 0x0703BCB8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_09005000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight inside_castle_seg7_light_0703BAB8, 1
gsSPLight inside_castle_seg7_light_0703BAB0, 2
gsSPVertex inside_castle_seg7_vertex_0703BAC8, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 14, 12, 0x0
gsSPVertex inside_castle_seg7_vertex_0703BBB8, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP1Triangle  0,  6,  1, 0x0
gsSPEndDisplayList

glabel inside_castle_seg7_dl_0703BCB8 # 0x0703BCB8 - 0x0703BD28
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList inside_castle_seg7_dl_0703BC28
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
