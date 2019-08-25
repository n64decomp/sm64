sl_seg7_light_0700CA68: # 0x0700CA68 - 0x0700CA70
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

sl_seg7_light_0700CA70: # 0x0700CA70 - 0x0700CA80
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

sl_seg7_vertex_0700CA80: # 0x0700CA80 - 0x0700CB00
vertex    410,      0,   1126,    786,    990,  0x00, 0x00, 0x7F, 0xFF
vertex   2048,    614,   1126,   2420,   -236,  0x00, 0x00, 0x7F, 0xFF
vertex    410,    614,   1126,    786,   -236,  0x00, 0x00, 0x7F, 0xFF
vertex   2048,      0,   1126,   2420,    990,  0x00, 0x00, 0x7F, 0xFF
vertex  -2047,    614,   1126,  -1666,   -236,  0x00, 0x00, 0x7F, 0xFF
vertex   -409,      0,   1126,      0,    990,  0x00, 0x00, 0x7F, 0xFF
vertex   -409,    614,   1126,      0,   -236,  0x00, 0x00, 0x7F, 0xFF
vertex  -2047,      0,   1126,  -1666,    990,  0x00, 0x00, 0x7F, 0xFF

sl_seg7_dl_0700CB00: # 0x0700CB00 - 0x0700CB58
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, snow_09000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight sl_seg7_light_0700CA70, 1
gsSPLight sl_seg7_light_0700CA68, 2
gsSPVertex sl_seg7_vertex_0700CA80, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

glabel sl_seg7_dl_0700CB58 # 0x0700CB58 - 0x0700CBD8
gsDPPipeSync
gsDPSetEnvColor 255, 255, 255, 100
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList sl_seg7_dl_0700CB00
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetEnvColor 255, 255, 255, 255
gsSPEndDisplayList
