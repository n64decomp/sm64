# Koopa Flag

.balign 8
koopa_flag_seg6_light_06000000: # 0x06000000
.byte 0x00, 0x1B, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00

koopa_flag_seg6_light_06000008: # 0x06000008
.byte 0x00, 0x6E, 0x00, 0x00, 0x00, 0x6E, 0x00, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

koopa_flag_seg6_light_06000018: # 0x06000018
.byte 0x3F, 0x39, 0x15, 0x00, 0x3F, 0x39, 0x15, 0x00

koopa_flag_seg6_light_06000020: # 0x06000020
.byte 0xFF, 0xE6, 0x57, 0x00, 0xFF, 0xE6, 0x57, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

koopa_flag_seg6_light_06000030: # 0x06000030
.byte 0x2B, 0x15, 0x01, 0x00, 0x2B, 0x15, 0x01, 0x00

koopa_flag_seg6_light_06000038: # 0x06000038
.byte 0xAC, 0x54, 0x05, 0x00, 0xAC, 0x54, 0x05, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

koopa_flag_seg6_texture_06000048: # 0x06000048
.incbin "actors/koopa_flag/koopa_flag_banner.rgba16"

koopa_flag_seg6_light_06000848: # 0x06000848
.byte 0x37, 0x27, 0x07, 0x00, 0x37, 0x27, 0x07, 0x00

koopa_flag_seg6_light_06000850: # 0x06000850
.byte 0xDF, 0x9F, 0x1F, 0x00, 0xDF, 0x9F, 0x1F, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

koopa_flag_seg6_light_06000860: # 0x06000860
.byte 0x14, 0x0A, 0x00, 0x00, 0x14, 0x0A, 0x00, 0x00

koopa_flag_seg6_light_06000868: # 0x06000868
.byte 0x50, 0x28, 0x00, 0x00, 0x50, 0x28, 0x00, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

koopa_flag_seg6_vertex_06000878: # 0x06000878
vertex   2800,    -18,     57,      0,      0,  0x5F, 0xE7, 0x4F, 0xFF
vertex   2800,    -59,      0,      0,      0,  0x2D, 0x8A, 0x00, 0xFF
vertex   2800,    -18,    -56,      0,      0,  0x4D, 0xE1, 0xA1, 0xFF
vertex   2800,     49,    -34,      0,      0,  0x4D, 0x51, 0xC5, 0xFF
vertex   2800,     49,     35,      0,      0,  0x2D, 0x60, 0x45, 0xFF

koopa_flag_seg6_vertex_060008C8: # 0x060008C8
vertex   2800,    -18,     57,      0,      0,  0x5F, 0xE7, 0x4F, 0xFF
vertex   2800,     49,     35,      0,      0,  0x2D, 0x60, 0x45, 0xFF
vertex      0,     19,     57,      0,      0,  0x00, 0x27, 0x78, 0xFF
vertex      0,    -48,     35,      0,      0,  0x00, 0x9A, 0x4A, 0xFF
vertex      0,     60,      0,      0,      0,  0x00, 0x7E, 0x00, 0xFF
vertex   2800,    -59,      0,      0,      0,  0x2D, 0x8A, 0x00, 0xFF
vertex      0,    -48,    -34,      0,      0,  0x00, 0x9A, 0xB6, 0xFF
vertex   2800,    -18,    -56,      0,      0,  0x4D, 0xE1, 0xA1, 0xFF
vertex      0,     19,    -56,      0,      0,  0x00, 0x27, 0x88, 0xFF
vertex   2800,     49,    -34,      0,      0,  0x4D, 0x51, 0xC5, 0xFF

glabel koopa_flag_seg6_dl_06000968 # 0x06000968 - 0x06000A08
gsSPLight koopa_flag_seg6_light_06000850, 1
gsSPLight koopa_flag_seg6_light_06000848, 2
gsSPVertex koopa_flag_seg6_vertex_06000878, 5, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  0, 0x0
gsSP1Triangle  3,  0,  2, 0x0
gsSPLight koopa_flag_seg6_light_06000868, 1
gsSPLight koopa_flag_seg6_light_06000860, 2
gsSPVertex koopa_flag_seg6_vertex_060008C8, 10, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  0, 0x0
gsSP2Triangles  4,  2,  1, 0x0,  5,  0,  3, 0x0
gsSP2Triangles  3,  6,  5, 0x0,  7,  5,  6, 0x0
gsSP2Triangles  6,  8,  7, 0x0,  9,  7,  8, 0x0
gsSP2Triangles  8,  4,  9, 0x0,  1,  9,  4, 0x0
gsSPEndDisplayList

