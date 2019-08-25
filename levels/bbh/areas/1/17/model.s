bbh_seg7_vertex_0700F5C8: # 0x0700F5C8 - 0x0700F6B8
vertex   2130,      0,  -1248,   2216,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2130,    102,   -306,  -7184,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2130,      0,   -306,  -7184,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2683,      0,   1024,  13050,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2683,    102,   1024,  13050,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2683,    102,   -286,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2683,      0,   -286,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2683,    102,   -286,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2765,    102,   -286,    172,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2765,      0,   -286,    172,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2683,      0,   -286,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   3174,    102,   -286,  -3914,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   3584,    102,   -286,  -8002,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   3584,      0,   -286,  -8002,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   3174,      0,   -286,  -3914,    990,  0xFF, 0xFF, 0xFF, 0xFF

bbh_seg7_vertex_0700F6B8: # 0x0700F6B8 - 0x0700F7A8
vertex   2130,      0,  -1248,  -5344,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2765,    102,  -1248,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2130,    102,  -1248,  -5344,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2130,      0,  -1248,   2216,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2130,    102,  -1248,   2216,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2130,    102,   -306,  -7184,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   3256,      0,  -1535,   5078,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   3256,    102,  -1535,   5078,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   3256,    102,  -1248,   2216,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   3256,      0,  -1248,   2216,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   3174,      0,  -1248,   5078,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   3256,      0,  -1248,   5896,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   3256,    102,  -1248,   5896,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   3174,    102,  -1248,   5078,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2765,      0,  -1248,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF

bbh_seg7_dl_0700F7A8: # 0x0700F7A8 - 0x0700F848
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09008000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bbh_seg7_vertex_0700F5C8, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex bbh_seg7_vertex_0700F6B8, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  8,  9, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 12, 13, 0x0
gsSP1Triangle  0, 14,  1, 0x0
gsSPEndDisplayList

glabel bbh_seg7_dl_0700F848 # 0x0700F848 - 0x0700F8B8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bbh_seg7_dl_0700F7A8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
