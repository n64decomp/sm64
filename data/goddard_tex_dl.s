.include "macros.inc"
.include "PR/gbi.inc"

.section .rodata

.balign 8
glabel textureHandOpen # 0x801A8730
   .incbin "textures/intro_raw/hand_open.rgba16"

#! stray EndDisplayList
gsSPEndDisplayList

.balign 8
glabel textureHandClosed # 0x801A8F38
   .incbin "textures/intro_raw/hand_closed.rgba16"
texture_red_star_0:
   .incbin "textures/intro_raw/red_star_0.rgba16"
texture_red_star_1:
   .incbin "textures/intro_raw/red_star_1.rgba16"
texture_red_star_2:
   .incbin "textures/intro_raw/red_star_2.rgba16"
texture_red_star_3:
   .incbin "textures/intro_raw/red_star_3.rgba16"
texture_red_star_4:
   .incbin "textures/intro_raw/red_star_4.rgba16"
texture_red_star_5:
   .incbin "textures/intro_raw/red_star_5.rgba16"
texture_red_star_6:
   .incbin "textures/intro_raw/red_star_6.rgba16"
texture_red_star_7:
   .incbin "textures/intro_raw/red_star_7.rgba16"
texture_white_star_0:
   .incbin "textures/intro_raw/white_star_0.rgba16"
texture_white_star_1:
   .incbin "textures/intro_raw/white_star_1.rgba16"
texture_white_star_2:
   .incbin "textures/intro_raw/white_star_2.rgba16"
texture_white_star_3:
   .incbin "textures/intro_raw/white_star_3.rgba16"
texture_white_star_4:
   .incbin "textures/intro_raw/white_star_4.rgba16"
texture_white_star_5:
   .incbin "textures/intro_raw/white_star_5.rgba16"
texture_white_star_6:
   .incbin "textures/intro_raw/white_star_6.rgba16"
texture_white_star_7:
   .incbin "textures/intro_raw/white_star_7.rgba16"

star_vertex_801B1738:
   vertex    -64,      0,      0,      0,    992,  0x00, 0x00, 0x7F, 0x00
   vertex     64,      0,      0,    992,    992,  0x00, 0x00, 0x7F, 0x00
   vertex     64,    128,      0,    992,      0,  0x00, 0x00, 0x7F, 0x00
   vertex    -64,    128,      0,      0,      0,  0x00, 0x00, 0x7F, 0x00

D_vertex_801B1778: #! no references to these vertices
   vertex  16384,      0,      0,      0,  16384,  0x00, 0x00, 0x00, 0x00
   vertex      0,      0,  16384,      0,      0,  0x00, 0x00, 0x40, 0x00
   vertex      0,      0,      0,      0,      0,  0x00, 0x00, 0x00, 0x00
   vertex      0,      0,      0,      0,      0,  0x00, 0x00, 0x00, 0x00

star_dl_common:
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode 0x000C0000
gsDPSetRenderMode G_RM_AA_ZB_TEX_EDGE, G_RM_NOOP2
gsSPTexture -1, -1, 0, 0, 1
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPVertex star_vertex_801B1738, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetRenderMode G_RM_AA_ZB_OPA_INTER, G_RM_NOOP2
gsSPEndDisplayList

red_star_dl_801B1838:
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_red_star_0
gsSPBranchList star_dl_common

red_star_dl_801B1850:
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_red_star_1
gsSPBranchList star_dl_common

red_star_dl_801B1868:
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_red_star_2
gsSPBranchList star_dl_common

red_star_dl_801B1880:
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_red_star_3
gsSPBranchList star_dl_common

red_star_dl_801B1898:
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_red_star_4
gsSPBranchList star_dl_common

red_star_dl_801B18B0:
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_red_star_5
gsSPBranchList star_dl_common

red_star_dl_801B18C8:
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_red_star_6
gsSPBranchList star_dl_common

red_star_dl_801B18E0:
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_red_star_7
gsSPBranchList star_dl_common

