# Breakable Box

breakable_box_seg8_light_08011A78: # 0x08011A78
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

breakable_box_seg8_light_08011A80: # 0x08011A80
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

breakable_box_seg8_texture_08011A90: # 0x08011A90
.incbin "actors/breakable_box/crazy_box_surface.rgba16"

breakable_box_seg8_texture_08012290: # 0x08012290
.incbin "actors/breakable_box/cork_box_surface.rgba16"

breakable_box_seg8_vertex_08012A90: # 0x08012A90
vertex   -100,      0,   -100,    992,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -100,      0,    100,    992,    992,  0x81, 0x00, 0x00, 0xFF
vertex   -100,    200,    100,      0,    992,  0x81, 0x00, 0x00, 0xFF
vertex   -100,      0,    100,      0,    992,  0x00, 0x00, 0x7F, 0xFF
vertex    100,      0,    100,    992,    992,  0x00, 0x00, 0x7F, 0xFF
vertex    100,    200,    100,    992,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -100,    200,    100,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    100,      0,   -100,    992,      0,  0x00, 0x81, 0x00, 0xFF
vertex    100,      0,    100,      0,      0,  0x00, 0x81, 0x00, 0xFF
vertex   -100,      0,    100,      0,    992,  0x00, 0x81, 0x00, 0xFF
vertex   -100,      0,   -100,    992,    992,  0x00, 0x81, 0x00, 0xFF
vertex    100,    200,   -100,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    100,    200,    100,      0,    992,  0x7F, 0x00, 0x00, 0xFF
vertex    100,      0,    100,    992,    992,  0x7F, 0x00, 0x00, 0xFF
vertex    100,      0,   -100,    992,      0,  0x7F, 0x00, 0x00, 0xFF

breakable_box_seg8_vertex_08012B80: # 0x08012B80
vertex   -100,    200,    100,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    100,    200,   -100,    992,    992,  0x00, 0x7F, 0x00, 0xFF
vertex   -100,    200,   -100,    992,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    100,    200,    100,      0,    992,  0x00, 0x7F, 0x00, 0xFF
vertex    100,    200,   -100,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex    100,      0,   -100,      0,    992,  0x00, 0x00, 0x81, 0xFF
vertex   -100,      0,   -100,    992,    992,  0x00, 0x00, 0x81, 0xFF
vertex   -100,    200,   -100,    992,      0,  0x00, 0x00, 0x81, 0xFF
vertex   -100,      0,   -100,    992,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -100,    200,    100,      0,    992,  0x81, 0x00, 0x00, 0xFF
vertex   -100,    200,   -100,      0,      0,  0x81, 0x00, 0x00, 0xFF

glabel breakable_box_seg8_dl_08012C30 # 0x08012C30 - 0x08012CD8
gsSPLight breakable_box_seg8_light_08011A80, 1
gsSPLight breakable_box_seg8_light_08011A78, 2
gsSPVertex breakable_box_seg8_vertex_08012A90, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex breakable_box_seg8_vertex_08012B80, 11, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP1Triangle  8,  9, 10, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

glabel breakable_box_seg8_dl_08012CD8 # 0x08012CD8 - 0x08012D20
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPEndDisplayList

glabel breakable_box_seg8_dl_08012D20 # 0x08012D20 - 0x08012D48
gsSPDisplayList breakable_box_seg8_dl_08012CD8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, breakable_box_seg8_texture_08011A90
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPBranchList breakable_box_seg8_dl_08012C30

glabel breakable_box_seg8_dl_08012D48 # 0x08012D20 - 0x08012D70
gsSPDisplayList breakable_box_seg8_dl_08012CD8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, breakable_box_seg8_texture_08012290
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPBranchList breakable_box_seg8_dl_08012C30
