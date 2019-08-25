ssl_seg7_light_07021E50: # 0x07021E50 - 0x07021E58
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

ssl_seg7_light_07021E58: # 0x07021E58 - 0x07021E68
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ssl_seg7_vertex_07021E68: # 0x07021E68 - 0x07021EE8
vertex   -224,      0,   -224,    990,    990,  0xD6, 0xAC, 0xAC, 0xFF
vertex    224,      0,    224,      0,      0,  0x2A, 0xAC, 0x54, 0xFF
vertex   -224,      0,    224,      0,    990,  0x99, 0xCD, 0x33, 0xFF
vertex    224,      0,   -224,    990,      0,  0x67, 0xCD, 0xCD, 0xFF
vertex   -224,    450,    224,      0,    990,  0xD6, 0x54, 0x54, 0xFF
vertex    224,    450,   -224,    990,      0,  0x2A, 0x54, 0xAC, 0xFF
vertex   -224,    450,   -224,    990,    990,  0x99, 0x33, 0xCD, 0xFF
vertex    224,    450,    224,      0,      0,  0x67, 0x33, 0x33, 0xFF

ssl_seg7_vertex_07021EE8: # 0x07021EE8 - 0x07021FE8
vertex    224,    450,   -224,      0,      0,  0x2A, 0x54, 0xAC, 0xFF
vertex   -224,      0,   -224,    990,   2012,  0xD6, 0xAC, 0xAC, 0xFF
vertex   -224,    450,   -224,    990,      0,  0x99, 0x33, 0xCD, 0xFF
vertex   -224,    450,    224,      0,      0,  0xD6, 0x54, 0x54, 0xFF
vertex    224,      0,    224,    990,   2012,  0x2A, 0xAC, 0x54, 0xFF
vertex    224,    450,    224,    990,      0,  0x67, 0x33, 0x33, 0xFF
vertex   -224,      0,    224,      0,   2012,  0x99, 0xCD, 0x33, 0xFF
vertex   -224,    450,   -224,      0,      0,  0x99, 0x33, 0xCD, 0xFF
vertex   -224,      0,   -224,      0,   2012,  0xD6, 0xAC, 0xAC, 0xFF
vertex   -224,      0,    224,    990,   2012,  0x99, 0xCD, 0x33, 0xFF
vertex   -224,    450,    224,    990,      0,  0xD6, 0x54, 0x54, 0xFF
vertex    224,    450,    224,      0,      0,  0x67, 0x33, 0x33, 0xFF
vertex    224,      0,    224,      0,   2012,  0x2A, 0xAC, 0x54, 0xFF
vertex    224,      0,   -224,    990,   2012,  0x67, 0xCD, 0xCD, 0xFF
vertex    224,    450,   -224,    990,      0,  0x2A, 0x54, 0xAC, 0xFF
vertex    224,      0,   -224,      0,   2012,  0x67, 0xCD, 0xCD, 0xFF

ssl_seg7_dl_07021FE8: # 0x07021FE8 - 0x07022040
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, generic_09002000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ssl_seg7_light_07021E58, 1
gsSPLight ssl_seg7_light_07021E50, 2
gsSPVertex ssl_seg7_vertex_07021E68, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

ssl_seg7_dl_07022040: # 0x07022040 - 0x070220A8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, ssl_seg7_texture_07002800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex ssl_seg7_vertex_07021EE8, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 13, 14, 0x0,  0, 15,  1, 0x0
gsSPEndDisplayList

glabel ssl_seg7_dl_070220A8 # 0x070220A8 - 0x07022170
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_SURF2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 0, 0, 0, 255
gsSPFogFactor 0x0E49, 0xF2B7 # This isn't gsSPFogPosition since there is no valid min/max pair that corresponds to 0x0E49F2B7
gsSPSetGeometryMode G_FOG
gsDPSetCombineModeLERP G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ssl_seg7_dl_07021FE8
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList ssl_seg7_dl_07022040
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

ssl_seg7_vertex_07022170: # 0x07022170 - 0x070221B0
vertex   -229,    382,   -157,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -229,     68,   -157,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -229,     68,    157,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -229,    382,    157,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF

ssl_seg7_dl_070221B0: # 0x070221B0 - 0x070221E8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, ssl_seg7_texture_07003800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex ssl_seg7_vertex_07022170, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel ssl_seg7_dl_070221E8 # 0x070221E8 - 0x070222A0
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_TEX_EDGE2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 0, 0, 0, 255
gsSPFogFactor 0x0E49, 0xF2B7 # This isn't gsSPFogPosition since there is no valid min/max pair that corresponds to 0x0E49F2B7
gsSPSetGeometryMode G_FOG
gsDPSetCombineModeLERP G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ssl_seg7_dl_070221B0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_TEX_EDGE, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
