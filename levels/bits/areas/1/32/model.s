bits_seg7_vertex_07016B18: # 0x07016B18 - 0x07016B58
vertex  -1023,      0,    307,    480,    478,  0xC8, 0xC8, 0xC8, 0xFF
vertex  -1330,      0,   -306,    990,   2010,  0xC8, 0xC8, 0xC8, 0xFF
vertex  -1330,      0,    307,      0,    990,  0xC8, 0xC8, 0xC8, 0xFF
vertex  -1023,      0,   -306,   1502,   1498,  0xC8, 0xC8, 0xC8, 0xFF

bits_seg7_vertex_07016B58: # 0x07016B58 - 0x07016C58
vertex   -716,    256,    307,   1948,      0,  0xD4, 0xFF, 0x00, 0xFF
vertex   -716,    256,   -306,     32,      0,  0xD4, 0xFF, 0x00, 0xFF
vertex  -1023,      0,   -306,     32,    926,  0xD4, 0xFF, 0x00, 0xFF
vertex  -1023,      0,    307,   1948,    926,  0xD4, 0xFF, 0x00, 0xFF
vertex   -409,    512,   -306,     32,      0,  0xAA, 0xFF, 0x00, 0xFF
vertex   -716,    256,   -306,     32,    926,  0xAA, 0xFF, 0x00, 0xFF
vertex   -716,    256,    307,   1948,    926,  0xAA, 0xFF, 0x00, 0xFF
vertex   -409,    512,    307,   1948,      0,  0xAA, 0xFF, 0x00, 0xFF
vertex   -101,    768,    307,   1948,      0,  0x7F, 0xFF, 0x00, 0xFF
vertex   -101,    768,   -306,     32,      0,  0x7F, 0xFF, 0x00, 0xFF
vertex   -409,    512,   -306,     32,    926,  0x7F, 0xFF, 0x00, 0xFF
vertex   -409,    512,    307,   1948,    926,  0x7F, 0xFF, 0x00, 0xFF
vertex    205,   1024,    307,   1948,      0,  0x2A, 0xFF, 0x00, 0xFF
vertex    205,   1024,   -306,     32,      0,  0x2A, 0xFF, 0x00, 0xFF
vertex   -101,    768,   -306,     32,    926,  0x2A, 0xFF, 0x00, 0xFF
vertex   -101,    768,    307,   1948,    926,  0x2A, 0xFF, 0x00, 0xFF

bits_seg7_vertex_07016C58: # 0x07016C58 - 0x07016CD8
vertex    512,   1280,    307,   1948,      0,  0x00, 0xFF, 0x55, 0xFF
vertex    205,   1024,   -306,     32,    926,  0x00, 0xFF, 0x55, 0xFF
vertex    205,   1024,    307,   1948,    926,  0x00, 0xFF, 0x55, 0xFF
vertex    512,   1280,   -306,     32,      0,  0x00, 0xFF, 0x55, 0xFF
vertex    819,   1536,    307,   1948,      0,  0x00, 0xFF, 0x7F, 0xFF
vertex    819,   1536,   -306,     32,      0,  0x00, 0xFF, 0x7F, 0xFF
vertex    512,   1280,   -306,     32,    926,  0x00, 0xFF, 0x7F, 0xFF
vertex    512,   1280,    307,   1948,    926,  0x00, 0xFF, 0x7F, 0xFF

bits_seg7_dl_07016CD8: # 0x07016CD8 - 0x07016D10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09007000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bits_seg7_vertex_07016B18, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

bits_seg7_dl_07016D10: # 0x07016D10 - 0x07016DA0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09008000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bits_seg7_vertex_07016B58, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 10, 11, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 14, 15, 0x0
gsSPVertex bits_seg7_vertex_07016C58, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSPEndDisplayList

glabel bits_seg7_dl_07016DA0 # 0x07016DA0 - 0x07016E18
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bits_seg7_dl_07016CD8
gsSPDisplayList bits_seg7_dl_07016D10
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
