# Swoop

# Unreferenced light
.byte 0x0A, 0x00, 0x25, 0x00, 0x0A, 0x00, 0x25, 0x00

.byte 0x2A, 0x00, 0x95, 0x00, 0x2A, 0x00, 0x95, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

# Unreferenced light
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

swoop_seg6_texture_06004270: # 0x06004270
.incbin "actors/swoop/swoop_body.rgba16"

swoop_seg6_texture_06004A70: # 0x06004A70
.incbin "actors/swoop/swoop_eye.rgba16"

swoop_seg6_texture_06005270: # 0x06005270
.incbin "actors/swoop/swoop_nose.rgba16"

swoop_seg6_texture_06005A70: # 0x06005A70
.incbin "actors/swoop/swoop_wing.rgba16"

swoop_seg6_light_06006270: # 0x06006270
.byte 0x79, 0x79, 0x79, 0x00, 0x79, 0x79, 0x79, 0x00

swoop_seg6_light_06006278: # 0x06006278
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

swoop_seg6_vertex_06006288: # 0x06006288
vertex     80,     38,    -44,     40,     86,  0x3F, 0x30, 0x9E, 0xFF
vertex     65,     77,    -24,   1108,    796,  0x44, 0x59, 0xC6, 0xFF
vertex    112,     54,      0,    768,   -454,  0x69, 0x46, 0x00, 0xFF
vertex    -14,     57,     28,    622,    254,  0x96, 0x31, 0x30, 0xFF
vertex    -11,    -13,      0,    536,    234,  0x8D, 0xCC, 0x00, 0xFF
vertex     17,    -18,     89,    804,     76,  0xCC, 0xED, 0x72, 0xFF
vertex     29,     71,     45,    668,     -2,  0x05, 0x44, 0x6A, 0xFF
vertex    -14,     57,    -27,    450,    246,  0x96, 0x31, 0xD0, 0xFF
vertex     17,    -18,    -88,    254,     54,  0xE5, 0xDF, 0x89, 0xFF
vertex     29,     71,    -44,    386,    -14,  0x05, 0x44, 0x95, 0xFF
vertex     82,      4,    -52,   -728,   -328,  0x3F, 0xFE, 0x93, 0xFF
vertex     17,    -18,    -88,  -1332,    810,  0xE5, 0xDF, 0x89, 0xFF
vertex     29,     71,    -44,    878,   1484,  0x05, 0x44, 0x95, 0xFF
vertex    114,      5,    -24,   -496,  -1006,  0x71, 0xE7, 0xCE, 0xFF

swoop_seg6_vertex_06006368: # 0x06006368
vertex     82,      4,     53,    758,   1078,  0x40, 0xF1, 0x6C, 0xFF
vertex     83,    -37,     25,    628,   1076,  0x54, 0xAB, 0x27, 0xFF
vertex    114,      5,     25,    626,    928,  0x6F, 0xF4, 0x3C, 0xFF
vertex     29,     71,     45,    386,   1344,  0x05, 0x44, 0x6A, 0xFF
vertex     80,     38,     45,    184,    100,  0x40, 0x31, 0x62, 0xFF
vertex     65,     77,     25,   1194,    792,  0x44, 0x59, 0x3A, 0xFF
vertex    112,     54,      0,   1590,   -282,  0x69, 0x46, 0x00, 0xFF
vertex     17,    -18,     89,  -2258,    574,  0xCC, 0xED, 0x72, 0xFF
vertex     82,      4,     53,   -608,   -318,  0x40, 0xF1, 0x6C, 0xFF
vertex    112,     54,      0,    514,    940,  0x69, 0x46, 0x00, 0xFF
vertex     80,     38,     45,    722,   1090,  0x40, 0x31, 0x62, 0xFF
vertex     34,    -55,     44,    722,   1312,  0x06, 0x8A, 0x2C, 0xFF
vertex     17,    -18,     89,    928,   1394,  0xCC, 0xED, 0x72, 0xFF
vertex     83,    -37,    -24,    402,   1080,  0x48, 0xA4, 0xD1, 0xFF
vertex     82,      4,    -52,    272,   1086,  0x3F, 0xFE, 0x93, 0xFF
vertex    114,      5,    -24,    400,    932,  0x71, 0xE7, 0xCE, 0xFF

