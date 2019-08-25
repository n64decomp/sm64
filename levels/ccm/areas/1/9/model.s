ccm_seg7_light_0700FB78: # 0x0700FB78 - 0x0700FB80
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

ccm_seg7_light_0700FB80: # 0x0700FB80 - 0x0700FB90
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ccm_seg7_vertex_0700FB90: # 0x0700FB90 - 0x0700FC90
vertex   -123,   -613,    238,      0,    990,  0x8F, 0x00, 0x38, 0xFF
vertex   -283,    666,    -85,    690,    138,  0x8F, 0x00, 0x38, 0xFF
vertex   -283,   -613,    -85,    690,    990,  0x8F, 0x00, 0x38, 0xFF
vertex    201,   -613,     78,    690,    990,  0x38, 0x00, 0x71, 0xFF
vertex    201,    666,     78,    690,   -288,  0x38, 0x00, 0x71, 0xFF
vertex   -123,    666,    238,      0,   -288,  0x38, 0x00, 0x71, 0xFF
vertex   -123,   -613,    238,      0,    990,  0x38, 0x00, 0x71, 0xFF
vertex     41,   -613,   -246,    690,    990,  0x71, 0x00, 0xC8, 0xFF
vertex     41,    666,   -246,    690,    138,  0x71, 0x00, 0xC8, 0xFF
vertex    201,    666,     78,      0,    138,  0x71, 0x00, 0xC8, 0xFF
vertex    201,   -613,     78,      0,    990,  0x71, 0x00, 0xC8, 0xFF
vertex   -283,   -613,    -85,    690,   1244,  0xC8, 0x00, 0x8F, 0xFF
vertex     41,    666,   -246,      0,      0,  0xC8, 0x00, 0x8F, 0xFF
vertex     41,   -613,   -246,      0,   1244,  0xC8, 0x00, 0x8F, 0xFF
vertex   -283,    666,    -85,    690,      0,  0xC8, 0x00, 0x8F, 0xFF
vertex   -123,    666,    238,      0,    138,  0x8F, 0x00, 0x38, 0xFF

ccm_seg7_dl_0700FC90: # 0x0700FC90 - 0x0700FD08
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, snow_09000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ccm_seg7_light_0700FB80, 1
gsSPLight ccm_seg7_light_0700FB78, 2
gsSPVertex ccm_seg7_vertex_0700FB90, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0,  0, 15,  1, 0x0
gsSPEndDisplayList

glabel ccm_seg7_dl_0700FD08 # 0x0700FD08 - 0x0700FD88
gsDPPipeSync
gsDPSetEnvColor 255, 255, 255, 90
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ccm_seg7_dl_0700FC90
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsDPSetEnvColor 255, 255, 255, 255
gsSPEndDisplayList