glabel koopa_flag_seg6_dl_06000A08 # 0x06000A08 - 0x06000A38
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPDisplayList koopa_flag_seg6_dl_06000968
gsSPEndDisplayList

koopa_flag_seg6_vertex_06000A38: # 0x06000A38
vertex      0,      0,      0,   -226,    510,  0xFF, 0xFF, 0xFF, 0xFF
vertex    460,      0,    540,    224,   1318,  0xFF, 0xFF, 0xFF, 0xFF
vertex    460,      0,   -539,    224,   -302,  0xFF, 0xFF, 0xFF, 0xFF

koopa_flag_seg6_vertex_06000A68: # 0x06000A68
vertex      0,      0,    720,      0,      0,  0xFD, 0xA8, 0x02, 0xFF
vertex    460,      0,    540,      0,      0,  0xFD, 0xA8, 0x02, 0xFF
vertex      0,      0,      0,      0,      0,  0xFD, 0xA8, 0x02, 0xFF
vertex    460,      0,   -539,      0,      0,  0xFD, 0xA8, 0x02, 0xFF
vertex      0,      0,   -719,      0,      0,  0xFD, 0xA8, 0x02, 0xFF

glabel koopa_flag_seg6_dl_06000AB8 # 0x06000AB8 - 0x06000AE8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, koopa_flag_seg6_texture_06000048
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex koopa_flag_seg6_vertex_06000A38, 3, 0
gsSP1Triangle  0,  1,  2, 0x0
gsSPEndDisplayList

glabel koopa_flag_seg6_dl_06000AE8 # 0x06000AE8 - 0x06000B08
gsSPVertex koopa_flag_seg6_vertex_06000A68, 5, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  2, 0x0
gsSPEndDisplayList

glabel koopa_flag_seg6_dl_06000B08 # 0x06000B08 - 0x06000B80
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList koopa_flag_seg6_dl_06000AB8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPDisplayList koopa_flag_seg6_dl_06000AE8
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList

koopa_flag_seg6_vertex_06000B80: # 0x06000B80
vertex      0,      0,    540,    224,   1318,  0xFF, 0xFF, 0xFF, 0xFF
vertex    460,      0,    360,    676,   1048,  0xFF, 0xFF, 0xFF, 0xFF
vertex    460,      0,   -359,    676,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,   -539,    224,   -302,  0xFF, 0xFF, 0xFF, 0xFF

glabel koopa_flag_seg6_dl_06000BC0 # 0x06000BC0 - 0x06000BF8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, koopa_flag_seg6_texture_06000048
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex koopa_flag_seg6_vertex_06000B80, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel koopa_flag_seg6_dl_06000BF8 # 0x06000BF8 - 0x06000C68
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList koopa_flag_seg6_dl_06000BC0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList

koopa_flag_seg6_vertex_06000C68: # 0x06000C68
vertex    344,      0,    224,   1014,    846,  0xFF, 0xFF, 0xFF, 0xFF
vertex    344,      0,   -223,   1014,    172,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,    360,    676,   1048,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,   -359,    676,      0,  0xFF, 0xFF, 0xFF, 0xFF

glabel koopa_flag_seg6_dl_06000CA8 # 0x06000CA8 - 0x06000CE0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, koopa_flag_seg6_texture_06000048
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex koopa_flag_seg6_vertex_06000C68, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSPEndDisplayList

glabel koopa_flag_seg6_dl_06000CE0 # 0x06000CE0 - 0x06000D50
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList koopa_flag_seg6_dl_06000CA8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList

koopa_flag_seg6_vertex_06000D50: # 0x06000D50
vertex      0,      0,    224,      0,      0,  0xFD, 0xA8, 0x02, 0xFF
vertex    288,      0,    112,      0,      0,  0xFD, 0xA8, 0x02, 0xFF
vertex    288,      0,   -111,      0,      0,  0xFD, 0xA8, 0x02, 0xFF
vertex      0,      0,   -223,      0,      0,  0xFD, 0xA8, 0x02, 0xFF

glabel koopa_flag_seg6_dl_06000D90 # 0x06000D90 - 0x06000DB0
gsSPVertex koopa_flag_seg6_vertex_06000D50, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel koopa_flag_seg6_dl_06000DB0 # 0x06000DB0 - 0x06000DF0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPDisplayList koopa_flag_seg6_dl_06000D90
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList

