# Yoshi Egg (unused)

yoshi_egg_seg5_vertex_05005778: # 0x05005778
vertex   -128,      0,      0,      0,   1984,  0x00, 0x00, 0x7F, 0x00
vertex    128,      0,      0,   1984,   1984,  0x00, 0x00, 0x7F, 0x00
vertex    128,    256,      0,   1984,      0,  0x00, 0x00, 0x7F, 0x00
vertex   -128,    256,      0,      0,      0,  0x00, 0x00, 0x7F, 0x00

yoshi_egg_seg5_texture_050057B8: # 0x050057B8
.incbin "actors/yoshi_egg/yoshi_egg_0_unused.rgba16"

yoshi_egg_seg5_texture_05005FB8: # 0x05005FB8
.incbin "actors/yoshi_egg/yoshi_egg_1_unused.rgba16"

yoshi_egg_seg5_texture_050067B8: # 0x050067B8
.incbin "actors/yoshi_egg/yoshi_egg_2_unused.rgba16"

yoshi_egg_seg5_texture_05006FB8: # 0x05006FB8
.incbin "actors/yoshi_egg/yoshi_egg_3_unused.rgba16"

yoshi_egg_seg5_texture_050077B8: # 0x050077B8
.incbin "actors/yoshi_egg/yoshi_egg_4_unused.rgba16"

yoshi_egg_seg5_texture_05007FB8: # 0x05007FB8
.incbin "actors/yoshi_egg/yoshi_egg_5_unused.rgba16"

yoshi_egg_seg5_texture_050087B8: # 0x050087B8
.incbin "actors/yoshi_egg/yoshi_egg_6_unused.rgba16"

yoshi_egg_seg5_texture_05008FB8: # 0x05008FB8
.incbin "actors/yoshi_egg/yoshi_egg_7_unused.rgba16"

glabel yoshi_egg_seg5_dl_050097B8 # 0x050097B8 - 0x05009820
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPTexture -32768, -32768, 0, 0, 1
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPVertex yoshi_egg_seg5_vertex_05005778, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture 1, 1, 0, 0, 0
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

glabel yoshi_egg_seg5_dl_05009820 # 0x05009820 - 0x05009838
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, yoshi_egg_seg5_texture_05008FB8
gsSPBranchList yoshi_egg_seg5_dl_050097B8

glabel yoshi_egg_seg5_dl_05009838 # 0x05009838 - 0x05009850
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, yoshi_egg_seg5_texture_050087B8
gsSPBranchList yoshi_egg_seg5_dl_050097B8

glabel yoshi_egg_seg5_dl_05009850 # 0x05009850 - 0x05009868
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, yoshi_egg_seg5_texture_05007FB8
gsSPBranchList yoshi_egg_seg5_dl_050097B8

glabel yoshi_egg_seg5_dl_05009868 # 0x05009868 - 0x05009880
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, yoshi_egg_seg5_texture_050077B8
gsSPBranchList yoshi_egg_seg5_dl_050097B8

glabel yoshi_egg_seg5_dl_05009880 # 0x05009880 - 0x05009898
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, yoshi_egg_seg5_texture_05006FB8
gsSPBranchList yoshi_egg_seg5_dl_050097B8

glabel yoshi_egg_seg5_dl_05009898 # 0x05009898 - 0x050098B0
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, yoshi_egg_seg5_texture_050067B8
gsSPBranchList yoshi_egg_seg5_dl_050097B8

glabel yoshi_egg_seg5_dl_050098B0 # 0x050098B0 - 0x050098C8
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, yoshi_egg_seg5_texture_05005FB8
gsSPBranchList yoshi_egg_seg5_dl_050097B8

glabel yoshi_egg_seg5_dl_050098C8 # 0x050098C8 - 0x050098E0
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, yoshi_egg_seg5_texture_050057B8
gsSPBranchList yoshi_egg_seg5_dl_050097B8
