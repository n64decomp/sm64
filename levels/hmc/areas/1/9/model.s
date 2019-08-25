hmc_seg7_vertex_0700FAB0: # 0x0700FAB0 - 0x0700FBA0
vertex   1137,    358,   6543,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1014,    563,   6543,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1137,    563,   6543,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6973,    563,   3697,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6851,    358,   3697,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6973,    358,   3697,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6851,    563,   3697,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6912,    358,   3799,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6912,    563,   3594,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6912,    563,   3799,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6912,    358,   3594,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1075,    563,   6441,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1075,    563,   6646,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1075,    358,   6646,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1075,    358,   6441,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF

hmc_seg7_vertex_0700FBA0: # 0x0700FBA0 - 0x0700FC90
vertex   6482,    358,   3123,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6482,    358,   3328,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6482,    563,   3328,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1137,    358,   6543,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1014,    358,   6543,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1014,    563,   6543,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6973,    358,   6543,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6851,    563,   6543,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6973,    563,   6543,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6851,    358,   6543,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6912,    563,   6441,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6912,    358,   6646,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6912,    358,   6441,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6912,    563,   6646,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6482,    563,   3123,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF

hmc_seg7_vertex_0700FC90: # 0x0700FC90 - 0x0700FD80
vertex   3878,    819,   1034,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   3756,    614,   1034,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   3878,    614,   1034,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6420,    358,   3226,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6543,    563,   3226,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6420,    563,   3226,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6543,    358,   3226,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6420,    358,   7014,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6543,    563,   7014,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6420,    563,   7014,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6543,    358,   7014,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6482,    358,   6912,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6482,    358,   7117,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6482,    563,   7117,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6482,    563,   6912,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF

hmc_seg7_vertex_0700FD80: # 0x0700FD80 - 0x0700FDF0
vertex   3817,    614,   1137,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   3817,    614,    932,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   3817,    819,    932,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   3878,    819,   1034,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   3756,    819,   1034,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   3756,    614,   1034,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   3817,    819,   1137,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF

hmc_seg7_dl_0700FDF0: # 0x0700FDF0 - 0x0700FEF0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cave_09007000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex hmc_seg7_vertex_0700FAB0, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex hmc_seg7_vertex_0700FBA0, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  9,  7, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 13, 11, 0x0
gsSP1Triangle  0,  2, 14, 0x0
gsSPVertex hmc_seg7_vertex_0700FC90, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex hmc_seg7_vertex_0700FD80, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP1Triangle  0,  2,  6, 0x0
gsSPEndDisplayList

glabel hmc_seg7_dl_0700FEF0 # 0x0700FEF0 - 0x0700FF70
gsDPPipeSync
gsDPSetEnvColor 255, 255, 255, 128
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_ENVIRONMENT, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList hmc_seg7_dl_0700FDF0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetEnvColor 255, 255, 255, 255
gsSPEndDisplayList
