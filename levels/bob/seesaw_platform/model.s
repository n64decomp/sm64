bob_seg7_light_0700E510: # 0x0700E510 - 0x0700E518
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

bob_seg7_light_0700E518: # 0x0700E518 - 0x0700E528
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bob_seg7_vertex_0700E528: # 0x0700E528 - 0x0700E628
vertex   -180,     51,   -904,    990,      0,  0xCD, 0x33, 0x99, 0xFF
vertex   -180,      0,   -904,    950,    284,  0xAC, 0xAC, 0xD6, 0xFF
vertex   -180,     51,    905,  -3222,      0,  0xAC, 0x54, 0x2A, 0xFF
vertex   -180,      0,   -904,  -3204,      0,  0xAC, 0xAC, 0xD6, 0xFF
vertex    181,      0,   -904,  -3204,   2012,  0x33, 0xCD, 0x99, 0xFF
vertex    181,      0,    905,    990,   2012,  0x54, 0xAC, 0x2A, 0xFF
vertex   -180,      0,    905,    990,      0,  0xCD, 0xCD, 0x67, 0xFF
vertex    181,     51,   -904,    990,   2012,  0x54, 0x54, 0xD6, 0xFF
vertex    181,     51,    905,  -3222,   2012,  0x33, 0x33, 0x67, 0xFF
vertex    181,      0,    905,  -3244,    304,  0x54, 0xAC, 0x2A, 0xFF
vertex    181,      0,   -904,    950,    284,  0x33, 0xCD, 0x99, 0xFF
vertex    181,     51,   -904,    990,      0,  0x54, 0x54, 0xD6, 0xFF
vertex    181,     51,    905,  -3222,      0,  0x33, 0x33, 0x67, 0xFF
vertex   -180,      0,    905,      0,    172,  0xCD, 0xCD, 0x67, 0xFF
vertex    181,     51,    905,    690,      0,  0x33, 0x33, 0x67, 0xFF
vertex   -180,     51,    905,      0,      0,  0xAC, 0x54, 0x2A, 0xFF

bob_seg7_vertex_0700E628: # 0x0700E628 - 0x0700E6C8
vertex   -180,      0,   -904,    950,    284,  0xAC, 0xAC, 0xD6, 0xFF
vertex   -180,      0,    905,  -3244,    304,  0xCD, 0xCD, 0x67, 0xFF
vertex   -180,     51,    905,  -3222,      0,  0xAC, 0x54, 0x2A, 0xFF
vertex    181,      0,   -904,    268,   2012,  0x33, 0xCD, 0x99, 0xFF
vertex   -180,      0,   -904,    990,   2012,  0xAC, 0xAC, 0xD6, 0xFF
vertex   -180,     51,   -904,    990,   1808,  0xCD, 0x33, 0x99, 0xFF
vertex    181,     51,   -904,    268,   1808,  0x54, 0x54, 0xD6, 0xFF
vertex   -180,      0,    905,      0,    172,  0xCD, 0xCD, 0x67, 0xFF
vertex    181,      0,    905,    690,    172,  0x54, 0xAC, 0x2A, 0xFF
vertex    181,     51,    905,    690,      0,  0x33, 0x33, 0x67, 0xFF

bob_seg7_dl_0700E6C8: # 0x0700E6C8 - 0x0700E768
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, generic_09006000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPLight bob_seg7_light_0700E518, 1
gsSPLight bob_seg7_light_0700E510, 2
gsSPVertex bob_seg7_vertex_0700E528, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  3,  5, 0x0,  7,  0,  2, 0x0
gsSP2Triangles  8,  7,  2, 0x0,  9, 10, 11, 0x0
gsSP2Triangles 12,  9, 11, 0x0, 13, 14, 15, 0x0
gsSPVertex bob_seg7_vertex_0700E628, 10, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSPEndDisplayList

glabel bob_seg7_dl_0700E768 # 0x0700E768 - 0x0700E810
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_SURF2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 160, 160, 160, 255
gsSPFogPosition 980, 1000
gsSPSetGeometryMode G_FOG
gsDPSetCombineModeLERP G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList bob_seg7_dl_0700E6C8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
