lll_seg7_vertex_07015E90: # 0x07015E90 - 0x07015F10
vertex   -255,    307,  -1023,  -2074,  -1054,  0x00, 0x7F, 0x00, 0xFF
vertex   -383,    307,    896,  -2586,   6608,  0x00, 0x7F, 0x00, 0xFF
vertex   -255,    307,   1024,  -2074,   7120,  0x00, 0x7F, 0x00, 0xFF
vertex    256,    307,   1024,      0,   7120,  0x00, 0x7F, 0x00, 0xFF
vertex   -383,    307,   -895,  -2584,   -542,  0x00, 0x7F, 0x00, 0xFF
vertex    384,    307,    896,    478,   6608,  0x00, 0x7F, 0x00, 0xFF
vertex    384,    307,   -895,    480,   -542,  0x00, 0x7F, 0x00, 0xFF
vertex    256,    307,  -1023,      0,  -1054,  0x00, 0x7F, 0x00, 0xFF

lll_seg7_vertex_07015F10: # 0x07015F10 - 0x07016000
vertex   -383,      0,   -895,      0,    990,  0xA7, 0x00, 0xA7, 0xFF
vertex   -255,    307,  -1023,  -1234,      0,  0xA7, 0x00, 0xA7, 0xFF
vertex   -255,      0,  -1023,  -1234,    990,  0xA7, 0x00, 0xA7, 0xFF
vertex    256,      0,   1024,    650,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    256,    307,   1024,    650,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -255,    307,   1024,  -1052,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -255,      0,   1024,  -1052,    990,  0x00, 0x00, 0x7F, 0xFF
vertex   -255,      0,   1024,    990,    990,  0xA7, 0x00, 0x59, 0xFF
vertex   -383,    307,    896,   -212,      0,  0xA7, 0x00, 0x59, 0xFF
vertex   -383,      0,    896,   -212,    990,  0xA7, 0x00, 0x59, 0xFF
vertex   -255,    307,   1024,    990,      0,  0xA7, 0x00, 0x59, 0xFF
vertex   -383,      0,    896,    990,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -383,    307,    896,    990,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -383,    307,   -895,  -8376,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -383,      0,   -895,  -8376,    990,  0x81, 0x00, 0x00, 0xFF

lll_seg7_vertex_07016000: # 0x07016000 - 0x070160F0
vertex    384,      0,   -895,   9336,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    384,    307,    896,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    384,      0,    896,      0,    990,  0x7F, 0x00, 0x00, 0xFF
vertex   -383,      0,   -895,      0,    990,  0xA7, 0x00, 0xA7, 0xFF
vertex   -383,    307,   -895,      0,      0,  0xA7, 0x00, 0xA7, 0xFF
vertex   -255,    307,  -1023,  -1234,      0,  0xA7, 0x00, 0xA7, 0xFF
vertex   -255,      0,  -1023,   1672,    990,  0x00, 0x00, 0x81, 0xFF
vertex    256,    307,  -1023,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex    256,      0,  -1023,      0,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -255,    307,  -1023,   1672,      0,  0x00, 0x00, 0x81, 0xFF
vertex    256,      0,  -1023,   1172,    990,  0x59, 0x00, 0xA7, 0xFF
vertex    384,    307,   -895,      0,      0,  0x59, 0x00, 0xA7, 0xFF
vertex    384,      0,   -895,      0,    990,  0x59, 0x00, 0xA7, 0xFF
vertex    256,    307,  -1023,   1172,      0,  0x59, 0x00, 0xA7, 0xFF
vertex    384,    307,   -895,   9336,      0,  0x7F, 0x00, 0x00, 0xFF

lll_seg7_vertex_070160F0: # 0x070160F0 - 0x07016130
vertex    384,      0,    896,   1172,    990,  0x59, 0x00, 0x59, 0xFF
vertex    256,    307,   1024,      0,      0,  0x59, 0x00, 0x59, 0xFF
vertex    256,      0,   1024,      0,    990,  0x59, 0x00, 0x59, 0xFF
vertex    384,    307,    896,   1172,      0,  0x59, 0x00, 0x59, 0xFF

lll_seg7_dl_07016130: # 0x07016130 - 0x07016198
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fire_09005000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight lll_seg7_light_0700FC08, 1
gsSPLight lll_seg7_light_0700FC00, 2
gsSPVertex lll_seg7_vertex_07015E90, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  0,  4,  1, 0x0,  0,  5,  6, 0x0
gsSP2Triangles  0,  6,  7, 0x0,  0,  3,  5, 0x0
gsSPEndDisplayList

lll_seg7_dl_07016198: # 0x07016198 - 0x07016250
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fire_09007800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex lll_seg7_vertex_07015F10, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex lll_seg7_vertex_07016000, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  9,  7, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 13, 11, 0x0
gsSP1Triangle  0, 14,  1, 0x0
gsSPVertex lll_seg7_vertex_070160F0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel lll_seg7_dl_07016250 # 0x07016250 - 0x070162E0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList lll_seg7_dl_07016130
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList lll_seg7_dl_07016198
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
