rr_seg7_vertex_0701AE68: # 0x0701AE68 - 0x0701AF48
vertex      0,      0,      0,    990,    990,  0x54, 0x16, 0xCE, 0xFF
vertex    307,    307,   -306,   2012,    990,  0x54, 0x16, 0xCE, 0xFF
vertex    307,    307,    307,    990,      0,  0x54, 0x16, 0xCE, 0xFF
vertex   -306,    307,    307,      0,    990,  0x54, 0x16, 0xCE, 0xFF
vertex   -306,    307,   -306,    990,   2010,  0x54, 0x16, 0xCE, 0xFF
vertex    307,    307,   -306,   2012,    990,  0x55, 0x3F, 0xBF, 0xFF
vertex      0,      0,      0,    990,    990,  0x55, 0x3F, 0xBF, 0xFF
vertex   -306,    307,   -306,    990,   2010,  0x55, 0x3F, 0xBF, 0xFF
vertex    307,    307,    307,    990,      0,  0x55, 0x3F, 0xBF, 0xFF
vertex   -306,    307,    307,      0,    990,  0x55, 0x3F, 0xBF, 0xFF
vertex    307,    307,   -306,   2012,    990,  0x8C, 0x98, 0xD8, 0xFF
vertex   -306,    307,   -306,    990,   2010,  0x8C, 0x98, 0xD8, 0xFF
vertex   -306,    307,    307,      0,    990,  0x8C, 0x98, 0xD8, 0xFF
vertex    307,    307,    307,    990,      0,  0x8C, 0x98, 0xD8, 0xFF

rr_seg7_dl_0701AF48: # 0x0701AF48 - 0x0701AFA0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09001800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex rr_seg7_vertex_0701AE68, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  0, 0x0
gsSP2Triangles  5,  6,  7, 0x0,  6,  8,  9, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 12, 13, 0x0
gsSPEndDisplayList

glabel rr_seg7_dl_0701AFA0 # 0x0701AFA0 - 0x0701B010
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList rr_seg7_dl_0701AF48
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
