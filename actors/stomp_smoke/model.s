# Stomp Smoke

stomp_smoke_seg4_vertex_040220C8: # 0x040220C8
vertex    -32,      0,     32,      0,      0,  0xFF, 0xFF, 0xFF, 0xC8
vertex     32,      0,     32,   1984,      0,  0xFF, 0xFF, 0xFF, 0xC8
vertex     32,      0,    -32,   1984,   1984,  0xFF, 0xFF, 0xFF, 0xC8
vertex    -32,      0,    -32,      0,   1984,  0xFF, 0xFF, 0xFF, 0xC8

stomp_smoke_seg4_vertex_04022108: # 0x04022108
vertex    -32,      0,     32,      0,      0,  0xFF, 0x00, 0x00, 0xC8
vertex     32,      0,     32,   1984,      0,  0xFF, 0x00, 0x00, 0xC8
vertex     32,      0,    -32,   1984,   1984,  0xFF, 0x00, 0x00, 0xC8
vertex    -32,      0,    -32,      0,   1984,  0xFF, 0x00, 0x00, 0xC8

stomp_smoke_seg4_texture_04022148: # 0x04022148
.incbin "actors/stomp_smoke/stomp_smoke_0.ia16"

stomp_smoke_seg4_texture_04022948: # 0x04022948
.incbin "actors/stomp_smoke/stomp_smoke_1.ia16"

stomp_smoke_seg4_texture_04023148: # 0x04023148
.incbin "actors/stomp_smoke/stomp_smoke_2.ia16"

stomp_smoke_seg4_texture_04023948: # 0x04023948
.incbin "actors/stomp_smoke/stomp_smoke_3.ia16"

stomp_smoke_seg4_texture_04024148: # 0x04024148
.incbin "actors/stomp_smoke/stomp_smoke_4.ia16"

stomp_smoke_seg4_texture_04024948: # 0x04024948
.incbin "actors/stomp_smoke/stomp_smoke_5.ia16"

glabel stomp_smoke_seg4_dl_04025148 # 0x04025148 - 0x04025190
gsSPClearGeometryMode G_LIGHTING
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPTexture -32768, -32768, 0, 0, 1
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPEndDisplayList

glabel stomp_smoke_seg4_dl_04025190 # 0x04025190 - 0x040251C8
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsDPPipeSync
gsSPTexture 1, 1, 0, 0, 0
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

glabel stomp_smoke_seg4_dl_040251C8 # 0x040251C8 - 0x040251E0
gsSPDisplayList stomp_smoke_seg4_dl_04025148
gsSPVertex stomp_smoke_seg4_vertex_040220C8, 4, 0
gsSPBranchList stomp_smoke_seg4_dl_04025190

glabel stomp_smoke_seg4_dl_040251E0 # 0x040251E0 - 0x040251F8
gsSPDisplayList stomp_smoke_seg4_dl_04025148
gsSPVertex stomp_smoke_seg4_vertex_04022108, 4, 0
gsSPBranchList stomp_smoke_seg4_dl_04025190

glabel stomp_smoke_seg4_dl_040251F8 # 0x040251F8 - 0x04025210
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, stomp_smoke_seg4_texture_04022148
gsSPBranchList stomp_smoke_seg4_dl_040251C8

glabel stomp_smoke_seg4_dl_04025210 # 0x04025210 - 0x04025228
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, stomp_smoke_seg4_texture_04022948
gsSPBranchList stomp_smoke_seg4_dl_040251C8

glabel stomp_smoke_seg4_dl_04025228 # 0x04025228 - 0x04025240
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, stomp_smoke_seg4_texture_04023148
gsSPBranchList stomp_smoke_seg4_dl_040251C8

glabel stomp_smoke_seg4_dl_04025240 # 0x04025240 - 0x04025258
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, stomp_smoke_seg4_texture_04023948
gsSPBranchList stomp_smoke_seg4_dl_040251C8

glabel stomp_smoke_seg4_dl_04025258 # 0x04025258 - 0x04025270
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, stomp_smoke_seg4_texture_04024148
gsSPBranchList stomp_smoke_seg4_dl_040251C8

glabel stomp_smoke_seg4_dl_04025270 # 0x04025270 - 0x04025288
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, stomp_smoke_seg4_texture_04024948
gsSPBranchList stomp_smoke_seg4_dl_040251C8

glabel stomp_smoke_seg4_dl_04025288 # 0x04025288 - 0x040252A0
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, stomp_smoke_seg4_texture_04022148
gsSPBranchList stomp_smoke_seg4_dl_040251E0

glabel stomp_smoke_seg4_dl_040252A0 # 0x040252A0 - 0x040252B8
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, stomp_smoke_seg4_texture_04022948
gsSPBranchList stomp_smoke_seg4_dl_040251E0

glabel stomp_smoke_seg4_dl_040252B8 # 0x040252B8 - 0x040252D0
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, stomp_smoke_seg4_texture_04023148
gsSPBranchList stomp_smoke_seg4_dl_040251E0

glabel stomp_smoke_seg4_dl_040252D0 # 0x040252D0 - 0x040252E8
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, stomp_smoke_seg4_texture_04023948
gsSPBranchList stomp_smoke_seg4_dl_040251E0

glabel stomp_smoke_seg4_dl_040252E8 # 0x040252E8 - 0x04025300
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, stomp_smoke_seg4_texture_04024148
gsSPBranchList stomp_smoke_seg4_dl_040251E0

glabel stomp_smoke_seg4_dl_04025300 # 0x04025300 - 0x04025318
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, stomp_smoke_seg4_texture_04024948
gsSPBranchList stomp_smoke_seg4_dl_040251E0
