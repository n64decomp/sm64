# Cyan Fish

# ???
.dword 0

cyan_fish_seg6_texture_0600D468: # 0x0600D468
.incbin "actors/cyan_fish/cyan_fish.rgba16"

cyan_fish_seg6_light_0600DC68: # 0x0600DC68
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

cyan_fish_seg6_light_0600DC70: # 0x0600DC70
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

cyan_fish_seg6_vertex_0600DC80: # 0x0600DC80
vertex    -95,     32,      0,     32,    436,  0xA9, 0x5B, 0xFF, 0xFF
vertex    -39,     20,     28,    184,    480,  0xF4, 0x0A, 0x7D, 0xFF
vertex     32,    112,      0,    376,    144,  0xE2, 0x7B, 0xFF, 0xFF
vertex    -39,     20,    -27,    184,    478,  0xF5, 0x09, 0x82, 0xFF
vertex   -115,      0,      0,    -22,    552,  0x95, 0xBD, 0x00, 0xFF
vertex     28,    -79,      8,    366,    844,  0xD7, 0xB9, 0x60, 0xFF
vertex    161,     14,      0,    724,    500,  0x69, 0x46, 0x00, 0xFF
vertex    161,    -13,      0,    724,    604,  0x69, 0xBA, 0x00, 0xFF
vertex     28,    -79,     -7,    366,    844,  0xD7, 0xBA, 0xA0, 0xFF
vertex     56,   -111,      0,    442,    960,  0xC2, 0x92, 0x00, 0xFF

glabel cyan_fish_seg6_dl_0600DD20 # 0x0600DD20 - 0x0600DDD8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cyan_fish_seg6_texture_0600D468
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight cyan_fish_seg6_light_0600DC70, 1
gsSPLight cyan_fish_seg6_light_0600DC68, 2
gsSPVertex cyan_fish_seg6_vertex_0600DC80, 10, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  2, 0x0
gsSP2Triangles  0,  4,  1, 0x0,  4,  0,  3, 0x0
gsSP2Triangles  4,  5,  1, 0x0,  1,  6,  2, 0x0
gsSP2Triangles  1,  5,  7, 0x0,  1,  7,  6, 0x0
gsSP2Triangles  6,  3,  2, 0x0,  4,  3,  8, 0x0
gsSP2Triangles  7,  8,  3, 0x0,  6,  7,  3, 0x0
gsSP2Triangles  5,  9,  7, 0x0,  7,  9,  8, 0x0
gsSP2Triangles  4,  8,  5, 0x0,  5,  8,  9, 0x0
gsSPEndDisplayList

glabel cyan_fish_seg6_dl_0600DDD8 # 0x0600DDD8 - 0x0600DE38
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList cyan_fish_seg6_dl_0600DD20
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

cyan_fish_seg6_light_0600DE38: # 0x0600DE38
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

cyan_fish_seg6_light_0600DE40: # 0x0600DE40
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

cyan_fish_seg6_vertex_0600DE50: # 0x0600DE50
vertex      9,    -26,      0,    420,    230,  0x00, 0x00, 0x7F, 0xFF
vertex     57,    -48,      0,    560,    260,  0x00, 0x00, 0x7F, 0xFF
vertex    120,      0,      0,    688,     26,  0x00, 0x00, 0x7F, 0xFF
vertex      0,      0,      0,    376,    144,  0x00, 0x00, 0x7F, 0xFF

glabel cyan_fish_seg6_dl_0600DE90 # 0x0600DE90 - 0x0600DED8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cyan_fish_seg6_texture_0600D468
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight cyan_fish_seg6_light_0600DE40, 1
gsSPLight cyan_fish_seg6_light_0600DE38, 2
gsSPVertex cyan_fish_seg6_vertex_0600DE50, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  0, 0x0
gsSPEndDisplayList

glabel cyan_fish_seg6_dl_0600DED8 # 0x0600DED8 - 0x0600DF48
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList cyan_fish_seg6_dl_0600DE90
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK
gsSPEndDisplayList

cyan_fish_seg6_light_0600DF48: # 0x0600DF48
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

cyan_fish_seg6_light_0600DF50: # 0x0600DF50
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

cyan_fish_seg6_vertex_0600DF60: # 0x0600DF60
vertex     55,    -37,      6,    868,    690,  0x4E, 0xAE, 0x37, 0xFF
vertex     55,    -37,     -5,    868,    690,  0x15, 0xC0, 0x95, 0xFF
vertex     88,     64,     -3,    958,    318,  0x64, 0x15, 0xB6, 0xFF
vertex      0,    -13,      0,    718,    604,  0xCA, 0xB5, 0x56, 0xFF
vertex      0,     14,      0,    718,    500,  0xC7, 0x4C, 0xAD, 0xFF
vertex     88,     64,      4,    958,    318,  0x13, 0x24, 0x78, 0xFF

