# Impact Smoke

# TODO: Are these seperate textures or unified 64x64 ones?

.balign 8
impact_smoke_seg6_texture_0605AA28: # 0x0605AA28
.incbin "actors/impact_smoke/impact_smoke_0.ia16"

impact_smoke_seg6_texture_0605CA28: # 0x0605CA28
.incbin "actors/impact_smoke/impact_smoke_1.ia16"

impact_smoke_seg6_texture_0605EA28: # 0x0605EA28
.incbin "actors/impact_smoke/impact_smoke_2.ia16"

impact_smoke_seg6_texture_06060A28: # 0x06060A28
.incbin "actors/impact_smoke/impact_smoke_3.ia16"

impact_smoke_seg6_vertex_06062A28: # 0x06062A28
vertex   -150,    150,      0,      0,    992,  0x28, 0x19, 0x14, 0xFF
vertex    150,    150,      0,   2016,    992,  0x28, 0x19, 0x14, 0xFF
vertex    150,    300,      0,   2016,      0,  0x28, 0x19, 0x14, 0xFF
vertex   -150,    300,      0,      0,      0,  0x28, 0x19, 0x14, 0xFF
vertex   -150,      0,      0,      0,    992,  0x28, 0x19, 0x14, 0xFF
vertex    150,      0,      0,   2016,    992,  0x28, 0x19, 0x14, 0xFF
vertex    150,    150,      0,   2016,      0,  0x28, 0x19, 0x14, 0xFF
vertex   -150,    150,      0,      0,      0,  0x28, 0x19, 0x14, 0xFF

glabel impact_smoke_seg6_dl_06062AA8 # 0x06062AA8 - 0x06062AD8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_ENVIRONMENT, G_ACMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0
gsSPGeometryMode G_LIGHTING, G_SHADING_SMOOTH, G_ORDER_CFIRST
gsSPTexture -1, -1, 0, 0, 1
gsSPEndDisplayList

glabel impact_smoke_seg6_dl_06062AD8 # 0x06062AD8 - 0x06062AF0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel impact_smoke_seg6_dl_06062AF0 # 0x06062AF0 - 0x06062B08
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSPEndDisplayList

glabel impact_smoke_seg6_dl_06062B08 # 0x06062B08 - 0x06062B38
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetEnvColor 255, 255, 255, 255
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

glabel impact_smoke_seg6_dl_06062B38 # 0x06062B38 - 0x06062BD8
gsSPDisplayList impact_smoke_seg6_dl_06062AA8
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, impact_smoke_seg6_texture_0605AA28
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsDPPipeSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPVertex impact_smoke_seg6_vertex_06062A28, 8, 0
gsSPDisplayList impact_smoke_seg6_dl_06062AD8
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, impact_smoke_seg6_texture_0605AA28 + 0x1000
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsDPPipeSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList impact_smoke_seg6_dl_06062AF0
gsSPDisplayList impact_smoke_seg6_dl_06062B08
gsSPEndDisplayList

glabel impact_smoke_seg6_dl_06062BD8 # 0x06062BD8 - 0x06062C78
gsSPDisplayList impact_smoke_seg6_dl_06062AA8
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, impact_smoke_seg6_texture_0605CA28
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsDPPipeSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPVertex impact_smoke_seg6_vertex_06062A28, 8, 0
gsSPDisplayList impact_smoke_seg6_dl_06062AD8
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, impact_smoke_seg6_texture_0605CA28 + 0x1000
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsDPPipeSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList impact_smoke_seg6_dl_06062AF0
gsSPDisplayList impact_smoke_seg6_dl_06062B08
gsSPEndDisplayList

glabel impact_smoke_seg6_dl_06062C78 # 0x06062C78 - 0x06062D18
gsSPDisplayList impact_smoke_seg6_dl_06062AA8
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, impact_smoke_seg6_texture_0605EA28
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsDPPipeSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPVertex impact_smoke_seg6_vertex_06062A28, 8, 0
gsSPDisplayList impact_smoke_seg6_dl_06062AD8
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, impact_smoke_seg6_texture_0605EA28 + 0x1000
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsDPPipeSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList impact_smoke_seg6_dl_06062AF0
gsSPDisplayList impact_smoke_seg6_dl_06062B08
gsSPEndDisplayList

glabel impact_smoke_seg6_dl_06062D18 # 0x06062D18 - 0x06062DB8
gsSPDisplayList impact_smoke_seg6_dl_06062AA8
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, impact_smoke_seg6_texture_06060A28
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsDPPipeSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPVertex impact_smoke_seg6_vertex_06062A28, 8, 0
gsSPDisplayList impact_smoke_seg6_dl_06062AD8
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, impact_smoke_seg6_texture_06060A28 + 0x1000
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsDPPipeSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList impact_smoke_seg6_dl_06062AF0
gsSPDisplayList impact_smoke_seg6_dl_06062B08
gsSPEndDisplayList
