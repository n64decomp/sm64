wf_seg7_light_0700AC70: # 0x0700AC70 - 0x0700AC78
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

wf_seg7_light_0700AC78: # 0x0700AC78 - 0x0700AC88
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

wf_seg7_vertex_0700AC88: # 0x0700AC88 - 0x0700ACE8
vertex   1536,    102,   -767,    990,   5076,  0x00, 0x7F, 0x00, 0xFF
vertex  -1023,    102,    768,  -2074,   1244,  0x00, 0x7F, 0x00, 0xFF
vertex   1024,    102,    768,  -2074,   5332,  0x00, 0x7F, 0x00, 0xFF
vertex  -1535,    102,    256,  -1052,    224,  0x00, 0x7F, 0x00, 0xFF
vertex   1536,    102,    256,  -1052,   6354,  0x00, 0x7F, 0x00, 0xFF
vertex  -1535,    102,   -767,    990,    224,  0x00, 0x7F, 0x00, 0xFF

wf_seg7_vertex_0700ACE8: # 0x0700ACE8 - 0x0700ADE8
vertex   -695,    133,    292,  -2074,  -2076,  0x00, 0x7F, 0x00, 0xFF
vertex   -419,    133,    568,    990,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   -327,    133,    476,   2012,      0,  0x00, 0x7F, 0x00, 0xFF
vertex   -327,    133,    292,   2012,  -2076,  0x00, 0x7F, 0x00, 0xFF
vertex   -419,    133,    200,    990,  -3098,  0x00, 0x7F, 0x00, 0xFF
vertex   -603,    133,    200,  -1052,  -3098,  0x00, 0x7F, 0x00, 0xFF
vertex   -603,    133,    568,  -1052,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   -695,    133,    476,  -2074,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    768,    154,      0,   3034,  -3098,  0x00, 0x7F, 0x00, 0xFF
vertex    896,    154,    384,      0,  -2076,  0x00, 0x7F, 0x00, 0xFF
vertex   1152,    154,    384,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    768,    154,    256,    990,  -3098,  0x00, 0x7F, 0x00, 0xFF
vertex   1152,    154,   -127,   4056,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    896,    154,   -127,   4056,  -2076,  0x00, 0x7F, 0x00, 0xFF
vertex   1280,    154,      0,   3034,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   1280,    154,    256,    990,    990,  0x00, 0x7F, 0x00, 0xFF

wf_seg7_dl_0700ADE8: # 0x0700ADE8 - 0x0700AE40
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09005800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight wf_seg7_light_0700AC78, 1
gsSPLight wf_seg7_light_0700AC70, 2
gsSPVertex wf_seg7_vertex_0700AC88, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  0,  2,  4, 0x0,  0,  5,  3, 0x0
gsSPEndDisplayList

wf_seg7_dl_0700AE40: # 0x0700AE40 - 0x0700AEC8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09002000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex wf_seg7_vertex_0700ACE8, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  4, 0x0
gsSP2Triangles  0,  4,  5, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  0,  6,  1, 0x0,  0,  7,  6, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSP2Triangles  8, 12, 13, 0x0,  8, 14, 12, 0x0
gsSP2Triangles  8, 10, 15, 0x0,  8, 15, 14, 0x0
gsSPEndDisplayList

glabel wf_seg7_dl_0700AEC8 # 0x0700AEC8 - 0x0700AF40
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList wf_seg7_dl_0700ADE8
gsSPDisplayList wf_seg7_dl_0700AE40
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
