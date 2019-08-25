bitfs_seg7_vertex_07003CF8: # 0x07003CF8 - 0x07003DF8
vertex   2560,      0,   1147,   9352,    990,  0x44, 0x44, 0x44, 0xFF
vertex     -4,      0,     -5,   4698,    222,  0x44, 0x44, 0x44, 0xFF
vertex   2560,      0,  -1163,   9352,   -514,  0x44, 0x44, 0x44, 0xFF
vertex  -2610,      0,   1147,      0,    990,  0x44, 0x44, 0x44, 0xFF
vertex  -2610,      0,  -1163,      0,   -548,  0x44, 0x44, 0x44, 0xFF
vertex  -2610,    256,   1147,      0,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2560,    256,   1147,  10290,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2560,    256,   1096,  10290,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2585,    256,   1121,     20,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2610,    256,   1147,    326,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2585,    256,  -1137,   4886,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2610,    256,  -1163,   4938,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2585,    256,   1121,    376,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2560,    256,  -1163,  10290,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2585,    256,  -1137,     20,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2560,    256,  -1112,  10290,    478,  0xFF, 0xFF, 0xFF, 0xFF

bitfs_seg7_vertex_07003DF8: # 0x07003DF8 - 0x07003ED8
vertex   2560,    256,  -1163,  10290,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2610,    256,  -1163,      0,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2585,    256,  -1137,     20,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2610,      0,   1147,    326,    990,  0x64, 0x64, 0x64, 0xFF
vertex  -2610,    256,   1147,    326,    478,  0x64, 0x64, 0x64, 0xFF
vertex  -2610,    256,  -1163,   4938,    478,  0x64, 0x64, 0x64, 0xFF
vertex  -2610,      0,  -1163,   4938,    990,  0x64, 0x64, 0x64, 0xFF
vertex  -2585,    256,   1121,    376,    478,  0x64, 0x64, 0x64, 0xFF
vertex  -2533,    205,  -1086,   4784,    582,  0x64, 0x64, 0x64, 0xFF
vertex  -2585,    256,  -1137,   4886,    478,  0x64, 0x64, 0x64, 0xFF
vertex  -2533,    205,   1070,    480,    582,  0x64, 0x64, 0x64, 0xFF
vertex  -2610,    256,  -1163,      0,    478,  0x8C, 0x8C, 0x8C, 0xFF
vertex   2560,    256,  -1163,  10290,    478,  0x8C, 0x8C, 0x8C, 0xFF
vertex  -2610,      0,  -1163,      0,    990,  0x8C, 0x8C, 0x8C, 0xFF

bitfs_seg7_vertex_07003ED8: # 0x07003ED8 - 0x07003FC8
vertex  -2585,    256,   1121,     20,    478,  0x8C, 0x8C, 0x8C, 0xFF
vertex   2560,    205,   1044,  10290,    582,  0x8C, 0x8C, 0x8C, 0xFF
vertex  -2533,    205,   1070,    122,    582,  0x8C, 0x8C, 0x8C, 0xFF
vertex   2560,    256,   1096,  10290,    478,  0x8C, 0x8C, 0x8C, 0xFF
vertex  -2610,      0,   1147,      0,    990,  0x8C, 0x8C, 0x8C, 0xFF
vertex   2560,    256,   1147,  10290,    478,  0x8C, 0x8C, 0x8C, 0xFF
vertex  -2610,    256,   1147,      0,    478,  0x8C, 0x8C, 0x8C, 0xFF
vertex   2560,      0,   1147,  10290,    990,  0x8C, 0x8C, 0x8C, 0xFF
vertex  -2533,    205,  -1086,    122,    582,  0x8C, 0x8C, 0x8C, 0xFF
vertex   2560,    256,  -1112,  10290,    478,  0x8C, 0x8C, 0x8C, 0xFF
vertex  -2585,    256,  -1137,     20,    478,  0x8C, 0x8C, 0x8C, 0xFF
vertex   2560,    205,  -1060,  10290,    582,  0x8C, 0x8C, 0x8C, 0xFF
vertex   2560,    256,  -1163,  10290,    478,  0x8C, 0x8C, 0x8C, 0xFF
vertex   2560,      0,  -1163,  10290,    990,  0x8C, 0x8C, 0x8C, 0xFF
vertex  -2610,      0,  -1163,      0,    990,  0x8C, 0x8C, 0x8C, 0xFF

bitfs_seg7_dl_07003FC8: # 0x07003FC8 - 0x070040B0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09001000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bitfs_seg7_vertex_07003CF8, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  0,  3, 0x0
gsSP2Triangles  2,  1,  4, 0x0,  4,  1,  3, 0x0
gsSP2Triangles  5,  6,  7, 0x0,  5,  7,  8, 0x0
gsSP2Triangles  9, 10, 11, 0x0,  9, 12, 10, 0x0
gsSP1Triangle 13, 14, 15, 0x0
gsSPVertex bitfs_seg7_vertex_07003DF8, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSPVertex bitfs_seg7_vertex_07003ED8, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPEndDisplayList

glabel bitfs_seg7_dl_070040B0 # 0x070040B0 - 0x07004120
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bitfs_seg7_dl_07003FC8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
