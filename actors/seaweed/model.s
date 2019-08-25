# Seaweed

seaweed_seg6_light_06007DF8: # 0x06007DF8
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

seaweed_seg6_light_06007E00: # 0x06007E00
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

seaweed_seg6_texture_06007E10: # 0x06007E10
.incbin "actors/seaweed/seaweed_tip.rgba16"

seaweed_seg6_texture_06008610: # 0x06008610
.incbin "actors/seaweed/seaweed_upper_center.rgba16"

seaweed_seg6_texture_06008E10: # 0x06008E10
.incbin "actors/seaweed/seaweed_lower_center.rgba16"

seaweed_seg6_texture_06009610: # 0x06009610
.incbin "actors/seaweed/seaweed_base.rgba16"

seaweed_seg6_vertex_06009E10: # 0x06009E10
vertex    232,      2,    -76,    -30,    -12,  0x00, 0x7F, 0x00, 0xFF
vertex     -1,      2,     77,    990,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    232,      2,     77,    992,    -12,  0x00, 0x7F, 0x00, 0xFF
vertex     -1,      2,    -76,      0,    990,  0x00, 0x7F, 0x00, 0xFF

glabel seaweed_seg6_dl_06009E50 # 0x06009E50 - 0x06009E98
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, seaweed_seg6_texture_06007E10
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight seaweed_seg6_light_06007E00, 1
gsSPLight seaweed_seg6_light_06007DF8, 2
gsSPVertex seaweed_seg6_vertex_06009E10, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel seaweed_seg6_dl_06009E98 # 0x06009E98 - 0x06009F08
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList seaweed_seg6_dl_06009E50
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsSPEndDisplayList

seaweed_seg6_vertex_06009F08: # 0x06009F08
vertex    311,      2,    -76,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex     -1,      2,    -76,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex     -1,      2,     77,    990,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    311,      2,     77,    990,      0,  0x00, 0x7F, 0x00, 0xFF

glabel seaweed_seg6_dl_06009F48 # 0x06009F48 - 0x06009F90
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, seaweed_seg6_texture_06008610
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight seaweed_seg6_light_06007E00, 1
gsSPLight seaweed_seg6_light_06007DF8, 2
gsSPVertex seaweed_seg6_vertex_06009F08, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel seaweed_seg6_dl_06009F90 # 0x06009F90 - 0x0600A000
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList seaweed_seg6_dl_06009F48
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsSPEndDisplayList

seaweed_seg6_vertex_0600A000: # 0x0600A000
vertex    314,      2,    -76,      0,    -20,  0x00, 0x7F, 0x00, 0xFF
vertex     -1,      2,     77,    990,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    314,      2,     77,    990,    -20,  0x00, 0x7F, 0x00, 0xFF
vertex     -1,      2,    -76,      0,    990,  0x00, 0x7F, 0x00, 0xFF

glabel seaweed_seg6_dl_0600A040 # 0x0600A040 - 0x0600A088
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, seaweed_seg6_texture_06008E10
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight seaweed_seg6_light_06007E00, 1
gsSPLight seaweed_seg6_light_06007DF8, 2
gsSPVertex seaweed_seg6_vertex_0600A000, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel seaweed_seg6_dl_0600A088 # 0x0600A088 - 0x0600A0F8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList seaweed_seg6_dl_0600A040
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsSPEndDisplayList

seaweed_seg6_vertex_0600A0F8: # 0x0600A0F8
vertex    236,      2,    -76,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex      0,      2,     77,    990,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    236,      2,     77,    990,      0,  0x00, 0x7F, 0x00, 0xFF
vertex      0,      2,    -76,      0,    990,  0x00, 0x7F, 0x00, 0xFF

glabel seaweed_seg6_dl_0600A138 # 0x0600A138 - 0x0600A180
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, seaweed_seg6_texture_06009610
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight seaweed_seg6_light_06007E00, 1
gsSPLight seaweed_seg6_light_06007DF8, 2
gsSPVertex seaweed_seg6_vertex_0600A0F8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel seaweed_seg6_dl_0600A180 # 0x0600A180 - 0x0600A1F0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList seaweed_seg6_dl_0600A138
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsSPEndDisplayList

seaweed_seg6_animvalue_0600A1F0: # 0x0600A1F0
.hword 0x0000, 0x3FFF, 0x0E42, 0x0DE6, 0x0CE5, 0x0B5D, 0x096E, 0x0734
.hword 0x04CF, 0x025D, 0xFFFC, 0xFDCA, 0xFBE5, 0xFA6B, 0xF97C, 0xF8DF
.hword 0xF849, 0xF7BB, 0xF735, 0xF6B7, 0xF641, 0xF5D3, 0xF56F, 0xF513
.hword 0xF4C1, 0xF479, 0xF43A, 0xF405, 0xF3DB, 0xF3BB, 0xF3A6, 0xF39C
.hword 0xF39D, 0xF3AA, 0xF3C3, 0xF3E8, 0xF419, 0xF457, 0xF4A2, 0xF4F9
.hword 0xF55E, 0xF5D1, 0xF6AA, 0xF829, 0xFA2B, 0xFC8B, 0xFF24, 0x01D2
.hword 0x0471, 0x06DE, 0x08F2, 0x0A8B, 0x0B84, 0x0C18, 0x0C9D, 0x0D12
.hword 0x0D79, 0x0DD3, 0x0E20, 0x0E61, 0x0E97, 0x0EC2, 0x0EE4, 0x0EFD
.hword 0x0F0E, 0x0F18, 0x0F1B, 0x0F18, 0x0F10, 0x0F04, 0x0EF5, 0x0EE3
.hword 0x0ECE, 0x0EB9, 0x0EA4, 0x0E8E, 0x0E7A, 0x0E68, 0x0E59, 0x0E4D
.hword 0x0E45, 0x0E42, 0xEE13, 0xEE26, 0xEE5D, 0xEEB7, 0xEF30, 0xEFC9
.hword 0xF07D, 0xF14D, 0xF234, 0xF333, 0xF445, 0xF56B, 0xF6A1, 0xF7E6
.hword 0xF938, 0xFA94, 0xFBF9, 0xFD66, 0xFED7, 0x004A, 0x01BF, 0x0333
.hword 0x04A4, 0x0610, 0x0775, 0x08D2, 0x0A23, 0x0B68, 0x0C9F, 0x0DC4
.hword 0x0ED7, 0x0FD5, 0x10BD, 0x118C, 0x1241, 0x12D9, 0x1353, 0x13AC
.hword 0x13E3, 0x13F6, 0x13E4, 0x13B0, 0x135B, 0x12E7, 0x1255, 0x11A9
.hword 0x10E3, 0x1005, 0x0F12, 0x0E0B, 0x0CF1, 0x0BC7, 0x0A8F, 0x0949
.hword 0x07F9, 0x06A0, 0x053F, 0x03D9, 0x0270, 0x0104, 0xFF9A, 0xFE30
.hword 0xFCCA, 0xFB6A, 0xFA10, 0xF8C0, 0xF77B, 0xF642, 0xF518, 0xF3FF
.hword 0xF2F7, 0xF204, 0xF126, 0xF061, 0xEFB4, 0xEF23, 0xEEAF, 0xEE5A
.hword 0xEE25, 0xEE13, 0xEA00, 0xEA16, 0xEA55, 0xEABB, 0xEB45, 0xEBF3
.hword 0xECC1, 0xEDAD, 0xEEB5, 0xEFD7, 0xF110, 0xF25F, 0xF3C0, 0xF533
.hword 0xF6B4, 0xF841, 0xF9D8, 0xFB77, 0xFD1C, 0xFEC4, 0x006C, 0x0214
.hword 0x03B9, 0x0558, 0x06EF, 0x087C, 0x09FD, 0x0B6F, 0x0CD1, 0x0E1F
.hword 0x0F59, 0x107A, 0x1183, 0x126F, 0x133D, 0x13EA, 0x1475, 0x14DB
.hword 0x151A, 0x152F, 0x151B, 0x14DF, 0x147E, 0x13FA, 0x1354, 0x1290
.hword 0x11AE, 0x10B1, 0x0F9C, 0x0E70, 0x0D2F, 0x0BDB, 0x0A77, 0x0904
.hword 0x0785, 0x05FC, 0x046A, 0x02D2, 0x0136, 0xFF98, 0xFDFA, 0xFC5E
.hword 0xFAC6, 0xF934, 0xF7AA, 0xF62B, 0xF4B9, 0xF354, 0xF201, 0xF0C0
.hword 0xEF94, 0xEE7E, 0xED82, 0xECA0, 0xEBDB, 0xEB36, 0xEAB2, 0xEA50
.hword 0xEA15, 0xEA00, 0x4CA0, 0x4C93, 0x4C6A, 0x4C29, 0x4BD0, 0x4B60
.hword 0x4ADC, 0x4A45, 0x499B, 0x48E2, 0x4819, 0x4742, 0x465F, 0x4572
.hword 0x447B, 0x437C, 0x4277, 0x416C, 0x405E, 0x3F4E, 0x3E3E, 0x3D2E
.hword 0x3C20, 0x3B16, 0x3A10, 0x3912, 0x381B, 0x372D, 0x364A, 0x3574
.hword 0x34AB, 0x33F1, 0x3347, 0x32B0, 0x322C, 0x31BC, 0x3163, 0x3122
.hword 0x30FA, 0x30EC, 0x30F9, 0x311F, 0x315E, 0x31B2, 0x321D, 0x329B
.hword 0x332B, 0x33CE, 0x347F, 0x3540, 0x360E, 0x36E8, 0x37CC, 0x38BA
.hword 0x39B0, 0x3AAC, 0x3BAE, 0x3CB4, 0x3DBC, 0x3EC6, 0x3FD0, 0x40D8
.hword 0x41DE, 0x42E0, 0x43DC, 0x44D2, 0x45C0, 0x46A4, 0x477E, 0x484C
.hword 0x490D, 0x49BF, 0x4A61, 0x4AF1, 0x4B70, 0x4BDA, 0x4C2F, 0x4C6D
.hword 0x4C93, 0x4CA0

seaweed_seg6_animindex_0600A474: # 0x0600A474
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0001, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0050, 0x00F2, 0x0001, 0x0000, 0x0001, 0x0000, 0x0050, 0x00A2
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0050, 0x0052, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0050, 0x0002

seaweed_seg6_anim_0600A4BC: # 0x0600A4BC
.hword 0
.hword 0
.hword 0
.hword 0
.hword 0x50
.hword 0x05
.word seaweed_seg6_animvalue_0600A1F0
.word seaweed_seg6_animindex_0600A474
.word 0

glabel seaweed_seg6_anims_0600A4D4 # 0x0600A4D4
.word seaweed_seg6_anim_0600A4BC
