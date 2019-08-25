ddd_seg7_vertex_07008CB8: # 0x07008CB8 - 0x07008D98
vertex   -869,  -2746,   -255,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   -869,  -2746,    256,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   -511,  -2746,      0,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex  -1177,  -2746,   -153,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   -869,  -2746,     51,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex   -869,  -2746,    -50,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex  -1177,  -2746,    154,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex  -5068,  -2149,   -255,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex  -5068,  -2149,    256,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex  -5068,  -1791,      0,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex  -5068,  -2457,   -153,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex  -5068,  -2149,     51,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex  -5068,  -2149,    -50,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex  -5068,  -2457,    154,      0,      0,  0xFF, 0xFF, 0x00, 0xFF

ddd_seg7_vertex_07008D98: # 0x07008D98 - 0x07008E78
vertex  -2713,  -2746,   -153,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex  -2713,  -2746,    154,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex  -2405,  -2746,     51,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex  -2405,  -2746,    -50,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex  -2405,  -2746,   -255,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex  -2405,  -2746,    256,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex  -2047,  -2746,      0,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex  -2203,    244,      0,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex  -2457,    497,    256,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex  -2457,    497,   -255,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex  -2457,    497,    -50,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex  -2674,    715,    154,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex  -2674,    715,   -153,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex  -2457,    497,     51,      0,      0,  0xFF, 0xFF, 0x00, 0xFF

ddd_seg7_vertex_07008E78: # 0x07008E78 - 0x07008EE8
vertex  -5068,  -4505,   -153,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex  -5068,  -4505,    154,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex  -5068,  -4197,     51,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex  -5068,  -4197,   -255,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex  -5068,  -4197,    256,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex  -5068,  -3839,      0,      0,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex  -5068,  -4197,    -50,      0,      0,  0xFF, 0xFF, 0x00, 0xFF

ddd_seg7_dl_07008EE8: # 0x07008EE8 - 0x07008F80
gsSPVertex ddd_seg7_vertex_07008CB8, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 13, 11, 0x0
gsSPVertex ddd_seg7_vertex_07008D98, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 13, 11, 0x0
gsSPVertex ddd_seg7_vertex_07008E78, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP1Triangle  0,  2,  6, 0x0
gsSPEndDisplayList

glabel ddd_seg7_dl_07008F80 # 0x07008F80 - 0x07008FD0
gsDPPipeSync
gsDPSetEnvColor 255, 255, 255, 98
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPClearGeometryMode G_LIGHTING
gsSPDisplayList ddd_seg7_dl_07008EE8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsDPSetEnvColor 255, 255, 255, 255
gsSPEndDisplayList
