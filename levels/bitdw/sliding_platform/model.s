bitdw_seg7_vertex_0700AD90: # 0x0700AD90 - 0x0700AE90
vertex   -409,    205,   -204,    990,   2010,  0xCE, 0x91, 0x16, 0xFF
vertex   -409,      0,   -204,    478,   1498,  0xCE, 0x91, 0x16, 0xFF
vertex   -409,      0,    205,   1502,    478,  0xCE, 0x91, 0x16, 0xFF
vertex   -409,    205,    205,   2012,    990,  0xCE, 0x91, 0x16, 0xFF
vertex    973,      0,   -204,    480,   1498,  0xCE, 0x91, 0x16, 0xFF
vertex    973,    205,    205,   2012,    990,  0xCE, 0x91, 0x16, 0xFF
vertex    973,      0,    205,   1500,    480,  0xCE, 0x91, 0x16, 0xFF
vertex    973,    205,   -204,    990,   2010,  0xCE, 0x91, 0x16, 0xFF
vertex   -409,    205,   -204,    478,    478,  0xCE, 0xAF, 0x16, 0xFF
vertex    973,      0,   -204,   3418,   4438,  0xCE, 0xAF, 0x16, 0xFF
vertex   -409,      0,   -204,      0,    990,  0xCE, 0xAF, 0x16, 0xFF
vertex    973,    205,   -204,   3928,   3926,  0xCE, 0xAF, 0x16, 0xFF
vertex    973,    205,    205,   3928,   3926,  0xCE, 0xAF, 0x16, 0xFF
vertex   -409,      0,    205,      0,    990,  0xCE, 0xAF, 0x16, 0xFF
vertex    973,      0,    205,   3418,   4438,  0xCE, 0xAF, 0x16, 0xFF
vertex   -409,    205,    205,    478,    478,  0xCE, 0xAF, 0x16, 0xFF

bitdw_seg7_vertex_0700AE90: # 0x0700AE90 - 0x0700AF10
vertex   -409,      0,   -204,    990,   2010,  0x91, 0x6D, 0x00, 0xFF
vertex    973,      0,   -204,   4440,  -1438,  0x91, 0x6D, 0x00, 0xFF
vertex    973,      0,    205,   3418,  -2460,  0x91, 0x6D, 0x00, 0xFF
vertex   -409,      0,    205,      0,    990,  0x91, 0x6D, 0x00, 0xFF
vertex   -409,    205,    205,      0,    990,  0xFF, 0xE5, 0x65, 0xFF
vertex    973,    205,   -204,   4440,  -1438,  0xFF, 0xE5, 0x65, 0xFF
vertex   -409,    205,   -204,    990,   2010,  0xFF, 0xE5, 0x65, 0xFF
vertex    973,    205,    205,   3418,  -2460,  0xFF, 0xE5, 0x65, 0xFF

bitdw_seg7_dl_0700AF10: # 0x0700AF10 - 0x0700AFA0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09007000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bitdw_seg7_vertex_0700AD90, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 15, 13, 0x0
gsSPVertex bitdw_seg7_vertex_0700AE90, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

glabel bitdw_seg7_dl_0700AFA0 # 0x0700AFA0 - 0x0700B010
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bitdw_seg7_dl_0700AF10
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
