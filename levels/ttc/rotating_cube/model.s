ttc_seg7_light_0700E950: # 0x0700E950 - 0x0700E958
.byte 0x55, 0x55, 0x55, 0x00, 0x55, 0x55, 0x55, 0x00

ttc_seg7_light_0700E958: # 0x0700E958 - 0x0700E968
.byte 0xAA, 0xAA, 0xAA, 0x00, 0xAA, 0xAA, 0xAA, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ttc_seg7_light_0700E968: # 0x0700E968 - 0x0700E970
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

ttc_seg7_light_0700E970: # 0x0700E970 - 0x0700E980
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ttc_seg7_vertex_0700E980: # 0x0700E980 - 0x0700EA20
vertex   -199,    200,   -199,   2012,      0,  0xD6, 0x54, 0xAC, 0xFF
vertex      0,      0,   -199,    478,   1340,  0x00, 0x00, 0x81, 0xFF
vertex   -199,   -199,   -199,  -1052,      0,  0xAC, 0xD6, 0xAC, 0xFF
vertex    200,   -199,   -199,   2012,      0,  0x2A, 0xAC, 0xAC, 0xFF
vertex    200,    200,   -199,  -1052,      0,  0x54, 0x2A, 0xAC, 0xFF
vertex    200,    200,    200,  -1052,      0,  0x2A, 0x54, 0x54, 0xFF
vertex      0,      0,    200,    478,   1340,  0x00, 0x00, 0x7F, 0xFF
vertex    200,   -199,    200,   2012,      0,  0x54, 0xD6, 0x54, 0xFF
vertex   -199,   -199,    200,  -1052,      0,  0xD6, 0xAC, 0x54, 0xFF
vertex   -199,    200,    200,   2012,      0,  0xAC, 0x2A, 0x54, 0xFF

ttc_seg7_vertex_0700EA20: # 0x0700EA20 - 0x0700EAC0
vertex   -199,   -199,   -199,   2012,      0,  0xAC, 0xD6, 0xAC, 0xFF
vertex      0,      0,   -199,    478,   1340,  0x00, 0x00, 0x81, 0xFF
vertex    200,   -199,   -199,  -1052,      0,  0x2A, 0xAC, 0xAC, 0xFF
vertex    200,    200,   -199,   2012,      0,  0x54, 0x2A, 0xAC, 0xFF
vertex   -199,    200,   -199,  -1052,      0,  0xD6, 0x54, 0xAC, 0xFF
vertex    200,   -199,    200,  -1052,      0,  0x54, 0xD6, 0x54, 0xFF
vertex      0,      0,    200,    478,   1340,  0x00, 0x00, 0x7F, 0xFF
vertex   -199,   -199,    200,   2012,      0,  0xD6, 0xAC, 0x54, 0xFF
vertex   -199,    200,    200,  -1052,      0,  0xAC, 0x2A, 0x54, 0xFF
vertex    200,    200,    200,   2012,      0,  0x2A, 0x54, 0x54, 0xFF

ttc_seg7_vertex_0700EAC0: # 0x0700EAC0 - 0x0700EBC0
vertex    200,   -199,   -199,      0,    990,  0x2A, 0xAC, 0xAC, 0xFF
vertex    200,   -199,    200,    990,    990,  0x54, 0xD6, 0x54, 0xFF
vertex   -199,   -199,    200,    990,      0,  0xD6, 0xAC, 0x54, 0xFF
vertex   -199,    200,   -199,      0,    990,  0xD6, 0x54, 0xAC, 0xFF
vertex   -199,    200,    200,    990,    990,  0xAC, 0x2A, 0x54, 0xFF
vertex    200,    200,    200,    990,      0,  0x2A, 0x54, 0x54, 0xFF
vertex    200,    200,   -199,      0,      0,  0x54, 0x2A, 0xAC, 0xFF
vertex   -199,    200,    200,    990,      0,  0xAC, 0x2A, 0x54, 0xFF
vertex   -199,   -199,   -199,      0,    990,  0xAC, 0xD6, 0xAC, 0xFF
vertex   -199,   -199,    200,    990,    990,  0xD6, 0xAC, 0x54, 0xFF
vertex   -199,    200,   -199,      0,      0,  0xD6, 0x54, 0xAC, 0xFF
vertex    200,    200,   -199,      0,    990,  0x54, 0x2A, 0xAC, 0xFF
vertex    200,   -199,    200,    990,      0,  0x54, 0xD6, 0x54, 0xFF
vertex    200,   -199,   -199,      0,      0,  0x2A, 0xAC, 0xAC, 0xFF
vertex    200,    200,    200,    990,    990,  0x2A, 0x54, 0x54, 0xFF
vertex   -199,   -199,   -199,      0,      0,  0xAC, 0xD6, 0xAC, 0xFF

ttc_seg7_dl_0700EBC0: # 0x0700EBC0 - 0x0700EC50
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, machine_09001000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ttc_seg7_light_0700E958, 1
gsSPLight ttc_seg7_light_0700E950, 2
gsSPVertex ttc_seg7_vertex_0700E980, 10, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  1,  4, 0x0
gsSP2Triangles  5,  6,  7, 0x0,  8,  6,  9, 0x0
gsSPLight ttc_seg7_light_0700E970, 1
gsSPLight ttc_seg7_light_0700E968, 2
gsSPVertex ttc_seg7_vertex_0700EA20, 10, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  1,  4, 0x0
gsSP2Triangles  5,  6,  7, 0x0,  8,  6,  9, 0x0
gsSPEndDisplayList

ttc_seg7_dl_0700EC50: # 0x0700EC50 - 0x0700ECB8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, machine_09005000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex ttc_seg7_vertex_0700EAC0, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0,  0,  2, 15, 0x0
gsSPEndDisplayList

glabel ttc_seg7_dl_0700ECB8 # 0x0700ECB8 - 0x0700ED68
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
gsSPDisplayList ttc_seg7_dl_0700EBC0
gsSPDisplayList ttc_seg7_dl_0700EC50
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
