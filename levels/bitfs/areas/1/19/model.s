bitfs_seg7_vertex_0700ECF0: # 0x0700ECF0 - 0x0700ED50
vertex      0,      0,   -306,    334,    528,  0xFF, 0xFF, 0x00, 0xFF
vertex   -278,      0,    283,    362,    620,  0xFF, 0xFF, 0x00, 0xFF
vertex     -7,      0,    135,    336,    530,  0xFF, 0xFF, 0x00, 0xFF
vertex    262,      0,    283,    310,    440,  0xFF, 0xFF, 0x00, 0xFF
vertex    326,      0,   -118,    304,    420,  0xFF, 0xFF, 0x00, 0xFF
vertex   -330,      0,   -118,    366,    638,  0xFF, 0xFF, 0x00, 0xFF

bitfs_seg7_dl_0700ED50: # 0x0700ED50 - 0x0700ED90
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bitfs_seg7_vertex_0700ECF0, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  0, 0x0
gsSP1Triangle  2,  4,  5, 0x0
gsSPEndDisplayList

glabel bitfs_seg7_dl_0700ED90 # 0x0700ED90 - 0x0700EE10
gsDPPipeSync
gsDPSetEnvColor 255, 255, 255, 100
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bitfs_seg7_dl_0700ED50
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsDPSetEnvColor 255, 255, 255, 255
gsSPEndDisplayList