swoop_seg6_vertex_06006468: # 0x06006468
vertex     34,    -55,     44,    722,   1312,  0x06, 0x8A, 0x2C, 0xFF
vertex     34,    -55,    -43,    314,   1318,  0xE6, 0x8A, 0xDC, 0xFF
vertex     83,    -37,    -24,    402,   1080,  0x48, 0xA4, 0xD1, 0xFF
vertex     83,    -37,     25,    628,   1076,  0x54, 0xAB, 0x27, 0xFF
vertex    114,      5,    -24,    400,    932,  0x71, 0xE7, 0xCE, 0xFF
vertex    114,      5,     25,    626,    928,  0x6F, 0xF4, 0x3C, 0xFF
vertex    112,     54,      0,    514,    940,  0x69, 0x46, 0x00, 0xFF
vertex    -11,    -13,      0,    522,   1540,  0x8D, 0xCC, 0x00, 0xFF
vertex     17,    -18,     89,    928,   1394,  0xCC, 0xED, 0x72, 0xFF
vertex     17,    -18,    -88,    112,   1406,  0xE5, 0xDF, 0x89, 0xFF
vertex     82,      4,    -52,    272,   1086,  0x3F, 0xFE, 0x93, 0xFF

swoop_seg6_vertex_06006518: # 0x06006518
vertex    112,     54,      0,    702,      6,  0x69, 0x46, 0x00, 0xFF
vertex     65,     77,    -24,    382,    266,  0x44, 0x59, 0xC6, 0xFF
vertex     65,     77,     25,    878,    288,  0x44, 0x59, 0x3A, 0xFF
vertex     40,    113,      0,    478,    480,  0xF9, 0x7E, 0x00, 0xFF
vertex     65,     77,     25,    726,    230,  0x44, 0x59, 0x3A, 0xFF
vertex     65,     77,    -24,    232,    230,  0x44, 0x59, 0xC6, 0xFF
vertex     29,     71,     45,    932,    586,  0x05, 0x44, 0x6A, 0xFF
vertex     29,     71,    -44,     26,    586,  0x05, 0x44, 0x95, 0xFF
vertex    -14,     57,     28,    756,   1022,  0x96, 0x31, 0x30, 0xFF
vertex    -14,     57,    -27,    202,   1022,  0x96, 0x31, 0xD0, 0xFF

glabel swoop_seg6_dl_060065B8 # 0x060065B8 - 0x060066F8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, swoop_seg6_texture_06004A70
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight swoop_seg6_light_06006278, 1
gsSPLight swoop_seg6_light_06006270, 2
gsSPVertex swoop_seg6_vertex_06006288, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  5,  6,  3, 0x0,  3,  7,  4, 0x0
gsSP2Triangles  8,  4,  7, 0x0,  7,  9,  8, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 10, 12,  0, 0x0
gsSP2Triangles  0,  2, 13, 0x0,  0, 13, 10, 0x0
gsSP1Triangle  1,  0, 12, 0x0
gsSPVertex swoop_seg6_vertex_06006368, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  5,  4,  6, 0x0,  3,  7,  8, 0x0
gsSP2Triangles  3,  8,  4, 0x0,  2,  9, 10, 0x0
gsSP2Triangles  2, 10,  0, 0x0, 11,  1,  0, 0x0
gsSP2Triangles 11,  0, 12, 0x0, 13, 14, 15, 0x0
gsSPVertex swoop_seg6_vertex_06006468, 11, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  3, 0x0,  4,  3,  2, 0x0
gsSP2Triangles  4,  6,  5, 0x0,  7,  1,  0, 0x0
gsSP2Triangles  0,  8,  7, 0x0,  9,  1,  7, 0x0
gsSP2Triangles  2,  1,  9, 0x0,  2,  9, 10, 0x0
gsSPEndDisplayList

