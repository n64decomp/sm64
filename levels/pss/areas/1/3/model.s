pss_seg7_vertex_0700B070: # 0x0700B070 - 0x0700B160
vertex  -5906,  -4217,   3701,      0,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -5845,  -4217,   3701,    478,    480,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -5845,  -4252,   3701,    478,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -5906,  -3951,    895,      0,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -5845,  -3951,    895,    478,    480,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -5845,  -3986,    895,    478,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6869,  -3986,    895,    478,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6869,  -3951,    895,    478,    480,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6808,  -3951,    895,      0,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -5906,  -4084,   2301,      0,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -5845,  -4084,   2301,    478,    480,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -5845,  -4119,   2301,    478,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6869,  -4119,   2301,    478,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6869,  -4084,   2301,    478,    480,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6808,  -4084,   2301,      0,    478,  0xFF, 0xFF, 0xFF, 0xFF

pss_seg7_vertex_0700B160: # 0x0700B160 - 0x0700B250
vertex    558,  -1918,  -5339,      0,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex    527,  -1918,  -5286,    478,    480,  0xFF, 0xFF, 0xFF, 0xFF
vertex    527,  -1953,  -5286,    478,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6869,  -4252,   3701,    478,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6869,  -4217,   3701,    478,    480,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6808,  -4217,   3701,      0,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3603,   4880,  -6143,    478,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3603,   4915,  -6143,    478,    480,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -3603,   4915,  -6082,      0,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2922,   6376,  -6143,    478,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2922,   6411,  -6143,    478,    480,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2922,   6411,  -6082,      0,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2922,   6411,  -5180,      0,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2922,   6411,  -5119,    478,    480,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2922,   6376,  -5119,    478,    990,  0xFF, 0xFF, 0xFF, 0xFF

pss_seg7_vertex_0700B250: # 0x0700B250 - 0x0700B340
vertex  -5095,   3457,   2438,    478,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -5095,   3492,   2438,    478,    480,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -5072,   3492,   2382,      0,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -4557,  -3325,  -3304,      0,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -4588,  -3325,  -3251,    478,    480,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -4588,  -3360,  -3251,    478,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -5753,   4665,  -5488,    478,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -5753,   4700,  -5488,    478,    480,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -5715,   4700,  -5440,      0,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6710,   4297,  -3107,    478,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6710,   4332,  -3107,    478,    480,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6649,   4332,  -3106,      0,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6710,   3887,      5,    478,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6710,   3922,      5,    478,    480,  0xFF, 0xFF, 0xFF, 0xFF
vertex  -6649,   3922,      0,      0,    478,  0xFF, 0xFF, 0xFF, 0xFF

pss_seg7_dl_0700B340: # 0x0700B340 - 0x0700B3F0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mountain_09007800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex pss_seg7_vertex_0700B070, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPVertex pss_seg7_vertex_0700B160, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPVertex pss_seg7_vertex_0700B250, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPEndDisplayList

glabel pss_seg7_dl_0700B3F0 # 0x0700B3F0 - 0x0700B4A8
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_SURF2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 0, 0, 0, 255
gsSPFogPosition 980, 1000
gsSPSetGeometryMode G_FOG
gsDPSetCombineModeLERP G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList pss_seg7_dl_0700B340
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