white_star_dl_801B18F8:
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_white_star_0
gsSPBranchList star_dl_common

white_star_dl_801B1910:
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_white_star_1
gsSPBranchList star_dl_common

white_star_dl_801B1928:
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_white_star_2
gsSPBranchList star_dl_common

white_star_dl_801B1940:
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_white_star_3
gsSPBranchList star_dl_common

white_star_dl_801B1958:
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_white_star_4
gsSPBranchList star_dl_common

white_star_dl_801B1970:
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_white_star_5
gsSPBranchList star_dl_common

white_star_dl_801B1988:
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_white_star_6
gsSPBranchList star_dl_common

white_star_dl_801B19A0:
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_white_star_7
gsSPBranchList star_dl_common

glabel redStarDlArray # 0x801B19B8
   .word red_star_dl_801B1838
   .word red_star_dl_801B1838
   .word red_star_dl_801B1850
   .word red_star_dl_801B1850
   .word red_star_dl_801B1868
   .word red_star_dl_801B1868
   .word red_star_dl_801B1880
   .word red_star_dl_801B1880
   .word red_star_dl_801B1898
   .word red_star_dl_801B1898
   .word red_star_dl_801B18B0
   .word red_star_dl_801B18B0
   .word red_star_dl_801B18C8
   .word red_star_dl_801B18C8
   .word red_star_dl_801B18E0
   .word red_star_dl_801B18E0

glabel silverStarDlArray # 0x801B19F8
   .word white_star_dl_801B18F8
   .word white_star_dl_801B18F8
   .word white_star_dl_801B1910
   .word white_star_dl_801B1910
   .word white_star_dl_801B1928
   .word white_star_dl_801B1928
   .word white_star_dl_801B1940
   .word white_star_dl_801B1940
   .word white_star_dl_801B1958
   .word white_star_dl_801B1958
   .word white_star_dl_801B1970
   .word white_star_dl_801B1970
   .word white_star_dl_801B1988
   .word white_star_dl_801B1988
   .word white_star_dl_801B19A0
   .word white_star_dl_801B19A0

texture_sparkle_0:
   .incbin "textures/intro_raw/sparkle_0.rgba16"
texture_sparkle_1:
   .incbin "textures/intro_raw/sparkle_1.rgba16"
texture_sparkle_2:
   .incbin "textures/intro_raw/sparkle_2.rgba16"
texture_sparkle_3:
   .incbin "textures/intro_raw/sparkle_3.rgba16"
texture_sparkle_4:
   .incbin "textures/intro_raw/sparkle_4.rgba16"
texture_sparkle_5: #! no references to this texture 0x801B4238
   .incbin "textures/intro_raw/sparkle_5.rgba16"

sparkle_vertex_801B4A38:
   vertex    -32,      0,      0,      0,   1984,  0x00, 0x00, 0x7F, 0x00
   vertex     32,      0,      0,   1984,   1984,  0x00, 0x00, 0x7F, 0x00
   vertex     32,     64,      0,   1984,      0,  0x00, 0x00, 0x7F, 0x00
   vertex    -32,     64,      0,      0,      0,  0x00, 0x00, 0x7F, 0x00

sparkle_dl_common: # 0x801B4A78
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_PRIMITIVE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_PRIMITIVE, G_ACMUX_0
gsSPClearGeometryMode 0x000C0000
gsDPSetRenderMode G_RM_AA_ZB_TEX_EDGE, G_RM_NOOP2
gsSPTexture -32768, -32768, 0, 0, 1
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPVertex sparkle_vertex_801B4A38, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture 1, 1, 0, 0, 0
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetRenderMode G_RM_AA_ZB_OPA_INTER, G_RM_NOOP2
gsSPEndDisplayList

red_dl_801B4AF8:
gsDPSetPrimColor 0, 0, 0xFF, 0x00, 0x00, 0xFF
gsSPEndDisplayList