glabel swoop_seg6_dl_060066F8 # 0x060066F8 - 0x06006758
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, swoop_seg6_texture_06005270
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex swoop_seg6_vertex_06006518, 10, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  4,  3,  6, 0x0,  7,  3,  5, 0x0
gsSP2Triangles  6,  3,  8, 0x0,  3,  9,  8, 0x0
gsSP1Triangle  7,  9,  3, 0x0
gsSPEndDisplayList

glabel swoop_seg6_dl_06006758 # 0x06006758 - 0x06006808
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
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList swoop_seg6_dl_060065B8
gsSPDisplayList swoop_seg6_dl_060066F8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

swoop_seg6_vertex_06006808: # 0x06006808
vertex     15,     15,      0,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -14,     15,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -14,    -14,      0,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex     15,    -14,      0,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF

glabel swoop_seg6_dl_06006848 # 0x06006848 - 0x06006880
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, swoop_seg6_texture_06004270
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex swoop_seg6_vertex_06006808, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel swoop_seg6_dl_06006880 # 0x06006880 - 0x06006938
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_TEX_EDGE2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 0, 0, 0, 255
gsSPFogPosition 960, 1000
gsSPSetGeometryMode G_FOG
gsDPSetCombineModeLERP G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList swoop_seg6_dl_06006848
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_TEX_EDGE, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

swoop_seg6_light_06006938: # 0x06006938
.byte 0x79, 0x79, 0x79, 0x00, 0x79, 0x79, 0x79, 0x00

swoop_seg6_light_06006940: # 0x06006940
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

swoop_seg6_vertex_06006950: # 0x06006950
vertex    187,     48,    -55,    426,    722,  0xC6, 0x6B, 0xDF, 0xFF
vertex    194,     32,   -119,    334,    706,  0xDF, 0x7A, 0x05, 0xFF
vertex     80,     -3,    -32,    458,    990,  0xDF, 0x7A, 0x05, 0xFF
vertex    116,     34,   -130,    318,    900,  0xFD, 0x77, 0x2B, 0xFF
vertex     80,     -3,     33,    552,    990,  0xDF, 0x7A, 0xFB, 0xFF
vertex    194,     32,    120,    676,    706,  0xDF, 0x7A, 0xFB, 0xFF
vertex    187,     48,     56,    584,    722,  0xC6, 0x6B, 0x21, 0xFF
vertex    116,     34,    131,    692,    900,  0xFD, 0x77, 0xD5, 0xFF

swoop_seg6_vertex_060069D0: # 0x060069D0
vertex     13,     79,    -15,      0,      0,  0xEC, 0x7D, 0x00, 0xFF
vertex    -17,     74,     -8,      0,      0,  0xEC, 0x7D, 0x00, 0xFF
vertex    -17,     74,      9,      0,      0,  0xEC, 0x7D, 0x00, 0xFF
vertex     13,     79,     16,      0,      0,  0xEC, 0x7D, 0x00, 0xFF

glabel swoop_seg6_dl_06006A10 # 0x06006A10 - 0x06006A68
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, swoop_seg6_texture_06005270
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight swoop_seg6_light_06006940, 1
gsSPLight swoop_seg6_light_06006938, 2
gsSPVertex swoop_seg6_vertex_06006950, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

glabel swoop_seg6_dl_06006A68 # 0x06006A68 - 0x06006A88
gsSPVertex swoop_seg6_vertex_060069D0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel swoop_seg6_dl_06006A88 # 0x06006A88 - 0x06006B58
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_SURF2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 0, 0, 0, 255
gsSPFogPosition 960, 1000
gsSPSetGeometryMode G_FOG
gsDPSetCombineModeLERP G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsSPClearGeometryMode G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList swoop_seg6_dl_06006A10
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsSPDisplayList swoop_seg6_dl_06006A68
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK
gsSPEndDisplayList

swoop_seg6_vertex_06006B58: # 0x06006B58
vertex      0,      1,    133,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      1,   -133,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    265,      1,   -133,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    265,      1,    133,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF

