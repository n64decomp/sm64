bbh_seg7_light_0701F6A8: # 0x0701F6A8 - 0x0701F6B0
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

bbh_seg7_light_0701F6B0: # 0x0701F6B0 - 0x0701F6C0
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bbh_seg7_vertex_0701F6C0: # 0x0701F6C0 - 0x0701F780
vertex   -101,      0,   -460,    990,   9164,  0x81, 0x00, 0x00, 0xFF
vertex   -101,   -101,    461,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -101,      0,    461,    990,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -101,   -101,   -460,      0,   9164,  0x81, 0x00, 0x00, 0xFF
vertex    102,      0,    461,    990,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    102,   -101,   -460,      0,   9164,  0x7F, 0x00, 0x00, 0xFF
vertex    102,      0,   -460,    990,   9164,  0x7F, 0x00, 0x00, 0xFF
vertex    102,   -101,    461,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    102,      0,   -460,    990,  -8208,  0x00, 0x7F, 0x00, 0xFF
vertex   -101,      0,    461,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    102,      0,    461,    990,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   -101,      0,   -460,      0,  -8208,  0x00, 0x7F, 0x00, 0xFF

bbh_seg7_dl_0701F780: # 0x0701F780 - 0x0701F7E8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09004800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight bbh_seg7_light_0701F6B0, 1
gsSPLight bbh_seg7_light_0701F6A8, 2
gsSPVertex bbh_seg7_vertex_0701F6C0, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSPEndDisplayList

glabel bbh_seg7_dl_0701F7E8 # 0x0701F7E8 - 0x0701F858
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bbh_seg7_dl_0701F780
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
