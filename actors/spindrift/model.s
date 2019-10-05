# Spindrift

# Unreferenced light
.byte 0x3F, 0x08, 0x1B, 0x00, 0x3F, 0x08, 0x1B, 0x00

.byte 0xFF, 0x22, 0x6D, 0x00, 0xFF, 0x22, 0x6D, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

# Unreferenced light
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

.byte 0xFD, 0xFF, 0xFF, 0x00, 0xFD, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

spindrift_seg5_light_05000030: # 0x05000030
.byte 0x12, 0x2C, 0x00, 0x00, 0x12, 0x2C, 0x00, 0x00

spindrift_seg5_light_05000038: # 0x05000038
.byte 0x49, 0xB2, 0x00, 0x00, 0x49, 0xB2, 0x00, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

spindrift_seg5_light_05000048: # 0x05000048
.byte 0x37, 0x3F, 0x00, 0x00, 0x37, 0x3F, 0x00, 0x00

spindrift_seg5_light_05000050: # 0x05000050
.byte 0xDD, 0xFF, 0x01, 0x00, 0xDD, 0xFF, 0x01, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

# Unreferenced light
.byte 0x00, 0x15, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00

.byte 0x00, 0x56, 0x00, 0x00, 0x00, 0x56, 0x00, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

spindrift_seg5_light_05000078: # 0x05000078
.byte 0x3F, 0x38, 0x00, 0x00, 0x3F, 0x38, 0x00, 0x00

spindrift_seg5_light_05000080: # 0x05000080
.byte 0xFF, 0xE2, 0x00, 0x00, 0xFF, 0xE2, 0x00, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

spindrift_seg5_light_05000090: # 0x05000090
.byte 0x00, 0x0F, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00

spindrift_seg5_light_05000098: # 0x05000098
.byte 0x00, 0x3F, 0x00, 0x00, 0x00, 0x3F, 0x00, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

# Unreferenced light
.byte 0x3F, 0x00, 0x00, 0x00, 0x3F, 0x00, 0x00, 0x00

.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

spindrift_seg5_vertex_050000C0: # 0x050000C0
vertex     34,     40,     30,      0,      0,  0x7B, 0x17, 0x11, 0x00
vertex     34,    -16,     46,      0,      0,  0x7B, 0xF7, 0x1C, 0x00
vertex     46,      0,      0,      0,      0,  0x7F, 0x00, 0x00, 0x00
vertex     34,    -50,      0,      0,      0,  0x7B, 0xE3, 0x00, 0xFF
vertex     34,    -16,    -46,      0,      0,  0x7B, 0xF7, 0xE3, 0xFF
vertex     34,     40,    -28,      0,      0,  0x7B, 0x18, 0xEE, 0xFF

spindrift_seg5_vertex_05000120: # 0x05000120
vertex      6,      0,      0,      0,      0,  0x81, 0x00, 0x00, 0x00
vertex     34,    -16,    -46,      0,      0,  0x92, 0xEE, 0xC4, 0x00
vertex     34,    -50,      0,      0,      0,  0x92, 0xC2, 0x00, 0x00
vertex     34,    -16,     46,      0,      0,  0x92, 0xEC, 0x3B, 0xFF
vertex     34,     40,    -28,      0,      0,  0x92, 0x32, 0xDB, 0xFF
vertex     34,     40,     30,      0,      0,  0x92, 0x31, 0x25, 0xFF

spindrift_seg5_vertex_05000180: # 0x05000180
vertex     70,     50,      0,      0,      0,  0xCB, 0x73, 0x00, 0x00
vertex     24,    -12,     56,      0,      0,  0xA9, 0x22, 0x54, 0x00
vertex    128,     -2,     94,      0,      0,  0xDA, 0x45, 0x63, 0x00
vertex      0,     -5,      0,      0,      0,  0x8E, 0x37, 0x00, 0xFF
vertex     24,    -12,    -56,      0,      0,  0xA8, 0x22, 0xAC, 0xFF
vertex      0,    -57,      0,      0,      0,  0x87, 0xDD, 0x00, 0xFF
vertex     55,   -113,     57,      0,      0,  0xA5, 0xCE, 0x48, 0xFF
vertex    128,     -2,    -94,      0,      0,  0xDA, 0x45, 0x9D, 0xFF
vertex     55,   -113,    -57,      0,      0,  0xA5, 0xCE, 0xB8, 0xFF

