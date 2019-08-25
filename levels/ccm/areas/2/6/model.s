ccm_seg7_vertex_0701FDE8: # 0x0701FDE8 - 0x0701FE28
vertex  -7592,  -5703,  -6819,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -7592,  -5600,  -6716,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -7592,  -5703,  -6716,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -7592,  -5600,  -6819,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF

ccm_seg7_dl_0701FE28: # 0x0701FE28 - 0x0701FE60
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, snow_09000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex ccm_seg7_vertex_0701FDE8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel ccm_seg7_dl_0701FE60 # 0x0701FE60 - 0x0701FEE0
gsDPPipeSync
gsDPSetEnvColor 255, 255, 255, 150
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ccm_seg7_dl_0701FE28
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetEnvColor 255, 255, 255, 255
gsSPEndDisplayList
