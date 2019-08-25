jrb_seg7_light_07004A18: # 0x07004A18 - 0x07004A20
.byte 0x1E, 0x27, 0x3A, 0x00, 0x1E, 0x27, 0x3A, 0x00

jrb_seg7_light_07004A20: # 0x07004A20 - 0x07004A30
.byte 0x79, 0x9F, 0xEB, 0x00, 0x79, 0x9F, 0xEB, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

jrb_seg7_light_07004A30: # 0x07004A30 - 0x07004A38
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

jrb_seg7_light_07004A38: # 0x07004A38 - 0x07004A48
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

jrb_seg7_vertex_07004A48: # 0x07004A48 - 0x07004AC8
vertex  -1944,    512,   7211,  19276,      0,  0x75, 0x00, 0x2F, 0xFF
vertex  -1675,    512,   6547,  15876,      0,  0x7C, 0x00, 0xE6, 0xFF
vertex  -1675,   1024,   6547,  15876,   2522,  0x7C, 0x00, 0xE6, 0xFF
vertex  -1944,   1024,   7211,  19276,   2522,  0x75, 0x00, 0x2F, 0xFF
vertex  -2073,    512,   6165,  12960,      0,  0x2B, 0x00, 0x89, 0xFF
vertex  -2073,   1024,   6165,  12960,   2522,  0xEC, 0x00, 0x83, 0xFF
vertex  -3017,    512,   6778,   7700,      0,  0xBB, 0x00, 0x96, 0xFF
vertex  -3017,   1024,   6778,   7700,   2522,  0xBB, 0x00, 0x96, 0xFF

jrb_seg7_vertex_07004AC8: # 0x07004AC8 - 0x07004B88
vertex  -2771,      0,   1676,   1672,    554,  0xF3, 0x00, 0x7E, 0xFF
vertex   -705,      0,   2401,   1672,   -520,  0xD6, 0x00, 0x77, 0xFF
vertex   -705,    512,   2401,   1840,   -520,  0xD6, 0x00, 0x77, 0xFF
vertex  -4161,    512,   6315,   1840,    886,  0x68, 0x00, 0xB8, 0xFF
vertex  -5256,   1024,   4733,   2012,   1544,  0x75, 0x00, 0xD1, 0xFF
vertex  -4161,   1024,   6315,   2012,    886,  0x68, 0x00, 0xB8, 0xFF
vertex  -5256,    512,   4733,   1840,   1544,  0x7D, 0x00, 0xED, 0xFF
vertex  -5170,    614,   3362,   1876,   1608,  0x7A, 0x00, 0x22, 0xFF
vertex  -5170,      0,   3362,   1672,   1608,  0x6F, 0x00, 0x3D, 0xFF
vertex  -4133,    614,   2187,   1876,   1186,  0x50, 0x00, 0x62, 0xFF
vertex  -4133,      0,   2187,   1672,   1186,  0x3F, 0x00, 0x6E, 0xFF
vertex  -2771,    614,   1676,   1876,    554,  0x10, 0x00, 0x7D, 0xFF

jrb_seg7_dl_07004B88: # 0x07004B88 - 0x07004BF0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_09001800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPLight jrb_seg7_light_07004A20, 1
gsSPLight jrb_seg7_light_07004A18, 2
gsSPVertex jrb_seg7_vertex_07004A48, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  2,  1,  4, 0x0,  2,  4,  5, 0x0
gsSP2Triangles  5,  4,  6, 0x0,  5,  6,  7, 0x0
gsSPEndDisplayList

jrb_seg7_dl_07004BF0: # 0x07004BF0 - 0x07004C78
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_09004800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPLight jrb_seg7_light_07004A38, 1
gsSPLight jrb_seg7_light_07004A30, 2
gsSPVertex jrb_seg7_vertex_07004AC8, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  6,  7,  4, 0x0
gsSP2Triangles  6,  8,  7, 0x0,  8,  9,  7, 0x0
gsSP2Triangles  8, 10,  9, 0x0, 10, 11,  9, 0x0
gsSP2Triangles 10,  0, 11, 0x0,  0,  2, 11, 0x0
gsSPEndDisplayList

glabel jrb_seg7_dl_07004C78 # 0x07004C78 - 0x07004D40
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_SURF2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 5, 80, 75, 255
gsSPFogPosition 900, 1000
gsSPSetGeometryMode G_FOG
gsDPSetCombineModeLERP G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList jrb_seg7_dl_07004B88
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList jrb_seg7_dl_07004BF0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
