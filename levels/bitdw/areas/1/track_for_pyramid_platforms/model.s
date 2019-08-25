bitdw_seg7_vertex_0700A3F8: # 0x0700A3F8 - 0x0700A4F8
vertex   -562,     57,   -568,    260,  -6504,  0xE6, 0xEE, 0x91, 0xFF
vertex    614,     57,   -620,    -76,   1328,  0xE6, 0xEE, 0x91, 0xFF
vertex   -613,     57,   -620,    -76,  -6846,  0xE6, 0xEE, 0x91, 0xFF
vertex    563,     57,    558,    260,    990,  0xE6, 0xEE, 0x91, 0xFF
vertex   -562,     57,    558,    260,   8482,  0xE6, 0xEE, 0x91, 0xFF
vertex   -613,     57,    609,    -76,   8824,  0xE6, 0xEE, 0x91, 0xFF
vertex    614,     57,    609,    -76,    650,  0xE6, 0xEE, 0x91, 0xFF
vertex    563,     57,   -568,    260,  -8208,  0xE6, 0xEE, 0x91, 0xFF
vertex    614,     57,    609,    -76,    990,  0xE6, 0xEE, 0x91, 0xFF
vertex    614,     57,   -620,    -76,  -8548,  0xE6, 0xEE, 0x91, 0xFF
vertex    563,     57,    558,    260,    650,  0xE6, 0xEE, 0x91, 0xFF
vertex   -613,     57,    609,    -76,    990,  0xE6, 0xEE, 0x91, 0xFF
vertex   -562,     57,    558,    260,   1328,  0xE6, 0xEE, 0x91, 0xFF
vertex   -562,     57,   -568,    260,  10186,  0xE6, 0xEE, 0x91, 0xFF
vertex   -613,     57,   -620,    -76,  10526,  0xE6, 0xEE, 0x91, 0xFF
vertex    563,     57,   -568,    260,    990,  0xE6, 0xEE, 0x91, 0xFF

bitdw_seg7_vertex_0700A4F8: # 0x0700A4F8 - 0x0700A5F8
vertex    563,     57,    558,    404,   1328,  0xB7, 0xC2, 0x52, 0xFF
vertex    512,      0,    513,    -76,    990,  0xB7, 0xC2, 0x52, 0xFF
vertex   -511,      0,    513,    -76,  -5824,  0xB7, 0xC2, 0x52, 0xFF
vertex   -562,     57,    558,    404,  -6164,  0xB7, 0xC2, 0x52, 0xFF
vertex   -562,     57,   -568,    460,    650,  0xB7, 0xC2, 0x52, 0xFF
vertex    512,      0,   -511,    -76,   7802,  0xB7, 0xC2, 0x52, 0xFF
vertex    563,     57,   -568,    460,   8142,  0xB7, 0xC2, 0x52, 0xFF
vertex   -511,      0,   -511,    -76,    990,  0xB7, 0xC2, 0x52, 0xFF
vertex    563,     57,   -568,    432,    982,  0x8E, 0xAC, 0x52, 0xFF
vertex    512,      0,    513,    -76,   9538,  0x8E, 0xAC, 0x52, 0xFF
vertex    563,     57,    558,    432,   9838,  0x8E, 0xAC, 0x52, 0xFF
vertex    512,      0,   -511,    -76,   1362,  0x8E, 0xAC, 0x52, 0xFF
vertex   -511,      0,    513,    -76,    956,  0x8E, 0xAC, 0x52, 0xFF
vertex   -511,      0,   -511,    -76,  -7220,  0x8E, 0xAC, 0x52, 0xFF
vertex   -562,     57,   -568,    432,  -7602,  0x8E, 0xAC, 0x52, 0xFF
vertex   -562,     57,    558,    432,   1254,  0x8E, 0xAC, 0x52, 0xFF

bitdw_seg7_dl_0700A5F8: # 0x0700A5F8 - 0x0700A6A8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09003800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPVertex bitdw_seg7_vertex_0700A3F8, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 13, 14, 0x0,  0, 15,  1, 0x0
gsSPVertex bitdw_seg7_vertex_0700A4F8, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 15, 12, 14, 0x0
gsSPEndDisplayList

glabel bitdw_seg7_dl_0700A6A8 # 0x0700A6A8 - 0x0700A718
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList bitdw_seg7_dl_0700A5F8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
