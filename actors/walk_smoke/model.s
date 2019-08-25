# Walk Smoke

smoke_seg4_vertex_0401DE60: # 0x0401DE60
vertex    -32,      0,      0,      0,    992,  0xFF, 0xFF, 0xFF, 0x64
vertex     32,      0,      0,    992,    992,  0xFF, 0xFF, 0xFF, 0x64
vertex     32,     64,      0,    992,      0,  0xFF, 0xFF, 0xFF, 0x64
vertex    -32,     64,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0x64

smoke_seg4_texture_0401DEA0: # 0x0401DEA0
.incbin "actors/walk_smoke/walk_smoke_0.ia16"

smoke_seg4_texture_0401E6A0: # 0x0401E6A0
.incbin "actors/walk_smoke/walk_smoke_1.ia16"

smoke_seg4_texture_0401EEA0: # 0x0401EEA0
.incbin "actors/walk_smoke/walk_smoke_2.ia16"

smoke_seg4_texture_0401F6A0: # 0x0401F6A0
.incbin "actors/walk_smoke/walk_smoke_3.ia16"

smoke_seg4_texture_0401FEA0: # 0x0401FEA0
.incbin "actors/walk_smoke/walk_smoke_4.ia16"

smoke_seg4_texture_040206A0: # 0x040206A0
.incbin "actors/walk_smoke/walk_smoke_5.ia16"

smoke_seg4_texture_04020EA0: # 0x04020EA0
.incbin "actors/walk_smoke/walk_smoke_6.ia16"

glabel smoke_seg4_dl_040216A0 # 0x040216A0 - 0x04021718
gsSPClearGeometryMode G_LIGHTING
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPTexture -1, -1, 0, 0, 1
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPVertex smoke_seg4_vertex_0401DE60, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

glabel smoke_seg4_dl_04021718 # 0x04021718 - 0x04021730
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, smoke_seg4_texture_0401DEA0
gsSPBranchList smoke_seg4_dl_040216A0

glabel smoke_seg4_dl_04021730 # 0x04021730 - 0x04021748
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, smoke_seg4_texture_0401E6A0
gsSPBranchList smoke_seg4_dl_040216A0

glabel smoke_seg4_dl_04021748 # 0x04021748 - 0x04021760
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, smoke_seg4_texture_0401EEA0
gsSPBranchList smoke_seg4_dl_040216A0

glabel smoke_seg4_dl_04021760 # 0x04021760 - 0x04021778
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, smoke_seg4_texture_0401F6A0
gsSPBranchList smoke_seg4_dl_040216A0

glabel smoke_seg4_dl_04021778 # 0x04021778 - 0x04021790
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, smoke_seg4_texture_0401FEA0
gsSPBranchList smoke_seg4_dl_040216A0

glabel smoke_seg4_dl_04021790 # 0x04021790 - 0x040217A8
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, smoke_seg4_texture_040206A0
gsSPBranchList smoke_seg4_dl_040216A0

glabel smoke_seg4_dl_040217A8 # 0x040217A8 - 0x040217C0
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, smoke_seg4_texture_04020EA0
gsSPBranchList smoke_seg4_dl_040216A0
