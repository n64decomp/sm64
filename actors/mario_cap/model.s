# Mario Cap (Normal Cap, Metal, Winged, etc)

mario_cap_seg3_light_0301CF08: # 0x0301CF08
.byte 0x39, 0x03, 0x00, 0x00, 0x39, 0x03, 0x00, 0x00

mario_cap_seg3_light_0301CF10: # 0x0301CF10
.byte 0x73, 0x06, 0x00, 0x00, 0x73, 0x06, 0x00, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

mario_cap_seg3_light_0301CF20: # 0x0301CF20
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

mario_cap_seg3_light_0301CF28: # 0x0301CF28
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

mario_cap_seg3_light_0301CF38: # 0x0301CF38
.byte 0x7F, 0x00, 0x00, 0x00, 0x7F, 0x00, 0x00, 0x00

mario_cap_seg3_light_0301CF40: # 0x0301CF40
.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

mario_cap_seg3_texture_0301CF50: # 0x0301CF50
.incbin "actors/mario_cap/mario_cap_metal.rgba16"

mario_cap_seg3_texture_0301DF50: # 0x0301DF50
.incbin "actors/mario_cap/mario_cap_logo.rgba16"

mario_cap_seg3_texture_0301E750: # 0x0301E750
.incbin "actors/mario_cap/mario_cap_wing.rgba16"

mario_cap_seg3_texture_0301F750: # 0x0301F750
.incbin "actors/mario_cap/mario_cap_wing_tip.rgba16"

mario_cap_seg3_texture_03020750: # 0x03020750
.incbin "actors/mario_cap/mario_cap_metal_wing_unused.rgba16"

mario_cap_seg3_texture_03021750: # 0x03021750
.incbin "actors/mario_cap/mario_cap_metal_wing_tip_unused.rgba16"

mario_cap_seg3_vertex_03022750: # 0x03022750
vertex     33,     35,    118,    728,    758,  0x30, 0x26, 0x6E, 0xFF
vertex     96,     22,     45,   1240,    876,  0x48, 0xA4, 0x31, 0xFF
vertex     71,    101,    113,   1028,    148,  0x55, 0x16, 0x5B, 0xFF
vertex      0,    110,    143,    460,     68,  0x00, 0x34, 0x73, 0xFF
vertex    -31,     35,    118,    206,    762,  0xD0, 0x26, 0x6F, 0xFF
vertex    -70,    101,    113,   -106,    158,  0xAB, 0x16, 0x5B, 0xFF
vertex    -95,     22,     46,   -302,    890,  0xA8, 0xB9, 0x38, 0xFF

mario_cap_seg3_vertex_030227C0: # 0x030227C0
vertex    -66,      2,    139,      0,      0,  0xB0, 0xBB, 0x45, 0xFF
vertex      0,      0,    163,      0,      0,  0x00, 0xBA, 0x69, 0xFF
vertex    -31,     35,    118,      0,      0,  0xD0, 0x26, 0x6F, 0xFF
vertex    -32,     17,    109,      0,      0,  0x00, 0x83, 0xF0, 0xFF
vertex     33,     17,    109,      0,      0,  0xFB, 0x84, 0xEA, 0xFF
vertex    -95,     22,     46,      0,      0,  0xA8, 0xB9, 0x38, 0xFF
vertex   -101,     10,     -7,      0,      0,  0xD8, 0x89, 0x11, 0xFF
vertex    -70,    101,    113,      0,      0,  0xAB, 0x16, 0x5B, 0xFF
vertex   -135,     70,     23,      0,      0,  0x84, 0x15, 0x10, 0xFF
vertex   -125,     38,    -45,      0,      0,  0x8D, 0xEC, 0xD1, 0xFF
vertex    -86,      1,    -60,      0,      0,  0xCE, 0x8C, 0xF6, 0xFF
vertex    -41,    144,     64,      0,      0,  0xDC, 0x79, 0x00, 0xFF
vertex    -76,     84,    -60,      0,      0,  0xD5, 0x6E, 0xD3, 0xFF
vertex    136,     70,     22,      0,      0,  0x7B, 0x16, 0x10, 0xFF
vertex     71,    101,    113,      0,      0,  0x55, 0x16, 0x5B, 0xFF
vertex     96,     22,     45,      0,      0,  0x48, 0xA4, 0x31, 0xFF

