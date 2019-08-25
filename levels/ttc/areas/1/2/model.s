ttc_seg7_light_0700AED8: # 0x0700AED8 - 0x0700AEE0
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

ttc_seg7_light_0700AEE0: # 0x0700AEE0 - 0x0700AEF0
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ttc_seg7_vertex_0700AEF0: # 0x0700AEF0 - 0x0700AFE0
vertex   -861,  -8703,   2081,   5078,  -5012,  0x20, 0x00, 0x86, 0x00
vertex   -861,  -8191,   2081,   5078,  -7186,  0x40, 0x00, 0x93, 0x32
vertex    862,  -8191,   2081,    -30,  -7186,  0xE0, 0x00, 0x86, 0x32
vertex   2081,  -8703,    862,   5078,  -5012,  0x86, 0x00, 0xE0, 0x00
vertex   2081,  -8191,   -861,    -30,  -7186,  0x86, 0x00, 0x20, 0x32
vertex   2081,  -8703,   -861,    -30,  -5012,  0x93, 0x00, 0x40, 0x00
vertex   2081,  -8191,    862,   5078,  -7186,  0x93, 0x00, 0xC0, 0x32
vertex    862,  -8703,   2081,   5078,  -5012,  0xC0, 0x00, 0x93, 0x00
vertex   2081,  -8191,    862,    -30,  -7186,  0x93, 0x00, 0xC0, 0x32
vertex   2081,  -8703,    862,    -30,  -5012,  0x86, 0x00, 0xE0, 0x00
vertex    862,  -8191,   2081,   5078,  -7186,  0xE0, 0x00, 0x86, 0x32
vertex  -2080,  -8703,    862,   5078,  -5012,  0x6D, 0x00, 0xC0, 0x00
vertex  -2080,  -8191,    862,   5078,  -7186,  0x7A, 0x00, 0xE0, 0x32
vertex   -861,  -8191,   2081,    -30,  -7186,  0x40, 0x00, 0x93, 0x32
vertex   -861,  -8703,   2081,    -30,  -5012,  0x20, 0x00, 0x86, 0x00

ttc_seg7_vertex_0700AFE0: # 0x0700AFE0 - 0x0700B0D0
vertex   -861,  -8703,  -2080,   5078,  -5012,  0x40, 0x00, 0x6D, 0x00
vertex   -861,  -8191,  -2080,   5078,  -7186,  0x20, 0x00, 0x7A, 0x32
vertex  -2080,  -8191,   -861,    -30,  -7186,  0x6D, 0x00, 0x40, 0x32
vertex   -861,  -8703,   2081,   5078,  -5012,  0x20, 0x00, 0x86, 0x00
vertex    862,  -8191,   2081,    -30,  -7186,  0xE0, 0x00, 0x86, 0x32
vertex    862,  -8703,   2081,    -30,  -5012,  0xC0, 0x00, 0x93, 0x00
vertex    862,  -8703,  -2080,   5078,  -5012,  0xE0, 0x00, 0x7A, 0x00
vertex    862,  -8191,  -2080,   5078,  -7186,  0xC0, 0x00, 0x6D, 0x32
vertex   -861,  -8191,  -2080,    -30,  -7186,  0x20, 0x00, 0x7A, 0x32
vertex   -861,  -8703,  -2080,    -30,  -5012,  0x40, 0x00, 0x6D, 0x00
vertex   2081,  -8703,   -861,   5078,  -5012,  0x93, 0x00, 0x40, 0x00
vertex    862,  -8191,  -2080,    -30,  -7186,  0xC0, 0x00, 0x6D, 0x32
vertex    862,  -8703,  -2080,    -30,  -5012,  0xE0, 0x00, 0x7A, 0x00
vertex   2081,  -8191,   -861,   5078,  -7186,  0x86, 0x00, 0x20, 0x32
vertex  -2080,  -8703,   -861,    -30,  -5012,  0x7A, 0x00, 0x20, 0x00

ttc_seg7_vertex_0700B0D0: # 0x0700B0D0 - 0x0700B110
vertex  -2080,  -8703,   -861,   5078,  -5012,  0x7A, 0x00, 0x20, 0x00
vertex  -2080,  -8191,    862,      0,  -7186,  0x7A, 0x00, 0xE0, 0x32
vertex  -2080,  -8703,    862,      0,  -5012,  0x6D, 0x00, 0xC0, 0x00
vertex  -2080,  -8191,   -861,   5078,  -7186,  0x6D, 0x00, 0x40, 0x32

ttc_seg7_dl_0700B110: # 0x0700B110 - 0x0700B1D8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, machine_09002800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ttc_seg7_light_0700AEE0, 1
gsSPLight ttc_seg7_light_0700AED8, 2
gsSPVertex ttc_seg7_vertex_0700AEF0, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex ttc_seg7_vertex_0700AFE0, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  8,  9, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 13, 11, 0x0
gsSP1Triangle  0,  2, 14, 0x0
gsSPVertex ttc_seg7_vertex_0700B0D0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel ttc_seg7_dl_0700B1D8 # 0x0700B1D8 - 0x0700B238
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ttc_seg7_dl_0700B110
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
