ddd_seg7_light_0700CEE0: # 0x0700CEE0 - 0x0700CEE8
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

ddd_seg7_light_0700CEE8: # 0x0700CEE8 - 0x0700CEF8
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ddd_seg7_vertex_0700CEF8: # 0x0700CEF8 - 0x0700CFE8
vertex     13,    512,    -12,    352,     16,  0x00, 0x00, 0x81, 0xFF
vertex     13,      0,    -12,    352,    990,  0x00, 0x00, 0x81, 0xFF
vertex    -12,      0,    -12,    606,    990,  0x00, 0x00, 0x81, 0xFF
vertex     77,    512,     77,   1118,     16,  0x00, 0x81, 0x00, 0xFF
vertex    -76,    512,    -76,    606,     16,  0x00, 0x81, 0x00, 0xFF
vertex     77,    512,    -76,    352,     16,  0x00, 0x81, 0x00, 0xFF
vertex    -76,    512,     77,    862,     16,  0x00, 0x81, 0x00, 0xFF
vertex    -76,    538,     77,    862,      0,  0x00, 0x00, 0x7F, 0xFF
vertex     77,    512,     77,   1118,     16,  0x00, 0x00, 0x7F, 0xFF
vertex     77,    538,     77,   1118,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    -76,    512,     77,    862,     16,  0x00, 0x00, 0x7F, 0xFF
vertex    -76,    538,    -76,    606,      0,  0x81, 0x00, 0x00, 0xFF
vertex    -76,    512,    -76,    606,     16,  0x81, 0x00, 0x00, 0xFF
vertex    -76,    512,     77,    862,     16,  0x81, 0x00, 0x00, 0xFF
vertex    -76,    538,     77,    862,      0,  0x81, 0x00, 0x00, 0xFF

ddd_seg7_vertex_0700CFE8: # 0x0700CFE8 - 0x0700D0C8
vertex     77,    538,    -76,    352,      0,  0x00, 0x00, 0x81, 0xFF
vertex    -76,    512,    -76,    606,     16,  0x00, 0x00, 0x81, 0xFF
vertex    -76,    538,    -76,    606,      0,  0x00, 0x00, 0x81, 0xFF
vertex     77,    512,    -76,    352,     16,  0x00, 0x00, 0x81, 0xFF
vertex     77,    538,     77,     96,      0,  0x7F, 0x00, 0x00, 0xFF
vertex     77,    512,    -76,    352,     16,  0x7F, 0x00, 0x00, 0xFF
vertex     77,    538,    -76,    352,      0,  0x7F, 0x00, 0x00, 0xFF
vertex     77,    512,     77,     96,     16,  0x7F, 0x00, 0x00, 0xFF
vertex     13,    512,    -12,    352,     16,  0x00, 0x00, 0x81, 0xFF
vertex    -12,      0,    -12,    606,    990,  0x00, 0x00, 0x81, 0xFF
vertex    -12,    512,    -12,    606,     16,  0x00, 0x00, 0x81, 0xFF
vertex     13,    512,     13,     96,     16,  0x7F, 0x00, 0x00, 0xFF
vertex     13,      0,    -12,    352,    990,  0x7F, 0x00, 0x00, 0xFF
vertex     13,    512,    -12,    352,     16,  0x7F, 0x00, 0x00, 0xFF

ddd_seg7_vertex_0700D0C8: # 0x0700D0C8 - 0x0700D1B8
vertex    -12,    512,     13,    862,     16,  0x00, 0x00, 0x7F, 0xFF
vertex     13,      0,     13,   1118,    990,  0x00, 0x00, 0x7F, 0xFF
vertex     13,    512,     13,   1118,     16,  0x00, 0x00, 0x7F, 0xFF
vertex     13,      0,     13,   1118,    990,  0x00, 0x81, 0x00, 0xFF
vertex    -12,      0,    -12,    606,    990,  0x00, 0x81, 0x00, 0xFF
vertex     13,      0,    -12,    352,    990,  0x00, 0x81, 0x00, 0xFF
vertex     13,    512,     13,     96,     16,  0x7F, 0x00, 0x00, 0xFF
vertex     13,      0,     13,     96,    990,  0x7F, 0x00, 0x00, 0xFF
vertex     13,      0,    -12,    352,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    -12,    512,    -12,    606,     16,  0x81, 0x00, 0x00, 0xFF
vertex    -12,      0,    -12,    606,    990,  0x81, 0x00, 0x00, 0xFF
vertex    -12,      0,     13,    862,    990,  0x81, 0x00, 0x00, 0xFF
vertex    -12,      0,     13,    862,    990,  0x00, 0x81, 0x00, 0xFF
vertex    -12,    512,     13,    862,     16,  0x81, 0x00, 0x00, 0xFF
vertex    -12,      0,     13,    862,    990,  0x00, 0x00, 0x7F, 0xFF

ddd_seg7_dl_0700D1B8: # 0x0700D1B8 - 0x0700D2A0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, ddd_seg7_texture_07003000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ddd_seg7_light_0700CEE8, 1
gsSPLight ddd_seg7_light_0700CEE0, 2
gsSPVertex ddd_seg7_vertex_0700CEF8, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex ddd_seg7_vertex_0700CFE8, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0, 11, 12, 13, 0x0
gsSPVertex ddd_seg7_vertex_0700D0C8, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP2Triangles  3, 12,  4, 0x0,  9, 11, 13, 0x0
gsSP1Triangle  0, 14,  1, 0x0
gsSPEndDisplayList

glabel ddd_seg7_dl_0700D2A0 # 0x0700D2A0 - 0x0700D310
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ddd_seg7_dl_0700D1B8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