mario_cap_seg3_vertex_030228C0: # 0x030228C0
vertex     42,    144,     64,      0,      0,  0x2B, 0x76, 0x0D, 0xFF
vertex    136,     70,     22,      0,      0,  0x7B, 0x16, 0x10, 0xFF
vertex     76,     84,    -60,      0,      0,  0x2A, 0x6C, 0xCF, 0xFF
vertex    103,     10,     -6,      0,      0,  0x42, 0x96, 0x12, 0xFF
vertex    126,     38,    -46,      0,      0,  0x73, 0xEC, 0xD0, 0xFF
vertex     71,    101,    113,      0,      0,  0x55, 0x16, 0x5B, 0xFF
vertex     96,     22,     45,      0,      0,  0x48, 0xA4, 0x31, 0xFF
vertex     67,      2,    139,      0,      0,  0x50, 0xBA, 0x44, 0xFF
vertex     33,     17,    109,      0,      0,  0xFB, 0x84, 0xEA, 0xFF
vertex     33,     35,    118,      0,      0,  0x30, 0x26, 0x6E, 0xFF
vertex     86,      1,    -60,      0,      0,  0x20, 0x86, 0xFE, 0xFF
vertex      0,      0,    163,      0,      0,  0x00, 0xBA, 0x69, 0xFF
vertex    -31,     35,    118,      0,      0,  0xD0, 0x26, 0x6F, 0xFF
vertex     53,      0,   -118,      0,      0,  0x2C, 0xB5, 0xA5, 0xFF
vertex     49,     62,   -139,      0,      0,  0x32, 0x49, 0xA6, 0xFF

mario_cap_seg3_vertex_030229B0: # 0x030229B0
vertex    -76,     84,    -60,      0,      0,  0xD5, 0x6E, 0xD3, 0xFF
vertex    -41,    144,     64,      0,      0,  0xDC, 0x79, 0x00, 0xFF
vertex     76,     84,    -60,      0,      0,  0x2A, 0x6C, 0xCF, 0xFF
vertex      0,    110,    143,      0,      0,  0x00, 0x34, 0x73, 0xFF
vertex     42,    144,     64,      0,      0,  0x2B, 0x76, 0x0D, 0xFF
vertex    -70,    101,    113,      0,      0,  0xAB, 0x16, 0x5B, 0xFF
vertex     71,    101,    113,      0,      0,  0x55, 0x16, 0x5B, 0xFF
vertex     49,     62,   -139,      0,      0,  0x32, 0x49, 0xA6, 0xFF
vertex    126,     38,    -46,      0,      0,  0x73, 0xEC, 0xD0, 0xFF
vertex    -52,      0,   -118,      0,      0,  0xD2, 0x9D, 0xC1, 0xFF
vertex    -49,     62,   -138,      0,      0,  0xCE, 0x1A, 0x8F, 0xFF
vertex     53,      0,   -118,      0,      0,  0x2C, 0xB5, 0xA5, 0xFF
vertex   -125,     38,    -45,      0,      0,  0x8D, 0xEC, 0xD1, 0xFF
vertex     86,      1,    -60,      0,      0,  0x20, 0x86, 0xFE, 0xFF
vertex    -86,      1,    -60,      0,      0,  0xCE, 0x8C, 0xF6, 0xFF

mario_cap_seg3_vertex_03022AA0: # 0x03022AA0
vertex     86,      1,    -60,      0,      0,  0x20, 0x86, 0xFE, 0xFF
vertex    -86,      1,    -60,      0,      0,  0xCE, 0x8C, 0xF6, 0xFF
vertex    -52,      0,   -118,      0,      0,  0xD2, 0x9D, 0xC1, 0xFF
vertex     33,     17,    109,      0,      0,  0xFB, 0x84, 0xEA, 0xFF
vertex    -32,     17,    109,      0,      0,  0x00, 0x83, 0xF0, 0xFF
vertex   -101,     10,     -7,      0,      0,  0xD8, 0x89, 0x11, 0xFF
vertex     96,     22,     45,      0,      0,  0x48, 0xA4, 0x31, 0xFF
vertex    103,     10,     -6,      0,      0,  0x42, 0x96, 0x12, 0xFF
vertex     53,      0,   -118,      0,      0,  0x2C, 0xB5, 0xA5, 0xFF

glabel mario_cap_seg3_dl_03022B30 # 0x03022B30 - 0x03022B68
gsSPVertex mario_cap_seg3_vertex_03022750, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  0, 0x0
gsSP2Triangles  3,  5,  4, 0x0,  2,  3,  0, 0x0
gsSP1Triangle  5,  6,  4, 0x0
gsSPEndDisplayList