white_dl_801B4B08:
gsDPSetPrimColor 0, 0, 0xFF, 0xFF, 0xFF, 0xFF
gsSPEndDisplayList

sparkle_dl_801B4B18:
gsDPPipeSync
gsSPDisplayList red_dl_801B4AF8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_sparkle_0
gsSPBranchList sparkle_dl_common

sparkle_dl_801B4B38:
gsDPPipeSync
gsSPDisplayList red_dl_801B4AF8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_sparkle_1
gsSPBranchList sparkle_dl_common

sparkle_dl_801B4B58:
gsDPPipeSync
gsSPDisplayList red_dl_801B4AF8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_sparkle_2
gsSPBranchList sparkle_dl_common

sparkle_dl_801B4B78:
gsDPPipeSync
gsSPDisplayList red_dl_801B4AF8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_sparkle_3
gsSPBranchList sparkle_dl_common

sparkle_dl_801B4B98:
gsDPPipeSync
gsSPDisplayList red_dl_801B4AF8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_sparkle_4
gsSPBranchList sparkle_dl_common

sparkle_dl_801B4BB8:
gsDPPipeSync
gsSPDisplayList red_dl_801B4AF8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_sparkle_4
gsSPBranchList sparkle_dl_common

sparkle_dl_801B4BD8:
gsDPPipeSync
gsSPDisplayList white_dl_801B4B08
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_sparkle_0
gsSPBranchList sparkle_dl_common

sparkle_dl_801B4BF8:
gsDPPipeSync
gsSPDisplayList white_dl_801B4B08
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_sparkle_1
gsSPBranchList sparkle_dl_common

sparkle_dl_801B4C18:
gsDPPipeSync
gsSPDisplayList white_dl_801B4B08
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_sparkle_2
gsSPBranchList sparkle_dl_common

sparkle_dl_801B4C38:
gsDPPipeSync
gsSPDisplayList white_dl_801B4B08
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_sparkle_3
gsSPBranchList sparkle_dl_common

sparkle_dl_801B4C58:
gsDPPipeSync
gsSPDisplayList white_dl_801B4B08
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_sparkle_4
gsSPBranchList sparkle_dl_common

sparkle_dl_801B4C78:
gsDPPipeSync
gsSPDisplayList white_dl_801B4B08
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_sparkle_4
gsSPBranchList sparkle_dl_common

glabel redSparkleDlArray # 0x801B4C98
   .word sparkle_dl_801B4B98
   .word sparkle_dl_801B4B98
   .word sparkle_dl_801B4B78
   .word sparkle_dl_801B4B78
   .word sparkle_dl_801B4B58
   .word sparkle_dl_801B4B58
   .word sparkle_dl_801B4B38
   .word sparkle_dl_801B4B38
   .word sparkle_dl_801B4B18
   .word sparkle_dl_801B4B18
   .word sparkle_dl_801B4BB8
   .word sparkle_dl_801B4BB8

glabel silverSparkleDlArray # 0x801B4CC8
   .word sparkle_dl_801B4C58
   .word sparkle_dl_801B4C58
   .word sparkle_dl_801B4C38
   .word sparkle_dl_801B4C38
   .word sparkle_dl_801B4C18
   .word sparkle_dl_801B4C18
   .word sparkle_dl_801B4BF8
   .word sparkle_dl_801B4BF8
   .word sparkle_dl_801B4BD8
   .word sparkle_dl_801B4BD8
   .word sparkle_dl_801B4C78
   .word sparkle_dl_801B4C78

#! stray EndDisplayList
gsSPEndDisplayList

texture_mario_face_shine: # 0x801B4D00
   .incbin "textures/intro_raw/mario_face_shine.ia8"

