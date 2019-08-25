bob_seg7_vertex_0700A4E0: # 0x0700A4E0 - 0x0700A560
vertex   -993,   1690,  -2310,  22656,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2262,   1690,  -4824,    172,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2262,   1075,  -4824,    172,    950,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -993,   1075,  -2310,  22656,    950,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3128,   1690,  -6537, -11272,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3128,   1075,  -6537, -11272,    950,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2436,   1075,  -5167,    990,    950,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2436,   1690,  -5167,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF

bob_seg7_vertex_0700A560: # 0x0700A560 - 0x0700A650
vertex  -3071,    768,   1536,   6100,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3071,   1024,   3072,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3071,    768,   3072,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    768,    870,   5847,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1751,    768,   5335, -10434,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    768,    768,   5847,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1751,    870,   5335, -10434,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1751,    870,   5335,    808,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2263,    768,   4864,  -6418,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1751,    768,   5335,    808,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2263,    870,   4864,  -6418,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2263,    870,   4864,   3800,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2263,    870,   4480,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2262,    768,   4480,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2263,    768,   4864,   3800,    990,  0xFF, 0xFF, 0xFF, 0xFF

bob_seg7_vertex_0700A650: # 0x0700A650 - 0x0700A740
vertex   3078,   1741,   -756,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   3078,   1869,   -756,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6271,   2064,  -2677, -23536,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3071,    768,   1536,   6100,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3071,   1024,   1536,   6100,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3071,   1024,   3072,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -4095,   1024,   4096,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -7167,   1024,   4096, -11272,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -7167,    768,   4096, -11274,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -4095,    768,   4096,    988,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -4095,    768,   4096,    318,    996,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3071,    768,   3072,   6100,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3071,   1024,   3072,   6100,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -4095,   1024,   4096,    318,    -24,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6270,   1936,  -2677, -23536,    990,  0xFF, 0xFF, 0xFF, 0xFF

bob_seg7_vertex_0700A740: # 0x0700A740 - 0x0700A800
vertex   6271,   2064,  -2677,  11912,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   8093,   2064,  -5982, -18564,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   6270,   1936,  -2677,  11890,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   8093,   1936,  -5982, -18588,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1521,    891,   2034,  -8206,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1288,    768,   3820,  19480,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1288,    891,   3820,  19480,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -1521,    768,   2034,  -8206,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    768,    768,   7168,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    768,    870,   7168,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    768,    870,   5847, -12192,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    768,    768,   5847, -12192,    990,  0xFF, 0xFF, 0xFF, 0xFF

bob_seg7_dl_0700A800: # 0x0700A800 - 0x0700A848
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, generic_09008800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bob_seg7_vertex_0700A4E0, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  7,  4,  6, 0x0
gsSPEndDisplayList

bob_seg7_dl_0700A848: # 0x0700A848 - 0x0700A920
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bob_seg7_texture_07000000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bob_seg7_vertex_0700A560, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 14, 11, 13, 0x0
gsSPVertex bob_seg7_vertex_0700A650, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  8,  9, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 12, 13, 0x0
gsSP1Triangle 14,  0,  2, 0x0
gsSPVertex bob_seg7_vertex_0700A740, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 10, 11, 0x0
gsSPEndDisplayList

glabel bob_seg7_dl_0700A920 # 0x0700A920 - 0x0700A9E0
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_TEX_EDGE2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 160, 160, 160, 255
gsSPFogPosition 980, 1000
gsSPSetGeometryMode G_FOG
gsDPSetCombineModeLERP G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bob_seg7_dl_0700A800
gsSPDisplayList bob_seg7_dl_0700A848
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_TEX_EDGE, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
