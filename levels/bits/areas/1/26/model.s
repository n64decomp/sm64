bits_seg7_vertex_07013F68: # 0x07013F68 - 0x07014068
vertex    307,    102,   -818,      0,  -2076,  0xBB, 0x73, 0x84, 0xFF
vertex   -306,      0,   -767,    480,    990,  0xBB, 0x73, 0x84, 0xFF
vertex   -306,    102,   -818,      0,    990,  0xBB, 0x73, 0x84, 0xFF
vertex    307,      0,   -767,    478,  -2076,  0xBB, 0x73, 0x84, 0xFF
vertex   -306,    102,    819,      0,    990,  0xBB, 0x73, 0x84, 0xFF
vertex   -306,      0,    768,    480,    990,  0xBB, 0x73, 0x84, 0xFF
vertex    307,      0,    768,    478,  -2076,  0xBB, 0x73, 0x84, 0xFF
vertex    307,    102,    819,      0,  -2076,  0xBB, 0x73, 0x84, 0xFF
vertex   -306,    102,   -818,    990,    990,  0x7C, 0x56, 0x6A, 0xFF
vertex   -306,      0,    768,    480,   9164,  0x7C, 0x56, 0x6A, 0xFF
vertex   -306,    102,    819,    990,   9164,  0x7C, 0x56, 0x6A, 0xFF
vertex   -306,      0,   -767,    478,    990,  0x7C, 0x56, 0x6A, 0xFF
vertex    307,    102,    819,    990,   9164,  0x7C, 0x56, 0x6A, 0xFF
vertex    307,      0,    768,    480,   9164,  0x7C, 0x56, 0x6A, 0xFF
vertex    307,      0,   -767,    478,    990,  0x7C, 0x56, 0x6A, 0xFF
vertex    307,    102,   -818,    990,    990,  0x7C, 0x56, 0x6A, 0xFF

bits_seg7_vertex_07014068: # 0x07014068 - 0x070140E8
vertex   -306,      0,    768,      0,    990,  0x5E, 0x3C, 0x45, 0xFF
vertex    307,      0,   -767,   1500,   5076,  0x5E, 0x3C, 0x45, 0xFF
vertex    307,      0,    768,   1502,    990,  0x5E, 0x3C, 0x45, 0xFF
vertex   -306,      0,   -767,      0,   5076,  0x5E, 0x3C, 0x45, 0xFF
vertex    307,    102,    819,   1502,    990,  0xFF, 0xCC, 0x65, 0xFF
vertex    307,    102,   -818,   1502,   5076,  0xFF, 0xCC, 0x65, 0xFF
vertex   -306,    102,   -818,      0,   5076,  0xFF, 0xCC, 0x65, 0xFF
vertex   -306,    102,    819,      0,    990,  0xFF, 0xCC, 0x65, 0xFF

bits_seg7_dl_070140E8: # 0x070140E8 - 0x07014178
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bits_seg7_vertex_07013F68, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 14, 15, 0x0
gsSPVertex bits_seg7_vertex_07014068, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSPEndDisplayList

glabel bits_seg7_dl_07014178 # 0x07014178 - 0x070141E8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bits_seg7_dl_070140E8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
