bits_seg7_vertex_0700D2F0: # 0x0700D2F0 - 0x0700D3F0
vertex  -3043,     51,    -50,  23342,    678,  0x41, 0x43, 0x8C, 0xFF
vertex      0,     51,    -50,  10684,    678,  0x41, 0x43, 0x8C, 0xFF
vertex      0,      0,      0,  10862,    748,  0x41, 0x43, 0x8C, 0xFF
vertex  -3043,      0,      0,  23520,    748,  0x41, 0x43, 0x8C, 0xFF
vertex   2765,     51,    -50,   -810,    678,  0x41, 0x43, 0x8C, 0xFF
vertex   2765,      0,      0,   -634,    748,  0x41, 0x43, 0x8C, 0xFF
vertex  -3043,     51,     51,  23342,    678,  0x97, 0xA9, 0xCD, 0xFF
vertex      0,    102,      0,  10508,    606,  0x97, 0xA9, 0xCD, 0xFF
vertex  -3043,    102,      0,  23164,    606,  0x97, 0xA9, 0xCD, 0xFF
vertex      0,     51,     51,  10684,    678,  0x97, 0xA9, 0xCD, 0xFF
vertex   2765,    102,      0,   -988,    606,  0x97, 0xA9, 0xCD, 0xFF
vertex   2765,     51,     51,   -810,    678,  0x97, 0xA9, 0xCD, 0xFF
vertex  -3043,    102,      0,  23164,    606,  0x8C, 0x98, 0xD8, 0xFF
vertex      0,     51,    -50,  10684,    678,  0x8C, 0x98, 0xD8, 0xFF
vertex  -3043,     51,    -50,  23342,    678,  0x8C, 0x98, 0xD8, 0xFF
vertex      0,    102,      0,  10508,    606,  0x8C, 0x98, 0xD8, 0xFF

bits_seg7_vertex_0700D3F0: # 0x0700D3F0 - 0x0700D4D0
vertex      0,    102,      0,  10508,    606,  0x8C, 0x98, 0xD8, 0xFF
vertex   2765,     51,    -50,   -810,    678,  0x8C, 0x98, 0xD8, 0xFF
vertex      0,     51,    -50,  10684,    678,  0x8C, 0x98, 0xD8, 0xFF
vertex   2765,    102,      0,   -988,    606,  0x8C, 0x98, 0xD8, 0xFF
vertex  -3043,     51,    -50,  23342,    678,  0x52, 0x61, 0xAC, 0xFF
vertex  -3043,      0,      0,  23520,    748,  0x52, 0x61, 0xAC, 0xFF
vertex  -3043,     51,     51,  23342,    678,  0x52, 0x61, 0xAC, 0xFF
vertex      0,     51,     51,  10684,    678,  0x52, 0x61, 0xAC, 0xFF
vertex      0,      0,      0,  10862,    748,  0x52, 0x61, 0xAC, 0xFF
vertex   2765,     51,     51,   -810,    678,  0x52, 0x61, 0xAC, 0xFF
vertex   2765,      0,      0,   -634,    748,  0x52, 0x61, 0xAC, 0xFF
vertex  -3043,    102,      0,  23164,    606,  0x52, 0x61, 0xAC, 0xFF
vertex   2765,    102,      0,   -988,    606,  0x52, 0x61, 0xAC, 0xFF
vertex   2765,     51,    -50,   -810,    678,  0x52, 0x61, 0xAC, 0xFF

bits_seg7_dl_0700D4D0: # 0x0700D4D0 - 0x0700D5A0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09008000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bits_seg7_vertex_0700D2F0, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  1,  4,  5, 0x0,  1,  5,  2, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  9,  7, 0x0
gsSP2Triangles  9, 10,  7, 0x0,  9, 11, 10, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 15, 13, 0x0
gsSPVertex bits_seg7_vertex_0700D3F0, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  5,  7,  6, 0x0
gsSP2Triangles  5,  8,  7, 0x0,  8,  9,  7, 0x0
gsSP2Triangles  8, 10,  9, 0x0,  4,  6, 11, 0x0
gsSP2Triangles 12,  9, 10, 0x0, 12, 10, 13, 0x0
gsSPEndDisplayList

glabel bits_seg7_dl_0700D5A0 # 0x0700D5A0 - 0x0700D620
gsDPPipeSync
gsDPSetEnvColor 255, 255, 255, 180
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bits_seg7_dl_0700D4D0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsDPSetEnvColor 255, 255, 255, 255
gsSPEndDisplayList
