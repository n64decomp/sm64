sl_seg7_light_07005520: # 0x07005520 - 0x07005528
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

sl_seg7_light_07005528: # 0x07005528 - 0x07005538
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

sl_seg7_vertex_07005538: # 0x07005538 - 0x07005638
vertex    768,   1352,  -5375,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   -200,   1352,  -3761,   1866,   -908,  0x00, 0x7F, 0x00, 0xFF
vertex   1091,   1352,  -4084,   1866,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   1024,    922,  -3071,  -3096,      0,  0x00, 0x7F, 0x00, 0xFF
vertex  -1023,    922,  -3071,  -3096,   2010,  0x00, 0x7F, 0x00, 0xFF
vertex   -818,    922,  -1023,  -1052,   1806,  0x00, 0x7F, 0x00, 0xFF
vertex   1024,    922,  -1023,  -1052,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    365,   3328,   2052,   2016,    626,  0x00, 0x7F, 0x00, 0xFF
vertex   2027,   3328,    608,    576,  -1034,  0x00, 0x7F, 0x00, 0xFF
vertex   1725,   3328,    260,    228,   -732,  0x00, 0x7F, 0x00, 0xFF
vertex     63,   3328,   1704,   1668,    928,  0x00, 0x7F, 0x00, 0xFF
vertex   3328,    973,  -4351,  -4374,  -2332,  0x00, 0x7F, 0x00, 0xFF
vertex   2304,    973,  -5375,  -5396,  -1310,  0x00, 0x7F, 0x00, 0xFF
vertex   2304,    973,  -4351,  -4374,  -1310,  0x00, 0x7F, 0x00, 0xFF
vertex   3328,    973,  -5375,  -5396,  -2332,  0x00, 0x7F, 0x00, 0xFF
vertex   -522,   1352,  -5052,      0,   -908,  0x00, 0x7F, 0x00, 0xFF

sl_seg7_dl_07005638: # 0x07005638 - 0x070056B0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, snow_09000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight sl_seg7_light_07005528, 1
gsSPLight sl_seg7_light_07005520, 2
gsSPVertex sl_seg7_vertex_07005538, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0,  0, 15,  1, 0x0
gsSPEndDisplayList

glabel sl_seg7_dl_070056B0 # 0x070056B0 - 0x07005730
gsDPPipeSync
gsDPSetEnvColor 255, 255, 255, 180
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList sl_seg7_dl_07005638
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetEnvColor 255, 255, 255, 255
gsSPEndDisplayList
