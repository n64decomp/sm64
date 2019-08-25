wf_seg7_light_0700E160: # 0x0700E160 - 0x0700E168
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

wf_seg7_light_0700E168: # 0x0700E168 - 0x0700E178
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

wf_seg7_vertex_0700E178: # 0x0700E178 - 0x0700E278
vertex   -127,     64,   -575,      0,    480,  0x81, 0x00, 0x00, 0xFF
vertex   -127,    -63,   -575,      0,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -127,    -63,    576,   9166,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -127,     64,    576,      0,    480,  0x00, 0x00, 0x7F, 0xFF
vertex   -127,    -63,    576,      0,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    215,    -63,    576,    990,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    215,     64,    576,    990,    478,  0x00, 0x00, 0x7F, 0xFF
vertex    215,     64,   -575,      0,   1498,  0x00, 0x7F, 0x00, 0xFF
vertex   -127,     64,   -575,    990,   1498,  0x00, 0x7F, 0x00, 0xFF
vertex   -127,     64,    576,    990,  -3098,  0x00, 0x7F, 0x00, 0xFF
vertex    215,     64,      0,      0,   -798,  0x00, 0x7F, 0x00, 0xFF
vertex    215,     64,    576,      0,  -3098,  0x00, 0x7F, 0x00, 0xFF
vertex   -127,     64,    576,   9166,    480,  0x81, 0x00, 0x00, 0xFF
vertex    215,     64,   -575,      0,    478,  0x00, 0x00, 0x81, 0xFF
vertex    215,    -63,   -575,      0,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -127,    -63,   -575,    990,    990,  0x00, 0x00, 0x81, 0xFF

wf_seg7_vertex_0700E278: # 0x0700E278 - 0x0700E328
vertex    215,     64,   -575,      0,    478,  0x00, 0x00, 0x81, 0xFF
vertex   -127,    -63,   -575,    990,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -127,     64,   -575,    990,    478,  0x00, 0x00, 0x81, 0xFF
vertex    215,    -63,    576,      0,  -3098,  0x00, 0x81, 0x00, 0xFF
vertex   -127,    -63,    576,    990,  -3098,  0x00, 0x81, 0x00, 0xFF
vertex   -127,    -63,   -575,    990,   1498,  0x00, 0x81, 0x00, 0xFF
vertex    215,    -63,   -575,      0,   1498,  0x00, 0x81, 0x00, 0xFF
vertex    215,     64,    576,      0,    478,  0x7F, 0x00, 0x00, 0xFF
vertex    215,    -63,    576,      0,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    215,    -63,   -575,   9166,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    215,     64,   -575,   9166,    480,  0x7F, 0x00, 0x00, 0xFF

wf_seg7_dl_0700E328: # 0x0700E328 - 0x0700E3D0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09004000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight wf_seg7_light_0700E168, 1
gsSPLight wf_seg7_light_0700E160, 2
gsSPVertex wf_seg7_vertex_0700E178, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  9, 10,  7, 0x0,  9, 11, 10, 0x0
gsSP2Triangles  0,  2, 12, 0x0, 13, 14, 15, 0x0
gsSPVertex wf_seg7_vertex_0700E278, 11, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP1Triangle  7,  9, 10, 0x0
gsSPEndDisplayList

glabel wf_seg7_dl_0700E3D0 # 0x0700E3D0 - 0x0700E440
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList wf_seg7_dl_0700E328
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
