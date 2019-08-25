# Yellow Sphere (used in a lot of things)

.balign 8
yellow_sphere_seg6_vertex_0601EB48: # 0x0601EB48
vertex    -76,    -76,      0,      0,    992,  0xFF, 0xFF, 0xFF, 0xFF
vertex     77,    -76,      0,    992,    992,  0xFF, 0xFF, 0xFF, 0xFF
vertex     77,     77,      0,    992,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -76,     77,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

yellow_sphere_seg6_texture_0601EB88: # 0x0601EB88
.incbin "actors/yellow_sphere/yellow_sphere.rgba16"

glabel yellow_sphere_seg6_dl_0601F388 # 0x0601F388 - 0x0601F3C0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, yellow_sphere_seg6_texture_0601EB88
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex yellow_sphere_seg6_vertex_0601EB48, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel yellow_sphere_seg6_dl_0601F3C0 # 0x0601F3C0 - 0x0601F430
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList yellow_sphere_seg6_dl_0601F388
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
