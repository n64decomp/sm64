# Impact Ring

.balign 8
impact_ring_seg6_vertex_0601C9D0: # 0x0601C9D0
vertex      0,      0,     -5,    992,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex     -5,      0,      5,      0,   2016,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,      5,    992,   2016,  0xFF, 0xFF, 0xFF, 0xFF
vertex     -5,      0,     -5,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

impact_ring_seg6_vertex_0601CA10: # 0x0601CA10
vertex      5,      0,     -5,    992,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,      5,      0,   2016,  0xFF, 0xFF, 0xFF, 0xFF
vertex      5,      0,      5,    992,   2016,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,     -5,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

impact_ring_seg6_texture_0601CA50: # 0x0601CA50
.incbin "actors/impact_ring/impact_ring_left_side.ia16"

impact_ring_seg6_texture_0601DA50: # 0x0601DA50
.incbin "actors/impact_ring/impact_ring_right_side.ia16"

glabel impact_ring_seg6_dl_0601EA50 # 0x0601EA50 - 0x0601EA88
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, impact_ring_seg6_texture_0601CA50
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex impact_ring_seg6_vertex_0601C9D0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel impact_ring_seg6_dl_0601EA88 # 0x0601EA88 - 0x0601EAC0
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, impact_ring_seg6_texture_0601DA50
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex impact_ring_seg6_vertex_0601CA10, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel impact_ring_seg6_dl_0601EAC0 # 0x0601EAC0 - 0x0601EB40
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_ENVIRONMENT, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList impact_ring_seg6_dl_0601EA50
gsSPDisplayList impact_ring_seg6_dl_0601EA88
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetEnvColor 255, 255, 255, 255
gsSPEndDisplayList
