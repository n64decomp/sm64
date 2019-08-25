ccm_seg7_light_0700F6E0: # 0x0700F6E0 - 0x0700F6E8
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

ccm_seg7_light_0700F6E8: # 0x0700F6E8 - 0x0700F6F8
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ccm_seg7_vertex_0700F6F8: # 0x0700F6F8 - 0x0700F738
vertex    219,   -378,     76,      0,    990,  0x56, 0x00, 0x5C, 0xFF
vertex    294,   -378,      6,    990,    990,  0x56, 0x00, 0x5C, 0xFF
vertex    294,   -275,      6,    990,      0,  0x56, 0x00, 0x5C, 0xFF
vertex    219,   -275,     76,      0,      0,  0x56, 0x00, 0x5C, 0xFF

ccm_seg7_dl_0700F738: # 0x0700F738 - 0x0700F780
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, snow_09000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ccm_seg7_light_0700F6E8, 1
gsSPLight ccm_seg7_light_0700F6E0, 2
gsSPVertex ccm_seg7_vertex_0700F6F8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  2, 0x0
gsSPEndDisplayList

glabel ccm_seg7_dl_0700F780 # 0x0700F780 - 0x0700F800
gsDPPipeSync
gsDPSetEnvColor 255, 255, 255, 90
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ccm_seg7_dl_0700F738
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsDPSetEnvColor 255, 255, 255, 255
gsSPEndDisplayList
