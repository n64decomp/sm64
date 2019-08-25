rr_seg7_vertex_0701B530: # 0x0701B530 - 0x0701B630
vertex    102,     51,   -306,    224,   1244,  0x72, 0x5D, 0x29, 0xFF
vertex     51,      0,    307,    122,   1192,  0x72, 0x5D, 0x29, 0xFF
vertex     51,      0,   -306,    122,   1192,  0x72, 0x5D, 0x29, 0xFF
vertex    102,     51,    307,    224,   1244,  0x72, 0x5D, 0x29, 0xFF
vertex    -50,      0,   -306,     70,   1040,  0x72, 0x5D, 0x29, 0xFF
vertex   -101,     51,    307,    122,    938,  0x72, 0x5D, 0x29, 0xFF
vertex   -101,     51,   -306,    122,    938,  0x72, 0x5D, 0x29, 0xFF
vertex    -50,      0,    307,     70,   1040,  0x72, 0x5D, 0x29, 0xFF
vertex     51,      0,   -306,    122,   1192,  0x66, 0x50, 0x21, 0xFF
vertex    -50,      0,    307,     70,   1040,  0x66, 0x50, 0x21, 0xFF
vertex    -50,      0,   -306,     70,   1040,  0x66, 0x50, 0x21, 0xFF
vertex     51,      0,    307,    122,   1192,  0x66, 0x50, 0x21, 0xFF
vertex    102,    154,   -306,    376,   1192,  0x9B, 0x7C, 0x3D, 0xFF
vertex    102,    154,    307,    376,   1192,  0x9B, 0x7C, 0x3D, 0xFF
vertex    102,     51,    307,    224,   1244,  0x9B, 0x7C, 0x3D, 0xFF
vertex    102,     51,   -306,    224,   1244,  0x9B, 0x7C, 0x3D, 0xFF

rr_seg7_vertex_0701B630: # 0x0701B630 - 0x0701B710
vertex   -101,     51,   -306,    122,    938,  0x9B, 0x7C, 0x3D, 0xFF
vertex   -101,    154,    307,    274,    888,  0x9B, 0x7C, 0x3D, 0xFF
vertex   -101,    154,   -306,    274,    888,  0x9B, 0x7C, 0x3D, 0xFF
vertex   -101,     51,    307,    122,    938,  0x9B, 0x7C, 0x3D, 0xFF
vertex   -101,    154,   -306,    274,    888,  0xCD, 0xC4, 0x97, 0xFF
vertex   -101,    154,    307,    274,    888,  0xCD, 0xC4, 0x97, 0xFF
vertex    102,    154,    307,    376,   1192,  0xCD, 0xC4, 0x97, 0xFF
vertex    102,    154,   -306,    376,   1192,  0xCD, 0xC4, 0x97, 0xFF
vertex    102,    154,    307,    376,   1192,  0xAC, 0x9D, 0x52, 0xFF
vertex   -101,    154,    307,    274,    888,  0xAC, 0x9D, 0x52, 0xFF
vertex   -101,     51,    307,    122,    938,  0xAC, 0x9D, 0x52, 0xFF
vertex     51,      0,    307,    122,   1192,  0xAC, 0x9D, 0x52, 0xFF
vertex    102,     51,    307,    224,   1244,  0xAC, 0x9D, 0x52, 0xFF
vertex    -50,      0,    307,     70,   1040,  0xAC, 0x9D, 0x52, 0xFF

rr_seg7_vertex_0701B710: # 0x0701B710 - 0x0701B770
vertex   -101,     51,   -306,    122,    938,  0xAC, 0x9D, 0x52, 0xFF
vertex     51,      0,   -306,    122,   1192,  0xAC, 0x9D, 0x52, 0xFF
vertex    -50,      0,   -306,     70,   1040,  0xAC, 0x9D, 0x52, 0xFF
vertex    102,    154,   -306,    376,   1192,  0xAC, 0x9D, 0x52, 0xFF
vertex    102,     51,   -306,    224,   1244,  0xAC, 0x9D, 0x52, 0xFF
vertex   -101,    154,   -306,    274,    888,  0xAC, 0x9D, 0x52, 0xFF

rr_seg7_dl_0701B770: # 0x0701B770 - 0x0701B848
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex rr_seg7_vertex_0701B530, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 14, 15, 0x0
gsSPVertex rr_seg7_vertex_0701B630, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11, 12, 0x0
gsSP2Triangles  8, 13, 11, 0x0,  8, 10, 13, 0x0
gsSPVertex rr_seg7_vertex_0701B710, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  4, 0x0
gsSP2Triangles  0,  4,  1, 0x0,  0,  5,  3, 0x0
gsSPEndDisplayList

glabel rr_seg7_dl_0701B848 # 0x0701B848 - 0x0701B8B8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList rr_seg7_dl_0701B770
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
