castle_grounds_seg7_us_texture_0700EAE8:
.incbin "levels/castle_grounds/5.ia8"

glabel castle_grounds_seg7_us_dl_0700F2E8 # 0x0700F2E8
gsDPPipeSync
gsDPSetTexturePersp G_TP_NONE
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_ENVIRONMENT, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_ENVIRONMENT, G_ACMUX_0
gsDPSetRenderMode G_RM_AA_XLU_SURF, G_RM_AA_XLU_SURF2
gsDPSetTextureFilter G_TF_POINT
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_8b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_8b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_8b, 1, castle_grounds_seg7_us_texture_0700EAE8
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPTextureRectangle 116 << 2, 166 << 2, (116 + 64) << 2, (166 + 32) << 2, G_TX_RENDERTILE, 0, 0, 1 << 10, 1 << 10
gsDPPipeSync
gsDPSetTexturePersp G_TP_PERSP

# There were multiple matching pairs, so I don't know if this is correct or not.
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2
# It could also be one of these:
# G_RM_AA_ZB_OPA_SURF, G_RM_RA_ZB_OPA_SURF2; G_RM_AA_ZB_OPA_SURF, G_RM_AA_OPA_SURF2; G_RM_AA_ZB_OPA_SURF, G_RM_RA_OPA_SURF2;
# G_RM_RA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2; G_RM_RA_ZB_OPA_SURF, G_RM_AA_OPA_SURF2; G_RM_AA_OPA_SURF, G_RM_AA_ZB_OPA_SURF2;
# G_RM_AA_OPA_SURF, G_RM_RA_ZB_OPA_SURF2; G_RM_RA_OPA_SURF, G_RM_AA_ZB_OPA_SURF2

gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetEnvColor 255, 255, 255, 255
gsSPTexture -1, -1, 0, 0, 0
gsDPSetTextureFilter G_TF_BILERP
gsSPEndDisplayList