glabel mario_cap_seg3_dl_03022B68 # 0x03022B68 - 0x03022CC8
gsSPVertex mario_cap_seg3_vertex_030227C0, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  1, 0x0
gsSP2Triangles  3,  1,  0, 0x0,  3,  5,  6, 0x0
gsSP2Triangles  3,  0,  5, 0x0,  5,  7,  8, 0x0
gsSP2Triangles  5,  8,  6, 0x0,  0,  2,  5, 0x0
gsSP2Triangles  6,  9, 10, 0x0,  8,  9,  6, 0x0
gsSP2Triangles 11,  8,  7, 0x0,  8, 12,  9, 0x0
gsSP2Triangles 12,  8, 11, 0x0, 13, 14, 15, 0x0
gsSPVertex mario_cap_seg3_vertex_030228C0, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  1, 0x0
gsSP2Triangles  4,  2,  1, 0x0,  5,  1,  0, 0x0
gsSP2Triangles  1,  6,  3, 0x0,  6,  7,  8, 0x0
gsSP2Triangles  9,  7,  6, 0x0, 10,  4,  3, 0x0
gsSP2Triangles  9, 11,  7, 0x0,  7, 11,  8, 0x0
gsSP2Triangles 12, 11,  9, 0x0, 13, 14,  4, 0x0
gsSPVertex mario_cap_seg3_vertex_030229B0, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  4, 0x0
gsSP2Triangles  5,  3,  1, 0x0,  1,  4,  2, 0x0
gsSP2Triangles  4,  3,  6, 0x0,  0,  2,  7, 0x0
gsSP2Triangles  8,  7,  2, 0x0,  9, 10, 11, 0x0
gsSP2Triangles 12, 10,  9, 0x0,  7, 10,  0, 0x0
gsSP2Triangles 10,  7, 11, 0x0,  0, 10, 12, 0x0
gsSP2Triangles 11,  8, 13, 0x0, 14, 12,  9, 0x0
gsSPEndDisplayList

glabel mario_cap_seg3_dl_03022CC8 # 0x03022CC8 - 0x03022D10
gsSPVertex mario_cap_seg3_vertex_03022AA0, 9, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  3,  5, 0x0,  7,  6,  5, 0x0
gsSP2Triangles  0,  7,  5, 0x0,  0,  5,  1, 0x0
gsSP1Triangle  2,  8,  0, 0x0
gsSPEndDisplayList

glabel mario_cap_seg3_dl_03022D10 # 0x03022D10 - 0x03022D38
gsSPDisplayList mario_cap_seg3_dl_03022B68
gsSPLight mario_cap_seg3_light_0301CF10, 1
gsSPLight mario_cap_seg3_light_0301CF08, 2
gsSPDisplayList mario_cap_seg3_dl_03022CC8
gsSPEndDisplayList

mario_cap_seg3_vertex_03022D38: # 0x03022D38
vertex    199,    247,    -55,    990,      0,  0x59, 0xED, 0x58, 0xFF
vertex    131,    274,     20,      0,      0,  0x59, 0xED, 0x58, 0xFF
vertex     69,     71,     38,      0,   2012,  0x59, 0xED, 0x58, 0xFF
vertex    199,    247,    -55,    990,      0,  0x58, 0xEE, 0x58, 0xFF
vertex     69,     71,     38,      0,   2012,  0x58, 0xEE, 0x58, 0xFF
vertex    138,     44,    -37,    990,   2012,  0x58, 0xEE, 0x58, 0xFF
vertex   -137,     44,    -37,    990,   2012,  0xA8, 0xEE, 0x58, 0xFF
vertex    -68,     71,     38,      0,   2012,  0xA8, 0xEE, 0x58, 0xFF
vertex   -198,    247,    -55,    990,      0,  0xA8, 0xEE, 0x58, 0xFF
vertex    -68,     71,     38,      0,   2012,  0xA7, 0xED, 0x58, 0xFF
vertex   -130,    274,     20,      0,      0,  0xA7, 0xED, 0x58, 0xFF
vertex   -198,    247,    -55,    990,      0,  0xA7, 0xED, 0x58, 0xFF

mario_cap_seg3_vertex_03022DF8: # 0x03022DF8
vertex    268,    219,   -132,    990,      0,  0x59, 0xED, 0x57, 0xFF
vertex    199,    247,    -55,      0,      0,  0x59, 0xED, 0x57, 0xFF
vertex    138,     44,    -37,      0,   2012,  0x59, 0xED, 0x57, 0xFF
vertex    207,     16,   -114,    990,   2012,  0x59, 0xED, 0x57, 0xFF
vertex   -206,     16,   -114,    990,   2012,  0xA7, 0xED, 0x57, 0xFF
vertex   -137,     44,    -37,      0,   2012,  0xA7, 0xED, 0x57, 0xFF
vertex   -267,    219,   -132,    990,      0,  0xA7, 0xED, 0x57, 0xFF
vertex   -198,    247,    -55,      0,      0,  0xA7, 0xED, 0x57, 0xFF

glabel mario_cap_seg3_dl_03022E78 # 0x03022E78 - 0x03022EA8
gsSPVertex mario_cap_seg3_vertex_03022D38, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSPEndDisplayList

