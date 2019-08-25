rr_seg7_vertex_0700DC58: # 0x0700DC58 - 0x0700DD48
vertex   -529,   -242,   -536,    990,    990,  0xEB, 0xEB, 0x79, 0xFF
vertex   -899,     19,   -761,      0,      0,  0xEB, 0xEB, 0x79, 0xFF
vertex   -541,     35,   -762,    990,      0,  0xEB, 0xEB, 0x79, 0xFF
vertex   -899,     19,    737,      0,      0,  0xEB, 0xEB, 0x79, 0xFF
vertex   -887,   -258,    511,      0,    990,  0xEB, 0xEB, 0x79, 0xFF
vertex   -529,   -242,    511,    990,    990,  0xEB, 0xEB, 0x79, 0xFF
vertex   -541,     35,    738,    990,      0,  0xEB, 0xEB, 0x79, 0xFF
vertex   -285,     46,    738,      0,      0,  0xEB, 0xEB, 0x79, 0xFF
vertex   -273,   -231,    512,      0,    990,  0xEB, 0xEB, 0x79, 0xFF
vertex     84,   -216,    513,    990,    990,  0xEB, 0xEB, 0x79, 0xFF
vertex     72,     61,    739,    990,      0,  0xEB, 0xEB, 0x79, 0xFF
vertex    700,     75,    726,    990,      0,  0xEB, 0xEB, 0x79, 0xFF
vertex    342,     59,    725,      0,      0,  0xEB, 0xEB, 0x79, 0xFF
vertex    712,   -202,    500,    990,    990,  0xEB, 0xEB, 0x79, 0xFF
vertex    354,   -218,    499,      0,    990,  0xEB, 0xEB, 0x79, 0xFF

rr_seg7_vertex_0700DD48: # 0x0700DD48 - 0x0700DDF8
vertex    712,   -202,   -545,    990,    990,  0xEB, 0xEB, 0x79, 0xFF
vertex    354,   -218,   -544,      0,    990,  0xEB, 0xEB, 0x79, 0xFF
vertex    342,     59,   -770,      0,      0,  0xEB, 0xEB, 0x79, 0xFF
vertex   -529,   -242,   -536,    990,    990,  0xEB, 0xEB, 0x79, 0xFF
vertex   -887,   -258,   -535,      0,    990,  0xEB, 0xEB, 0x79, 0xFF
vertex   -899,     19,   -761,      0,      0,  0xEB, 0xEB, 0x79, 0xFF
vertex     84,   -216,   -537,    990,    990,  0xEB, 0xEB, 0x79, 0xFF
vertex   -273,   -231,   -536,      0,    990,  0xEB, 0xEB, 0x79, 0xFF
vertex   -285,     46,   -762,      0,      0,  0xEB, 0xEB, 0x79, 0xFF
vertex     72,     61,   -763,    990,      0,  0xEB, 0xEB, 0x79, 0xFF
vertex    700,     75,   -771,    990,      0,  0xEB, 0xEB, 0x79, 0xFF

rr_seg7_dl_0700DDF8: # 0x0700DDF8 - 0x0700DE88
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_metal_hole
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex rr_seg7_vertex_0700DC58, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  3,  5, 0x0,  7,  8,  9, 0x0
gsSP2Triangles 10,  7,  9, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 12, 14, 13, 0x0
gsSPVertex rr_seg7_vertex_0700DD48, 11, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  8,  9, 0x0
gsSP1Triangle  0,  2, 10, 0x0
gsSPEndDisplayList

glabel rr_seg7_dl_0700DE88 # 0x0700DE88 - 0x0700DEF8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList rr_seg7_dl_0700DDF8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