glabel swoop_seg6_dl_06006B98 # 0x06006B98 - 0x06006BD0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, swoop_seg6_texture_06005A70
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex swoop_seg6_vertex_06006B58, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel swoop_seg6_dl_06006BD0 # 0x06006BD0 - 0x06006C88
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_TEX_EDGE2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 0, 0, 0, 255
gsSPFogPosition 960, 1000
gsSPSetGeometryMode G_FOG
gsDPSetCombineModeLERP G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList swoop_seg6_dl_06006B98
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_TEX_EDGE, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList

swoop_seg6_vertex_06006C88: # 0x06006C88
vertex    265,      1,   -132,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    265,      1,    134,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      1,    134,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      1,   -132,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

glabel swoop_seg6_dl_06006CC8 # 0x06006CC8 - 0x06006D00
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, swoop_seg6_texture_06005A70
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex swoop_seg6_vertex_06006C88, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel swoop_seg6_dl_06006D00 # 0x06006D00 - 0x06006DB8
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_TEX_EDGE2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 0, 0, 0, 255
gsSPFogPosition 960, 1000
gsSPSetGeometryMode G_FOG
gsDPSetCombineModeLERP G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList swoop_seg6_dl_06006CC8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_TEX_EDGE, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList

swoop_seg6_animvalue_06006DB8: # 0x06006DB8
.hword 0x0000, 0x0030, 0x0005, 0x3FFF, 0x1FFF, 0x151E, 0x00EA, 0xF609
.hword 0xFC4F, 0x0A3F, 0x188E, 0x1FEC, 0x1FFF, 0x1611, 0x03A1, 0xF9B4
.hword 0xFF6D, 0x0C26, 0x1935, 0x1FEE, 0x5FA3, 0x3FFF, 0xE05C, 0xA05D
.hword 0xC001, 0xE05C, 0xF698, 0xF7A7, 0xF99D, 0xFAAC, 0xFA10, 0xF8B5
.hword 0xF751, 0xF69A, 0xF698, 0xF7A7, 0xF99D, 0xFAAC, 0xFA10, 0xF8B5
.hword 0xF751, 0xF69A, 0x4F2C, 0x4D96, 0x4AA5, 0x490F, 0x49F9, 0x4C01
.hword 0x4E16, 0x4F29

swoop_seg6_animindex_06006E1C: # 0x06006E1C
.hword 0x0001, 0x0000, 0x0001, 0x0001, 0x0001, 0x0002, 0x0001, 0x0000
.hword 0x0001, 0x0003, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0008, 0x002A, 0x0001, 0x0000, 0x0001, 0x0000, 0x0008, 0x0022
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0008, 0x001A, 0x0001, 0x0017
.hword 0x0001, 0x0018, 0x0001, 0x0019, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0008, 0x0004, 0x0001, 0x0014, 0x0001, 0x0015, 0x0001, 0x0016
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0008, 0x000C

swoop_seg6_anim_06006E88: # 0x06006E88
.hword 0
.hword 0
.hword 0
.hword 0
.hword 0x08
.hword 0x08
.word swoop_seg6_animvalue_06006DB8
.word swoop_seg6_animindex_06006E1C
.word 0