glabel mario_cap_seg3_dl_03022EA8 # 0x03022EA8 - 0x03022ED8
gsSPVertex mario_cap_seg3_vertex_03022DF8, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  5,  7,  6, 0x0
gsSPEndDisplayList

glabel mario_cap_seg3_dl_03022ED8 # 0x03022ED8 - 0x03022F20
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPEndDisplayList

glabel mario_cap_seg3_dl_03022F20 # 0x03022F20 - 0x03022F48
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList

glabel mario_cap_seg3_dl_03022F48 # 0x03022F48 - 0x03022FF8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_cap_seg3_texture_0301DF50
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_cap_seg3_light_0301CF40, 1
gsSPLight mario_cap_seg3_light_0301CF38, 2
gsSPDisplayList mario_cap_seg3_dl_03022B30
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_cap_seg3_dl_03022D10
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetAlphaCompare G_AC_NONE
gsDPSetEnvColor 255, 255, 255, 255
gsSPEndDisplayList

glabel mario_cap_seg3_dl_03022FF8 # 0x03022FF8 - 0x030230B0
gsDPPipeSync
gsSPSetGeometryMode G_TEXTURE_GEN
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_cap_seg3_texture_0301CF50
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsDPPipeSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPTexture 3968, 1984, 0, 0, 1
gsSPLight mario_cap_seg3_light_0301CF28, 1
gsSPLight mario_cap_seg3_light_0301CF20, 2
gsSPDisplayList mario_cap_seg3_dl_03022B30
gsSPDisplayList mario_cap_seg3_dl_03022B68
gsSPDisplayList mario_cap_seg3_dl_03022CC8
gsDPPipeSync
gsSPClearGeometryMode G_TEXTURE_GEN
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPTexture 3968, 1984, 0, 0, 0
gsDPSetAlphaCompare G_AC_NONE
gsDPSetEnvColor 255, 255, 255, 255
gsSPEndDisplayList

glabel mario_cap_seg3_dl_030230B0 # 0x030230B0 - 0x03023108
gsSPDisplayList mario_cap_seg3_dl_03022ED8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_cap_seg3_texture_0301E750
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList mario_cap_seg3_dl_03022E78
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_cap_seg3_texture_0301F750
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList mario_cap_seg3_dl_03022EA8
gsSPDisplayList mario_cap_seg3_dl_03022F20
gsSPEndDisplayList

glabel mario_cap_seg3_dl_03023108 # 0x03023108 - 0x03023160
gsSPDisplayList mario_cap_seg3_dl_03022ED8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_cap_seg3_texture_03020750
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList mario_cap_seg3_dl_03022E78
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_cap_seg3_texture_03021750
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList mario_cap_seg3_dl_03022EA8
gsSPDisplayList mario_cap_seg3_dl_03022F20
gsSPEndDisplayList

glabel mario_cap_seg3_dl_03023160 # 0x03023160 - 0x03023298
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_SHADE, G_CCMUX_TEXEL0_ALPHA, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_cap_seg3_texture_0301DF50
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight mario_cap_seg3_light_0301CF40, 1
gsSPLight mario_cap_seg3_light_0301CF38, 2
gsSPDisplayList mario_cap_seg3_dl_03022B30
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPDisplayList mario_cap_seg3_dl_03022D10
gsDPPipeSync
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_ENVIRONMENT, G_ACMUX_0
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_cap_seg3_texture_0301E750
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList mario_cap_seg3_dl_03022E78
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_cap_seg3_texture_0301F750
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList mario_cap_seg3_dl_03022EA8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetAlphaCompare G_AC_NONE
gsDPSetEnvColor 255, 255, 255, 255
gsSPEndDisplayList

glabel mario_cap_seg3_dl_03023298 # 0x03023298 - 0x030233D0
gsDPPipeSync
gsSPSetGeometryMode G_TEXTURE_GEN
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_cap_seg3_texture_0301CF50
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsDPPipeSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPTexture 3968, 1984, 0, 0, 1
gsSPLight mario_cap_seg3_light_0301CF28, 1
gsSPLight mario_cap_seg3_light_0301CF20, 2
gsSPDisplayList mario_cap_seg3_dl_03022B30
gsSPDisplayList mario_cap_seg3_dl_03022B68
gsSPDisplayList mario_cap_seg3_dl_03022CC8
gsSPTexture 3968, 1984, 0, 0, 0
gsDPPipeSync
gsSPClearGeometryMode G_TEXTURE_GEN | G_LIGHTING | G_CULL_BACK
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_ENVIRONMENT, G_ACMUX_0
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_cap_seg3_texture_03020750
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList mario_cap_seg3_dl_03022E78
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mario_cap_seg3_texture_03021750
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList mario_cap_seg3_dl_03022EA8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetAlphaCompare G_AC_NONE
gsDPSetEnvColor 255, 255, 255, 255
gsSPEndDisplayList