spindrift_seg5_vertex_05000210: # 0x05000210
vertex     55,   -113,    -57,      0,      0,  0xA5, 0xCE, 0xB8, 0x00
vertex     55,   -113,     57,      0,      0,  0xA5, 0xCE, 0x48, 0x00
vertex      0,    -57,      0,      0,      0,  0x87, 0xDD, 0x00, 0x00
vertex    128,     -2,    -94,      0,      0,  0xDA, 0x45, 0x9D, 0xFF
vertex     24,    -12,    -56,      0,      0,  0xA8, 0x22, 0xAC, 0xFF
vertex    128,     -2,     94,      0,      0,  0xDA, 0x45, 0x63, 0xFF
vertex     24,    -12,     56,      0,      0,  0xA9, 0x22, 0x54, 0xFF
vertex    138,     66,      0,      0,      0,  0xE3, 0x7B, 0x00, 0xFF
vertex     70,     50,      0,      0,      0,  0xCB, 0x73, 0x00, 0xFF

glabel spindrift_seg5_dl_050002A0 # 0x050002A0 - 0x05000328
gsSPLight spindrift_seg5_light_05000050, 1
gsSPLight spindrift_seg5_light_05000048, 2
gsSPVertex spindrift_seg5_vertex_050000C0, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  2, 0x0
gsSP2Triangles  1,  3,  2, 0x0,  4,  5,  2, 0x0
gsSP1Triangle  5,  0,  2, 0x0
gsSPLight spindrift_seg5_light_05000038, 1
gsSPLight spindrift_seg5_light_05000030, 2
gsSPVertex spindrift_seg5_vertex_05000120, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  1,  0,  4, 0x0,  4,  0,  5, 0x0
gsSP1Triangle  5,  0,  3, 0x0
gsSPEndDisplayList

glabel spindrift_seg5_dl_05000328 # 0x05000328 - 0x050003D8
gsSPClearGeometryMode G_CULL_BACK
gsSPLight spindrift_seg5_light_05000098, 1
gsSPLight spindrift_seg5_light_05000090, 2
gsSPVertex spindrift_seg5_vertex_05000180, 9, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  0,  3, 0x0
gsSP2Triangles  0,  4,  3, 0x0,  1,  5,  6, 0x0
gsSP2Triangles  7,  4,  0, 0x0,  5,  4,  8, 0x0
gsSP2Triangles  5,  1,  3, 0x0,  4,  5,  3, 0x0
gsSPLight spindrift_seg5_light_05000080, 1
gsSPLight spindrift_seg5_light_05000078, 2
gsSPVertex spindrift_seg5_vertex_05000210, 9, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  4, 0x0
gsSP2Triangles  1,  5,  6, 0x0,  5,  7,  8, 0x0
gsSP1Triangle  8,  7,  3, 0x0
gsSPSetGeometryMode G_CULL_BACK
gsSPEndDisplayList

