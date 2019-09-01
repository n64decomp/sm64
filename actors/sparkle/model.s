# Sparkles

sparkles_seg4_vertex_04027450: # 0x04027450
vertex    -32,      0,      0,      0,   1984,  0x00, 0x00, 0x7F, 0x00
vertex     32,      0,      0,   1984,   1984,  0x00, 0x00, 0x7F, 0x00
vertex     32,     64,      0,   1984,      0,  0x00, 0x00, 0x7F, 0x00
vertex    -32,     64,      0,      0,      0,  0x00, 0x00, 0x7F, 0x00

sparkles_seg4_texture_04027490: # 0x04027490
.incbin "actors/sparkle/sparkle_0.ia16"

sparkles_seg4_texture_04027C90: # 0x04027C90
.incbin "actors/sparkle/sparkle_1.ia16"

sparkles_seg4_texture_04028490: # 0x04028490
.incbin "actors/sparkle/sparkle_2.ia16"

sparkles_seg4_texture_04028C90: # 0x04028C90
.incbin "actors/sparkle/sparkle_3.ia16"

sparkles_seg4_texture_04029490: # 0x04029490
.incbin "actors/sparkle/sparkle_4.ia16"

sparkles_seg4_texture_04029C90: # 0x04029C90
.incbin "actors/sparkle/sparkle_5.ia16"

glabel sparkles_seg4_dl_0402A490 # 0x0402A490 - 0x0402A4F8
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPTexture -32768, -32768, 0, 0, 1
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPVertex sparkles_seg4_vertex_04027450, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture 1, 1, 0, 0, 0
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

glabel sparkles_seg4_dl_0402A4F8 # 0x0402A4F8 - 0x0402A510
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sparkles_seg4_texture_04027490
gsSPBranchList sparkles_seg4_dl_0402A490

glabel sparkles_seg4_dl_0402A510 # 0x0402A510 - 0x0402A528
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sparkles_seg4_texture_04027C90
gsSPBranchList sparkles_seg4_dl_0402A490

glabel sparkles_seg4_dl_0402A528 # 0x0402A528 - 0x0402A540
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sparkles_seg4_texture_04028490
gsSPBranchList sparkles_seg4_dl_0402A490

glabel sparkles_seg4_dl_0402A540 # 0x0402A540 - 0x0402A558
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sparkles_seg4_texture_04028C90
gsSPBranchList sparkles_seg4_dl_0402A490

glabel sparkles_seg4_dl_0402A558 # 0x0402A558 - 0x0402A570
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sparkles_seg4_texture_04029490
gsSPBranchList sparkles_seg4_dl_0402A490

glabel sparkles_seg4_dl_0402A570 # 0x0402A570 - 0x0402A588
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sparkles_seg4_texture_04029C90
gsSPBranchList sparkles_seg4_dl_0402A490
