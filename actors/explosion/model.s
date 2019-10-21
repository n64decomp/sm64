# Explosion

explosion_seg3_vertex_030009C8: # 0x030009C8
vertex   -128,   -128,      0,      0,    992,  0xFF, 0xFF, 0xFF, 0xFF
vertex    128,   -128,      0,    992,    992,  0xFF, 0xFF, 0xFF, 0xFF
vertex    128,    128,      0,    992,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -128,    128,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

explosion_seg3_texture_03000A08: # 0x03000A08
.incbin "actors/explosion/explosion_0.rgba16"

explosion_seg3_texture_03001208: # 0x03001208
.incbin "actors/explosion/explosion_1.rgba16"

explosion_seg3_texture_03001A08: # 0x03001A08
.incbin "actors/explosion/explosion_2.rgba16"

explosion_seg3_texture_03002208: # 0x03002208
.incbin "actors/explosion/explosion_3.rgba16"

explosion_seg3_texture_03002A08: # 0x03002A08
.incbin "actors/explosion/explosion_4.rgba16"

explosion_seg3_texture_03003208: # 0x03003208
.incbin "actors/explosion/explosion_5.rgba16"

explosion_seg3_texture_03003A08: # 0x03003A08
.incbin "actors/explosion/explosion_6.rgba16"

glabel explosion_seg3_dl_03004208 # 0x03004208 - 0x03004298
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_ENVIRONMENT, G_ACMUX_0
gsDPSetEnvColor 255, 255, 255, 150
gsSPClearGeometryMode G_LIGHTING
gsSPTexture -1, -1, 0, 0, 1
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPVertex explosion_seg3_vertex_030009C8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsSPSetGeometryMode G_LIGHTING
gsDPSetEnvColor 255, 255, 255, 255
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

glabel explosion_seg3_dl_03004298 # 0x03004298 - 0x030042B0
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, explosion_seg3_texture_03000A08
gsSPBranchList explosion_seg3_dl_03004208

glabel explosion_seg3_dl_030042B0 # 0x030042B0 - 0x030042C8
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, explosion_seg3_texture_03001208
gsSPBranchList explosion_seg3_dl_03004208

glabel explosion_seg3_dl_030042C8 # 0x030042C8 - 0x030042E0
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, explosion_seg3_texture_03001A08
gsSPBranchList explosion_seg3_dl_03004208

glabel explosion_seg3_dl_030042E0 # 0x030042E0 - 0x030042F8
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, explosion_seg3_texture_03002208
gsSPBranchList explosion_seg3_dl_03004208

glabel explosion_seg3_dl_030042F8 # 0x030042F8 - 0x03004310
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, explosion_seg3_texture_03002A08
gsSPBranchList explosion_seg3_dl_03004208

glabel explosion_seg3_dl_03004310 # 0x03004310 - 0x03004328
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, explosion_seg3_texture_03003208
gsSPBranchList explosion_seg3_dl_03004208

glabel explosion_seg3_dl_03004328 # 0x03004328 - 0x03004340
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, explosion_seg3_texture_03003A08
gsSPBranchList explosion_seg3_dl_03004208
