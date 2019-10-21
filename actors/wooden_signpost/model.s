# Signpost

wooden_signpost_seg3_light_0302C940: # 0x0302C940
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

wooden_signpost_seg3_light_0302C948: # 0x0302C948
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

wooden_signpost_seg3_vertex_0302C958: # 0x0302C958
vertex      0,    504,     19,    962,    478,  0x00, 0x7E, 0xFC, 0xFF
vertex     24,    490,     34,    938,    780,  0x62, 0x3B, 0x36, 0xFF
vertex      0,    490,     -6,    938,    478,  0xFF, 0x39, 0x90, 0xFF
vertex    -23,    490,     34,    938,    178,  0x9E, 0x3A, 0x36, 0xFF
vertex      0,    -39,     34,     36,    478,  0x00, 0xFC, 0x7E, 0xFF
vertex    -23,    -39,     -6,     36,    178,  0x93, 0x00, 0xC1, 0xFF
vertex     24,    -39,     -6,     36,    780,  0x6D, 0x00, 0xC0, 0xFF

wooden_signpost_seg3_texture_0302C9C8: # 0x0302C9C8
.incbin "actors/wooden_signpost/wooden_signpost_back.rgba16"

wooden_signpost_seg3_texture_0302D1C8: # 0x0302D1C8
.incbin "actors/wooden_signpost/wooden_signpost_front.rgba16"

glabel wooden_signpost_seg3_dl_0302D9C8 # 0x0302D9C8 - 0x0302DA48
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, wooden_signpost_seg3_texture_0302C9C8
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight wooden_signpost_seg3_light_0302C948, 1
gsSPLight wooden_signpost_seg3_light_0302C940, 2
gsSPVertex wooden_signpost_seg3_vertex_0302C958, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  0, 0x0
gsSP2Triangles  0,  3,  1, 0x0,  4,  1,  3, 0x0
gsSP2Triangles  3,  5,  4, 0x0,  5,  3,  2, 0x0
gsSP2Triangles  2,  6,  5, 0x0,  1,  4,  6, 0x0
gsSP1Triangle  6,  2,  1, 0x0
gsSPEndDisplayList

glabel wooden_signpost_seg3_dl_0302DA48 # 0x0302DA48 - 0x0302DAA8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList wooden_signpost_seg3_dl_0302D9C8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

wooden_signpost_seg3_light_0302DAA8: # 0x0302DAA8
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

wooden_signpost_seg3_light_0302DAB0: # 0x0302DAB0
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

wooden_signpost_seg3_vertex_0302DAC0: # 0x0302DAC0
vertex    180,    260,     20,    990,    990,  0x00, 0x81, 0x00, 0xFF
vertex   -179,    260,     60,      0,    990,  0x00, 0x81, 0x00, 0xFF
vertex   -179,    260,     20,      0,    990,  0x00, 0x81, 0x00, 0xFF
vertex    180,    260,     20,    990,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -179,    260,     20,      0,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -179,    460,     20,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex   -179,    260,     20,      0,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -179,    260,     60,      0,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -179,    460,     60,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -179,    460,     20,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex    180,    260,     60,    990,    990,  0x00, 0x81, 0x00, 0xFF
vertex   -179,    460,     20,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex   -179,    460,     60,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    180,    460,     60,    990,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    180,    460,     20,    990,      0,  0x00, 0x00, 0x81, 0xFF
vertex    180,    460,     20,    990,      0,  0x00, 0x7F, 0x00, 0xFF

wooden_signpost_seg3_vertex_0302DBC0: # 0x0302DBC0
vertex    180,    260,     60,    990,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    180,    460,     20,    990,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    180,    460,     60,    990,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    180,    260,     20,    990,    990,  0x7F, 0x00, 0x00, 0xFF

wooden_signpost_seg3_vertex_0302DC00: # 0x0302DC00
vertex   -179,    260,     60,      0,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    180,    460,     60,    990,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -179,    460,     60,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    180,    260,     60,    990,    990,  0x00, 0x00, 0x7F, 0xFF

glabel wooden_signpost_seg3_dl_0302DC40 # 0x0302DC40 - 0x0302DCD0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, wooden_signpost_seg3_texture_0302C9C8
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight wooden_signpost_seg3_light_0302DAB0, 1
gsSPLight wooden_signpost_seg3_light_0302DAA8, 2
gsSPVertex wooden_signpost_seg3_vertex_0302DAC0, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  8,  9, 0x0
gsSP2Triangles  0, 10,  1, 0x0, 11, 12, 13, 0x0
gsSP2Triangles  3,  5, 14, 0x0, 11, 13, 15, 0x0
gsSPVertex wooden_signpost_seg3_vertex_0302DBC0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel wooden_signpost_seg3_dl_0302DCD0 # 0x0302DCD0 - 0x0302DD08
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, wooden_signpost_seg3_texture_0302D1C8
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex wooden_signpost_seg3_vertex_0302DC00, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel wooden_signpost_seg3_dl_0302DD08 # 0x0302DD08 - 0x0302DD80
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList wooden_signpost_seg3_dl_0302DC40
gsSPDisplayList wooden_signpost_seg3_dl_0302DCD0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