spindrift_seg5_animvalue_050003D8: # 0x050003D8
.hword 0x0000, 0x00EC, 0x00EC, 0x00EE, 0x00F1, 0x00F5, 0x00F8, 0x00FC
.hword 0x00FF, 0x0101, 0x0101, 0x0101, 0x00FF, 0x00FD, 0x00FA, 0x00F6
.hword 0x00F3, 0x00F0, 0x00EE, 0x00EC, 0x00EC, 0x3FFF, 0x0000, 0x0D79
.hword 0x1AF2, 0x286B, 0x35E4, 0x435D, 0x50D6, 0x5E50, 0x6BC9, 0x7942
.hword 0x86BE, 0x9437, 0xA1B0, 0xAF2A, 0xBCA3, 0xCA1C, 0xD795, 0xE50E
.hword 0xF287, 0x0000, 0x4BD0, 0xC001, 0x0000, 0x0D79, 0x1AF2, 0x286B
.hword 0x35E4, 0x435D, 0x50D6, 0x5E50, 0x6BC9, 0x7942, 0x86BE, 0x9437
.hword 0xA1B0, 0xAF2A, 0xBCA3, 0xCA1C, 0xD795, 0xE50E, 0xF287, 0x0000
.hword 0x4BD0, 0xC001, 0x0000, 0x0D79, 0x1AF2, 0x286B, 0x35E4, 0x435D
.hword 0x50D6, 0x5E50, 0x6BC9, 0x7942, 0x86BE, 0x9437, 0xA1B0, 0xAF2A
.hword 0xBCA3, 0xCA1C, 0xD795, 0xE50E, 0xF287, 0x0000, 0x4BD0, 0x0000
.hword 0x0D79, 0x1AF2, 0x286B, 0x35E4, 0x435D, 0x50D6, 0x5E50, 0x6BC9
.hword 0x7942, 0x86BE, 0x9437, 0xA1B0, 0xAF2A, 0xBCA3, 0xCA1C, 0xD795
.hword 0xE50E, 0xF287, 0x0000, 0x4BD0, 0x0000, 0x0D79, 0x1AF2, 0x286B
.hword 0x35E4, 0x435D, 0x50D6, 0x5E50, 0x6BC9, 0x7942, 0x86BE, 0x9437
.hword 0xA1B0, 0xAF2A, 0xBCA3, 0xCA1C, 0xD795, 0xE50E, 0xF287, 0x0000
.hword 0x4BD0, 0x0000, 0x0D79, 0x1AF2, 0x286B, 0x35E4, 0x435D, 0x50D6
.hword 0x5E50, 0x6BC9, 0x7942, 0x86BE, 0x9437, 0xA1B0, 0xAF2A, 0xBCA3
.hword 0xCA1C, 0xD795, 0xE50E, 0xF287, 0x0000, 0x4BD0, 0x3FFF, 0xFA42
.hword 0xFCCB, 0xFFCC, 0x02F5, 0x05F6, 0x087F, 0x0A3F, 0x0AE6, 0x0A5E
.hword 0x08EB, 0x06C9, 0x0432, 0x0160, 0xFE8F, 0xFBF8, 0xF9D6, 0xF863
.hword 0xF7DA, 0xF863, 0xF9D6, 0x24E7, 0x23FC, 0x22E4, 0x21BE, 0x20A6
.hword 0x1FBA, 0x1F17, 0x1EDA, 0x1F0C, 0x1F93, 0x2059, 0x214A, 0x2251
.hword 0x2357, 0x2448, 0x250F, 0x2596, 0x25C7, 0x2596, 0x250F, 0xFA42
.hword 0xFCCB, 0xFFCC, 0x02F5, 0x05F6, 0x087F, 0x0A3F, 0x0AE6, 0x0A5E
.hword 0x08EB, 0x06C9, 0x0432, 0x0160, 0xFE8F, 0xFBF8, 0xF9D6, 0xF863
.hword 0xF7DA, 0xF863, 0xF9D6, 0x24E7, 0x23FC, 0x22E4, 0x21BE, 0x20A6
.hword 0x1FBA, 0x1F17, 0x1EDA, 0x1F0C, 0x1F93, 0x2059, 0x214A, 0x2251
.hword 0x2357, 0x2448, 0x250F, 0x2596, 0x25C7, 0x2596, 0x250F, 0xFA42
.hword 0xFCCB, 0xFFCC, 0x02F5, 0x05F6, 0x087F, 0x0A3F, 0x0AE6, 0x0A5E
.hword 0x08EB, 0x06C9, 0x0432, 0x0160, 0xFE8F, 0xFBF8, 0xF9D6, 0xF863
.hword 0xF7DA, 0xF863, 0xF9D6, 0x24E7, 0x23FC, 0x22E4, 0x21BE, 0x20A6
.hword 0x1FBA, 0x1F17, 0x1EDA, 0x1F0C, 0x1F93, 0x2059, 0x214A, 0x2251
.hword 0x2357, 0x2448, 0x250F, 0x2596, 0x25C7, 0x2596, 0x250F, 0xC001

spindrift_seg5_animindex_050005F8: # 0x050005F8
.hword 0x0001, 0x0000, 0x0014, 0x0001, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0015, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x010F, 0x0001, 0x0000, 0x0014, 0x00E7, 0x0014, 0x00FB
.hword 0x0001, 0x0000, 0x0014, 0x00BF, 0x0014, 0x00D3, 0x0001, 0x0000
.hword 0x0014, 0x0097, 0x0014, 0x00AB, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0096, 0x0014, 0x0081, 0x0001, 0x0000, 0x0001, 0x0095
.hword 0x0014, 0x006C, 0x0001, 0x0000, 0x0001, 0x0080, 0x0014, 0x0057
.hword 0x0001, 0x0000, 0x0001, 0x006B, 0x0014, 0x0042, 0x0001, 0x0000
.hword 0x0001, 0x0056, 0x0014, 0x002C, 0x0001, 0x0000, 0x0001, 0x0040
.hword 0x0014, 0x0016, 0x0001, 0x0000, 0x0001, 0x002A, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0041, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x002B

