# White Particle

white_particle_vertex: # 0x0302C660
vertex    -15,    -15,      0,      0,    480,  0xFF, 0xFF, 0xFF, 0xFF
vertex     15,    -15,      0,    480,    480,  0xFF, 0xFF, 0xFF, 0xFF
vertex     15,     15,      0,    480,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -15,     15,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

white_particle_texture: # 0x0302C6A0
.incbin "actors/white_particle/snow_particle.rgba16"

glabel white_particle_dl # 0x0302C8A0 - 0x0302C938
gsDPPipeSync
gsSPClearGeometryMode G_LIGHTING
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, white_particle_texture
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x0FF, 0x200
gsDPPipeSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 60, 60
gsSPTexture -1, -1, 0, 0, 1
gsSPVertex white_particle_vertex, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
