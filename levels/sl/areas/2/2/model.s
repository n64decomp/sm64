sl_seg7_light_0700BB68: # 0x0700BB68 - 0x0700BB70
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

sl_seg7_light_0700BB70: # 0x0700BB70 - 0x0700BB80
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

sl_seg7_vertex_0700BB80: # 0x0700BB80 - 0x0700BC80
vertex   -204,    317,   1229,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    205,    317,    819,   2012,  -1054,  0x00, 0x7F, 0x00, 0xFF
vertex   -204,    317,    819,   2012,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    205,    317,   1229,      0,  -1054,  0x00, 0x7F, 0x00, 0xFF
vertex    205,    317,    819,   2012,  -1054,  0x00, 0x00, 0x81, 0xFF
vertex    205,    307,    819,   2012,  -1054,  0x00, 0x00, 0x81, 0xFF
vertex   -204,    307,    819,   2012,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -204,    317,    819,   2012,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -204,    307,    819,   2012,    990,  0x00, 0x81, 0x00, 0xFF
vertex    205,    307,    819,   2012,  -1054,  0x00, 0x81, 0x00, 0xFF
vertex    205,    307,   1229,      0,  -1054,  0x00, 0x81, 0x00, 0xFF
vertex   -204,    307,   1229,      0,    990,  0x00, 0x81, 0x00, 0xFF
vertex   -204,    317,   1229,      0,    990,  0x00, 0x00, 0x7F, 0xFF
vertex   -204,    307,   1229,      0,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    205,    307,   1229,      0,  -1054,  0x00, 0x00, 0x7F, 0xFF
vertex    205,    317,   1229,      0,  -1054,  0x00, 0x00, 0x7F, 0xFF

sl_seg7_dl_0700BC80: # 0x0700BC80 - 0x0700BCF8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, snow_09008000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight sl_seg7_light_0700BB70, 1
gsSPLight sl_seg7_light_0700BB68, 2
gsSPVertex sl_seg7_vertex_0700BB80, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 10, 11, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 14, 15, 0x0
gsSPEndDisplayList

glabel sl_seg7_dl_0700BCF8 # 0x0700BCF8 - 0x0700BD68
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList sl_seg7_dl_0700BC80
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
