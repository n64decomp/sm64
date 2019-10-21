# Yellow Sphere (used in a lot of things)

yellow_sphere_seg5_vertex_05000000: # 0x05000000
vertex    -49,    -49,      0,      0,    992,  0xB5, 0x20, 0x40, 0xFF
vertex     50,    -49,      0,    992,    992,  0xB5, 0x20, 0x40, 0xFF
vertex     50,     50,      0,    992,      0,  0xB5, 0x20, 0x40, 0xFF
vertex    -49,     50,      0,      0,      0,  0xB5, 0x20, 0x40, 0xFF

yellow_sphere_seg5_texture_05000040: # 0x05000040
.incbin "actors/yellow_sphere_small/small_yellow_sphere.rgba16"

glabel yellow_sphere_seg5_dl_05000840 # 0x05000840 - 0x05000888
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPEndDisplayList

glabel yellow_sphere_seg5_dl_05000888 # 0x05000888 - 0x050008C8
gsSPVertex yellow_sphere_seg5_vertex_05000000, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

glabel yellow_sphere_seg5_dl_050008C8 # 0x050008C8 - 0x050008F8
gsSPDisplayList yellow_sphere_seg5_dl_05000840
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, yellow_sphere_seg5_texture_05000040
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList yellow_sphere_seg5_dl_05000888
gsSPEndDisplayList
