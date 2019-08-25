# Mr I (Iris)

mr_i_iris_seg6_vertex_06002130: # 0x06002130
vertex    -50,    -50,      0,      0,    992,  0xFF, 0xFF, 0xFF, 0xFF
vertex     50,    -50,      0,    992,    992,  0xFF, 0xFF, 0xFF, 0xFF
vertex     50,     50,      0,    992,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -50,     50,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

mr_i_iris_seg6_texture_06002170: # 0x06002170
.incbin "actors/mr_i_iris/mr_i_iris_open.rgba16"

mr_i_iris_seg6_texture_06002970: # 0x06002970
.incbin "actors/mr_i_iris/mr_i_iris_mostly_open.rgba16"

mr_i_iris_seg6_texture_06003170: # 0x06003170
.incbin "actors/mr_i_iris/mr_i_iris_mostly_closed.rgba16"

mr_i_iris_seg6_texture_06003970: # 0x06003970
.incbin "actors/mr_i_iris/mr_i_iris_closed.rgba16"

glabel mr_i_iris_seg6_dl_06004170 # 0x06004170 - 0x060041D8
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPTexture -1, -1, 0, 0, 1
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPVertex mr_i_iris_seg6_vertex_06002130, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

glabel mr_i_iris_seg6_dl_060041D8 # 0x060041D8 - 0x060041F0
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mr_i_iris_seg6_texture_06002170
gsSPBranchList mr_i_iris_seg6_dl_06004170

glabel mr_i_iris_seg6_dl_060041F0 # 0x060041F0 - 0x06004208
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mr_i_iris_seg6_texture_06002970
gsSPBranchList mr_i_iris_seg6_dl_06004170

glabel mr_i_iris_seg6_dl_06004208 # 0x06004208 - 0x06004220
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mr_i_iris_seg6_texture_06003170
gsSPBranchList mr_i_iris_seg6_dl_06004170

glabel mr_i_iris_seg6_dl_06004220 # 0x06004220 - 0x06004238
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mr_i_iris_seg6_texture_06003970
gsSPBranchList mr_i_iris_seg6_dl_06004170
