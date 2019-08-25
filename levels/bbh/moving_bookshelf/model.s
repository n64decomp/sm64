bbh_seg7_light_0701FB20: # 0x0701FB20 - 0x0701FB28
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

bbh_seg7_light_0701FB28: # 0x0701FB28 - 0x0701FB38
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bbh_seg7_vertex_0701FB38: # 0x0701FB38 - 0x0701FB78
vertex   -255,    819,   -204,    990,      0,  0x00, 0x00, 0x81, 0xFF
vertex   -153,    819,   -204,    734,      0,  0x00, 0x00, 0x81, 0xFF
vertex   -153,      0,   -204,    734,   2012,  0x00, 0x00, 0x81, 0xFF
vertex   -255,      0,   -204,    990,   2012,  0x00, 0x00, 0x81, 0xFF

bbh_seg7_vertex_0701FB78: # 0x0701FB78 - 0x0701FC78
vertex   -255,      0,    205,   2012,   2012,  0x81, 0x00, 0x00, 0xFF
vertex   -255,    512,    205,   2012,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -255,    512,   -204,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -153,    512,   -204,   2012,      0,  0x00, 0x00, 0x81, 0xFF
vertex    256,      0,   -204,      0,   2012,  0x00, 0x00, 0x81, 0xFF
vertex   -153,      0,   -204,   2012,   2012,  0x00, 0x00, 0x81, 0xFF
vertex    256,    512,   -204,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex   -153,    819,   -204,   2012,    580,  0x00, 0x00, 0x81, 0xFF
vertex    256,    512,   -204,      0,   1808,  0x00, 0x00, 0x81, 0xFF
vertex   -153,    512,   -204,   2012,   1808,  0x00, 0x00, 0x81, 0xFF
vertex    256,    819,   -204,      0,    580,  0x00, 0x00, 0x81, 0xFF
vertex   -255,    512,    205,   2012,   1808,  0x81, 0x00, 0x00, 0xFF
vertex   -255,    819,   -204,      0,    580,  0x81, 0x00, 0x00, 0xFF
vertex   -255,    512,   -204,      0,   1808,  0x81, 0x00, 0x00, 0xFF
vertex   -255,    819,    205,   2012,    580,  0x81, 0x00, 0x00, 0xFF
vertex   -255,      0,   -204,      0,   2012,  0x81, 0x00, 0x00, 0xFF

bbh_seg7_dl_0701FC78: # 0x0701FC78 - 0x0701FCC0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09003800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPLight bbh_seg7_light_0701FB28, 1
gsSPLight bbh_seg7_light_0701FB20, 2
gsSPVertex bbh_seg7_vertex_0701FB38, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

bbh_seg7_dl_0701FCC0: # 0x0701FCC0 - 0x0701FD28
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09002800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex bbh_seg7_vertex_0701FB78, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0,  0,  2, 15, 0x0
gsSPEndDisplayList

glabel bbh_seg7_dl_0701FD28 # 0x0701FD28 - 0x0701FDB8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList bbh_seg7_dl_0701FC78
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList bbh_seg7_dl_0701FCC0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