glabel cyan_fish_seg6_dl_0600DFC0 # 0x0600DFC0 - 0x0600E038
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cyan_fish_seg6_texture_0600D468
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight cyan_fish_seg6_light_0600DF50, 1
gsSPLight cyan_fish_seg6_light_0600DF48, 2
gsSPVertex cyan_fish_seg6_vertex_0600DF60, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  4, 0x0
gsSP2Triangles  1,  4,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  3,  5,  4, 0x0,  3,  0,  5, 0x0
gsSP2Triangles  2,  4,  5, 0x0,  0,  2,  5, 0x0
gsSPEndDisplayList

glabel cyan_fish_seg6_dl_0600E038 # 0x0600E038 - 0x0600E098
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList cyan_fish_seg6_dl_0600DFC0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

cyan_fish_seg6_animvalue_0600E098: # 0x0600E098
.hword 0x0000, 0xFFFB, 0xFFFD, 0xFFFF, 0x0001, 0x0003, 0x0005, 0x0007
.hword 0x0009, 0x000A, 0x000B, 0x000B, 0x000B, 0x000A, 0x0009, 0x0007
.hword 0x0005, 0x0003, 0x0001, 0xFFFF, 0xFFFD, 0xFFFB, 0xFFFA, 0xFFF8
.hword 0xFFF7, 0xFFF7, 0xFFF7, 0xFFF8, 0xFFF9, 0xFFFB, 0xFFFD, 0x3FFF
.hword 0x017A, 0x01C2, 0x01F0, 0x0201, 0x01F2, 0x01C9, 0x018A, 0x0139
.hword 0x00D9, 0x0070, 0x0000, 0xFF8F, 0xFF20, 0xFEB6, 0xFE56, 0xFE05
.hword 0xFDC6, 0xFD9D, 0xFD8F, 0xFD9D, 0xFDC6, 0xFE05, 0xFE56, 0xFEB6
.hword 0xFF20, 0xFF8F, 0x0000, 0x0070, 0x00D9, 0x0139, 0xFC36, 0xFB93
.hword 0xFB29, 0xFB03, 0xFB24, 0xFB82, 0xFC12, 0xFCCC, 0xFDA6, 0xFE97
.hword 0xFF96, 0x0099, 0x0199, 0x028A, 0x0364, 0x041E, 0x04AE, 0x050C
.hword 0x052D, 0x050C, 0x04AE, 0x041E, 0x0364, 0x028A, 0x0199, 0x0099
.hword 0xFF96, 0xFE97, 0xFDA6, 0xFCCC, 0x0B97, 0x0BA2, 0x0BAA, 0x0BAC
.hword 0x0BAA, 0x0BA4, 0x0B99, 0x0B8D, 0x0B7D, 0x0B6C, 0x0B5B, 0x0B49
.hword 0x0B37, 0x0B26, 0x0B17, 0x0B0A, 0x0B00, 0x0AF9, 0x0AF7, 0x0AF9
.hword 0x0B00, 0x0B0A, 0x0B17, 0x0B26, 0x0B37, 0x0B49, 0x0B5B, 0x0B6C
.hword 0x0B7D, 0x0B8D, 0x00A8, 0x02C3, 0x04CD, 0x06B5, 0x086B, 0x09DD
.hword 0x0AFA, 0x0BB1, 0x0BF2, 0x0B9E, 0x0AB2, 0x0948, 0x0778, 0x055D
.hword 0x030F, 0x00A8, 0xFE42, 0xFBF4, 0xF9D9, 0xF809, 0xF69F, 0xF5B3
.hword 0xF55F, 0xF5A9, 0xF678, 0xF7B8, 0xF955, 0xFB39, 0xFD52, 0xFF88
.hword 0x04B8, 0x0492, 0x0429, 0x0387, 0x02B8, 0x01C7, 0x00C0, 0xFFAE
.hword 0xFE9B, 0xFD94, 0xFCA3, 0xFBD4, 0xFB32, 0xFAC9, 0xFAA3, 0xFAC4
.hword 0xFB21, 0xFBB0, 0xFC68, 0xFD40, 0xFE30, 0xFF2D, 0x002E, 0x012B
.hword 0x021A, 0x02F3, 0x03AB, 0x043A, 0x0497, 0x04B8

cyan_fish_seg6_animindex_0600E204: # 0x0600E204
.hword 0x001E, 0x0001, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x001F, 0x0001, 0x0000, 0x0001, 0x0000, 0x001E, 0x0098
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x001E, 0x007A, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x001E, 0x0020
.hword 0x001E, 0x003E, 0x001E, 0x005C

cyan_fish_seg6_anim_0600E24C: # 0x0600E24C
.hword 0
.hword 0
.hword 0
.hword 0
.hword 0x1E
.hword 0x05
.word cyan_fish_seg6_animvalue_0600E098
.word cyan_fish_seg6_animindex_0600E204
.word 0

glabel cyan_fish_seg6_anims_0600E264 # 0x0600E264
.word cyan_fish_seg6_anim_0600E24C
.word 0
.word 0