spindrift_seg5_anim_050006AC: # 0x050006AC
.hword 0
.hword 0
.hword 0
.hword 0
.hword 0x13
.hword 0x0E
.word spindrift_seg5_animvalue_050003D8
.word spindrift_seg5_animindex_050005F8
.word 0

.balign 8

.dword 1 # False Bin ID?

spindrift_seg5_texture_050006D0: # 0x050006D0
.incbin "actors/spindrift/spindrift_face.rgba16"

spindrift_seg5_texture_05000ED0: # 0x05000ED0
.incbin "actors/spindrift/spindrift_petal.rgba16"

spindrift_seg5_texture_050016D0: # 0x050016D0
.incbin "actors/spindrift/spindrift_leaf.rgba16"

spindrift_seg5_texture_05001ED0: # 0x05001ED0
.incbin "actors/spindrift/spindrift_head.rgba16"

spindrift_seg5_vertex_050026D0: # 0x050026D0
vertex    -54,    -54,      0,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex     56,     56,      0,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -54,     56,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex     56,    -54,      0,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF

glabel spindrift_seg5_dl_05002710 # 0x05002710 - 0x05002748
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spindrift_seg5_texture_05001ED0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex spindrift_seg5_vertex_050026D0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel spindrift_seg5_dl_05002748 # 0x05002748 - 0x050027B8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList spindrift_seg5_dl_05002710
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

spindrift_seg5_vertex_050027B8: # 0x050027B8
vertex     27,   -112,    -47,    -36,    520,  0xFF, 0xFF, 0xFF, 0xFF
vertex     27,   -112,     48,    990,    520,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -32,   -112,    -47,    -36,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -32,   -112,     48,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF

glabel spindrift_seg5_dl_050027F8 # 0x050027F8 - 0x05002830
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spindrift_seg5_texture_050006D0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex spindrift_seg5_vertex_050027B8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  1,  3, 0x0
gsSPEndDisplayList

glabel spindrift_seg5_dl_05002830 # 0x05002830 - 0x050028A0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList spindrift_seg5_dl_050027F8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

spindrift_seg5_vertex_050028A0: # 0x050028A0
vertex     36,   -109,    -44,    -30,    572,  0xFF, 0xFF, 0xFF, 0xFF
vertex     83,    -79,      0,    480,   1092,  0xFF, 0xFF, 0xFF, 0xFF
vertex     36,   -109,     45,    990,    572,  0xFF, 0xFF, 0xFF, 0xFF

glabel spindrift_seg5_dl_050028D0 # 0x050028D0 - 0x05002900
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spindrift_seg5_texture_050006D0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex spindrift_seg5_vertex_050028A0, 3, 0
gsSP1Triangle  0,  1,  2, 0x0
gsSPEndDisplayList

glabel spindrift_seg5_dl_05002900 # 0x05002900 - 0x05002970
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList spindrift_seg5_dl_050028D0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

spindrift_seg5_light_05002970: # 0x05002970
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

spindrift_seg5_light_05002978: # 0x05002978
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

spindrift_seg5_vertex_05002988: # 0x05002988
vertex     19,     22,    102,    196,   1200,  0x90, 0x25, 0x2E, 0xFF
vertex     13,     -6,      4,   1032,    456,  0x92, 0x3E, 0xF5, 0xFF
vertex    -20,    -53,     69,    250,   -194,  0x90, 0x25, 0x2E, 0xFF
vertex     34,    -56,    120,    -62,    330,  0xA9, 0x04, 0x5C, 0xFF

glabel spindrift_seg5_dl_050029C8 # 0x050029C8 - 0x05002A20
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spindrift_seg5_texture_050016D0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPClearGeometryMode G_CULL_BACK
gsSPLight spindrift_seg5_light_05002978, 1
gsSPLight spindrift_seg5_light_05002970, 2
gsSPVertex spindrift_seg5_vertex_05002988, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPSetGeometryMode G_CULL_BACK
gsSPEndDisplayList

