.balign 4 # 0x070285EE - 0x070285F0

glabel ssl_dl_pyramid_sand_pathway_floor_begin # 0x070285F0 - 0x07028660
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_INTER2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 0, 0, 0, 255
gsSPFogFactor 0x0E49, 0xF2B7 # This isn't gsSPFogPosition since there is no valid min/max pair that corresponds to 0x0E49F2B7
gsSPSetGeometryMode G_FOG
gsDPSetCombineModeLERP G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPEndDisplayList

glabel ssl_dl_pyramid_sand_pathway_floor_end # 0x07028660 - 0x070286A0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsSPGeometryMode G_FOG, G_LIGHTING | G_CULL_BACK, G_ORDER_SFIRST
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetRenderMode G_RM_AA_ZB_OPA_INTER, G_RM_NOOP2
gsSPEndDisplayList

glabel ssl_dl_pyramid_sand_pathway_begin # 0x070286A0 - 0x07028718
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_XLU_INTER2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 0, 0, 0, 255
gsSPFogFactor 0x0E49, 0xF2B7 # This isn't gsSPFogPosition since there is no valid min/max pair that corresponds to 0x0E49F2B7
gsSPSetGeometryMode G_FOG
gsDPSetEnvColor 255, 255, 255, 180
gsDPSetCombineModeLERP G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPEndDisplayList

glabel ssl_dl_pyramid_sand_pathway_end # 0x07028718 - 0x07028760
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsSPGeometryMode G_FOG, G_LIGHTING | G_CULL_BACK, G_ORDER_SFIRST
gsDPSetEnvColor 255, 255, 255, 255
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetRenderMode G_RM_AA_ZB_XLU_INTER, G_RM_NOOP2
gsSPEndDisplayList

glabel ssl_movtex_tris_pyramid_sand_pathway_front # 0x07028760 - 0x070287B8
movTexSpd    50
movTexTris  102, 1229, -742, 0, 0
movTexTris  102, 4275, -742, 5, 0
movTexTris  102, 4300, -768, 6, 0
movTexTris  102, 4300, -870, 8, 0
movTexTris -102, 1229, -742, 0, 1
movTexTris -102, 4275, -742, 5, 1
movTexTris -102, 4300, -768, 6, 1
movTexTris -102, 4300, -870, 8, 1
movTexEnd
.hword 0 # alignment?

glabel ssl_dl_pyramid_sand_pathway_front_end # 0x070287B8 - 0x070287F0
gsSP2Triangles  0,  1,  4, 0x0,  4,  1,  5, 0x0
gsSP2Triangles  1,  2,  5, 0x0,  5,  2,  6, 0x0
gsSP2Triangles  2,  3,  6, 0x0,  6,  3,  7, 0x0
gsSPEndDisplayList

glabel ssl_movtex_tris_pyramid_sand_pathway_floor # 0x070287F0 - 0x07028844
movTexSpd      8
movTexTris  1178, 1229, 2150, 0, 0
movTexTris -1741, 1229, 2150, 2, 0
movTexTris -1741, 1229, -589, 4, 0
movTexTris   154, 1229, -589, 5, 0
movTexTris  1178, 1229, 2560, 0, 1
movTexTris -2150, 1229, 2560, 2, 1
movTexTris -2150, 1229, -794, 4, 1
movTexTris   154, 1229, -794, 5, 1
movTexEnd

glabel ssl_movtex_tris_pyramid_sand_pathway_side # 0x07028844 - 0x07028888
movTexSpd    50
movTexTris 1229, -307, 2150, 0, 0
movTexTris 1229, 1168, 2150, 1, 0
movTexTris 1178, 1229, 2150, 2, 0
movTexTris 1229, -307, 2560, 0, 1
movTexTris 1229, 1168, 2560, 1, 1
movTexTris 1178, 1229, 2560, 2, 1
movTexEnd
.hword 0 # alignment?

glabel ssl_dl_pyramid_sand_pathway_side_end # 0x07028888 - 0x070288B0
gsSP2Triangles  0,  1,  3, 0x0,  1,  4,  3, 0x0
gsSP2Triangles  1,  2,  4, 0x0,  2,  5,  4, 0x0
gsSPEndDisplayList
