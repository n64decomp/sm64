# Sparkles Animation

sparkles_animation_seg4_vertex_04032A48: # 0x04032A48
vertex    -32,      0,      0,      0,    992,  0xFF, 0xFF, 0x64, 0xFF
vertex     32,      0,      0,    992,    992,  0xFF, 0xFF, 0x64, 0xFF
vertex     32,     64,      0,    992,      0,  0xFF, 0xFF, 0x64, 0xFF
vertex    -32,     64,      0,      0,      0,  0xFF, 0xFF, 0x64, 0xFF

sparkles_animation_seg4_texture_04032A88: # 0x04032A88
.incbin "actors/sparkle_animation/sparkle_animation_0.ia16"

sparkles_animation_seg4_texture_04033288: # 0x04033288
.incbin "actors/sparkle_animation/sparkle_animation_1.ia16"

sparkles_animation_seg4_texture_04033A88: # 0x04033A88
.incbin "actors/sparkle_animation/sparkle_animation_2.ia16"

sparkles_animation_seg4_texture_04034288: # 0x04034288
.incbin "actors/sparkle_animation/sparkle_animation_3.ia16"

sparkles_animation_seg4_texture_04034A88: # 0x04034A88
.incbin "actors/sparkle_animation/sparkle_animation_4.ia16"

glabel sparkles_animation_seg4_dl_04035288 # 0x04035288 - 0x04035300
gsSPClearGeometryMode G_LIGHTING
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPTexture -1, -1, 0, 0, 1
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPVertex sparkles_animation_seg4_vertex_04032A48, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsSPSetGeometryMode G_LIGHTING
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

glabel sparkles_animation_seg4_dl_04035300 # 0x04035300 - 0x04035318
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, sparkles_animation_seg4_texture_04032A88
gsSPBranchList sparkles_animation_seg4_dl_04035288

glabel sparkles_animation_seg4_dl_04035318 # 0x04035318 - 0x04035330
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, sparkles_animation_seg4_texture_04033288
gsSPBranchList sparkles_animation_seg4_dl_04035288

glabel sparkles_animation_seg4_dl_04035330 # 0x04035330 - 0x04035348
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, sparkles_animation_seg4_texture_04033A88
gsSPBranchList sparkles_animation_seg4_dl_04035288

glabel sparkles_animation_seg4_dl_04035348 # 0x04035348 - 0x04035360
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, sparkles_animation_seg4_texture_04034288
gsSPBranchList sparkles_animation_seg4_dl_04035288

glabel sparkles_animation_seg4_dl_04035360 # 0x04035360 - 0x04035378
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, sparkles_animation_seg4_texture_04034A88
gsSPBranchList sparkles_animation_seg4_dl_04035288
