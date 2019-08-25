ttc_seg7_light_07010930: # 0x07010930 - 0x07010938
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

ttc_seg7_light_07010938: # 0x07010938 - 0x07010948
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ttc_seg7_vertex_07010948: # 0x07010948 - 0x07010A28
vertex      0,      0,    -74,   4566,      0,  0x00, 0x22, 0x86, 0xFF
vertex      0,     77,      0,   4566,   -542,  0x00, 0x7E, 0x00, 0xFF
vertex     75,      0,      0,   5716,      0,  0x5C, 0x4A, 0xD3, 0xFF
vertex   -299,   -153,    300,  -4986,    990,  0xD9, 0x9E, 0x45, 0xFF
vertex    300,   -153,    300,   6968,    990,  0x27, 0x9E, 0x45, 0xFF
vertex      0,      0,    300,    990,      0,  0x00, 0x46, 0x69, 0xFF
vertex    300,      0,    300,   6968,      0,  0x4F, 0x62, 0xF7, 0xFF
vertex   -299,      0,    300,  -4986,      0,  0xB1, 0x62, 0xF7, 0xFF
vertex      0,   -153,     75,   4566,    990,  0x00, 0x86, 0x22, 0xFF
vertex    -74,   -153,      0,   3418,    990,  0x9E, 0xCE, 0xC3, 0xFF
vertex      0,   -229,      0,   4566,   1498,  0x00, 0x82, 0x00, 0xFF
vertex     75,   -153,      0,   5716,    990,  0x62, 0xCE, 0xC2, 0xFF
vertex      0,   -153,    -74,   4566,    990,  0x00, 0xCD, 0x8C, 0xFF
vertex    -74,      0,      0,   3418,      0,  0xA4, 0x49, 0xD3, 0xFF

ttc_seg7_vertex_07010A28: # 0x07010A28 - 0x07010B28
vertex    300,      0,    300,  -6482,      0,  0x4F, 0x62, 0xF7, 0xFF
vertex     75,   -153,      0,    990,    990,  0x62, 0xCE, 0xC2, 0xFF
vertex     75,      0,      0,    990,      0,  0x5C, 0x4A, 0xD3, 0xFF
vertex      0,     77,      0,   4566,   -542,  0x00, 0x7E, 0x00, 0xFF
vertex    -74,      0,      0,   3418,      0,  0xA4, 0x49, 0xD3, 0xFF
vertex      0,      0,     75,   4566,      0,  0x00, 0x7B, 0x1C, 0xFF
vertex     75,      0,      0,   5716,      0,  0x5C, 0x4A, 0xD3, 0xFF
vertex      0,      0,    -74,  -2128,      0,  0x00, 0x22, 0x86, 0xFF
vertex      0,   -153,    -74,  -2128,    990,  0x00, 0xCD, 0x8C, 0xFF
vertex    -74,   -153,      0,      0,    990,  0x9E, 0xCE, 0xC3, 0xFF
vertex    -74,      0,      0,      0,      0,  0xA4, 0x49, 0xD3, 0xFF
vertex   -299,   -153,    300,   7442,    990,  0xD9, 0x9E, 0x45, 0xFF
vertex   -299,      0,    300,   7442,      0,  0xB1, 0x62, 0xF7, 0xFF
vertex      0,      0,    -74,   3088,      0,  0x00, 0x22, 0x86, 0xFF
vertex      0,   -153,    -74,   3088,    990,  0x00, 0xCD, 0x8C, 0xFF
vertex    300,   -153,    300,  -6482,    990,  0x27, 0x9E, 0x45, 0xFF

ttc_seg7_vertex_07010B28: # 0x07010B28 - 0x07010B78
vertex    300,   -153,    300,   9166,    990,  0x27, 0x9E, 0x45, 0xFF
vertex   -299,   -153,    300,      0,    990,  0xD9, 0x9E, 0x45, 0xFF
vertex      0,   -153,     75,   4566,    990,  0x00, 0x86, 0x22, 0xFF
vertex    -74,   -153,      0,   3418,    990,  0x9E, 0xCE, 0xC3, 0xFF
vertex     75,   -153,      0,   5716,    990,  0x62, 0xCE, 0xC2, 0xFF

ttc_seg7_vertex_07010B78: # 0x07010B78 - 0x07010BF8
vertex    300,      0,    300,    990,    990,  0x4F, 0x62, 0xF7, 0xFF
vertex     75,      0,      0,    -76,    990,  0x5C, 0x4A, 0xD3, 0xFF
vertex      0,      0,     75,    190,   1362,  0x00, 0x7B, 0x1C, 0xFF
vertex      0,      0,    300,    990,   1842,  0x00, 0x46, 0x69, 0xFF
vertex   -299,      0,    300,    990,    990,  0xB1, 0x62, 0xF7, 0xFF
vertex      0,      0,    300,    990,    136,  0x00, 0x46, 0x69, 0xFF
vertex      0,      0,     75,    190,    616,  0x00, 0x7B, 0x1C, 0xFF
vertex    -74,      0,      0,    -76,    990,  0xA4, 0x49, 0xD3, 0xFF

ttc_seg7_dl_07010BF8: # 0x07010BF8 - 0x07010CF0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, machine_09003800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ttc_seg7_light_07010938, 1
gsSPLight ttc_seg7_light_07010930, 2
gsSPVertex ttc_seg7_vertex_07010948, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  4,  6,  5, 0x0,  3,  5,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0, 10, 11,  8, 0x0
gsSP2Triangles  9, 12, 10, 0x0, 11, 10, 12, 0x0
gsSP1Triangle  1,  0, 13, 0x0
gsSPVertex ttc_seg7_vertex_07010A28, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  5,  6,  3, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0,  9, 11, 12, 0x0
gsSP2Triangles  9, 12, 10, 0x0,  1, 13,  2, 0x0
gsSP2Triangles  1, 14, 13, 0x0,  0, 15,  1, 0x0
gsSPVertex ttc_seg7_vertex_07010B28, 5, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP1Triangle  0,  2,  4, 0x0
gsSPEndDisplayList

ttc_seg7_dl_07010CF0: # 0x07010CF0 - 0x07010D38
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, machine_09005000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex ttc_seg7_vertex_07010B78, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  2, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  7,  4,  6, 0x0
gsSPEndDisplayList

glabel ttc_seg7_dl_07010D38 # 0x07010D38 - 0x07010DE8
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_SURF2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 200, 255, 255, 255
gsSPFogPosition 900, 1000
gsSPSetGeometryMode G_FOG
gsDPSetCombineModeLERP G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ttc_seg7_dl_07010BF8
gsSPDisplayList ttc_seg7_dl_07010CF0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
