ttm_seg7_light_0701D888: # 0x0701D888 - 0x0701D890
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

ttm_seg7_light_0701D890: # 0x0701D890 - 0x0701D8A0
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ttm_seg7_vertex_0701D8A0: # 0x0701D8A0 - 0x0701D9A0
vertex  -5967,  -1533,  -5572,      0,    448,  0x0D, 0x00, 0x7E, 0xFF
vertex  -5943,  -1533,  -5572,      0,    522,  0xE5, 0x00, 0x7C, 0xFF
vertex  -5943,  -1021,  -5572,   2012,    522,  0xF3, 0x00, 0x7E, 0xFF
vertex  -5907,  -1021,  -5560,   2012,    632,  0xD0, 0x00, 0x75, 0xFF
vertex  -5907,  -1533,  -5560,      0,    632,  0xD0, 0x00, 0x75, 0xFF
vertex  -5967,  -1021,  -5572,   2012,    448,  0x1B, 0x00, 0x7C, 0xFF
vertex  -6003,  -1533,  -5560,      0,    336,  0x2D, 0x00, 0x76, 0xFF
vertex  -6121,  -1533,  -5501,      0,      0,  0x44, 0x00, 0x6A, 0xFF
vertex  -6003,  -1021,  -5560,   2012,    336,  0x33, 0x00, 0x74, 0xFF
vertex  -6121,  -1021,  -5501,   2012,      0,  0x4F, 0x00, 0x62, 0xFF
vertex  -7548,  -1533,  -4074,   2012,  -3088,  0x5D, 0x00, 0x56, 0xFF
vertex  -7548,  -2045,  -4074,      0,  -3088,  0x5B, 0x00, 0x58, 0xFF
vertex  -6679,  -1124,  -4943,   2012,    990,  0x59, 0x00, 0x59, 0xFF
vertex  -6389,  -1533,  -5233,      0,      0,  0x59, 0x00, 0x59, 0xFF
vertex  -6121,  -1021,  -5501,   2012,    990,  0x4F, 0x00, 0x62, 0xFF
vertex  -6389,  -1021,  -5233,   2012,      0,  0x59, 0x00, 0x59, 0xFF

ttm_seg7_vertex_0701D9A0: # 0x0701D9A0 - 0x0701DA80
vertex  -6389,  -1533,  -5233,      0,      0,  0x59, 0x00, 0x59, 0xFF
vertex  -6121,  -1533,  -5501,      0,    990,  0x44, 0x00, 0x6A, 0xFF
vertex  -6121,  -1021,  -5501,   2012,    990,  0x4F, 0x00, 0x62, 0xFF
vertex  -7961,  -2076,  -3611,      0,  -1056,  0x5E, 0x00, 0x54, 0xFF
vertex  -7548,  -2045,  -4074,      0,    990,  0x5B, 0x00, 0x58, 0xFF
vertex  -7548,  -1533,  -4074,   2012,    990,  0x5D, 0x00, 0x56, 0xFF
vertex  -7961,  -1564,  -3611,   2012,  -1056,  0x5E, 0x00, 0x54, 0xFF
vertex  -5792,  -1533,  -5502,      0,    990,  0xC7, 0x00, 0x71, 0xFF
vertex  -5792,  -1021,  -5502,   2012,    990,  0xC7, 0x00, 0x71, 0xFF
vertex  -5907,  -1021,  -5560,   2012,    632,  0xD0, 0x00, 0x75, 0xFF
vertex  -5907,  -1533,  -5560,      0,    632,  0xD0, 0x00, 0x75, 0xFF
vertex  -6679,  -1124,  -4943,   2012,      0,  0x59, 0x00, 0x59, 0xFF
vertex  -6679,  -1636,  -4943,      0,      0,  0x59, 0x00, 0x59, 0xFF
vertex  -6389,  -1533,  -5233,      0,    990,  0x59, 0x00, 0x59, 0xFF

ttm_seg7_vertex_0701DA80: # 0x0701DA80 - 0x0701DAE0
vertex  -6679,  -1636,  -4943,      0,    990,  0x59, 0x00, 0x59, 0xFF
vertex  -6679,  -1124,  -4943,   2012,    990,  0x59, 0x00, 0x59, 0xFF
vertex  -7548,  -2045,  -4074,      0,  -3088,  0x5B, 0x00, 0x58, 0xFF
vertex  -6389,  -1021,  -5233,   2012,    990,  0x59, 0x00, 0x59, 0xFF
vertex  -6679,  -1124,  -4943,   2012,      0,  0x59, 0x00, 0x59, 0xFF
vertex  -6389,  -1533,  -5233,      0,    990,  0x59, 0x00, 0x59, 0xFF

ttm_seg7_dl_0701DAE0: # 0x0701DAE0 - 0x0701DBB8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, mountain_09000800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPLight ttm_seg7_light_0701D890, 1
gsSPLight ttm_seg7_light_0701D888, 2
gsSPVertex ttm_seg7_vertex_0701D8A0, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP2Triangles  1,  4,  3, 0x0,  0,  2,  5, 0x0
gsSP2Triangles  6,  0,  5, 0x0,  7,  6,  8, 0x0
gsSP2Triangles  6,  5,  8, 0x0,  7,  8,  9, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 13, 14, 15, 0x0
gsSPVertex ttm_seg7_vertex_0701D9A0, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSPVertex ttm_seg7_vertex_0701DA80, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPEndDisplayList

glabel ttm_seg7_dl_0701DBB8 # 0x0701DBB8 - 0x0701DC60
gsDPPipeSync
gsDPSetCycleType G_CYC_2CYCLE
gsDPSetRenderMode G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_SURF2
gsDPSetDepthSource G_ZS_PIXEL
gsDPSetFogColor 0, 0, 0, 255
gsSPFogPosition 980, 1000
gsSPSetGeometryMode G_FOG
gsDPSetCombineModeLERP G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE, G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_COMBINED, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_COMBINED
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList ttm_seg7_dl_0701DAE0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2
gsSPClearGeometryMode G_FOG
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList
