bbh_seg7_vertex_0700B238: # 0x0700B238 - 0x0700B328
vertex   2161,    819,   1638,      0,   2012,  0xFF, 0x57, 0x00, 0x9A
vertex   2161,   1485,   1638,      0,      0,  0xFF, 0x57, 0x00, 0x9A
vertex   2161,   1485,   1997,    990,      0,  0xFF, 0x57, 0x00, 0x9A
vertex   2161,   1741,    307,      0,   2012,  0xFF, 0x57, 0x00, 0x9A
vertex   2161,   2406,    307,      0,      0,  0xFF, 0x57, 0x00, 0x9A
vertex   2161,   2406,    666,    990,      0,  0xFF, 0x57, 0x00, 0x9A
vertex   2161,   1741,    666,    990,   2012,  0xFF, 0x57, 0x00, 0x9A
vertex   2161,    819,    307,      0,   2012,  0xFF, 0x57, 0x00, 0x9A
vertex   2161,   1485,    307,      0,      0,  0xFF, 0x57, 0x00, 0x9A
vertex   2161,   1485,    666,    990,      0,  0xFF, 0x57, 0x00, 0x9A
vertex   2161,    819,    666,    990,   2012,  0xFF, 0x57, 0x00, 0x9A
vertex   3533,    614,   1137,    990,      0,  0xFF, 0x57, 0x00, 0x9A
vertex   3174,      0,   1137,      0,   2012,  0xFF, 0x57, 0x00, 0x9A
vertex   3533,      0,   1137,    990,   2012,  0xFF, 0x57, 0x00, 0x9A
vertex   3174,    614,   1137,      0,      0,  0xFF, 0x57, 0x00, 0x9A

bbh_seg7_vertex_0700B328: # 0x0700B328 - 0x0700B398
vertex   2161,      0,   1280,      0,   2012,  0xFF, 0x57, 0x00, 0x9A
vertex   2161,    666,   1638,    990,      0,  0xFF, 0x57, 0x00, 0x9A
vertex   2161,      0,   1638,    990,   2012,  0xFF, 0x57, 0x00, 0x9A
vertex   2161,    819,   1638,      0,   2012,  0xFF, 0x57, 0x00, 0x9A
vertex   2161,   1485,   1997,    990,      0,  0xFF, 0x57, 0x00, 0x9A
vertex   2161,    819,   1997,    990,   2012,  0xFF, 0x57, 0x00, 0x9A
vertex   2161,    666,   1280,      0,      0,  0xFF, 0x57, 0x00, 0x9A

bbh_seg7_dl_0700B398: # 0x0700B398 - 0x0700B418
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, spooky_0900B800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex bbh_seg7_vertex_0700B238, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 14, 12, 0x0
gsSPVertex bbh_seg7_vertex_0700B328, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP1Triangle  0,  6,  1, 0x0
gsSPEndDisplayList

glabel bbh_seg7_dl_0700B418 # 0x0700B418 - 0x0700B488
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList bbh_seg7_dl_0700B398
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
