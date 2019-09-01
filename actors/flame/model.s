# Flame

flame_seg3_vertex_030172E0: # 0x030172E0
vertex    -25,    -25,      0,      0,    992,  0x00, 0x00, 0x00, 0x00
vertex     25,    -25,      0,    992,    992,  0x00, 0x00, 0x00, 0x00
vertex     25,     25,      0,    992,      0,  0x00, 0x00, 0x00, 0x00
vertex    -25,     25,      0,      0,      0,  0x00, 0x00, 0x00, 0x00

flame_seg3_texture_03017320: # 0x03017320
.incbin "actors/flame/flame_0.ia16"

flame_seg3_texture_03017B20: # 0x03017B20
.incbin "actors/flame/flame_1.ia16"

flame_seg3_texture_03018320: # 0x03018320
.incbin "actors/flame/flame_2.ia16"

flame_seg3_texture_03018B20: # 0x03018B20
.incbin "actors/flame/flame_3.ia16"

flame_seg3_texture_03019320: # 0x03019320
.incbin "actors/flame/flame_4.ia16"

flame_seg3_texture_03019B20: # 0x03019B20
.incbin "actors/flame/flame_5.ia16"

flame_seg3_texture_0301A320: # 0x0301A320
.incbin "actors/flame/flame_6.ia16"

flame_seg3_texture_0301AB20: # 0x0301AB20
.incbin "actors/flame/flame_7.ia16"

glabel flame_seg3_dl_0301B320 # 0x0301B320 - 0x0301B3B0
gsSPClearGeometryMode G_LIGHTING | G_SHADING_SMOOTH
gsDPSetEnvColor 255, 50, 0, 200
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_ENVIRONMENT, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_ENVIRONMENT, G_ACMUX_0
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPTexture -1, -1, 0, 0, 1
gsSPVertex flame_seg3_vertex_030172E0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsSPSetGeometryMode G_LIGHTING | G_SHADING_SMOOTH
gsDPSetEnvColor 255, 255, 255, 255
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

glabel flame_seg3_dl_0301B3B0 # 0x0301B3B0 - 0x0301B3C8
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, flame_seg3_texture_03017320
gsSPBranchList flame_seg3_dl_0301B320

glabel flame_seg3_dl_0301B3C8 # 0x0301B3C8 - 0x0301B3E0
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, flame_seg3_texture_03017B20
gsSPBranchList flame_seg3_dl_0301B320

glabel flame_seg3_dl_0301B3E0 # 0x0301B3E0 - 0x0301B3F8
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, flame_seg3_texture_03018320
gsSPBranchList flame_seg3_dl_0301B320

glabel flame_seg3_dl_0301B3F8 # 0x0301B3F8 - 0x0301B410
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, flame_seg3_texture_03018B20
gsSPBranchList flame_seg3_dl_0301B320

glabel flame_seg3_dl_0301B410 # 0x0301B410 - 0x0301B428
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, flame_seg3_texture_03019320
gsSPBranchList flame_seg3_dl_0301B320

glabel flame_seg3_dl_0301B428 # 0x0301B428 - 0x0301B440
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, flame_seg3_texture_03019B20
gsSPBranchList flame_seg3_dl_0301B320

glabel flame_seg3_dl_0301B440 # 0x0301B440 - 0x0301B458
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, flame_seg3_texture_0301A320
gsSPBranchList flame_seg3_dl_0301B320

glabel flame_seg3_dl_0301B458 # 0x0301B458 - 0x0301B470
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, flame_seg3_texture_0301AB20
gsSPBranchList flame_seg3_dl_0301B320

glabel flame_seg3_dl_0301B470 # 0x0301B470 - 0x0301B500
gsSPClearGeometryMode G_LIGHTING | G_SHADING_SMOOTH
gsDPSetEnvColor 100, 100, 255, 255
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_ENVIRONMENT, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_ENVIRONMENT, G_ACMUX_0
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPTexture -1, -1, 0, 0, 1
gsSPVertex flame_seg3_vertex_030172E0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsSPSetGeometryMode G_LIGHTING | G_SHADING_SMOOTH
gsDPSetEnvColor 255, 255, 255, 255
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

glabel flame_seg3_dl_0301B500 # 0x0301B500 - 0x0301B518
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, flame_seg3_texture_03017320
gsSPBranchList flame_seg3_dl_0301B470

glabel flame_seg3_dl_0301B518 # 0x0301B518 - 0x0301B530
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, flame_seg3_texture_03017B20
gsSPBranchList flame_seg3_dl_0301B470

glabel flame_seg3_dl_0301B530 # 0x0301B530 - 0x0301B548
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, flame_seg3_texture_03018320
gsSPBranchList flame_seg3_dl_0301B470

glabel flame_seg3_dl_0301B548 # 0x0301B548 - 0x0301B560
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, flame_seg3_texture_03018B20
gsSPBranchList flame_seg3_dl_0301B470

glabel flame_seg3_dl_0301B560 # 0x0301B560 - 0x0301B578
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, flame_seg3_texture_03019320
gsSPBranchList flame_seg3_dl_0301B470

glabel flame_seg3_dl_0301B578 # 0x0301B578 - 0x0301B590
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, flame_seg3_texture_03019B20
gsSPBranchList flame_seg3_dl_0301B470

glabel flame_seg3_dl_0301B590 # 0x0301B590 - 0x0301B5A8
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, flame_seg3_texture_0301A320
gsSPBranchList flame_seg3_dl_0301B470

glabel flame_seg3_dl_0301B5A8 # 0x0301B5A8 - 0x0301B5C0
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, flame_seg3_texture_0301AB20
gsSPBranchList flame_seg3_dl_0301B470
