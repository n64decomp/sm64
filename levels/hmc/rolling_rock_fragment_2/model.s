hmc_seg7_light_07023EB8: # 0x07023EB8 - 0x07023EC0
.byte 0x79, 0x79, 0x79, 0x00, 0x79, 0x79, 0x79, 0x00

hmc_seg7_light_07023EC0: # 0x07023EC0 - 0x07023ED0
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

hmc_seg7_vertex_07023ED0: # 0x07023ED0 - 0x07023FD0
vertex    -22,     29,     25,      0,   2012,  0x96, 0x13, 0x42, 0xFF
vertex      2,     47,    -24,      0,   2680,  0x1D, 0x7A, 0xF1, 0xFF
vertex    -32,      0,    -24,    258,   2344,  0x8E, 0xF4, 0xCA, 0xFF
vertex     46,    -25,     14,      0,   2012,  0x78, 0xDD, 0x12, 0xFF
vertex     18,      0,    -55,      0,   2916,  0x16, 0xD9, 0x8A, 0xFF
vertex      2,     47,    -24,    302,   2840,  0x1D, 0x7A, 0xF1, 0xFF
vertex      6,      5,     44,      0,   2012,  0x0D, 0x07, 0x7E, 0xFF
vertex     46,    -25,     14,      0,   2672,  0x78, 0xDD, 0x12, 0xFF
vertex      2,     47,    -24,    422,   2120,  0x1D, 0x7A, 0xF1, 0xFF
vertex      2,    -34,     -8,      0,   2012,  0xC9, 0x8F, 0x0E, 0xFF
vertex      6,      5,     44,      0,   2760,  0x0D, 0x07, 0x7E, 0xFF
vertex    -22,     29,     25,    204,   2740,  0x96, 0x13, 0x42, 0xFF
vertex    -32,      0,    -24,    258,   2076,  0x8E, 0xF4, 0xCA, 0xFF
vertex     18,      0,    -55,      0,   2012,  0x16, 0xD9, 0x8A, 0xFF
vertex      2,    -34,     -8,      0,   2692,  0xC9, 0x8F, 0x0E, 0xFF
vertex    -32,      0,    -24,    228,   2432,  0x8E, 0xF4, 0xCA, 0xFF

hmc_seg7_vertex_07023FD0: # 0x07023FD0 - 0x07024080
vertex      6,      5,     44,      0,   2012,  0x0D, 0x07, 0x7E, 0xFF
vertex      2,    -34,     -8,      0,   2760,  0xC9, 0x8F, 0x0E, 0xFF
vertex     46,    -25,     14,    212,   2460,  0x78, 0xDD, 0x12, 0xFF
vertex     18,      0,    -55,      0,   2012,  0x16, 0xD9, 0x8A, 0xFF
vertex    -32,      0,    -24,      0,   2680,  0x8E, 0xF4, 0xCA, 0xFF
vertex      2,     47,    -24,    258,   2344,  0x1D, 0x7A, 0xF1, 0xFF
vertex      2,     47,    -24,      0,   2012,  0x1D, 0x7A, 0xF1, 0xFF
vertex    -22,     29,     25,      0,   2680,  0x96, 0x13, 0x42, 0xFF
vertex      6,      5,     44,    196,   2804,  0x0D, 0x07, 0x7E, 0xFF
vertex     46,    -25,     14,      0,   2916,  0x78, 0xDD, 0x12, 0xFF
vertex      2,    -34,     -8,    184,   2540,  0xC9, 0x8F, 0x0E, 0xFF

hmc_seg7_dl_07024080: # 0x07024080 - 0x07024110
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, hmc_seg7_texture_07004800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPLight hmc_seg7_light_07023EC0, 1
gsSPLight hmc_seg7_light_07023EB8, 2
gsSPVertex hmc_seg7_vertex_07023ED0, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP2Triangles  9, 11, 12, 0x0, 13, 14, 15, 0x0
gsSPVertex hmc_seg7_vertex_07023FD0, 11, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  3,  9, 10, 0x0
gsSPEndDisplayList

glabel hmc_seg7_dl_07024110 # 0x07024110 - 0x070241B8
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_SURF2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 0, 0, 0, 255
gsSPFogPosition 960, 1000
gsSPSetGeometryMode G_FOG
gsDPSetCombineModeLERP G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList hmc_seg7_dl_07024080
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
