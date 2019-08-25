ssl_seg7_light_07022AA0: # 0x07022AA0 - 0x07022AA8
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

ssl_seg7_light_07022AA8: # 0x07022AA8 - 0x07022AB8
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ssl_seg7_vertex_07022AB8: # 0x07022AB8 - 0x07022BB8
vertex    -63,      0,    307,   2420,    990,  0x99, 0xCD, 0x33, 0xFF
vertex    -63,    512,    307,   2420,  -1054,  0xD6, 0x54, 0x54, 0xFF
vertex    -63,    512,   -306,      0,  -1054,  0x99, 0x33, 0xCD, 0xFF
vertex    -63,      0,   -306,    990,    990,  0xD6, 0xAC, 0xAC, 0xFF
vertex    -63,    512,   -306,    990,  -1054,  0x99, 0x33, 0xCD, 0xFF
vertex     64,    512,   -306,    478,  -1054,  0x2A, 0x54, 0xAC, 0xFF
vertex     64,      0,   -306,    478,    990,  0x67, 0xCD, 0xCD, 0xFF
vertex     64,      0,   -306,   2420,    990,  0x67, 0xCD, 0xCD, 0xFF
vertex     64,    512,    307,      0,  -1054,  0x67, 0x33, 0x33, 0xFF
vertex     64,      0,    307,      0,    990,  0x2A, 0xAC, 0x54, 0xFF
vertex     64,    512,   -306,   2420,  -1054,  0x2A, 0x54, 0xAC, 0xFF
vertex     64,      0,    307,    990,    990,  0x2A, 0xAC, 0x54, 0xFF
vertex    -63,    512,    307,    478,  -1054,  0xD6, 0x54, 0x54, 0xFF
vertex    -63,      0,    307,    478,    990,  0x99, 0xCD, 0x33, 0xFF
vertex     64,    512,    307,    990,  -1054,  0x67, 0x33, 0x33, 0xFF
vertex    -63,      0,   -306,      0,    990,  0xD6, 0xAC, 0xAC, 0xFF

ssl_seg7_vertex_07022BB8: # 0x07022BB8 - 0x07022C38
vertex     64,      0,    307,    990,   1464,  0x2A, 0xAC, 0x54, 0xFF
vertex    -63,      0,    307,    480,   1464,  0x99, 0xCD, 0x33, 0xFF
vertex    -63,      0,   -306,    480,   -986,  0xD6, 0xAC, 0xAC, 0xFF
vertex     64,      0,   -306,    990,   -986,  0x67, 0xCD, 0xCD, 0xFF
vertex     64,    512,   -306,    990,   -986,  0x2A, 0x54, 0xAC, 0xFF
vertex    -63,    512,    307,    480,   1464,  0xD6, 0x54, 0x54, 0xFF
vertex     64,    512,    307,    990,   1464,  0x67, 0x33, 0x33, 0xFF
vertex    -63,    512,   -306,    480,   -986,  0x99, 0x33, 0xCD, 0xFF

ssl_seg7_dl_07022C38: # 0x07022C38 - 0x07022CB0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, generic_09000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ssl_seg7_light_07022AA8, 1
gsSPLight ssl_seg7_light_07022AA0, 2
gsSPVertex ssl_seg7_vertex_07022AB8, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0,  0,  2, 15, 0x0
gsSPEndDisplayList

ssl_seg7_dl_07022CB0: # 0x07022CB0 - 0x07022CF8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, generic_0900A800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex ssl_seg7_vertex_07022BB8, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

glabel ssl_seg7_dl_07022CF8 # 0x07022CF8 - 0x07022DA8
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_SURF2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 0, 0, 0, 255
gsSPFogFactor 0x0E49, 0xF2B7 # This isn't gsSPFogPosition since there is no valid min/max pair that corresponds to 0x0E49F2B7
gsSPSetGeometryMode G_FOG
gsDPSetCombineModeLERP G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ssl_seg7_dl_07022C38
gsSPDisplayList ssl_seg7_dl_07022CB0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
