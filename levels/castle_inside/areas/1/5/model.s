dl_castle_lobby_wing_cap_light_vertex_group:
vertex  -1075,   1741,   -380,   -360,    -62,  0xFF, 0xFF, 0xFF, 0x80
vertex  -1125,    -50,    461,    478,    990,  0xFF, 0xFF, 0xFF, 0x80
vertex  -1279,    -50,    594,    612,    990,  0xFF, 0xFF, 0xFF, 0x80
vertex  -1075,   1741,   -130,   -110,    -62,  0xFF, 0xFF, 0xFF, 0x80
vertex   -921,    -50,    973,    990,    990,  0xFF, 0xFF, 0xFF, 0x80
vertex   -968,   1741,   -130,   -110,    -62,  0xFF, 0xFF, 0xFF, 0x80
vertex   -767,    -50,    819,    836,    990,  0xFF, 0xFF, 0xFF, 0x80
vertex   -896,   1741,   -201,   -180,    -62,  0xFF, 0xFF, 0xFF, 0x80
vertex  -1125,    -50,    973,    990,    990,  0xFF, 0xFF, 0xFF, 0x80
vertex   -767,    -50,    614,    632,    990,  0xFF, 0xFF, 0xFF, 0x80
vertex   -896,   1741,   -309,   -288,    -62,  0xFF, 0xFF, 0xFF, 0x80
vertex   -921,    -50,    461,    478,    990,  0xFF, 0xFF, 0xFF, 0x80
vertex   -968,   1741,   -380,   -360,    -62,  0xFF, 0xFF, 0xFF, 0x80
vertex  -1147,   1741,   -201,   -180,    -62,  0xFF, 0xFF, 0xFF, 0x80
vertex  -1147,   1741,   -309,   -288,    -62,  0xFF, 0xFF, 0xFF, 0x80
vertex  -1279,    -50,    819,    836,    990,  0xFF, 0xFF, 0xFF, 0x80

dl_castle_lobby_wing_cap_light_model:
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, texture_castle_light
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex dl_castle_lobby_wing_cap_light_vertex_group, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  5,  4,  6, 0x0,  5,  6,  7, 0x0
gsSP2Triangles  3,  8,  4, 0x0,  7,  6,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 10,  9, 11, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 12, 11,  1, 0x0
gsSP2Triangles 12,  1,  0, 0x0, 13,  8,  3, 0x0
gsSP2Triangles  0,  2, 14, 0x0, 14,  2, 15, 0x0
gsSP2Triangles 14, 15, 13, 0x0, 13, 15,  8, 0x0
gsSPEndDisplayList

glabel dl_castle_lobby_wing_cap_light
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList dl_castle_lobby_wing_cap_light_model
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
