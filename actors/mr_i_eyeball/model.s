# Mr I (white eyeball)

mr_i_eyeball_seg6_vertex_06000000: # 0x06000000
vertex   -100,      0,      0,      0,   2016,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,      0,    992,   2016,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    200,      0,    992,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -100,    200,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,      0,      0,   2016,  0xFF, 0xFF, 0xFF, 0xFF
vertex    100,      0,      0,    992,   2016,  0xFF, 0xFF, 0xFF, 0xFF
vertex    100,    200,      0,    992,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    200,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

mr_i_eyeball_seg6_texture_06000080: # 0x06000080
.incbin "actors/mr_i_eyeball/mr_i_eyeball_left_side.rgba16"

mr_i_eyeball_seg6_texture_06001080: # 0x06001080
.incbin "actors/mr_i_eyeball/mr_i_eyeball_right_side.rgba16"

glabel mr_i_eyeball_seg6_dl_06002080 # 0x06002080 - 0x06002128
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsSPVertex mr_i_eyeball_seg6_vertex_06000000, 8, 0
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mr_i_eyeball_seg6_texture_06000080
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mr_i_eyeball_seg6_texture_06001080
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
