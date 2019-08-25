bitdw_seg7_vertex_0700B010: # 0x0700B010 - 0x0700B110
vertex    307,    102,   -818,   5760,  -4460,  0x8D, 0xF0, 0xE3, 0xFF
vertex   -306,    102,   -818,   3716,  -4460,  0x8D, 0xF0, 0xE3, 0xFF
vertex   -306,    102,    819,   3716,    990,  0x8D, 0xF0, 0xE3, 0xFF
vertex    307,    102,    819,   5760,    990,  0x8D, 0xF0, 0xE3, 0xFF
vertex   -306,      0,    768,      0,    990,  0x3F, 0xBF, 0xAA, 0xFF
vertex   -306,    102,    819,    990,   1158,  0x3F, 0xBF, 0xAA, 0xFF
vertex   -306,    102,   -818,    990,  -4290,  0x3F, 0xBF, 0xAA, 0xFF
vertex   -306,      0,   -767,      0,  -4120,  0x3F, 0xBF, 0xAA, 0xFF
vertex    307,      0,   -767,      0,  -4120,  0x3F, 0xBF, 0xAA, 0xFF
vertex    307,    102,    819,    990,   1158,  0x3F, 0xBF, 0xAA, 0xFF
vertex    307,      0,    768,      0,    990,  0x3F, 0xBF, 0xAA, 0xFF
vertex    307,    102,   -818,    990,  -4290,  0x3F, 0xBF, 0xAA, 0xFF
vertex   -306,      0,   -767,   3716,  -4290,  0x00, 0x96, 0x96, 0xFF
vertex    307,    102,   -818,   5760,  -4460,  0x00, 0x96, 0x96, 0xFF
vertex    307,      0,   -767,   5760,  -4290,  0x00, 0x96, 0x96, 0xFF
vertex   -306,    102,   -818,   3716,  -4460,  0x00, 0x96, 0x96, 0xFF

bitdw_seg7_vertex_0700B110: # 0x0700B110 - 0x0700B190
vertex    307,      0,    768,   5760,    820,  0x00, 0x96, 0x96, 0xFF
vertex    307,    102,    819,   5760,    990,  0x00, 0x96, 0x96, 0xFF
vertex   -306,    102,    819,   3716,    990,  0x00, 0x96, 0x96, 0xFF
vertex   -306,      0,    768,   3716,    820,  0x00, 0x96, 0x96, 0xFF
vertex   -306,      0,   -767,   3716,  -4290,  0x00, 0x5D, 0x5D, 0xFF
vertex    307,      0,    768,   5760,    820,  0x00, 0x5D, 0x5D, 0xFF
vertex   -306,      0,    768,   3716,    820,  0x00, 0x5D, 0x5D, 0xFF
vertex    307,      0,   -767,   5760,  -4290,  0x00, 0x5D, 0x5D, 0xFF

bitdw_seg7_dl_0700B190: # 0x0700B190 - 0x0700B220
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bitdw_seg7_vertex_0700B010, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 15, 13, 0x0
gsSPVertex bitdw_seg7_vertex_0700B110, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

glabel bitdw_seg7_dl_0700B220 # 0x0700B220 - 0x0700B290
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bitdw_seg7_dl_0700B190
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
