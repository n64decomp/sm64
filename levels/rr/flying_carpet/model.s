# Not a traditional model file. The vertexes are generated in src/geo_misc.c.

rr_seg7_light_07019230: # 0x07019230 - 0x07019238
.byte 0x5F, 0x5F, 0x5F, 0x00, 0x5F, 0x5F, 0x5F, 0x00

rr_seg7_light_07019238: # 0x07019238 - 0x07019248
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00


glabel flying_carpet_static_vertex_data # 0x07019248 - 0x070192F0
#         X     Z    tx    ty
.hword -306,  205,    0,    0
.hword -306,    0,  992,    0
.hword -306, -204,    0,    0
.hword -204,  205,    0,  308
.hword -204,    0,  992,  308
.hword -204, -204,    0,  308
.hword -102,  205,    0,  650
.hword -102,    0,  992,  650
.hword -102, -204,    0,  650
.hword    0,  205,    0,  992
.hword    0,    0,  992,  992
.hword    0, -204,    0,  992
.hword  102,  205,    0,  650
.hword  102,    0,  992,  650
.hword  102, -204,    0,  650
.hword  205,  205,    0,  308
.hword  205,    0,  992,  308
.hword  205, -204,    0,  308
.hword  307,  205,    0,    0
.hword  307,    0,  990,    0
.hword  307, -204,    0,    0

glabel dl_flying_carpet_begin # 0x070192F0 - 0x07019360
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_quarter_flying_carpet
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight rr_seg7_light_07019238, 1
gsSPLight rr_seg7_light_07019230, 2
gsSPEndDisplayList

glabel dl_flying_carpet_model_half # 0x07019360 - 0x070193C8
gsSP2Triangles  0,  1,  3, 0x0,  3,  1,  4, 0x0
gsSP2Triangles  1,  2,  4, 0x0,  4,  2,  5, 0x0
gsSP2Triangles  3,  4,  6, 0x0,  6,  4,  7, 0x0
gsSP2Triangles  4,  5,  7, 0x0,  7,  5,  8, 0x0
gsSP2Triangles  6,  7,  9, 0x0,  9,  7, 10, 0x0
gsSP2Triangles  7,  8, 10, 0x0, 10,  8, 11, 0x0
gsSPEndDisplayList

glabel dl_flying_carpet_end # 0x070193C8 - 0x070193F0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK
gsSPEndDisplayList
