hmc_seg7_vertex_07013F38: # 0x07013F38 - 0x07014028
vertex   4875,   -613,  -4402,    990,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   4875,   -101,  -3890,      0,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   4875,   -613,  -3890,      0,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   5274,   -716,  -5621,    990,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   4762,   -204,  -5621,      0,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   4762,   -716,  -5621,      0,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   5274,   -204,  -5621,    990,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   4752,   -613,   -511,      0,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   4752,   -101,  -1023,    990,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   4752,   -613,  -1023,    990,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   4752,   -101,   -511,      0,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   5571,   -511,  -3173,      0,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   5571,      0,  -3173,      0,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   5571,      0,  -3685,    990,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   5571,   -511,  -3685,    990,    990,  0xFF, 0x00, 0x00, 0xB4

hmc_seg7_vertex_07014028: # 0x07014028 - 0x07014118
vertex   3523,   -511,   -869,      0,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   3523,      0,   -869,      0,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   3523,      0,  -1381,    990,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   4875,   -613,  -4402,    990,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   4875,   -101,  -4402,    990,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   4875,   -101,  -3890,      0,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   1700,   -716,  -2866,    990,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   1700,   -204,  -2354,      0,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   1700,   -716,  -2354,      0,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   1700,   -204,  -2866,    990,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   4240,   -511,  -3481,      0,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   4240,      0,  -3993,    990,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   4240,   -511,  -3993,    990,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   4240,      0,  -3481,      0,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   3523,   -511,  -1381,    990,    990,  0xFF, 0x00, 0x00, 0xB4

hmc_seg7_vertex_07014118: # 0x07014118 - 0x07014218
vertex   1700,   -716,      0,    990,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   1700,   -204,    512,      0,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   1700,   -716,    512,      0,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   2253,    410,   -296,    990,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   1741,    922,   -296,      0,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   1741,    410,   -296,      0,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   2253,    922,   -296,    990,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   1700,    410,   -180,    990,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   1700,    922,   -180,    990,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   1700,    922,    256,      0,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   1700,    410,    256,      0,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   2294,   -716,    512,      0,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   2294,   -204,      0,    990,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   2294,   -716,      0,    990,    990,  0xFF, 0x00, 0x00, 0xB4
vertex   2294,   -204,    512,      0,      0,  0xFF, 0x00, 0x00, 0xB4
vertex   1700,   -204,      0,    990,      0,  0xFF, 0x00, 0x00, 0xB4

hmc_seg7_dl_07014218: # 0x07014218 - 0x07014300
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, cave_0900C000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex hmc_seg7_vertex_07013F38, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex hmc_seg7_vertex_07014028, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  9,  7, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 13, 11, 0x0
gsSP1Triangle  0,  2, 14, 0x0
gsSPVertex hmc_seg7_vertex_07014118, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0,  0, 15,  1, 0x0
gsSPEndDisplayList

glabel hmc_seg7_dl_07014300 # 0x07014300 - 0x07014370
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList hmc_seg7_dl_07014218
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
