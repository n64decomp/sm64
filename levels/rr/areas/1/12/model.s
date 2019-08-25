rr_seg7_vertex_0700DEF8: # 0x0700DEF8 - 0x0700DFF8
vertex    307,    -50,   -306,      0,    990,  0x8A, 0x6B, 0x00, 0xFF
vertex    307,    154,   -306,      0,      0,  0x8A, 0x6B, 0x00, 0xFF
vertex    307,    154,    307,   3034,      0,  0x8A, 0x6B, 0x00, 0xFF
vertex    307,    -50,    307,   3034,    990,  0x8A, 0x6B, 0x00, 0xFF
vertex   -306,    -50,    307,   3034,    990,  0x8A, 0x6B, 0x00, 0xFF
vertex   -306,    154,    307,   3034,      0,  0x8A, 0x6B, 0x00, 0xFF
vertex   -306,    154,   -306,      0,      0,  0x8A, 0x6B, 0x00, 0xFF
vertex   -306,    -50,   -306,      0,    990,  0x8A, 0x6B, 0x00, 0xFF
vertex   -306,    -50,   -306,      0,    990,  0xCE, 0xAF, 0x16, 0xFF
vertex    307,    -50,   -306,   3034,    990,  0xCE, 0xAF, 0x16, 0xFF
vertex    307,    154,   -306,   3034,      0,  0xCE, 0xAF, 0x16, 0xFF
vertex   -306,    154,   -306,      0,      0,  0xCE, 0xAF, 0x16, 0xFF
vertex   -306,    -50,    307,      0,    990,  0xCE, 0xAF, 0x16, 0xFF
vertex    307,    -50,    307,   3034,    990,  0xCE, 0xAF, 0x16, 0xFF
vertex    307,    154,    307,   3034,      0,  0xCE, 0xAF, 0x16, 0xFF
vertex   -306,    154,    307,      0,      0,  0xCE, 0xAF, 0x16, 0xFF

rr_seg7_vertex_0700DFF8: # 0x0700DFF8 - 0x0700E0A8
vertex   -101,      0,   -101,      0,      0,  0xEF, 0xCD, 0x8E, 0xFF
vertex    102,      0,   -101,    990,      0,  0xEF, 0xCD, 0x8E, 0xFF
vertex    298,      0,   -297,   2012,  -1054,  0xEF, 0xCD, 0x8E, 0xFF
vertex   -297,      0,   -297,  -1052,  -1054,  0xEF, 0xCD, 0x8E, 0xFF
vertex    102,      0,    102,    990,    990,  0xEF, 0xCD, 0x8E, 0xFF
vertex    298,      0,    298,   2012,   2010,  0xEF, 0xCD, 0x8E, 0xFF
vertex   -101,      0,    102,      0,    990,  0xEF, 0xCD, 0x8E, 0xFF
vertex   -297,      0,    298,  -1052,   2010,  0xEF, 0xCD, 0x8E, 0xFF
vertex   -297,      0,   -297,  -1052,   3032,  0xEF, 0xCD, 0x8E, 0xFF
vertex   -101,      0,   -101,      0,   2010,  0xEF, 0xCD, 0x8E, 0xFF
vertex   -297,      0,    298,  -1052,      0,  0xEF, 0xCD, 0x8E, 0xFF

rr_seg7_dl_0700E0A8: # 0x0700E0A8 - 0x0700E110
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09000000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex rr_seg7_vertex_0700DEF8, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 10, 11, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 14, 15, 0x0
gsSPEndDisplayList

rr_seg7_dl_0700E110: # 0x0700E110 - 0x0700E178
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09004800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex rr_seg7_vertex_0700DFF8, 11, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  2,  1,  4, 0x0,  2,  4,  5, 0x0
gsSP2Triangles  5,  6,  7, 0x0,  5,  4,  6, 0x0
gsSP2Triangles  8,  6,  9, 0x0,  8, 10,  6, 0x0
gsSPEndDisplayList

glabel rr_seg7_dl_0700E178 # 0x0700E178 - 0x0700E208
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList rr_seg7_dl_0700E0A8
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList rr_seg7_dl_0700E110
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
