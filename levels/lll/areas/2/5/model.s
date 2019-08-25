lll_seg7_vertex_07025AC0: # 0x07025AC0 - 0x07025B80
vertex  -2732,   2391,  -1140,    479,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2773,   2309,  -1069,      0,    479,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2732,   2309,  -1140,    479,    479,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2773,   2391,  -1069,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2446,   2391,  -1636,    479,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2487,   2309,  -1565,      0,    479,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2446,   2309,  -1636,    479,    479,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -2487,   2391,  -1565,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2937,    518,    -30,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2937,    436,     51,    479,    479,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2937,    518,     51,    479,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2937,    436,    -30,      0,    479,  0xFF, 0xFF, 0xFF, 0xFF

lll_seg7_dl_07025B80: # 0x07025B80 - 0x07025BD8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, lll_seg7_texture_0700D000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x0FF, 0x200
gsSPVertex lll_seg7_vertex_07025AC0, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSPEndDisplayList

glabel lll_seg7_dl_07025BD8 # 0x07025BD8 - 0x07025C90
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_TEX_EDGE2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 0, 0, 0, 255
gsSPFogFactor 0x0855, 0xF8AB # This isn't gsSPFogPosition since there is no valid min/max pair that corresponds to 0x0855F8AB
gsSPSetGeometryMode G_FOG
gsDPSetCombineModeLERP G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 60, 60
gsSPDisplayList lll_seg7_dl_07025B80
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_TEX_EDGE, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
