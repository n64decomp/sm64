ttc_seg7_light_0700ED68: # 0x0700ED68 - 0x0700ED70
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

ttc_seg7_light_0700ED70: # 0x0700ED70 - 0x0700ED80
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ttc_seg7_vertex_0700ED80: # 0x0700ED80 - 0x0700EE60
vertex      0,   -229,    200,  -1052,      0,  0x29, 0xB8, 0x5F, 0xFF
vertex      0,      1,    200,    478,    762,  0x00, 0x00, 0x7F, 0xFF
vertex   -199,    116,    200,   2012,      0,  0xAD, 0x00, 0x5F, 0xFF
vertex   -199,    116,   -199,  -1052,      0,  0xD7, 0x48, 0xA1, 0xFF
vertex      0,      1,   -199,    478,    762,  0x00, 0x00, 0x81, 0xFF
vertex      0,   -229,   -199,   2012,      0,  0xD7, 0xB8, 0xA1, 0xFF
vertex      0,   -229,   -199,  -1052,      0,  0xD7, 0xB8, 0xA1, 0xFF
vertex    200,    116,   -199,   2012,      0,  0x53, 0x00, 0xA0, 0xFF
vertex    200,    116,   -199,  -1052,      0,  0x53, 0x00, 0xA0, 0xFF
vertex   -199,    116,   -199,   2012,      0,  0xD7, 0x48, 0xA1, 0xFF
vertex    200,    116,    200,  -1052,      0,  0x29, 0x47, 0x60, 0xFF
vertex      0,   -229,    200,   2012,      0,  0x29, 0xB8, 0x5F, 0xFF
vertex   -199,    116,    200,  -1052,      0,  0xAD, 0x00, 0x5F, 0xFF
vertex    200,    116,    200,   2012,      0,  0x29, 0x47, 0x60, 0xFF

ttc_seg7_vertex_0700EE60: # 0x0700EE60 - 0x0700EF20
vertex    200,    116,    200,    990,      0,  0x29, 0x47, 0x60, 0xFF
vertex   -199,    116,   -199,      0,    990,  0xD7, 0x48, 0xA1, 0xFF
vertex   -199,    116,    200,    990,    990,  0xAD, 0x00, 0x5F, 0xFF
vertex    200,    116,   -199,      0,      0,  0x53, 0x00, 0xA0, 0xFF
vertex   -199,    116,    200,    990,      0,  0xAD, 0x00, 0x5F, 0xFF
vertex   -199,    116,   -199,      0,      0,  0xD7, 0x48, 0xA1, 0xFF
vertex      0,   -229,   -199,      0,    990,  0xD7, 0xB8, 0xA1, 0xFF
vertex      0,   -229,    200,    990,    990,  0x29, 0xB8, 0x5F, 0xFF
vertex      0,   -229,    200,    990,      0,  0x29, 0xB8, 0x5F, 0xFF
vertex      0,   -229,   -199,      0,      0,  0xD7, 0xB8, 0xA1, 0xFF
vertex    200,    116,   -199,      0,    990,  0x53, 0x00, 0xA0, 0xFF
vertex    200,    116,    200,    990,    990,  0x29, 0x47, 0x60, 0xFF

ttc_seg7_dl_0700EF20: # 0x0700EF20 - 0x0700EF88
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, machine_09001000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ttc_seg7_light_0700ED70, 1
gsSPLight ttc_seg7_light_0700ED68, 2
gsSPVertex ttc_seg7_vertex_0700ED80, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  4,  7, 0x0,  8,  4,  9, 0x0
gsSP2Triangles 10,  1, 11, 0x0, 12,  1, 13, 0x0
gsSPEndDisplayList

ttc_seg7_dl_0700EF88: # 0x0700EF88 - 0x0700EFE0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, machine_09005000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex ttc_seg7_vertex_0700EE60, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 10, 11, 0x0
gsSPEndDisplayList

glabel ttc_seg7_dl_0700EFE0 # 0x0700EFE0 - 0x0700F090
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
gsSPDisplayList ttc_seg7_dl_0700EF20
gsSPDisplayList ttc_seg7_dl_0700EF88
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
