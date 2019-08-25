ttc_seg7_light_0700FC80: # 0x0700FC80 - 0x0700FC88
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

ttc_seg7_light_0700FC88: # 0x0700FC88 - 0x0700FC98
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ttc_seg7_light_0700FC98: # 0x0700FC98 - 0x0700FCA0
.byte 0x46, 0x46, 0x46, 0x00, 0x46, 0x46, 0x46, 0x00

ttc_seg7_light_0700FCA0: # 0x0700FCA0 - 0x0700FCB0
.byte 0x8C, 0x8C, 0x8C, 0x00, 0x8C, 0x8C, 0x8C, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ttc_seg7_vertex_0700FCB0: # 0x0700FCB0 - 0x0700FD30
vertex   -229,      0,   -306,   4510,    -34,  0x81, 0x00, 0x00, 0xFF
vertex   -229,   -137,   -306,   4510,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -229,   -137,    308,      0,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -229,      0,    308,      0,    -34,  0x81, 0x00, 0x00, 0xFF
vertex    230,      0,    308,      0,    -34,  0x7F, 0x00, 0x00, 0xFF
vertex    230,   -137,   -306,   4510,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    230,      0,   -306,   4510,    -34,  0x7F, 0x00, 0x00, 0xFF
vertex    230,   -137,    308,      0,    990,  0x7F, 0x00, 0x00, 0xFF

ttc_seg7_vertex_0700FD30: # 0x0700FD30 - 0x0700FE30
vertex   -229,   -137,    308,    990,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -229,    -35,    344,    334,    234,  0x81, 0x00, 0x00, 0xFF
vertex   -229,      0,    308,    990,      0,  0x81, 0x00, 0x00, 0xFF
vertex    230,      0,    308,    990,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    230,    -35,    344,    334,    234,  0x7F, 0x00, 0x00, 0xFF
vertex    230,   -137,    344,    334,    990,  0x54, 0xD6, 0x54, 0xFF
vertex    230,   -137,    308,    990,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    230,   -137,   -306,    990,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    230,   -137,   -342,    334,    990,  0x33, 0x99, 0xCD, 0xFF
vertex    230,    -35,   -342,    334,    234,  0x7F, 0x00, 0x00, 0xFF
vertex    230,      0,   -306,    990,      0,  0x7F, 0x00, 0x00, 0xFF
vertex   -229,    -86,    344,    334,    612,  0x00, 0x00, 0x7F, 0xFF
vertex   -229,   -137,    344,    334,    990,  0xCD, 0x99, 0x33, 0xFF
vertex    230,    -86,    344,    334,    612,  0x00, 0x00, 0x7F, 0xFF
vertex   -229,   -137,   -342,    334,    990,  0xAC, 0xD6, 0xAC, 0xFF
vertex    230,    -86,   -342,    334,    612,  0x00, 0x00, 0x81, 0xFF

ttc_seg7_vertex_0700FE30: # 0x0700FE30 - 0x0700FE90
vertex   -229,      0,   -306,    990,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -229,    -35,   -342,    334,    234,  0x81, 0x00, 0x00, 0xFF
vertex   -229,   -137,   -342,    334,    990,  0xAC, 0xD6, 0xAC, 0xFF
vertex   -229,   -137,   -306,    990,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -229,    -86,   -342,    334,    612,  0x00, 0x00, 0x81, 0xFF
vertex    230,    -86,   -342,    334,    612,  0x00, 0x00, 0x81, 0xFF

ttc_seg7_vertex_0700FE90: # 0x0700FE90 - 0x0700FED0
vertex    230,   -137,   -342,      0,      0,  0x33, 0x99, 0xCD, 0xFF
vertex   -229,   -137,    344,      0,      0,  0xCD, 0x99, 0x33, 0xFF
vertex   -229,   -137,   -342,      0,      0,  0xAC, 0xD6, 0xAC, 0xFF
vertex    230,   -137,    344,      0,      0,  0x54, 0xD6, 0x54, 0xFF

ttc_seg7_dl_0700FED0: # 0x0700FED0 - 0x0700FF28
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, machine_09005800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ttc_seg7_light_0700FC88, 1
gsSPLight ttc_seg7_light_0700FC80, 2
gsSPVertex ttc_seg7_vertex_0700FCB0, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

ttc_seg7_dl_0700FF28: # 0x0700FF28 - 0x0700FFB8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, machine_09006000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex ttc_seg7_vertex_0700FD30, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0,  5, 11, 12, 0x0
gsSP2Triangles  5, 13, 11, 0x0, 14, 15,  8, 0x0
gsSP1Triangle  0, 12,  1, 0x0
gsSPVertex ttc_seg7_vertex_0700FE30, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP1Triangle  2,  4,  5, 0x0
gsSPEndDisplayList

ttc_seg7_dl_0700FFB8: # 0x0700FFB8 - 0x0700FFE8
gsSPLight ttc_seg7_light_0700FCA0, 1
gsSPLight ttc_seg7_light_0700FC98, 2
gsSPVertex ttc_seg7_vertex_0700FE90, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel ttc_seg7_dl_0700FFE8 # 0x0700FFE8 - 0x070100B0
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
gsSPDisplayList ttc_seg7_dl_0700FED0
gsSPDisplayList ttc_seg7_dl_0700FF28
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsSPDisplayList ttc_seg7_dl_0700FFB8
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
