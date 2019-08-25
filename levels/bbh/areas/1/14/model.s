bbh_seg7_light_0700D350: # 0x0700D350 - 0x0700D358
.byte 0x3F, 0x51, 0x66, 0x00, 0x3F, 0x51, 0x66, 0x00

bbh_seg7_light_0700D358: # 0x0700D358 - 0x0700D368
.byte 0x9E, 0xCC, 0xFF, 0x00, 0x9E, 0xCC, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bbh_seg7_vertex_0700D368: # 0x0700D368 - 0x0700D428
vertex  -1740,   1536,   2550,    990,      0,  0x00, 0x00, 0x81, 0xFF
vertex  -1330,   1536,   2550,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex  -1330,   1126,   2550,      0,    990,  0x00, 0x00, 0x81, 0xFF
vertex  -1740,   1126,   2550,    990,    990,  0x00, 0x00, 0x81, 0xFF
vertex  -1740,    614,   2550,    990,      0,  0x00, 0x00, 0x81, 0xFF
vertex  -1330,    614,   2550,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex  -1330,    205,   2550,      0,    990,  0x00, 0x00, 0x81, 0xFF
vertex  -1740,    205,   2550,    990,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -613,    614,   2038,    990,      0,  0x00, 0x00, 0x81, 0xFF
vertex   -204,    614,   2038,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex   -204,    205,   2038,      0,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -613,    205,   2038,    990,    990,  0x00, 0x00, 0x81, 0xFF

bbh_seg7_dl_0700D428: # 0x0700D428 - 0x0700D490
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09006000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight bbh_seg7_light_0700D358, 1
gsSPLight bbh_seg7_light_0700D350, 2
gsSPVertex bbh_seg7_vertex_0700D368, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 10, 11, 0x0
gsSPEndDisplayList

glabel bbh_seg7_dl_0700D490 # 0x0700D490 - 0x0700D500
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bbh_seg7_dl_0700D428
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
