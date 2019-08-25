castle_grounds_seg7_vertex_0700C2A0: # 0x0700C2A0 - 0x0700C2E0
vertex    268,    803,  -3206,    990,    328,  0xC4, 0xC4, 0xD0, 0xFF
vertex   -243,    803,  -3206,      0,    330,  0xC4, 0xC4, 0xD0, 0xFF
vertex   -245,    803,  -2844,      0,    970,  0xC4, 0xC4, 0xD0, 0xFF
vertex    266,    803,  -2844,    990,    966,  0xC4, 0xC4, 0xD0, 0xFF

castle_grounds_seg7_vertex_0700C2E0: # 0x0700C2E0 - 0x0700C3A0
vertex    205,   1110,  -3104,  -4534,      0,  0x9C, 0x9C, 0xAE, 0xFF
vertex    154,    803,  -3104,   1596,    990,  0x9C, 0x9C, 0xAE, 0xFF
vertex    205,    803,  -3104,   1596,      0,  0x9C, 0x9C, 0xAE, 0xFF
vertex    154,   1059,  -3104,  -3512,    990,  0x9C, 0x9C, 0xAE, 0xFF
vertex    205,   1110,  -3104,   6610,      0,  0x9C, 0x9C, 0xAE, 0xFF
vertex   -153,   1059,  -3104,   -542,    990,  0x9C, 0x9C, 0xAE, 0xFF
vertex    154,   1059,  -3104,   5588,    990,  0x9C, 0x9C, 0xAE, 0xFF
vertex   -204,   1110,  -3104,  -1564,      0,  0x9C, 0x9C, 0xAE, 0xFF
vertex   -153,   1059,  -3104,   4564,    990,  0x9C, 0x9C, 0xAE, 0xFF
vertex   -204,    803,  -3104,   -544,      0,  0x9C, 0x9C, 0xAE, 0xFF
vertex   -153,    803,  -3104,   -544,    990,  0x9C, 0x9C, 0xAE, 0xFF
vertex   -204,   1110,  -3104,   5586,      0,  0x9C, 0x9C, 0xAE, 0xFF

castle_grounds_seg7_dl_0700C3A0: # 0x0700C3A0 - 0x0700C3D8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, outside_09006000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex castle_grounds_seg7_vertex_0700C2A0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

castle_grounds_seg7_dl_0700C3D8: # 0x0700C3D8 - 0x0700C430
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, outside_09003000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex castle_grounds_seg7_vertex_0700C2E0, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSPEndDisplayList

glabel castle_grounds_seg7_dl_0700C430 # 0x0700C430 - 0x0700C4C0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList castle_grounds_seg7_dl_0700C3A0
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList castle_grounds_seg7_dl_0700C3D8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
