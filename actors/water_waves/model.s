# Water Waves

water_waves_seg4_vertex_04025318: # 0x04025318
vertex    -64,      0,     64,      0,      0,  0xFF, 0xFF, 0xFF, 0xC8
vertex     64,      0,     64,    992,      0,  0xFF, 0xFF, 0xFF, 0xC8
vertex     64,      0,    -64,    992,    992,  0xFF, 0xFF, 0xFF, 0xC8
vertex    -64,      0,    -64,      0,    992,  0xFF, 0xFF, 0xFF, 0xC8

water_waves_seg4_texture_04025358: # 0x04025358
.incbin "actors/water_waves/water_waves_0.ia16"

water_waves_seg4_texture_04025B58: # 0x04025B58
.incbin "actors/water_waves/water_waves_1.ia16"

water_waves_seg4_texture_04026358: # 0x04026358
.incbin "actors/water_waves/water_waves_2.ia16"

water_waves_seg4_texture_04026B58: # 0x04026B58
.incbin "actors/water_waves/water_waves_3.ia16"

glabel water_waves_seg4_dl_04027358 # 0x04027358 - 0x040273A0
gsSPClearGeometryMode G_LIGHTING
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPTexture -1, -1, 0, 0, 1
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPEndDisplayList

glabel water_waves_seg4_dl_040273A0 # 0x040273A0 - 0x040273D8
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsDPPipeSync
gsSPTexture 1, 1, 0, 0, 0
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

glabel water_waves_seg4_dl_040273D8 # 0x040273D8 - 0x040273F0
gsSPDisplayList water_waves_seg4_dl_04027358
gsSPVertex water_waves_seg4_vertex_04025318, 4, 0
gsSPBranchList water_waves_seg4_dl_040273A0

glabel water_waves_seg4_dl_040273F0 # 0x040273F0 - 0x04027408
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, water_waves_seg4_texture_04025358
gsSPBranchList water_waves_seg4_dl_040273D8

glabel water_waves_seg4_dl_04027408 # 0x04027408 - 0x04027420
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, water_waves_seg4_texture_04025B58
gsSPBranchList water_waves_seg4_dl_040273D8

glabel water_waves_seg4_dl_04027420 # 0x04027420 - 0x04027438
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, water_waves_seg4_texture_04026358
gsSPBranchList water_waves_seg4_dl_040273D8

glabel water_waves_seg4_dl_04027438 # 0x04027438 - 0x04027450
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, water_waves_seg4_texture_04026B58
gsSPBranchList water_waves_seg4_dl_040273D8
