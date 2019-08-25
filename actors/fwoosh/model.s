# Fwoosh

fwoosh_seg5_vertex_050157C8: # 0x050157C8
vertex    -19,    -19,      0,    992,    992,  0xFF, 0xFF, 0xFF, 0xFF
vertex     20,    -19,      0,      0,    992,  0xFF, 0xFF, 0xFF, 0xFF
vertex     20,     20,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -19,     20,      0,    992,      0,  0xFF, 0xFF, 0xFF, 0xFF

fwoosh_seg5_texture_05015808: # 0x05015808
.incbin "actors/fwoosh/fwoosh_face.ia16"

glabel fwoosh_seg5_dl_05016008 # 0x05016008 - 0x05016040
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, fwoosh_seg5_texture_05015808
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex fwoosh_seg5_vertex_050157C8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel fwoosh_seg5_dl_05016040 # 0x05016040 - 0x050160B0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList fwoosh_seg5_dl_05016008
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
