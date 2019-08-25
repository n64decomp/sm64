ssl_seg7_light_0700BD70: # 0x0700BD70 - 0x0700BD78
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

ssl_seg7_light_0700BD78: # 0x0700BD78 - 0x0700BD88
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ssl_seg7_vertex_0700BD88: # 0x0700BD88 - 0x0700BE48
vertex    512,   -255,    512,    480,    990,  0x59, 0x59, 0x00, 0xFF
vertex    512,   -255,   -511,   4566,    990,  0x59, 0x59, 0x00, 0xFF
vertex      0,    256,      0,   2522,  -1900,  0x59, 0x59, 0x00, 0xFF
vertex    512,   -255,   -511,    480,    990,  0x00, 0x59, 0xA7, 0xFF
vertex   -511,   -255,   -511,   4568,    990,  0x00, 0x59, 0xA7, 0xFF
vertex      0,    256,      0,   2524,  -1900,  0x00, 0x59, 0xA7, 0xFF
vertex   -511,   -255,   -511,    478,    990,  0xA7, 0x59, 0x00, 0xFF
vertex   -511,   -255,    512,   4566,    990,  0xA7, 0x59, 0x00, 0xFF
vertex      0,    256,      0,   2522,  -1900,  0xA7, 0x59, 0x00, 0xFF
vertex   -511,   -255,    512,    480,    990,  0x00, 0x59, 0x59, 0xFF
vertex    512,   -255,    512,   4566,    990,  0x00, 0x59, 0x59, 0xFF
vertex      0,    256,      0,   2522,  -1900,  0x00, 0x59, 0x59, 0xFF

ssl_seg7_vertex_0700BE48: # 0x0700BE48 - 0x0700BE88
vertex   -511,   -255,    512,   6100,  -7186,  0x00, 0x81, 0x00, 0xFF
vertex    512,   -255,   -511,  10188,  -3098,  0x00, 0x81, 0x00, 0xFF
vertex    512,   -255,    512,   6100,  -3098,  0x00, 0x81, 0x00, 0xFF
vertex   -511,   -255,   -511,  10188,  -7186,  0x00, 0x81, 0x00, 0xFF

ssl_seg7_dl_0700BE88: # 0x0700BE88 - 0x0700BEE0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, generic_09000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ssl_seg7_light_0700BD78, 1
gsSPLight ssl_seg7_light_0700BD70, 2
gsSPVertex ssl_seg7_vertex_0700BD88, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSPEndDisplayList

ssl_seg7_dl_0700BEE0: # 0x0700BEE0 - 0x0700BF18
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, generic_0900A800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex ssl_seg7_vertex_0700BE48, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel ssl_seg7_dl_0700BF18 # 0x0700BF18 - 0x0700BF90
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ssl_seg7_dl_0700BE88
gsSPDisplayList ssl_seg7_dl_0700BEE0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