glabel spindrift_seg5_dl_05002A20 # 0x05002A20 - 0x05002A80
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList spindrift_seg5_dl_050029C8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

spindrift_seg5_light_05002A80: # 0x05002A80
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

spindrift_seg5_light_05002A88: # 0x05002A88
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

spindrift_seg5_vertex_05002A98: # 0x05002A98
vertex      0,    -33,    -69,    514,   1102,  0xA0, 0x40, 0xCD, 0xFF
vertex     13,     -2,      0,   1070,    398,  0x9C, 0x4C, 0xF1, 0xFF
vertex     53,     33,    -86,    138,   -146,  0xA0, 0x40, 0xCD, 0xFF
vertex     62,    -15,   -122,   -146,    482,  0xAC, 0x2E, 0xAE, 0xFF

glabel spindrift_seg5_dl_05002AD8 # 0x05002AD8 - 0x05002B30
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spindrift_seg5_texture_050016D0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPClearGeometryMode G_CULL_BACK
gsSPLight spindrift_seg5_light_05002A88, 1
gsSPLight spindrift_seg5_light_05002A80, 2
gsSPVertex spindrift_seg5_vertex_05002A98, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  2, 0x0
gsSPSetGeometryMode G_CULL_BACK
gsSPEndDisplayList

glabel spindrift_seg5_dl_05002B30 # 0x05002B30 - 0x05002B90
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList spindrift_seg5_dl_05002AD8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

spindrift_seg5_light_05002B90: # 0x05002B90
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

spindrift_seg5_light_05002B98: # 0x05002B98
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

spindrift_seg5_vertex_05002BA8: # 0x05002BA8
vertex     28,     -6,     21,    474,   1104,  0x7E, 0xFD, 0x0B, 0xFF
vertex     42,    -20,   -134,   -192,      0,  0x7E, 0xFD, 0x0B, 0xFF
vertex     42,     98,    -96,   1152,      0,  0x7E, 0xFD, 0x0B, 0xFF
vertex     28,    -21,      0,    474,   1104,  0x7E, 0xF4, 0x00, 0xFF
vertex     42,    122,    -61,   -192,      0,  0x7E, 0xF4, 0x00, 0xFF
vertex     42,    122,     63,   1152,      0,  0x7E, 0xF4, 0x00, 0xFF
vertex     28,     -6,    -20,    474,   1104,  0x7E, 0xFD, 0xF5, 0xFF
vertex     42,     97,     97,   -192,      0,  0x7E, 0xFD, 0xF5, 0xFF
vertex     42,    -21,    135,   1152,      0,  0x7E, 0xFD, 0xF5, 0xFF
vertex     28,     18,    -12,    474,   1104,  0x7E, 0x09, 0xF9, 0xFF
vertex     42,    -61,    122,   -192,      0,  0x7E, 0x09, 0xF9, 0xFF
vertex     42,   -135,     21,   1152,      0,  0x7E, 0x09, 0xF9, 0xFF
vertex     28,     18,     13,    474,   1104,  0x7E, 0x0A, 0x07, 0xFF
vertex     42,   -134,    -21,   -192,      0,  0x7E, 0x0A, 0x07, 0xFF
vertex     42,    -61,   -122,   1152,      0,  0x7E, 0x0A, 0x07, 0xFF

glabel spindrift_seg5_dl_05002C98 # 0x05002C98 - 0x05002D08
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spindrift_seg5_texture_05000ED0
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPClearGeometryMode G_CULL_BACK
gsSPLight spindrift_seg5_light_05002B98, 1
gsSPLight spindrift_seg5_light_05002B90, 2
gsSPVertex spindrift_seg5_vertex_05002BA8, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSP1Triangle 12, 13, 14, 0x0
gsSPSetGeometryMode G_CULL_BACK
gsSPEndDisplayList

glabel spindrift_seg5_dl_05002D08 # 0x05002D08 - 0x05002D68
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList spindrift_seg5_dl_05002C98
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

# unlike the other anim lists, this one is way after the actual anim entry. why?
glabel spindrift_seg5_anims_05002D68 # 0x05002D68
.word spindrift_seg5_anim_050006AC
.word 0
.word 0
.word 0