koopa_flag_seg6_vertex_06000DF0: # 0x06000DF0
vertex      0,      0,    112,      0,      0,  0xFD, 0xA8, 0x02, 0xFF
vertex    288,      0,      0,      0,      0,  0xFD, 0xA8, 0x02, 0xFF
vertex      0,      0,   -111,      0,      0,  0xFD, 0xA8, 0x02, 0xFF

glabel koopa_flag_seg6_dl_06000E20 # 0x06000E20 - 0x06000E38
gsSPVertex koopa_flag_seg6_vertex_06000DF0, 3, 0
gsSP1Triangle  0,  1,  2, 0x0
gsSPEndDisplayList

glabel koopa_flag_seg6_dl_06000E38 # 0x06000E38 - 0x06000E78
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPDisplayList koopa_flag_seg6_dl_06000E20
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList

koopa_flag_seg6_animvalue_06000E78: # 0x06000E78
.hword 0x0000, 0x12E3, 0x0F43, 0x099F, 0x02D1, 0xFBB3, 0xF51B, 0xEFE3
.hword 0xECC0, 0xEA97, 0xE905, 0xE817, 0xE7DA, 0xE85A, 0xE9A5, 0xEBC7
.hword 0xEF2B, 0xF51F, 0xFCD4, 0x053B, 0x0D49, 0x13EE, 0x181E, 0x1A24
.hword 0x1B1B, 0x1B28, 0x1A71, 0x191C, 0x174F, 0x152F, 0x0DFD, 0x0B37
.hword 0x064A, 0x006D, 0xFADA, 0xF6C7, 0xF4D9, 0xF371, 0xF25D, 0xF1A3
.hword 0xF148, 0xF152, 0xF1C6, 0xF2AA, 0xF404, 0xF622, 0xFA11, 0xFF44
.hword 0x04FD, 0x0A7D, 0x0F08, 0x11DD, 0x132A, 0x13B1, 0x1393, 0x12F3
.hword 0x11F2, 0x10B2, 0x0F55, 0xF43F, 0xF376, 0xF2F2, 0xF2B7, 0xF2C3
.hword 0xF319, 0xF3B9, 0xF4A5, 0xF64B, 0xF8E8, 0xFC2A, 0xFFC5, 0x0367
.hword 0x06C3, 0x098B, 0x0B73, 0x0C85, 0x0CE4, 0x0CA5, 0x0BDD, 0x0AA2
.hword 0x08F8, 0x06A5, 0x03D3, 0x00B6, 0xFD87, 0xFA7A, 0xF7C5, 0xF59F
.hword 0xF5BC, 0xF61A, 0xF722, 0xF8BA, 0xFAC7, 0xFD30, 0xFFD8, 0x02A6
.hword 0x0580, 0x0829, 0x0A3A, 0x0BBC, 0x0CB9, 0x0D3F, 0x0D4C, 0x0C44
.hword 0x0A3B, 0x0785, 0x0478, 0x0169, 0xFEAD, 0xFC97, 0xFB3E, 0xFA01
.hword 0xF8DB, 0xF7D5, 0xF6F8, 0xF64F, 0xF5E2, 0x04EA, 0x04B3, 0x0421
.hword 0x034C, 0x0250, 0x0147, 0x004B, 0xFF77, 0xFEAA, 0xFDC3, 0xFCD9
.hword 0xFC02, 0xFB55, 0xFAE7, 0xFAD0, 0xFB25, 0xFBDC, 0xFCD6, 0xFDF4
.hword 0xFF17, 0x0020, 0x00F2, 0x01A2, 0x0253, 0x02FE, 0x039A, 0x0422
.hword 0x048C, 0x04D1, 0x3FFF, 0xC001, 0x3FFF, 0x0000

koopa_flag_seg6_animindex_06000FA4: # 0x06000FA4
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0094, 0x0001, 0x0092, 0x0001, 0x0000, 0x0001, 0x0093
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x001D, 0x0075, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x001D, 0x0058, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x001D, 0x003B, 0x0001, 0x0000, 0x0001, 0x0000, 0x001D, 0x001E
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x001D, 0x0001

koopa_flag_seg6_anim_06001010: # 0x06001010
.hword 0
.hword 0
.hword 0
.hword 0
.hword 0x1D
.hword 0x08
.word koopa_flag_seg6_animvalue_06000E78
.word koopa_flag_seg6_animindex_06000FA4
.word 0

glabel koopa_flag_seg6_anims_06001028 # 0x06001028
.word koopa_flag_seg6_anim_06001010
.word 0
