bbh_seg7_light_0701F378: # 0x0701F378 - 0x0701F380
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

bbh_seg7_light_0701F380: # 0x0701F380 - 0x0701F390
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bbh_seg7_vertex_0701F390: # 0x0701F390 - 0x0701F3D0
vertex    307,   -101,    256,    698,    260,  0x00, 0x81, 0x00, 0xFF
vertex   -306,   -101,    256,    260,    260,  0x00, 0x81, 0x00, 0xFF
vertex   -306,   -101,   -255,    260,    624,  0x00, 0x81, 0x00, 0xFF
vertex    307,   -101,   -255,    698,    624,  0x00, 0x81, 0x00, 0xFF

bbh_seg7_vertex_0701F3D0: # 0x0701F3D0 - 0x0701F4D0
vertex    307,      0,    256,   2522,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    307,   -101,   -255,      0,    988,  0x7F, 0x00, 0x00, 0xFF
vertex    307,      0,   -255,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    307,      0,   -255,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex   -306,   -101,   -255,   3034,    992,  0x00, 0x00, 0x81, 0xFF
vertex   -306,      0,   -255,   3034,      0,  0x00, 0x00, 0x81, 0xFF
vertex    307,   -101,   -255,      0,    992,  0x00, 0x00, 0x81, 0xFF
vertex   -306,      0,   -255,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -306,   -101,   -255,      0,    988,  0x81, 0x00, 0x00, 0xFF
vertex   -306,   -101,    256,   2522,    988,  0x81, 0x00, 0x00, 0xFF
vertex   -306,      0,    256,   2522,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -306,      0,    256,   3034,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -306,   -101,    256,   3034,    992,  0x00, 0x00, 0x7F, 0xFF
vertex    307,   -101,    256,      0,    992,  0x00, 0x00, 0x7F, 0xFF
vertex    307,      0,    256,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    307,   -101,    256,   2522,    988,  0x7F, 0x00, 0x00, 0xFF

bbh_seg7_vertex_0701F4D0: # 0x0701F4D0 - 0x0701F510
vertex    307,      0,   -255,   5080,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   -306,      0,    256,      0,  -5142,  0x00, 0x7F, 0x00, 0xFF
vertex    307,      0,    256,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   -306,      0,   -255,   5076,  -5142,  0x00, 0x7F, 0x00, 0xFF

bbh_seg7_dl_0701F510: # 0x0701F510 - 0x0701F558
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09008800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight bbh_seg7_light_0701F380, 1
gsSPLight bbh_seg7_light_0701F378, 2
gsSPVertex bbh_seg7_vertex_0701F390, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

bbh_seg7_dl_0701F558: # 0x0701F558 - 0x0701F5C0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09005000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex bbh_seg7_vertex_0701F3D0, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 13, 14, 0x0,  0, 15,  1, 0x0
gsSPEndDisplayList

bbh_seg7_dl_0701F5C0: # 0x0701F5C0 - 0x0701F5F8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09009000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPVertex bbh_seg7_vertex_0701F4D0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel bbh_seg7_dl_0701F5F8 # 0x0701F5F8 - 0x0701F6A8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bbh_seg7_dl_0701F510
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList bbh_seg7_dl_0701F558
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList bbh_seg7_dl_0701F5C0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
