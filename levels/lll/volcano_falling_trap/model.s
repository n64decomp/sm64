lll_seg7_vertex_07025C90: # 0x07025C90 - 0x07025D70
vertex   -306,    614,      0,      0,    864,  0x77, 0x77, 0x77, 0xFF
vertex   -306,   -101,      0,      0,   3184,  0x77, 0x77, 0x77, 0xFF
vertex   -306,   -101,    102,    300,   3184,  0x77, 0x77, 0x77, 0xFF
vertex   -306,    614,    102,    300,    864,  0x77, 0x77, 0x77, 0xFF
vertex    307,   -101,      0,   3086,   3184,  0x77, 0x77, 0x77, 0xFF
vertex    307,    614,    102,   2754,    864,  0x77, 0x77, 0x77, 0xFF
vertex    307,   -101,    102,   2754,   3184,  0x77, 0x77, 0x77, 0xFF
vertex    307,    614,      0,   3086,    864,  0x77, 0x77, 0x77, 0xFF
vertex   -306,   -101,      0,   5078,   3184,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -306,    614,      0,   5078,    864,  0xFF, 0xFF, 0xFF, 0xFF
vertex    307,    614,      0,   3086,    864,  0xFF, 0xFF, 0xFF, 0xFF
vertex    307,   -101,      0,   3086,   3184,  0xFF, 0xFF, 0xFF, 0xFF
vertex    307,    614,    102,   3086,    830,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -306,    614,    102,   5078,    830,  0xFF, 0xFF, 0xFF, 0xFF

lll_seg7_vertex_07025D70: # 0x07025D70 - 0x07025E10
vertex    307,   -101,    102,  -2584,  -4120,  0x77, 0x77, 0x77, 0xFF
vertex    307,    614,    102,  -2584,   3032,  0x77, 0x77, 0x77, 0xFF
vertex    307,   -101,    700,  -2584,  -4120,  0x77, 0x77, 0x77, 0xFF
vertex   -306,    614,    102,   3544,   3032,  0x77, 0x77, 0x77, 0xFF
vertex   -306,   -101,    102,   3546,  -4120,  0x77, 0x77, 0x77, 0xFF
vertex   -306,   -101,    700,   3544,  -4120,  0x77, 0x77, 0x77, 0xFF
vertex    307,   -101,    700,  -2584,  -4120,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -306,    614,    102,   3544,   3032,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -306,   -101,    700,   3544,  -4120,  0xFF, 0xFF, 0xFF, 0xFF
vertex    307,    614,    102,  -2584,   3032,  0xFF, 0xFF, 0xFF, 0xFF

lll_seg7_dl_07025E10: # 0x07025E10 - 0x07025E78
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, lll_seg7_texture_0700DC00
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex lll_seg7_vertex_07025C90, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 10, 11, 0x0
gsSP2Triangles  9, 12, 10, 0x0,  9, 13, 12, 0x0
gsSPEndDisplayList

lll_seg7_dl_07025E78: # 0x07025E78 - 0x07025EC0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, fire_0900A000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex lll_seg7_vertex_07025D70, 10, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  9,  7, 0x0
gsSPEndDisplayList

glabel lll_seg7_dl_07025EC0 # 0x07025EC0 - 0x07025F80
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_SURF2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 0, 0, 0, 255
gsSPFogFactor 0x0855, 0xF8AB # This isn't gsSPFogPosition since there is no valid min/max pair that corresponds to 0x0855F8AB
gsSPSetGeometryMode G_FOG
gsDPSetCombineModeLERP G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList lll_seg7_dl_07025E10
gsSPDisplayList lll_seg7_dl_07025E78
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
