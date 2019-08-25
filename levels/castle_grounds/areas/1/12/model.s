# TODO: what is this? 0700C960-0700C968 [8,8]
.word 0, 0

castle_grounds_seg7_vertex_0700C968: # 0x0700C968 - 0x0700C9A8
vertex      0,     82,      0,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -71,    -81,      0,      0,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    -81,      0,    990,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -71,     82,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

castle_grounds_seg7_vertex_0700C9A8: # 0x0700C9A8 - 0x0700C9E8
vertex     72,     82,      0,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    -81,      0,      0,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex     72,    -81,      0,    990,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,     82,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

castle_grounds_seg7_texture_0700C9E8: # 0x0700C9E8 - 0x0700D9E8
.incbin "levels/castle_grounds/3.rgba16"

castle_grounds_seg7_texture_0700D9E8: # 0x0700D9E8 - 0x0700E9E8
.incbin "levels/castle_grounds/4.rgba16"

castle_grounds_seg7_dl_0700E9E8: # 0x0700E9E8 - 0x0700EA20
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, castle_grounds_seg7_texture_0700C9E8
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex castle_grounds_seg7_vertex_0700C968, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

castle_grounds_seg7_dl_0700EA20: # 0x0700EA20 - 0x0700EA58
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, castle_grounds_seg7_texture_0700D9E8
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex castle_grounds_seg7_vertex_0700C9A8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel castle_grounds_seg7_dl_0700EA58 # 0x0700EA58 - 0x0700EAE8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_ENVIRONMENT, G_ACMUX_0
gsDPSetRenderMode G_RM_XLU_SURF, G_RM_XLU_SURF2
gsDPSetTextureFilter G_TF_BILERP
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList castle_grounds_seg7_dl_0700E9E8
gsSPDisplayList castle_grounds_seg7_dl_0700EA20
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE

# There were multiple matching pairs, so I don't know if this is correct or not.
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2
# It could also be one of these:
# G_RM_AA_ZB_OPA_SURF, G_RM_RA_ZB_OPA_SURF2; G_RM_AA_ZB_OPA_SURF, G_RM_AA_OPA_SURF2; G_RM_AA_ZB_OPA_SURF, G_RM_RA_OPA_SURF2;
# G_RM_RA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2; G_RM_RA_ZB_OPA_SURF, G_RM_AA_OPA_SURF2; G_RM_AA_OPA_SURF, G_RM_AA_ZB_OPA_SURF2;
# G_RM_AA_OPA_SURF, G_RM_RA_ZB_OPA_SURF2; G_RM_RA_OPA_SURF, G_RM_AA_ZB_OPA_SURF2

gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
