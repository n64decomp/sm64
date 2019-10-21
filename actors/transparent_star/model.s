# Transparent Star

transparent_star_seg3_light_0302C488: # 0x0302C488
.byte 0x03, 0x05, 0x17, 0x00, 0x03, 0x05, 0x17, 0x00

transparent_star_seg3_light_0302C490: # 0x0302C490
.byte 0x1E, 0x32, 0xE6, 0x00, 0x1E, 0x32, 0xE6, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

transparent_star_seg3_vertex_0302C4A0: # 0x0302C4A0
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

glabel transparent_star_seg3_dl_0302C560 # 0x0302C560 - 0x0302C620
gsSPLight transparent_star_seg3_light_0302C490, 1
gsSPLight transparent_star_seg3_light_0302C488, 2
gsSPVertex transparent_star_seg3_vertex_0302C4A0, 12, 0
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

glabel transparent_star_seg3_dl_0302C620 # 0x0302C620 - 0x0302C658
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetEnvColor 255, 255, 255, 120
gsSPDisplayList transparent_star_seg3_dl_0302C560
gsDPSetEnvColor 255, 255, 255, 255
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
