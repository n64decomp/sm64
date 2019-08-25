rr_seg7_vertex_0701B010: # 0x0701B010 - 0x0701B110
vertex    205,    102,   -306,   2522,   1498,  0xAD, 0xBB, 0xD1, 0xFF
vertex   -204,    102,    307,      0,    990,  0xAD, 0xBB, 0xD1, 0xFF
vertex    205,    102,    307,    990,      0,  0xAD, 0xBB, 0xD1, 0xFF
vertex   -204,    102,   -306,   1500,   2520,  0xAD, 0xBB, 0xD1, 0xFF
vertex   -204,    102,   -306,     36,   1124,  0x59, 0x7A, 0xB3, 0xFF
vertex   -204,      0,   -306,      0,    990,  0x59, 0x7A, 0xB3, 0xFF
vertex   -204,      0,    307,    786,    582,  0x59, 0x7A, 0xB3, 0xFF
vertex   -204,    102,    307,    854,    718,  0x59, 0x7A, 0xB3, 0xFF
vertex    205,    102,    307,    854,    718,  0x59, 0x7A, 0xB3, 0xFF
vertex    205,      0,    307,    786,    582,  0x59, 0x7A, 0xB3, 0xFF
vertex    205,      0,   -306,      0,    990,  0x59, 0x7A, 0xB3, 0xFF
vertex    205,    102,   -306,     36,   1124,  0x59, 0x7A, 0xB3, 0xFF
vertex    205,      0,    307,    990,      0,  0x38, 0x5E, 0x96, 0xFF
vertex   -204,      0,    307,      0,    990,  0x38, 0x5E, 0x96, 0xFF
vertex   -204,      0,   -306,   1500,   2520,  0x38, 0x5E, 0x96, 0xFF
vertex    205,      0,   -306,   2522,   1498,  0x38, 0x5E, 0x96, 0xFF

rr_seg7_vertex_0701B110: # 0x0701B110 - 0x0701B190
vertex   -204,    102,    307,    138,    820,  0x75, 0x92, 0xCB, 0xFF
vertex   -204,      0,    307,      0,    990,  0x75, 0x92, 0xCB, 0xFF
vertex    205,      0,    307,    650,   1670,  0x75, 0x92, 0xCB, 0xFF
vertex    205,    102,    307,    820,   1500,  0x75, 0x92, 0xCB, 0xFF
vertex    205,    102,   -306,    820,   1500,  0x75, 0x92, 0xCB, 0xFF
vertex    205,      0,   -306,    650,   1670,  0x75, 0x92, 0xCB, 0xFF
vertex   -204,      0,   -306,      0,    990,  0x75, 0x92, 0xCB, 0xFF
vertex   -204,    102,   -306,    138,    820,  0x75, 0x92, 0xCB, 0xFF

rr_seg7_dl_0701B190: # 0x0701B190 - 0x0701B220
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09007000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex rr_seg7_vertex_0701B010, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 10, 11, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 14, 15, 0x0
gsSPVertex rr_seg7_vertex_0701B110, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSPEndDisplayList

glabel rr_seg7_dl_0701B220 # 0x0701B220 - 0x0701B290
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList rr_seg7_dl_0701B190
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
