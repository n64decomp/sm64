# Poundable Pole

.balign 8
poundable_pole_seg6_light_06001038: # 0x06001038
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

poundable_pole_seg6_light_06001040: # 0x06001040
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

poundable_pole_seg6_texture_06001050: # 0x06001050
.incbin "actors/poundable_pole/poundable_pole_top.rgba16"

poundable_pole_seg6_texture_06001850: # 0x06001850
.incbin "actors/poundable_pole/poundable_pole_side.rgba16"

poundable_pole_seg6_vertex_06002050: # 0x06002050
vertex    -38,    410,    -94,     78,     78,  0xDF, 0x5C, 0xB0, 0xFF
vertex    -94,    410,    -38,    -86,    478,  0xA1, 0x49, 0xD9, 0xFF
vertex     95,    410,     39,   1046,    478,  0x39, 0x6E, 0x18, 0xFF
vertex     95,    410,    -38,    880,     78,  0x5F, 0x49, 0xD9, 0xFF
vertex     39,    410,    -94,    478,    -88,  0x2D, 0x2A, 0x92, 0xFF
vertex    -94,    410,     39,     78,    880,  0xA1, 0x49, 0x27, 0xFF
vertex    -38,    410,     95,    480,   1044,  0xD9, 0x49, 0x5F, 0xFF
vertex     39,    410,     95,    880,    880,  0x2D, 0x2A, 0x6E, 0xFF

poundable_pole_seg6_vertex_060020D0: # 0x060020D0
vertex    -71,    -19,     72,      0,    990,  0xA7, 0xFF, 0x59, 0xFF
vertex    -38,    410,     95,    990,  -1012,  0xD9, 0x49, 0x5F, 0xFF
vertex    -94,    410,     39,      0,  -1012,  0xA1, 0x49, 0x27, 0xFF
vertex    -71,    -19,    -71,    -26,    990,  0xA7, 0x00, 0xA7, 0xFF
vertex   -101,    -19,      0,    990,    990,  0x82, 0xFF, 0x00, 0xFF
vertex    -94,    410,    -38,    990,  -1054,  0xA1, 0x49, 0xD9, 0xFF
vertex    -38,    410,    -94,    -26,  -1054,  0xDF, 0x5C, 0xB0, 0xFF
vertex      0,    -19,   -101,    -26,    990,  0x00, 0xFF, 0x82, 0xFF
vertex    -71,    -19,    -71,    990,    990,  0xA7, 0x00, 0xA7, 0xFF
vertex    -38,    410,    -94,    990,  -1054,  0xDF, 0x5C, 0xB0, 0xFF
vertex     39,    410,    -94,    -26,  -1054,  0x2D, 0x2A, 0x92, 0xFF
vertex    -94,    410,     39,    990,  -1054,  0xA1, 0x49, 0x27, 0xFF
vertex   -101,    -19,      0,      0,    990,  0x82, 0xFF, 0x00, 0xFF
vertex    -71,    -19,     72,    990,    990,  0xA7, 0xFF, 0x59, 0xFF
vertex    -94,    410,    -38,      0,  -1054,  0xA1, 0x49, 0xD9, 0xFF

poundable_pole_seg6_vertex_060021C0: # 0x060021C0
vertex    102,    -19,      0,    -26,    990,  0x7E, 0xFF, 0x00, 0xFF
vertex     95,    410,    -38,    990,  -1054,  0x5F, 0x49, 0xD9, 0xFF
vertex     95,    410,     39,    -26,  -1054,  0x39, 0x6E, 0x18, 0xFF
vertex    -71,    -19,     72,      0,    990,  0xA7, 0xFF, 0x59, 0xFF
vertex      0,    -19,    102,    990,    990,  0x00, 0xFF, 0x7E, 0xFF
vertex    -38,    410,     95,    990,  -1012,  0xD9, 0x49, 0x5F, 0xFF
vertex      0,    -19,    102,    -26,    990,  0x00, 0xFF, 0x7E, 0xFF
vertex     39,    410,     95,    990,  -1054,  0x2D, 0x2A, 0x6E, 0xFF
vertex    -38,    410,     95,    -26,  -1054,  0xD9, 0x49, 0x5F, 0xFF
vertex     72,    -19,     72,    990,    990,  0x59, 0xFF, 0x59, 0xFF
vertex     95,    410,     39,    990,  -1054,  0x39, 0x6E, 0x18, 0xFF
vertex     72,    -19,     72,      0,    990,  0x59, 0xFF, 0x59, 0xFF
vertex    102,    -19,      0,    990,    990,  0x7E, 0xFF, 0x00, 0xFF
vertex     39,    410,     95,      0,  -1054,  0x2D, 0x2A, 0x6E, 0xFF
vertex     72,    -19,    -71,    990,    990,  0x59, 0xFF, 0xA7, 0xFF

poundable_pole_seg6_vertex_060022B0: # 0x060022B0
vertex     39,    410,    -94,    990,  -1054,  0x2D, 0x2A, 0x92, 0xFF
vertex     95,    410,    -38,    -26,  -1054,  0x5F, 0x49, 0xD9, 0xFF
vertex     72,    -19,    -71,    -26,    990,  0x59, 0xFF, 0xA7, 0xFF
vertex      0,    -19,   -101,    990,    990,  0x00, 0xFF, 0x82, 0xFF

glabel poundable_pole_seg6_dl_060022F0 # 0x060022F0 - 0x06002358
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, poundable_pole_seg6_texture_06001050
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight poundable_pole_seg6_light_06001040, 1
gsSPLight poundable_pole_seg6_light_06001038, 2
gsSPVertex poundable_pole_seg6_vertex_06002050, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  4, 0x0
gsSP2Triangles  0,  2,  3, 0x0,  2,  1,  5, 0x0
gsSP2Triangles  2,  5,  6, 0x0,  2,  6,  7, 0x0
gsSPEndDisplayList

glabel poundable_pole_seg6_dl_06002358 # 0x06002358 - 0x06002410
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, poundable_pole_seg6_texture_06001850
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex poundable_pole_seg6_vertex_060020D0, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 12, 11, 14, 0x0
gsSPVertex poundable_pole_seg6_vertex_060021C0, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  9,  7, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 11, 10, 13, 0x0
gsSP1Triangle  1,  0, 14, 0x0
gsSPVertex poundable_pole_seg6_vertex_060022B0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  2, 0x0
gsSPEndDisplayList

glabel poundable_pole_seg6_dl_06002410 # 0x06002410 - 0x06002490
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList poundable_pole_seg6_dl_060022F0
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList poundable_pole_seg6_dl_06002358
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
