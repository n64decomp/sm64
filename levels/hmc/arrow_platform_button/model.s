hmc_seg7_light_07022E78: # 0x07022E78 - 0x07022E80
.byte 0x79, 0x79, 0x79, 0x00, 0x79, 0x79, 0x79, 0x00

hmc_seg7_light_07022E80: # 0x07022E80 - 0x07022E90
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

hmc_seg7_light_07022E90: # 0x07022E90 - 0x07022E98
.byte 0x4F, 0x64, 0x5B, 0x00, 0x4F, 0x64, 0x5B, 0x00

hmc_seg7_light_07022E98: # 0x07022E98 - 0x07022EA8
.byte 0xA8, 0xD3, 0xC0, 0x00, 0xA8, 0xD3, 0xC0, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

hmc_seg7_vertex_07022EA8: # 0x07022EA8 - 0x07022EE8
vertex     38,     11,     38,    990,      0,  0x00, 0x7F, 0x00, 0xFF
vertex     38,     11,    -37,    990,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    -37,     11,    -37,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    -37,     11,     38,      0,      0,  0x00, 0x7F, 0x00, 0xFF

hmc_seg7_vertex_07022EE8: # 0x07022EE8 - 0x07022FE8
vertex    -50,      0,    -50,      0,      0,  0x00, 0x60, 0xAE, 0xFF
vertex    -37,     11,    -37,      0,      0,  0x00, 0x60, 0xAE, 0xFF
vertex     51,      0,    -50,      0,      0,  0x00, 0x60, 0xAE, 0xFF
vertex     38,     11,    -37,      0,      0,  0x00, 0x60, 0xAE, 0xFF
vertex     51,      0,    -50,      0,      0,  0x52, 0x60, 0x00, 0xFF
vertex     38,     11,    -37,      0,      0,  0x52, 0x60, 0x00, 0xFF
vertex     51,      0,     51,      0,      0,  0x52, 0x60, 0x00, 0xFF
vertex     38,     11,     38,      0,      0,  0x52, 0x60, 0x00, 0xFF
vertex    -37,     11,     38,      0,      0,  0xAE, 0x60, 0x00, 0xFF
vertex    -37,     11,    -37,      0,      0,  0xAE, 0x60, 0x00, 0xFF
vertex    -50,      0,    -50,      0,      0,  0xAE, 0x60, 0x00, 0xFF
vertex    -50,      0,     51,      0,      0,  0xAE, 0x60, 0x00, 0xFF
vertex     38,     11,     38,      0,      0,  0x00, 0x60, 0x52, 0xFF
vertex    -50,      0,     51,      0,      0,  0x00, 0x60, 0x52, 0xFF
vertex     51,      0,     51,      0,      0,  0x00, 0x60, 0x52, 0xFF
vertex    -37,     11,     38,      0,      0,  0x00, 0x60, 0x52, 0xFF

hmc_seg7_dl_07022FE8: # 0x07022FE8 - 0x07023030
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, hmc_seg7_texture_07003800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight hmc_seg7_light_07022E80, 1
gsSPLight hmc_seg7_light_07022E78, 2
gsSPVertex hmc_seg7_vertex_07022EA8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  2, 0x0
gsSPEndDisplayList

hmc_seg7_dl_07023030: # 0x07023030 - 0x07023090
gsSPLight hmc_seg7_light_07022E98, 1
gsSPLight hmc_seg7_light_07022E90, 2
gsSPVertex hmc_seg7_vertex_07022EE8, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  5,  7,  6, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 10, 11, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 15, 13, 0x0
gsSPEndDisplayList

glabel hmc_seg7_dl_07023090 # 0x07023090 - 0x07023160
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_SURF2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 0, 0, 0, 255
gsSPFogPosition 960, 1000
gsSPSetGeometryMode G_FOG
gsDPSetCombineModeLERP G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList hmc_seg7_dl_07022FE8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsSPDisplayList hmc_seg7_dl_07023030
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
