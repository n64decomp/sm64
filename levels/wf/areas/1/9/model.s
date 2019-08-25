wf_seg7_light_07007298: # 0x07007298 - 0x070072A0
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

wf_seg7_light_070072A0: # 0x070072A0 - 0x070072B0
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

wf_seg7_vertex_070072B0: # 0x070072B0 - 0x070073A0
vertex   -255,     65,    256,  -1308,    338,  0x00, 0xE7, 0x7C, 0xFF
vertex    205,    -62,    230,    990,    990,  0x00, 0xE7, 0x7C, 0xFF
vertex    256,     65,    256,   1246,    338,  0x00, 0xE7, 0x7C, 0xFF
vertex    256,     65,    256,   -158,    302,  0x75, 0xD1, 0x00, 0xFF
vertex    205,    -62,   -229,   2268,    990,  0x75, 0xD1, 0x00, 0xFF
vertex    256,     65,   -255,   2396,    302,  0x75, 0xD1, 0x00, 0xFF
vertex    205,    -62,    230,      0,    990,  0x75, 0xD1, 0x00, 0xFF
vertex    256,     65,   -255,  -1308,    338,  0x00, 0xE7, 0x84, 0xFF
vertex    205,    -62,   -229,  -1052,    990,  0x00, 0xE7, 0x84, 0xFF
vertex   -204,    -62,   -229,    990,    990,  0x00, 0xE7, 0x84, 0xFF
vertex   -255,     65,   -255,   1246,    338,  0x00, 0xE7, 0x84, 0xFF
vertex   -255,     65,   -255,  -1562,      0,  0x8B, 0xD1, 0x00, 0xFF
vertex   -204,    -62,    230,    862,    656,  0x8B, 0xD1, 0x00, 0xFF
vertex   -255,     65,    256,    990,      0,  0x8B, 0xD1, 0x00, 0xFF
vertex   -204,    -62,   -229,  -1436,    656,  0x8B, 0xD1, 0x00, 0xFF

wf_seg7_vertex_070073A0: # 0x070073A0 - 0x07007410
vertex    205,    -62,    230,  -1052,    990,  0x00, 0x81, 0x00, 0xFF
vertex   -204,    -62,    230,    990,    990,  0x00, 0x81, 0x00, 0xFF
vertex   -204,    -62,   -229,    990,  -1310,  0x00, 0x81, 0x00, 0xFF
vertex   -255,     65,    256,  -1308,    338,  0x00, 0xE7, 0x7C, 0xFF
vertex   -204,    -62,    230,  -1052,    990,  0x00, 0xE7, 0x7C, 0xFF
vertex    205,    -62,    230,    990,    990,  0x00, 0xE7, 0x7C, 0xFF
vertex    205,    -62,   -229,  -1052,  -1310,  0x00, 0x81, 0x00, 0xFF

wf_seg7_vertex_07007410: # 0x07007410 - 0x07007450
vertex    256,     65,   -255,    990,  -1566,  0x00, 0x7F, 0x00, 0xFF
vertex   -255,     65,    256,  -1564,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    256,     65,    256,    990,    990,  0x00, 0x7F, 0x00, 0xFF
vertex   -255,     65,   -255,  -1564,  -1566,  0x00, 0x7F, 0x00, 0xFF

wf_seg7_dl_07007450: # 0x07007450 - 0x070074E0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight wf_seg7_light_070072A0, 1
gsSPLight wf_seg7_light_07007298, 2
gsSPVertex wf_seg7_vertex_070072B0, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 14, 12, 0x0
gsSPVertex wf_seg7_vertex_070073A0, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP1Triangle  0,  2,  6, 0x0
gsSPEndDisplayList

wf_seg7_dl_070074E0: # 0x070074E0 - 0x07007518
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09001000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex wf_seg7_vertex_07007410, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel wf_seg7_dl_07007518 # 0x07007518 - 0x07007590
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList wf_seg7_dl_07007450
gsSPDisplayList wf_seg7_dl_070074E0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
