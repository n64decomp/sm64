bbh_seg7_vertex_0701FDB8: # 0x0701FDB8 - 0x0701FEA8
vertex   -306,      0,    256,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    307,   -101,    256,   6100,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    307,      0,    256,   6100,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    307,      0,    256,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    307,   -101,    256,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    307,   -101,   -255,  -4118,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    307,      0,   -255,  -4118,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    307,      0,   -255,   6100,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    307,   -101,   -255,   6100,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -306,   -101,   -255,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -306,      0,   -255,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -306,      0,   -255,  -4118,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -306,   -101,   -255,  -4118,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -306,   -101,    256,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -306,      0,    256,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF

bbh_seg7_vertex_0701FEA8: # 0x0701FEA8 - 0x0701FF58
vertex    307,   -101,    256,  -2074,  -3608,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -306,   -101,    256,   4056,  -3608,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -306,   -101,   -255,   4056,   1500,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -306,      0,    256,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -306,   -101,    256,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    307,   -101,    256,   6100,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -306,      0,   -255,   4056,   1500,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -306,      0,    256,   4056,  -3608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    307,      0,    256,  -2074,  -3608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    307,      0,   -255,  -2074,   1500,  0xFF, 0xFF, 0xFF, 0xFF
vertex    307,   -101,   -255,  -2074,   1500,  0xFF, 0xFF, 0xFF, 0xFF

bbh_seg7_dl_0701FF58: # 0x0701FF58 - 0x0701FFE8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09000000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bbh_seg7_vertex_0701FDB8, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex bbh_seg7_vertex_0701FEA8, 11, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  8,  9, 0x0
gsSP1Triangle 10,  0,  2, 0x0
gsSPEndDisplayList

glabel bbh_seg7_dl_0701FFE8 # 0x0701FFE8 - 0x07020058
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bbh_seg7_dl_0701FF58
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
