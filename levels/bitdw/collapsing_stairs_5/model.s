bitdw_seg7_vertex_0700D208: # 0x0700D208 - 0x0700D308
vertex   -716,    256,    307,   1948,      0,  0x65, 0xFF, 0xB2, 0xFF
vertex  -1023,      0,   -306,     32,    926,  0x65, 0xFF, 0xB2, 0xFF
vertex  -1023,      0,    307,   1948,    926,  0x65, 0xFF, 0xB2, 0xFF
vertex   -716,    256,   -306,     32,      0,  0x65, 0xFF, 0xB2, 0xFF
vertex   -409,    512,   -306,     32,      0,  0x65, 0xFF, 0xCC, 0xFF
vertex   -716,    256,   -306,     32,    926,  0x65, 0xFF, 0xCC, 0xFF
vertex   -716,    256,    307,   1948,    926,  0x65, 0xFF, 0xCC, 0xFF
vertex   -409,    512,    307,   1948,      0,  0x65, 0xFF, 0xCC, 0xFF
vertex   -101,    768,    307,   1948,      0,  0x65, 0xFF, 0xE5, 0xFF
vertex   -409,    512,   -306,     32,    926,  0x65, 0xFF, 0xE5, 0xFF
vertex   -409,    512,    307,   1948,    926,  0x65, 0xFF, 0xE5, 0xFF
vertex   -101,    768,   -306,     32,      0,  0x65, 0xFF, 0xE5, 0xFF
vertex    205,   1024,    307,   1948,      0,  0x65, 0xE5, 0xFF, 0xFF
vertex    205,   1024,   -306,     32,      0,  0x65, 0xE5, 0xFF, 0xFF
vertex   -101,    768,   -306,     32,    926,  0x65, 0xE5, 0xFF, 0xFF
vertex   -101,    768,    307,   1948,    926,  0x65, 0xE5, 0xFF, 0xFF

bitdw_seg7_vertex_0700D308: # 0x0700D308 - 0x0700D348
vertex  -1023,      0,    307,      0,      0,  0xB7, 0xCD, 0xBA, 0xFF
vertex  -1023,      0,   -306,  -1052,    990,  0xB7, 0xCD, 0xBA, 0xFF
vertex  -1637,      0,   -306,  -2074,      0,  0xB7, 0xCD, 0xBA, 0xFF
vertex  -1637,      0,    307,  -1052,  -1054,  0xB7, 0xCD, 0xBA, 0xFF

bitdw_seg7_dl_0700D348: # 0x0700D348 - 0x0700D3B0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09008000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bitdw_seg7_vertex_0700D208, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 14, 15, 0x0
gsSPEndDisplayList

bitdw_seg7_dl_0700D3B0: # 0x0700D3B0 - 0x0700D3E8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09007000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bitdw_seg7_vertex_0700D308, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel bitdw_seg7_dl_0700D3E8 # 0x0700D3E8 - 0x0700D460
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bitdw_seg7_dl_0700D348
gsSPDisplayList bitdw_seg7_dl_0700D3B0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
