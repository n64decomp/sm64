# Star

star_seg3_light_0302A6D8: # 0x0302A6D8
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

star_seg3_light_0302A6E0: # 0x0302A6E0
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

star_seg3_texture_0302A6F0: # 0x0302A6F0
.incbin "actors/star/star_surface.rgba16"

star_seg3_texture_0302AEF0: # 0x0302AEF0
.incbin "actors/star/star_eye.rgba16"

star_seg3_vertex_0302B6F0: # 0x0302B6F0
vertex      0,      8,    -89,      0,      0,  0x00, 0x07, 0x82, 0xFF
vertex    190,   -201,      0,      0,      0,  0x55, 0xA3, 0x00, 0xFF
vertex      0,   -129,      0,      0,      0,  0x00, 0x82, 0x00, 0xFF
vertex    146,    -42,      0,      0,      0,  0x7C, 0xE7, 0x00, 0xFF
vertex      0,      8,     90,      0,      0,  0x00, 0x07, 0x7E, 0xFF
vertex    257,     84,      0,      0,      0,  0x68, 0x47, 0x00, 0xFF
vertex   -145,    -42,      0,      0,      0,  0x84, 0xE7, 0x00, 0xFF
vertex   -189,   -201,      0,      0,      0,  0xAA, 0xA3, 0x00, 0xFF
vertex   -256,     84,      0,      0,      0,  0x97, 0x47, 0x00, 0xFF
vertex      0,    246,      0,      0,      0,  0x00, 0x7E, 0x00, 0xFF
vertex     96,     99,      0,      0,      0,  0x3D, 0x6F, 0x00, 0xFF
vertex    -95,     99,      0,      0,      0,  0xC3, 0x6F, 0x00, 0xFF

glabel star_seg3_dl_0302B7B0 # 0x0302B7B0 - 0x0302B870
gsSPLight star_seg3_light_0302A6E0, 1
gsSPLight star_seg3_light_0302A6D8, 2
gsSPVertex star_seg3_vertex_0302B6F0, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  2,  1,  4, 0x0,  1,  3,  4, 0x0
gsSP2Triangles  5,  3,  0, 0x0,  4,  3,  5, 0x0
gsSP2Triangles  6,  7,  4, 0x0,  7,  2,  4, 0x0
gsSP2Triangles  8,  6,  4, 0x0,  9,  4, 10, 0x0
gsSP2Triangles  9, 11,  4, 0x0,  4,  5, 10, 0x0
gsSP2Triangles 11,  8,  4, 0x0,  0,  2,  7, 0x0
gsSP2Triangles  0,  7,  6, 0x0,  0,  6,  8, 0x0
gsSP2Triangles  0,  8, 11, 0x0,  0, 11,  9, 0x0
gsSP2Triangles 10,  5,  0, 0x0, 10,  0,  9, 0x0
gsSPEndDisplayList

glabel star_seg3_dl_0302B870 # 0x0302B870 - 0x0302B908
gsDPPipeSync
gsSPSetGeometryMode G_TEXTURE_GEN
gsDPSetEnvColor 255, 255, 255, 255
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, star_seg3_texture_0302A6F0
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsDPPipeSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPTexture 1984, 1984, 0, 0, 1
gsSPDisplayList star_seg3_dl_0302B7B0
gsDPPipeSync
gsSPTexture 1984, 1984, 0, 0, 0
gsSPClearGeometryMode G_TEXTURE_GEN
gsDPSetEnvColor 255, 255, 255, 255
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

star_seg3_light_0302B908: # 0x0302B908
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

star_seg3_light_0302B910: # 0x0302B910
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

star_seg3_vertex_0302B920: # 0x0302B920
vertex     67,     86,     63,    990,      0,  0x18, 0x15, 0x7A, 0xFF
vertex      0,    -27,     96,      0,    990,  0x18, 0x15, 0x7A, 0xFF
vertex     67,    -29,     83,    990,    990,  0x18, 0x15, 0x7A, 0xFF
vertex      0,     89,     76,      0,      0,  0x18, 0x15, 0x7A, 0xFF
vertex      0,     89,     76,    990,      0,  0xE8, 0x15, 0x7A, 0xFF
vertex    -66,    -29,     83,      0,    990,  0xE8, 0x15, 0x7A, 0xFF
vertex      0,    -27,     96,    990,    990,  0xE8, 0x15, 0x7A, 0xFF
vertex      0,     89,     76,    990,      0,  0xE7, 0x15, 0x7A, 0xFF
vertex    -66,     86,     63,      0,      0,  0xE7, 0x15, 0x7A, 0xFF
vertex    -66,    -29,     83,      0,    990,  0xE7, 0x15, 0x7A, 0xFF

glabel star_seg3_dl_0302B9C0 # 0x0302B9C0 - 0x0302BA18
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, star_seg3_texture_0302AEF0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight star_seg3_light_0302B910, 1
gsSPLight star_seg3_light_0302B908, 2
gsSPVertex star_seg3_vertex_0302B920, 10, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  7,  8,  9, 0x0
gsSPEndDisplayList

glabel star_seg3_dl_0302BA18 # 0x0302BA18 - 0x0302BA88
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList star_seg3_dl_0302B9C0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
