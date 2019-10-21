# Smoke

smoke_seg5_vertex_05007280: # 0x05007280
vertex     26,     26,      0,    990,      0,  0xFF, 0xFF, 0xFF, 0xB4
vertex    -25,     26,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xB4
vertex    -25,    -25,      0,      0,    990,  0xFF, 0xFF, 0xFF, 0xB4
vertex     26,    -25,      0,    990,    990,  0xFF, 0xFF, 0xFF, 0xB4

smoke_seg5_texture_050072C0: # 0x050072C0
.incbin "actors/smoke/smoke.ia16"

glabel smoke_seg5_dl_05007AC0 # 0x05007AC0 - 0x05007AF8
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, smoke_seg5_texture_050072C0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex smoke_seg5_vertex_05007280, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel smoke_seg5_dl_05007AF8 # 0x05007AF8 - 0x05007B68
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList smoke_seg5_dl_05007AC0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