glabel marioHeadDl801B5100
gsSPSetGeometryMode G_TEXTURE_GEN
gsSPTexture 1984, 1984, 0, 0, 1
gsDPSetTexturePersp G_TP_PERSP
gsDPSetTextureFilter G_TF_BILERP
gsDPSetCombineModeLERP1Cycle G_CCMUX_PRIMITIVE, G_CCMUX_SHADE, G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_ACMUX_PRIMITIVE, G_ACMUX_SHADE, G_ACMUX_TEXEL0, G_ACMUX_SHADE
gsDPLoadTextureBlock texture_mario_face_shine, G_IM_FMT_IA, G_IM_SIZ_8b, 32, 32, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_WRAP | G_TX_NOMIRROR, 5, 5, G_TX_NOLOD, G_TX_NOLOD
gsDPPipeSync
gsSPEndDisplayList

glabel marioHeadDl801B5170
gsSPGeometryMode 0xFFFFFFFF, G_SHADING_SMOOTH | G_SHADE, G_ORDER_CFIRST
gsSPEndDisplayList

glabel marioHeadDl801B5188
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetTextureLOD G_TL_TILE
gsDPSetTextureLUT G_TT_NONE
gsDPSetTextureDetail G_TD_CLAMP
gsDPSetTexturePersp G_TP_PERSP
gsDPSetTextureFilter G_TF_BILERP
gsDPSetTextureConvert G_TC_FILT
gsDPSetCombineKey G_CK_NONE
gsDPSetAlphaCompare G_AC_NONE

# There were multiple matching pairs, so I don't know if this is correct or not.
gsDPSetRenderMode G_RM_OPA_SURF, G_RM_OPA_SURF2
# It could also be one of these:
# G_RM_OPA_SURF, G_RM_OPA_CI2; G_RM_OPA_CI, G_RM_OPA_SURF2; G_RM_PASS, G_RM_OPA_SURF2;

gsDPNoOp
gsDPSetColorDither G_CD_MAGICSQ
gsDPPipeSync
gsSPEndDisplayList

   .word 0

glabel D_801B520C
   .float 1.0

   .word 0
   .word 0

#! no references to display list
gsDPPipeSync
gsSPEndDisplayList

vertex_801B5228:
vertex -8,  8,  0,  0,  0,  0x00, 0x00, 0x00, 0xFF
vertex  8, -2,  0,  0,  0,  0x00, 0x00, 0x00, 0xFF
vertex  2, -8,  0,  0,  0,  0x00, 0x00, 0x00, 0xFF

vertex_801B5258:
vertex -6,  6,  0,  0,  0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  7, -3,  0,  0,  0,  0xFF, 0x00, 0x00, 0xFF
vertex  3, -7,  0,  0,  0,  0xFF, 0x00, 0x00, 0xFF

glabel dl_801B5288 #! no references to display list
gsDPPipeSync

# There were multiple matching pairs, so I don't know if this is correct or not.
gsDPSetRenderMode G_RM_OPA_SURF, G_RM_OPA_SURF2
# It could also be one of these:
# G_RM_OPA_SURF, G_RM_OPA_CI2; G_RM_OPA_CI, G_RM_OPA_SURF2; G_RM_PASS, G_RM_OPA_SURF2;
gsSPGeometryMode 0xFFFFFFFF, G_SHADING_SMOOTH | G_SHADE, G_ORDER_CFIRST
gsDPPipeSync
gsSPVertex vertex_801B5228, 3, 0
gsSP1Triangle  0,  1,  2, 0x0
gsSPVertex vertex_801B5258, 3, 0
gsSP1Triangle  0,  1,  2, 0x0
gsSPEndDisplayList

glabel marioHeadDl801B52D8
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsSPTexture -32768, -32768, 0, 0, 1
gsDPSetAlphaCompare G_AC_THRESHOLD
gsDPSetBlendColor 0, 0, 0, 1
gsDPSetRenderMode G_RM_AA_ZB_TEX_EDGE, G_RM_NOOP2
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsDPSetTextureFilter G_TF_BILERP
gsDPSetTexturePersp G_TP_NONE
gsSPEndDisplayList