swoop_seg6_animvalue_06006EA0: # 0x06006EA0
.hword 0x0000, 0x0030, 0x0005, 0x3FFF, 0x13F6, 0x13CD, 0x1356, 0x1298
.hword 0x119C, 0x1068, 0x0F04, 0x0D77, 0x0BC9, 0x0A01, 0x0826, 0x0640
.hword 0x0457, 0x0271, 0x0096, 0xFECF, 0xFD21, 0xFB94, 0xFA30, 0xF8FC
.hword 0xF800, 0xF742, 0xF6CB, 0xF6A2, 0xF6C5, 0xF72A, 0xF7CC, 0xF8A5
.hword 0xF9AF, 0xFAE4, 0xFC3E, 0xFDB8, 0xFF4D, 0x00F4, 0x02AB, 0x046A
.hword 0x062D, 0x07EC, 0x09A3, 0x0B4B, 0x0CDF, 0x0E5A, 0x0FB4, 0x10E9
.hword 0x11F3, 0x12CC, 0x136E, 0x13D3, 0x13F6, 0x13F6, 0x7FFB, 0x7FFB
.hword 0x7FFB, 0x7FFB, 0x7FFB, 0x7FFB, 0x7FFB, 0x7FFC, 0x7FFC, 0x7FFC
.hword 0x7FFC, 0x7FFD, 0x7FFD, 0x7FFD, 0x7FFD, 0x7FFE, 0x7FFE, 0x7FFE
.hword 0x7FFE, 0x7FFE, 0x7FFE, 0x7FFE, 0x7FFE, 0x8001, 0x7FFE, 0x7FFE
.hword 0x7FFE, 0x7FFE, 0x7FFE, 0x7FFE, 0x7FFE, 0x7FFE, 0x7FFD, 0x7FFD
.hword 0x7FFD, 0x7FFD, 0x7FFD, 0x7FFC, 0x7FFC, 0x7FFC, 0x7FFC, 0x7FFC
.hword 0x7FFB, 0x7FFB, 0x7FFB, 0x7FFB, 0x7FFB, 0x7FFB, 0x7FFB, 0x7FFB
.hword 0x7FFD, 0x7FFD, 0x7FFD, 0x7FFD, 0x7FFD, 0x7FFD, 0x7FFD, 0x7FFD
.hword 0x7FFD, 0x7FFC, 0x7FFC, 0x7FFC, 0x7FFC, 0x7FFC, 0x7FFC, 0x7FFC
.hword 0x7FFC, 0x7FFC, 0x7FFC, 0x7FFC, 0x7FFC, 0x7FFC, 0x7FFC, 0x7FFC
.hword 0x7FFC, 0x7FFC, 0x7FFC, 0x7FFC, 0x7FFC, 0x7FFC, 0x7FFC, 0x7FFC
.hword 0x7FFC, 0x7FFC, 0x7FFC, 0x7FFC, 0x7FFC, 0x7FFC, 0x7FFC, 0x7FFD
.hword 0x7FFD, 0x7FFD, 0x7FFD, 0x7FFD, 0x7FFD, 0x7FFD, 0x7FFD, 0x7FFD
.hword 0x7FFD, 0x7FFD, 0x9328, 0x92FE, 0x9287, 0x91CA, 0x90CD, 0x8F99
.hword 0x8E35, 0x8CA8, 0x8AFA, 0x8932, 0x8757, 0x8572, 0x8388, 0x81A2
.hword 0x7FC5, 0x7DFD, 0x7C4E, 0x7AC2, 0x795D, 0x7829, 0x772D, 0x766F
.hword 0x75F8, 0x75CF, 0x75F2, 0x7657, 0x76F9, 0x77D2, 0x78DC, 0x7A11
.hword 0x7B6C, 0x7CE6, 0x7E7A, 0x8025, 0x81DC, 0x839C, 0x855E, 0x871D
.hword 0x88D4, 0x8A7D, 0x8C11, 0x8D8B, 0x8EE6, 0x901B, 0x9124, 0x91FD
.hword 0x929F, 0x9305, 0x9328, 0x9328, 0x5FA3, 0x3FFF, 0xE05C, 0xA05D
.hword 0xC001, 0xE05C, 0xFF27, 0xFF27, 0x3F48, 0x0000

swoop_seg6_animindex_0600704C: # 0x0600704C
.hword 0x0001, 0x0000, 0x0001, 0x0001, 0x0001, 0x0002, 0x0001, 0x0000
.hword 0x0001, 0x0003, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x00D4, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x00D3
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x00D2, 0x0001, 0x00CF
.hword 0x0001, 0x00D0, 0x0001, 0x00D1, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0032, 0x0004, 0x0001, 0x00CC, 0x0001, 0x00CD, 0x0001, 0x00CE
.hword 0x0032, 0x0036, 0x0032, 0x0068, 0x0032, 0x009A

swoop_seg6_anim_060070B8: # 0x060070B8
.hword 0
.hword 0
.hword 0
.hword 0
.hword 0x32
.hword 0x08
.word swoop_seg6_animvalue_06006EA0
.word swoop_seg6_animindex_0600704C
.word 0

glabel swoop_seg6_anims_060070D0 # 0x060070D0
.word swoop_seg6_anim_06006E88
.word swoop_seg6_anim_060070B8
