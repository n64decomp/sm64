hmc_seg7_light_07014CB8: # 0x07014CB8 - 0x07014CC0
.byte 0x23, 0x2B, 0x14, 0x00, 0x23, 0x2B, 0x14, 0x00

hmc_seg7_light_07014CC0: # 0x07014CC0 - 0x07014CD0
.byte 0x8E, 0xAC, 0x52, 0x00, 0x8E, 0xAC, 0x52, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

hmc_seg7_vertex_07014CD0: # 0x07014CD0 - 0x07014DD0
vertex   3165,   -409,  -6338,    990,    422,  0x00, 0x00, 0x7F, 0x80
vertex   3113,   -869,  -6338,      0,    990,  0x00, 0x00, 0x7F, 0x80
vertex   3165,   -869,  -6338,    990,    990,  0x00, 0x00, 0x7F, 0x80
vertex   3482,   -665,  -6338,      0,    990,  0x00, 0x00, 0x7F, 0x80
vertex   3533,   -665,  -6338,    990,    990,  0x00, 0x00, 0x7F, 0x80
vertex   3533,   -409,  -6338,    990,    422,  0x00, 0x00, 0x7F, 0x80
vertex   3482,   -409,  -6338,      0,    422,  0x00, 0x00, 0x7F, 0x80
vertex   3328,   -921,  -6338,      0,    990,  0x00, 0x00, 0x7F, 0x80
vertex   3431,   -921,  -6338,    990,    990,  0x00, 0x00, 0x7F, 0x80
vertex   3431,   -409,  -6338,    990,    422,  0x00, 0x00, 0x7F, 0x80
vertex   3328,   -409,  -6338,      0,    422,  0x00, 0x00, 0x7F, 0x80
vertex   3277,   -409,  -6338,    990,    422,  0x00, 0x00, 0x7F, 0x80
vertex   3226,   -818,  -6338,      0,    990,  0x00, 0x00, 0x7F, 0x80
vertex   3277,   -818,  -6338,    990,    990,  0x00, 0x00, 0x7F, 0x80
vertex   3226,   -409,  -6338,      0,    422,  0x00, 0x00, 0x7F, 0x80
vertex   3113,   -409,  -6338,      0,    422,  0x00, 0x00, 0x7F, 0x80

hmc_seg7_dl_07014DD0: # 0x07014DD0 - 0x07014E48
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, cave_0900C000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight hmc_seg7_light_07014CC0, 1
gsSPLight hmc_seg7_light_07014CB8, 2
gsSPVertex hmc_seg7_vertex_07014CD0, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0,  0, 15,  1, 0x0
gsSPEndDisplayList

glabel hmc_seg7_dl_07014E48 # 0x07014E48 - 0x07014EB8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList hmc_seg7_dl_07014DD0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
