hmc_seg7_light_07023C70: # 0x07023C70 - 0x07023C78
.byte 0x79, 0x79, 0x79, 0x00, 0x79, 0x79, 0x79, 0x00

hmc_seg7_light_07023C78: # 0x07023C78 - 0x07023C88
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

hmc_seg7_vertex_07023C88: # 0x07023C88 - 0x07023D48
vertex    -91,      0,    -45,    -22,   4380,  0x8A, 0x17, 0xD8, 0xFF
vertex    -73,    -53,     46,    158,   3308,  0x9F, 0xC9, 0x3C, 0xFF
vertex    -32,     24,     51,   -194,   2768,  0xAD, 0x5E, 0x11, 0xFF
vertex      0,      0,   -101,    426,   5632,  0xF6, 0x1D, 0x85, 0xFF
vertex     74,     54,    -45,   1058,   4388,  0x3E, 0x52, 0xB7, 0xFF
vertex    -32,     24,     51,   1634,   2768,  0xAD, 0x5E, 0x11, 0xFF
vertex     28,     87,     46,   1246,   3284,  0x05, 0x70, 0x3A, 0xFF
vertex     92,      0,     46,    874,   3300,  0x72, 0xF9, 0x36, 0xFF
vertex    -41,    -67,    -45,    272,   4428,  0xDC, 0x95, 0xC7, 0xFF
vertex     37,    -80,     29,    546,   3484,  0x21, 0x8F, 0x2C, 0xFF
vertex     66,    -59,    -28,    660,   4196,  0x53, 0xB3, 0xC9, 0xFF
vertex      0,      0,    102,    426,   2044,  0xF3, 0x03, 0x7E, 0xFF

hmc_seg7_dl_07023D48: # 0x07023D48 - 0x07023E10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, hmc_seg7_texture_07004800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPLight hmc_seg7_light_07023C78, 1
gsSPLight hmc_seg7_light_07023C70, 2
gsSPVertex hmc_seg7_vertex_07023C88, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  0, 0x0
gsSP2Triangles  2,  4,  3, 0x0,  5,  6,  4, 0x0
gsSP2Triangles  4,  6,  7, 0x0,  3,  8,  0, 0x0
gsSP2Triangles  8,  9,  1, 0x0, 10,  7,  9, 0x0
gsSP2Triangles  1,  0,  8, 0x0,  3, 10,  8, 0x0
gsSP2Triangles  3,  4, 10, 0x0,  9,  8, 10, 0x0
gsSP2Triangles 11,  9,  7, 0x0, 11,  7,  6, 0x0
gsSP2Triangles 11,  1,  9, 0x0, 11,  2,  1, 0x0
gsSP2Triangles 11,  6,  2, 0x0,  7, 10,  4, 0x0
gsSPEndDisplayList

glabel hmc_seg7_dl_07023E10 # 0x07023E10 - 0x07023EB8
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_SURF2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 0, 0, 0, 255
gsSPFogPosition 960, 1000
gsSPSetGeometryMode G_FOG
gsDPSetCombineModeLERP G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList hmc_seg7_dl_07023D48
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
