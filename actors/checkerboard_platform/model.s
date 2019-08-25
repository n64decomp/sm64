# Checkerboard Platform

checkerboard_platform_seg8_light_0800C828: # 0x0800C828
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

checkerboard_platform_seg8_light_0800C830: # 0x0800C830
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

checkerboard_platform_seg8_texture_0800C840: # 0x0800C840
.incbin "actors/checkerboard_platform/checkerboard_platform_side.rgba16"

checkerboard_platform_seg8_texture_0800CC40: # 0x0800CC40
.incbin "actors/checkerboard_platform/checkerboard_platform.rgba16"

checkerboard_platform_seg8_vertex_0800D440: # 0x0800D440
vertex   -255,    -25,    154,   1504,    480,  0x81, 0x00, 0x00, 0xFF
vertex   -255,     26,    154,   1504,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -255,     26,   -153,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -255,    -25,   -153,      0,    480,  0x81, 0x00, 0x00, 0xFF
vertex    256,    -25,   -153,   1504,    480,  0x7F, 0x00, 0x00, 0xFF
vertex    256,     26,    154,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    256,    -25,    154,      0,    480,  0x7F, 0x00, 0x00, 0xFF
vertex    256,     26,   -153,   1504,      0,  0x7F, 0x00, 0x00, 0xFF

checkerboard_platform_seg8_vertex_0800D4C0: # 0x0800D4C0
vertex    256,    -25,    154,   2528,    992,  0x00, 0x81, 0x00, 0xFF
vertex   -255,    -25,   -153,      0,   -512,  0x00, 0x81, 0x00, 0xFF
vertex    256,    -25,   -153,   2528,   -512,  0x00, 0x81, 0x00, 0xFF
vertex    256,     26,   -153,   2528,   -512,  0x00, 0x7F, 0x00, 0xFF
vertex   -255,     26,    154,      0,    992,  0x00, 0x7F, 0x00, 0xFF
vertex    256,     26,    154,   2528,    992,  0x00, 0x7F, 0x00, 0xFF
vertex   -255,     26,   -153,      0,   -512,  0x00, 0x7F, 0x00, 0xFF
vertex   -255,    -25,   -153,   2528,    480,  0x00, 0x00, 0x81, 0xFF
vertex   -255,     26,   -153,   2528,      0,  0x00, 0x00, 0x81, 0xFF
vertex    256,     26,   -153,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex    256,    -25,   -153,      0,    480,  0x00, 0x00, 0x81, 0xFF
vertex    256,    -25,    154,   2528,    480,  0x00, 0x00, 0x7F, 0xFF
vertex   -255,     26,    154,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -255,    -25,    154,      0,    480,  0x00, 0x00, 0x7F, 0xFF
vertex    256,     26,    154,   2528,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -255,    -25,    154,      0,    992,  0x00, 0x81, 0x00, 0xFF

glabel checkerboard_platform_seg8_dl_0800D5C0 # 0x0800D5C0 - 0x0800D618
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, checkerboard_platform_seg8_texture_0800C840
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x1FF, 0x100
gsSPLight checkerboard_platform_seg8_light_0800C830, 1
gsSPLight checkerboard_platform_seg8_light_0800C828, 2
gsSPVertex checkerboard_platform_seg8_vertex_0800D440, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

glabel checkerboard_platform_seg8_dl_0800D618 # 0x0800D618 - 0x0800D680
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, checkerboard_platform_seg8_texture_0800CC40
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex checkerboard_platform_seg8_vertex_0800D4C0, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0,  0, 15,  1, 0x0
gsSPEndDisplayList

glabel checkerboard_platform_seg8_dl_0800D680 # 0x0800D680 - 0x0800D710
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 60
gsSPDisplayList checkerboard_platform_seg8_dl_0800D5C0
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList checkerboard_platform_seg8_dl_0800D618
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

