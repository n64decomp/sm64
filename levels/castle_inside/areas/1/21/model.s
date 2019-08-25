inside_castle_seg7_light_07037C58: # 0x07037C58 - 0x07037C60
.byte 0x37, 0x37, 0x37, 0x00, 0x37, 0x37, 0x37, 0x00

inside_castle_seg7_light_07037C60: # 0x07037C60 - 0x07037C70
.byte 0xDD, 0xDD, 0xDD, 0x00, 0xDD, 0xDD, 0xDD, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

inside_castle_seg7_vertex_07037C70: # 0x07037C70 - 0x07037D70
vertex   3422,    768,   1208,    860,    578,  0x37, 0x37, 0x37, 0xFF
vertex   4146,    358,    484,   1346,    778,  0x37, 0x37, 0x37, 0xFF
vertex   3422,    358,   1208,    778,    706,  0x37, 0x37, 0x37, 0xFF
vertex   3422,    768,  -1667,    860,    578,  0x37, 0x37, 0x37, 0xFF
vertex   3422,    358,  -1667,    778,    706,  0x37, 0x37, 0x37, 0xFF
vertex   4146,    358,   -943,   1346,    778,  0x37, 0x37, 0x37, 0xFF
vertex   4146,    768,   -943,   1428,    648,  0x37, 0x37, 0x37, 0xFF
vertex   3174,    768,  -1791,    666,    554,  0x37, 0x37, 0x37, 0xFF
vertex   2355,    768,  -1791,     22,    474,  0x37, 0x37, 0x37, 0xFF
vertex   2355,    358,  -1791,    -58,    604,  0x37, 0x37, 0x37, 0xFF
vertex   3174,    358,  -1791,    584,    682,  0x37, 0x37, 0x37, 0xFF
vertex   2355,    768,   1331,     22,    474,  0x37, 0x37, 0x37, 0xFF
vertex   3174,    358,   1331,    584,    682,  0x37, 0x37, 0x37, 0xFF
vertex   2355,    358,   1331,    -58,    604,  0x37, 0x37, 0x37, 0xFF
vertex   3174,    768,   1331,    666,    554,  0x37, 0x37, 0x37, 0xFF
vertex   4146,    768,    484,   1428,    648,  0x37, 0x37, 0x37, 0xFF

inside_castle_seg7_dl_07037D70: # 0x07037D70 - 0x07037DE8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_0900B000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight inside_castle_seg7_light_07037C60, 1
gsSPLight inside_castle_seg7_light_07037C58, 2
gsSPVertex inside_castle_seg7_vertex_07037C70, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  3,  5, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0,  0, 15,  1, 0x0
gsSPEndDisplayList

glabel inside_castle_seg7_dl_07037DE8 # 0x07037DE8 - 0x07037E38
gsDPPipeSync
gsSPClearGeometryMode G_LIGHTING
gsDPSetEnvColor 255, 255, 255, 100
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList inside_castle_seg7_dl_07037D70
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetEnvColor 255, 255, 255, 255
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
