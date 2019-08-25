jrb_seg7_light_07007B70: # 0x07007B70 - 0x07007B78
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

jrb_seg7_light_07007B78: # 0x07007B78 - 0x07007B88
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

jrb_seg7_vertex_07007B88: # 0x07007B88 - 0x07007C88
vertex   -255,    -63,    640,   -882,    990,  0x81, 0x00, 0x00, 0xFF
vertex   -255,     64,    640,   -882,    848,  0x81, 0x00, 0x00, 0xFF
vertex   -255,     64,   -639,   3374,    848,  0x81, 0x00, 0x00, 0xFF
vertex    256,    -63,    640,    138,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    256,     64,    640,    138,    848,  0x00, 0x00, 0x7F, 0xFF
vertex   -255,     64,    640,    990,    848,  0x00, 0x00, 0x7F, 0xFF
vertex   -255,    -63,    640,    990,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    256,    -63,   -639,   3374,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    256,     64,    640,   -882,    848,  0x7F, 0x00, 0x00, 0xFF
vertex    256,    -63,    640,   -882,    990,  0x7F, 0x00, 0x00, 0xFF
vertex    256,     64,   -639,   3374,    848,  0x7F, 0x00, 0x00, 0xFF
vertex   -255,    -63,   -639,    990,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -255,     64,   -639,    990,    848,  0x00, 0x00, 0x81, 0xFF
vertex    256,     64,   -639,    138,    848,  0x00, 0x00, 0x81, 0xFF
vertex    256,    -63,   -639,    138,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -255,    -63,   -639,   3374,    990,  0x81, 0x00, 0x00, 0xFF

jrb_seg7_vertex_07007C88: # 0x07007C88 - 0x07007D08
vertex    256,    -63,    640,  -2328,    990,  0x00, 0x81, 0x00, 0xFF
vertex   -255,    -63,    640,  -2328,  -1566,  0x00, 0x81, 0x00, 0xFF
vertex   -255,    -63,   -639,   4056,  -1566,  0x00, 0x81, 0x00, 0xFF
vertex    256,    -63,   -639,   4056,    990,  0x00, 0x81, 0x00, 0xFF
vertex    256,     64,   -639,   4056,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   -255,     64,    640,  -2328,  -1566,  0x00, 0x7F, 0x00, 0xFF
vertex    256,     64,    640,  -2328,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   -255,     64,   -639,   4056,  -1566,  0x00, 0x7F, 0x00, 0xFF

jrb_seg7_dl_07007D08: # 0x07007D08 - 0x07007D80
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_0900A000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight jrb_seg7_light_07007B78, 1
gsSPLight jrb_seg7_light_07007B70, 2
gsSPVertex jrb_seg7_vertex_07007B88, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 13, 14, 0x0,  0,  2, 15, 0x0
gsSPEndDisplayList

jrb_seg7_dl_07007D80: # 0x07007D80 - 0x07007DC8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_0900A800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPVertex jrb_seg7_vertex_07007C88, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

glabel jrb_seg7_dl_07007DC8 # 0x07007DC8 - 0x07007EA0
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_SURF2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 5, 80, 75, 255
gsSPFogPosition 900, 1000
gsSPSetGeometryMode G_FOG
gsDPSetCombineModeLERP G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList jrb_seg7_dl_07007D08
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList jrb_seg7_dl_07007D80
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
