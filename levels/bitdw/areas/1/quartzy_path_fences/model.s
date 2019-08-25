bitdw_seg7_vertex_07004390: # 0x07004390 - 0x07004480
vertex    979,    307,  -1022,   7430,    990,  0xAF, 0xCE, 0x16, 0xFF
vertex    253,    255,  -1018,    240,    -14,  0xAF, 0xCE, 0x16, 0xFF
vertex    258,    153,  -1027,     70,    990,  0xAF, 0xCE, 0x16, 0xFF
vertex     49,    205,  -1632,    172,    990,  0xAF, 0xCE, 0x16, 0xFF
vertex    979,    307,  -1637,   9510,    990,  0xAF, 0xCE, 0x16, 0xFF
vertex    979,    410,  -1637,   9510,      0,  0xAF, 0xCE, 0x16, 0xFF
vertex     49,    307,  -1632,    238,    -30,  0xAF, 0xCE, 0x16, 0xFF
vertex     49,    205,  -1632,  20784,    990,  0xAF, 0xCE, 0x16, 0xFF
vertex     49,    307,  -1632,  20784,      0,  0xAF, 0xCE, 0x16, 0xFF
vertex   -874,    102,    214,    172,      0,  0xAF, 0xCE, 0x16, 0xFF
vertex   -869,      0,    205,    172,    990,  0xAF, 0xCE, 0x16, 0xFF
vertex   -874,    102,    214,  17900,     -6,  0xAF, 0xCE, 0x16, 0xFF
vertex    -44,   -413,   1770,   -438,      0,  0xAF, 0xCE, 0x16, 0xFF
vertex    -50,   -511,   1741,   -438,    990,  0xAF, 0xCE, 0x16, 0xFF
vertex   -869,      0,    205,  17670,    990,  0xAF, 0xCE, 0x16, 0xFF

bitdw_seg7_vertex_07004480: # 0x07004480 - 0x07004530
vertex     33,   -135,    544,   -438,      0,  0xAF, 0xCE, 0x16, 0xFF
vertex   -255,      0,      0,   5772,    990,  0xAF, 0xCE, 0x16, 0xFF
vertex   -258,    102,      8,   6092,     20,  0xAF, 0xCE, 0x16, 0xFF
vertex    979,    307,  -1022,   7430,    990,  0xAF, 0xCE, 0x16, 0xFF
vertex    979,    410,  -1023,   7644,    -10,  0xAF, 0xCE, 0x16, 0xFF
vertex    253,    255,  -1018,    240,    -14,  0xAF, 0xCE, 0x16, 0xFF
vertex    258,    153,  -1027,  11336,    990,  0xAF, 0xCE, 0x16, 0xFF
vertex    253,    255,  -1018,  11370,      0,  0xAF, 0xCE, 0x16, 0xFF
vertex   -258,    102,      8,   -186,    -30,  0xAF, 0xCE, 0x16, 0xFF
vertex   -255,      0,      0,   -234,    990,  0xAF, 0xCE, 0x16, 0xFF
vertex     21,   -230,    508,   -438,    990,  0xAF, 0xCE, 0x16, 0xFF

bitdw_seg7_dl_07004530: # 0x07004530 - 0x070045C0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09005000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bitdw_seg7_vertex_07004390, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  5,  6,  3, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 14, 11, 13, 0x0
gsSPVertex bitdw_seg7_vertex_07004480, 11, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  8,  9, 0x0
gsSP1Triangle  0, 10,  1, 0x0
gsSPEndDisplayList

glabel bitdw_seg7_dl_070045C0 # 0x070045C0 - 0x07004630
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bitdw_seg7_dl_07004530
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
