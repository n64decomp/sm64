ddd_seg7_vertex_07008FD0: # 0x07008FD0 - 0x07009010
vertex   4941,  -1015,  -4095,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex   2893,  -1015,  -4095,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex   2893,  -3063,  -5631,      0,      0,  0x00, 0x00, 0x00, 0xFF
vertex   4941,  -3063,  -5631,      0,      0,  0x00, 0x00, 0x00, 0xFF

ddd_seg7_dl_07009010: # 0x07009010 - 0x07009030
gsSPVertex ddd_seg7_vertex_07008FD0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel ddd_seg7_dl_07009030 # 0x07009030 - 0x07009080
gsDPPipeSync
gsDPSetEnvColor 255, 255, 255, 80
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsSPDisplayList ddd_seg7_dl_07009010
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetEnvColor 255, 255, 255, 255
gsSPEndDisplayList
