.section .rodata
.include "macros.inc"
.include "PR/gbi.inc"

main_menu_seg7_light_07000000: # 0x07000000 - 0x07000008
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

main_menu_seg7_light_07000008: # 0x07000008 - 0x07000018
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

main_menu_seg7_texture_07000018: # 0x07000018 - 0x07000818
.incbin "levels/menu/main_menu_seg7.00018.rgba16"

main_menu_seg7_texture_07000818: # 0x07000818 - 0x07001018
.incbin "levels/menu/main_menu_seg7.00818.rgba16"

main_menu_seg7_texture_07001018: # 0x07001018 - 0x07002018
.incbin "levels/menu/main_menu_seg7.01018.rgba16"

main_menu_seg7_texture_07002018: # 0x07002018 - 0x07003018
.incbin "levels/menu/main_menu_seg7.02018.rgba16"

main_menu_seg7_vertex_07003018: # 0x07003018 - 0x07003118
vertex   -163,   -122,      0,      0,    990,  0x00, 0xB6, 0x66, 0xFF
vertex    163,   -122,      0,    990,    990,  0x00, 0xB6, 0x66, 0xFF
vertex   -122,    -81,     30,     96,    820,  0x00, 0xB6, 0x66, 0xFF
vertex    122,    -81,     30,    862,    820,  0x00, 0xB6, 0x66, 0xFF
vertex   -163,   -122,      0,      0,    990,  0xB6, 0x00, 0x66, 0xFF
vertex   -122,    -81,     30,     96,    820,  0xB6, 0x00, 0x66, 0xFF
vertex   -163,    122,      0,      0,      0,  0xB6, 0x00, 0x66, 0xFF
vertex   -122,     81,     30,     96,    138,  0xB6, 0x00, 0x66, 0xFF
vertex   -122,     81,     30,     96,    138,  0x00, 0x4A, 0x66, 0xFF
vertex    122,     81,     30,    862,    138,  0x00, 0x4A, 0x66, 0xFF
vertex    163,    122,      0,    990,      0,  0x00, 0x4A, 0x66, 0xFF
vertex   -163,    122,      0,      0,      0,  0x00, 0x4A, 0x66, 0xFF
vertex    122,     81,     30,    862,    138,  0x4A, 0x00, 0x66, 0xFF
vertex    122,    -81,     30,    862,    820,  0x4A, 0x00, 0x66, 0xFF
vertex    163,   -122,      0,    990,    990,  0x4A, 0x00, 0x66, 0xFF
vertex    163,    122,      0,    990,      0,  0x4A, 0x00, 0x66, 0xFF

main_menu_seg7_vertex_07003118: # 0x07003118 - 0x07003158
vertex    122,     81,     30,   2012,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -122,     81,     30,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    122,    -81,     30,   2012,    990,  0x00, 0x00, 0x7F, 0xFF
vertex   -122,    -81,     30,      0,    990,  0x00, 0x00, 0x7F, 0xFF

main_menu_seg7_dl_07003158: # 0x07003158 - 0x070031A0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPEndDisplayList

main_menu_seg7_dl_070031A0: # 0x070031A0 - 0x07003218
gsSPLight main_menu_seg7_light_07000008, 1
gsSPLight main_menu_seg7_light_07000000, 2
gsSPVertex main_menu_seg7_vertex_07003018, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  5,  7,  6, 0x0
gsSP2Triangles  8,  9, 10, 0x0, 11,  8, 10, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 15, 12, 14, 0x0
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPEndDisplayList

main_menu_seg7_dl_07003218: # 0x07003218 - 0x07003258
gsSPVertex main_menu_seg7_vertex_07003118, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

main_menu_seg7_vertex_07003258: # 0x07003258 - 0x07003298
vertex    163,   -122,      0,      0,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -163,   -122,      0,    990,    990,  0x00, 0x00, 0x81, 0xFF
vertex    163,    122,      0,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex   -163,    122,      0,    990,      0,  0x00, 0x00, 0x81, 0xFF

main_menu_seg7_dl_07003298: # 0x07003298 - 0x070032E0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPEndDisplayList

main_menu_seg7_dl_070032E0: # 0x070032E0 - 0x07003330
gsSPLight main_menu_seg7_light_07000008, 1
gsSPLight main_menu_seg7_light_07000000, 2
gsSPVertex main_menu_seg7_vertex_07003258, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

glabel main_menu_seg7_dl_07003330 # 0x07003330 - 0x07003380
gsSPDisplayList main_menu_seg7_dl_07003158
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, main_menu_seg7_texture_07000018
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList main_menu_seg7_dl_070031A0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, main_menu_seg7_texture_07001018
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList main_menu_seg7_dl_07003218
gsSPEndDisplayList

glabel main_menu_seg7_dl_07003380 # 0x07003380 - 0x070033D0
gsSPDisplayList main_menu_seg7_dl_07003158
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, main_menu_seg7_texture_07000018
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList main_menu_seg7_dl_070031A0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, main_menu_seg7_texture_07002018
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList main_menu_seg7_dl_07003218
gsSPEndDisplayList

glabel main_menu_seg7_dl_070033D0 # 0x070033D0 - 0x07003400
gsSPDisplayList main_menu_seg7_dl_07003298
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, main_menu_seg7_texture_07000818
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList main_menu_seg7_dl_070032E0
gsSPEndDisplayList

glabel main_menu_seg7_dl_07003400 # 0x07003400 - 0x07003450
gsDPPipeSync
gsSPClearGeometryMode G_SHADING_SMOOTH
gsSPLight main_menu_seg7_light_07000008, 1
gsSPLight main_menu_seg7_light_07000000, 2
gsSPVertex main_menu_seg7_vertex_07003258, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsDPPipeSync
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

main_menu_seg7_light_07003450: # 0x07003450 - 0x07003458
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

main_menu_seg7_light_07003458: # 0x07003458 - 0x07003468
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

main_menu_seg7_texture_07003468: # 0x07003468 - 0x07003468
.incbin "levels/menu/main_menu_seg7.03468.rgba16"

main_menu_seg7_texture_07003C68: # 0x07003C68 - 0x07003C68
.incbin "levels/menu/main_menu_seg7.03C68.rgba16"

main_menu_seg7_texture_07004468: # 0x07004468 - 0x07004468
.incbin "levels/menu/main_menu_seg7.04468.rgba16"

main_menu_seg7_texture_07004C68: # 0x07004C68 - 0x07004C68
.incbin "levels/menu/main_menu_seg7.04C68.rgba16"

main_menu_seg7_texture_07005468: # 0x07005468 - 0x07005468
.incbin "levels/menu/main_menu_seg7.05468.rgba16"

main_menu_seg7_vertex_07005C68: # 0x07005C68 - 0x07005D68
vertex   -163,   -122,      0,    990,      0,  0xB6, 0x00, 0x66, 0xFF
vertex   -122,    -81,     30,    862,    138,  0xB6, 0x00, 0x66, 0xFF
vertex   -163,    122,      0,    990,    990,  0xB6, 0x00, 0x66, 0xFF
vertex   -143,    102,      0,    926,    904,  0x59, 0x00, 0xA7, 0xFF
vertex   -133,     92,     10,    894,    862,  0x59, 0x00, 0xA7, 0xFF
vertex   -133,    -92,     10,    894,     96,  0x59, 0x00, 0xA7, 0xFF
vertex   -133,     92,     10,    894,    862,  0x00, 0x00, 0x81, 0xFF
vertex    133,    -92,     10,     64,     96,  0x00, 0x00, 0x81, 0xFF
vertex   -133,    -92,     10,    894,     96,  0x00, 0x00, 0x81, 0xFF
vertex    133,     92,     10,     64,    862,  0x00, 0x00, 0x81, 0xFF
vertex    133,     92,     10,     64,    862,  0x00, 0xA7, 0xA7, 0xFF
vertex   -133,     92,     10,    894,    862,  0x00, 0xA7, 0xA7, 0xFF
vertex   -143,    102,      0,    926,    904,  0x00, 0xA7, 0xA7, 0xFF
vertex    143,   -102,      0,     32,     54,  0xA7, 0x00, 0xA7, 0xFF
vertex    133,     92,     10,     64,    862,  0xA7, 0x00, 0xA7, 0xFF
vertex    143,    102,      0,     32,    904,  0xA7, 0x00, 0xA7, 0xFF

main_menu_seg7_vertex_07005D68: # 0x07005D68 - 0x07005E68
vertex    143,   -102,      0,     32,     54,  0xA7, 0x00, 0xA7, 0xFF
vertex    133,    -92,     10,     64,     96,  0xA7, 0x00, 0xA7, 0xFF
vertex    133,     92,     10,     64,    862,  0xA7, 0x00, 0xA7, 0xFF
vertex    133,     92,     10,     64,    862,  0x00, 0xA7, 0xA7, 0xFF
vertex   -143,    102,      0,    926,    904,  0x00, 0xA7, 0xA7, 0xFF
vertex    143,    102,      0,     32,    904,  0x00, 0xA7, 0xA7, 0xFF
vertex   -143,   -102,      0,    926,     54,  0x00, 0x59, 0xA7, 0xFF
vertex    133,    -92,     10,     64,     96,  0x00, 0x59, 0xA7, 0xFF
vertex    143,   -102,      0,     32,     54,  0x00, 0x59, 0xA7, 0xFF
vertex   -133,    -92,     10,    894,     96,  0x00, 0x59, 0xA7, 0xFF
vertex   -143,    102,      0,    926,    904,  0x59, 0x00, 0xA7, 0xFF
vertex   -133,    -92,     10,    894,     96,  0x59, 0x00, 0xA7, 0xFF
vertex   -143,   -102,      0,    926,     54,  0x59, 0x00, 0xA7, 0xFF
vertex    163,    122,      0,      0,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -143,    102,      0,    926,    904,  0x00, 0x00, 0x81, 0xFF
vertex   -163,    122,      0,    990,    990,  0x00, 0x00, 0x81, 0xFF

main_menu_seg7_vertex_07005E68: # 0x07005E68 - 0x07005F48
vertex    163,    122,      0,      0,    990,  0x00, 0x00, 0x81, 0xFF
vertex    143,    102,      0,     32,    904,  0x00, 0x00, 0x81, 0xFF
vertex   -143,    102,      0,    926,    904,  0x00, 0x00, 0x81, 0xFF
vertex    143,   -102,      0,     32,     54,  0x00, 0x00, 0x81, 0xFF
vertex    163,   -122,      0,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex   -163,    122,      0,    990,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -143,   -102,      0,    926,     54,  0x00, 0x00, 0x81, 0xFF
vertex   -163,   -122,      0,    990,      0,  0x00, 0x00, 0x81, 0xFF
vertex    163,   -122,      0,      0,      0,  0x00, 0xB6, 0x66, 0xFF
vertex    122,    -81,     30,     96,    138,  0x00, 0xB6, 0x66, 0xFF
vertex   -122,    -81,     30,    862,    138,  0x00, 0xB6, 0x66, 0xFF
vertex   -122,    -81,     30,    862,    138,  0xB6, 0x00, 0x66, 0xFF
vertex   -122,     81,     30,    862,    820,  0xB6, 0x00, 0x66, 0xFF
vertex   -163,    122,      0,    990,    990,  0xB6, 0x00, 0x66, 0xFF

main_menu_seg7_vertex_07005F48: # 0x07005F48 - 0x07006038
vertex   -122,     81,     30,    862,    820,  0x00, 0x00, 0x7F, 0xFF
vertex   -122,    -81,     30,    862,    138,  0x00, 0x00, 0x7F, 0xFF
vertex    122,    -81,     30,     96,    138,  0x00, 0x00, 0x7F, 0xFF
vertex   -163,   -122,      0,    990,      0,  0x00, 0xB6, 0x66, 0xFF
vertex    163,   -122,      0,      0,      0,  0x00, 0xB6, 0x66, 0xFF
vertex   -122,    -81,     30,    862,    138,  0x00, 0xB6, 0x66, 0xFF
vertex   -122,     81,     30,    862,    820,  0x00, 0x4A, 0x66, 0xFF
vertex    122,     81,     30,     96,    820,  0x00, 0x4A, 0x66, 0xFF
vertex    163,    122,      0,      0,    990,  0x00, 0x4A, 0x66, 0xFF
vertex   -163,    122,      0,    990,    990,  0x00, 0x4A, 0x66, 0xFF
vertex    122,     81,     30,     96,    820,  0x00, 0x00, 0x7F, 0xFF
vertex    163,    122,      0,      0,    990,  0x4A, 0x00, 0x66, 0xFF
vertex    122,     81,     30,     96,    820,  0x4A, 0x00, 0x66, 0xFF
vertex    163,   -122,      0,      0,      0,  0x4A, 0x00, 0x66, 0xFF
vertex    122,    -81,     30,     96,    138,  0x4A, 0x00, 0x66, 0xFF

main_menu_seg7_dl_07006038: # 0x07006038 - 0x07006150
gsSPLight main_menu_seg7_light_07003458, 1
gsSPLight main_menu_seg7_light_07003450, 2
gsSPVertex main_menu_seg7_vertex_07005C68, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  9,  7, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 13, 14, 15, 0x0
gsSPVertex main_menu_seg7_vertex_07005D68, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  9,  7, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 13, 14, 15, 0x0
gsSPVertex main_menu_seg7_vertex_07005E68, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  0,  4,  3, 0x0,  5,  2,  6, 0x0
gsSP2Triangles  5,  6,  7, 0x0,  6,  3,  4, 0x0
gsSP2Triangles  6,  4,  7, 0x0,  8,  9, 10, 0x0
gsSP1Triangle 11, 12, 13, 0x0
gsSPVertex main_menu_seg7_vertex_07005F48, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9,  6,  8, 0x0
gsSP2Triangles 10,  0,  2, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 12, 14, 13, 0x0
gsSPEndDisplayList

main_menu_seg7_dl_07006150: # 0x07006150 - 0x07006198
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPEndDisplayList

main_menu_seg7_dl_07006198: # 0x07006198 - 0x070061C8
gsSPDisplayList main_menu_seg7_dl_07006038
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

glabel main_menu_seg7_dl_070061C8 # 0x070061C8 - 0x070061F8
gsSPDisplayList main_menu_seg7_dl_07006150
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, main_menu_seg7_texture_07003468
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList main_menu_seg7_dl_07006198
gsSPEndDisplayList

glabel main_menu_seg7_dl_070061F8 # 0x070061F8 - 0x07006228
gsSPDisplayList main_menu_seg7_dl_07006150
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, main_menu_seg7_texture_07003C68
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList main_menu_seg7_dl_07006198
gsSPEndDisplayList

glabel main_menu_seg7_dl_07006228 # 0x07006228 - 0x07006258
gsSPDisplayList main_menu_seg7_dl_07006150
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, main_menu_seg7_texture_07004468
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList main_menu_seg7_dl_07006198
gsSPEndDisplayList

glabel main_menu_seg7_dl_07006258 # 0x07006258 - 0x07006288
gsSPDisplayList main_menu_seg7_dl_07006150
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, main_menu_seg7_texture_07004C68
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList main_menu_seg7_dl_07006198
gsSPEndDisplayList

glabel main_menu_seg7_dl_07006288 # 0x07006288 - 0x070062B8
gsSPDisplayList main_menu_seg7_dl_07006150
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, main_menu_seg7_texture_07005468
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList main_menu_seg7_dl_07006198
gsSPEndDisplayList

glabel main_menu_seg7_dl_070062B8 # 0x070062B8 - 0x070062E8
gsSPDisplayList main_menu_seg7_dl_07006150
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, main_menu_seg7_texture_07000018
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList main_menu_seg7_dl_07006198
gsSPEndDisplayList

main_menu_seg7_vertex_070062E8: # 0x070062E8 - 0x07006328
vertex      0,      0,      0,      0,   1984,  0x00, 0x00, 0x7F, 0xFF
vertex     32,      0,      0,   1984,   1984,  0x00, 0x00, 0x7F, 0xFF
vertex     32,     32,      0,   1984,      0,  0x00, 0x00, 0x7F, 0xFF
vertex      0,     32,      0,      0,      0,  0x00, 0x00, 0x7F, 0xFF

main_menu_seg7_texture_07006328: # 0x07006328 - 0x07006B28
.incbin "levels/menu/main_menu_seg7.06328.rgba16"

main_menu_seg7_texture_07006B28: # 0x07006B28 - 0x07007328
.incbin "levels/menu/main_menu_seg7.06B28.rgba16"

main_menu_seg7_dl_07007328: # 0x07007328 - 0x070073A0
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0

# There were multiple matching pairs, so I don't know if this is correct or not.
gsDPSetRenderMode G_RM_AA_TEX_EDGE, G_RM_AA_TEX_EDGE2
# It could also be one of these:
# G_RM_RA_OPA_SURF, G_RM_AA_TEX_EDGE2; G_RM_AA_TEX_EDGE, G_RM_AA_OPA_SURF2; G_RM_AA_TEX_EDGE, G_RM_RA_OPA_SURF2;
# G_RM_AA_OPA_SURF, G_RM_AA_TEX_EDGE2;

gsSPTexture -32768, -32768, 0, 0, 1
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPVertex main_menu_seg7_vertex_070062E8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture 1, 1, 0, 0, 0

# There were multiple matching pairs, so I don't know if this is correct or not.
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2
# It could also be one of these:
# G_RM_AA_ZB_OPA_SURF, G_RM_RA_ZB_OPA_SURF2; G_RM_AA_ZB_OPA_SURF, G_RM_AA_OPA_SURF2; G_RM_AA_ZB_OPA_SURF, G_RM_RA_OPA_SURF2;
# G_RM_RA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2; G_RM_RA_ZB_OPA_SURF, G_RM_AA_OPA_SURF2; G_RM_AA_OPA_SURF, G_RM_AA_ZB_OPA_SURF2;
# G_RM_AA_OPA_SURF, G_RM_RA_ZB_OPA_SURF2; G_RM_RA_OPA_SURF, G_RM_AA_ZB_OPA_SURF2

gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

glabel main_menu_seg7_dl_070073A0 # 0x070073A0 - 0x070073B8
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, main_menu_seg7_texture_07006328
gsSPBranchList main_menu_seg7_dl_07007328

glabel main_menu_seg7_dl_070073B8 # 0x070073B8 - 0x070073D0
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, main_menu_seg7_texture_07006B28
gsSPBranchList main_menu_seg7_dl_07007328

main_menu_seg7_texture_070073D0: # 0x070073D0
.incbin "levels/menu/main_menu_seg7.073D0.rgba16"
main_menu_seg7_texture_070075D0: # 0x070075D0
.incbin "levels/menu/main_menu_seg7.075D0.rgba16"
main_menu_seg7_texture_070077D0: # 0x070077D0
.incbin "levels/menu/main_menu_seg7.077D0.rgba16"
main_menu_seg7_texture_070079D0: # 0x070079D0
.incbin "levels/menu/main_menu_seg7.079D0.rgba16"
main_menu_seg7_texture_07007BD0: # 0x07007BD0
.incbin "levels/menu/main_menu_seg7.07BD0.rgba16"
main_menu_seg7_texture_07007DD0: # 0x07007DD0
.incbin "levels/menu/main_menu_seg7.07DD0.rgba16"
main_menu_seg7_texture_07007FD0: # 0x07007FD0
.incbin "levels/menu/main_menu_seg7.07FD0.rgba16"
main_menu_seg7_texture_070081D0: # 0x070081D0
.incbin "levels/menu/main_menu_seg7.081D0.rgba16"
main_menu_seg7_texture_070083D0: # 0x070083D0
.incbin "levels/menu/main_menu_seg7.083D0.rgba16"
main_menu_seg7_texture_070085D0: # 0x070085D0
.incbin "levels/menu/main_menu_seg7.085D0.rgba16"
main_menu_seg7_texture_070087D0: # 0x070087D0
.incbin "levels/menu/main_menu_seg7.087D0.rgba16"
main_menu_seg7_texture_070089D0: # 0x070089D0
.incbin "levels/menu/main_menu_seg7.089D0.rgba16"
main_menu_seg7_texture_07008BD0: # 0x07008BD0
.incbin "levels/menu/main_menu_seg7.08BD0.rgba16"
main_menu_seg7_texture_07008DD0: # 0x07008DD0
.incbin "levels/menu/main_menu_seg7.08DD0.rgba16"
main_menu_seg7_texture_07008FD0: # 0x07008FD0
.incbin "levels/menu/main_menu_seg7.08FD0.rgba16"
main_menu_seg7_texture_070091D0: # 0x070091D0
.incbin "levels/menu/main_menu_seg7.091D0.rgba16"
main_menu_seg7_texture_070093D0: # 0x070093D0
.incbin "levels/menu/main_menu_seg7.093D0.rgba16"
main_menu_seg7_texture_070095D0: # 0x070095D0
.incbin "levels/menu/main_menu_seg7.095D0.rgba16"
main_menu_seg7_texture_070097D0: # 0x070097D0
.incbin "levels/menu/main_menu_seg7.097D0.rgba16"
main_menu_seg7_texture_070099D0: # 0x070099D0
.incbin "levels/menu/main_menu_seg7.099D0.rgba16"
main_menu_seg7_texture_07009BD0: # 0x07009BD0
.incbin "levels/menu/main_menu_seg7.09BD0.rgba16"
main_menu_seg7_texture_07009DD0: # 0x07009DD0
.incbin "levels/menu/main_menu_seg7.09DD0.rgba16"
main_menu_seg7_texture_07009FD0: # 0x07009FD0
.incbin "levels/menu/main_menu_seg7.09FD0.rgba16"
main_menu_seg7_texture_0700A1D0: # 0x0700A1D0
.incbin "levels/menu/main_menu_seg7.0A1D0.rgba16"
main_menu_seg7_texture_0700A3D0: # 0x0700A3D0
.incbin "levels/menu/main_menu_seg7.0A3D0.rgba16"
main_menu_seg7_texture_0700A5D0: # 0x0700A5D0
.incbin "levels/menu/main_menu_seg7.0A5D0.rgba16"
main_menu_seg7_texture_0700A7D0: # 0x0700A7D0
.incbin "levels/menu/main_menu_seg7.0A7D0.rgba16"
main_menu_seg7_texture_0700A9D0: # 0x0700A9D0
.incbin "levels/menu/main_menu_seg7.0A9D0.rgba16"

glabel main_menu_seg7_table_0700ABD0 # 0x0700ABD0
.word main_menu_seg7_texture_070073D0, main_menu_seg7_texture_070075D0, main_menu_seg7_texture_070077D0, main_menu_seg7_texture_070079D0
.word main_menu_seg7_texture_07007BD0, main_menu_seg7_texture_07007DD0, main_menu_seg7_texture_07007FD0, main_menu_seg7_texture_070081D0
.word main_menu_seg7_texture_070083D0, main_menu_seg7_texture_070085D0, main_menu_seg7_texture_070087D0, main_menu_seg7_texture_070089D0
.word main_menu_seg7_texture_07008BD0, main_menu_seg7_texture_07008DD0, main_menu_seg7_texture_07008FD0, main_menu_seg7_texture_070091D0
.word main_menu_seg7_texture_070093D0, main_menu_seg7_texture_070095D0, main_menu_seg7_texture_070097D0, main_menu_seg7_texture_070099D0
.word main_menu_seg7_texture_07009BD0, main_menu_seg7_texture_07009DD0, main_menu_seg7_texture_07009FD0, main_menu_seg7_texture_0700A1D0
.word main_menu_seg7_texture_0700A3D0, main_menu_seg7_texture_0700A5D0, main_menu_seg7_texture_0700A7D0, main_menu_seg7_texture_0700A9D0

.ifdef VERSION_JP
.word 0x00000000, 0x00000000

main_menu_seg7_texture_0700AC48: # 0x0700AC48
.incbin "levels/menu/main_menu_seg7.0AC48.ia8"
main_menu_seg7_texture_0700AC88: # 0x0700AC88
.incbin "levels/menu/main_menu_seg7.0AC88.ia8"
main_menu_seg7_texture_0700ACC8: # 0x0700ACC8
.incbin "levels/menu/main_menu_seg7.0ACC8.ia8"
main_menu_seg7_texture_0700AD08: # 0x0700AD08
.incbin "levels/menu/main_menu_seg7.0AD08.ia8"
main_menu_seg7_texture_0700AD48: # 0x0700AD48
.incbin "levels/menu/main_menu_seg7.0AD48.ia8"
main_menu_seg7_texture_0700AD88: # 0x0700AD88
.incbin "levels/menu/main_menu_seg7.0AD88.ia8"
main_menu_seg7_texture_0700ADC8: # 0x0700ADC8
.incbin "levels/menu/main_menu_seg7.0ADC8.ia8"
main_menu_seg7_texture_0700AE08: # 0x0700AE08
.incbin "levels/menu/main_menu_seg7.0AE08.ia8"
main_menu_seg7_texture_0700AE48: # 0x0700AE48
.incbin "levels/menu/main_menu_seg7.0AE48.ia8"
main_menu_seg7_texture_0700AE88: # 0x0700AE88
.incbin "levels/menu/main_menu_seg7.0AE88.ia8"
main_menu_seg7_texture_0700AEC8: # 0x0700AEC8
.incbin "levels/menu/main_menu_seg7.0AEC8.ia8"
main_menu_seg7_texture_0700AF08: # 0x0700AF08
.incbin "levels/menu/main_menu_seg7.0AF08.ia8"
main_menu_seg7_texture_0700AF48: # 0x0700AF48
.incbin "levels/menu/main_menu_seg7.0AF48.ia8"
main_menu_seg7_texture_0700AF88: # 0x0700AF88
.incbin "levels/menu/main_menu_seg7.0AF88.ia8"
main_menu_seg7_texture_0700AFC8: # 0x0700AFC8
.incbin "levels/menu/main_menu_seg7.0AFC8.ia8"
main_menu_seg7_texture_0700B008: # 0x0700B008
.incbin "levels/menu/main_menu_seg7.0B008.ia8"
main_menu_seg7_texture_0700B048: # 0x0700B048
.incbin "levels/menu/main_menu_seg7.0B048.ia8"
main_menu_seg7_texture_0700B088: # 0x0700B088
.incbin "levels/menu/main_menu_seg7.0B088.ia8"
main_menu_seg7_texture_0700B0C8: # 0x0700B0C8
.incbin "levels/menu/main_menu_seg7.0B0C8.ia8"
main_menu_seg7_texture_0700B108: # 0x0700B108
.incbin "levels/menu/main_menu_seg7.0B108.ia8"
main_menu_seg7_texture_0700B148: # 0x0700B148
.incbin "levels/menu/main_menu_seg7.0B148.ia8"
main_menu_seg7_texture_0700B188: # 0x0700B188
.incbin "levels/menu/main_menu_seg7.0B188.ia8"
main_menu_seg7_texture_0700B1C8: # 0x0700B1C8
.incbin "levels/menu/main_menu_seg7.0B1C8.ia8"
main_menu_seg7_texture_0700B208: # 0x0700B208
.incbin "levels/menu/main_menu_seg7.0B208.ia8"
main_menu_seg7_texture_0700B248: # 0x0700B248
.incbin "levels/menu/main_menu_seg7.0B248.ia8"
main_menu_seg7_texture_0700B288: # 0x0700B288
.incbin "levels/menu/main_menu_seg7.0B288.ia8"
main_menu_seg7_texture_0700B2C8: # 0x0700B2C8
.incbin "levels/menu/main_menu_seg7.0B2C8.ia8"
main_menu_seg7_texture_0700B308: # 0x0700B308
.incbin "levels/menu/main_menu_seg7.0B308.ia8"
main_menu_seg7_texture_0700B348: # 0x0700B348
.incbin "levels/menu/main_menu_seg7.0B348.ia8"
main_menu_seg7_texture_0700B388: # 0x0700B388
.incbin "levels/menu/main_menu_seg7.0B388.ia8"
main_menu_seg7_texture_0700B3C8: # 0x0700B3C8
.incbin "levels/menu/main_menu_seg7.0B3C8.ia8"
main_menu_seg7_texture_0700B408: # 0x0700B408
.incbin "levels/menu/main_menu_seg7.0B408.ia8"
main_menu_seg7_texture_0700B448: # 0x0700B448
.incbin "levels/menu/main_menu_seg7.0B448.ia8"
main_menu_seg7_texture_0700B488: # 0x0700B488
.incbin "levels/menu/main_menu_seg7.0B488.ia8"
main_menu_seg7_texture_0700B4C8: # 0x0700B4C8
.incbin "levels/menu/main_menu_seg7.0B4C8.ia8"
main_menu_seg7_texture_0700B508: # 0x0700B508
.incbin "levels/menu/main_menu_seg7.0B508.ia8"
main_menu_seg7_texture_0700B548: # 0x0700B548
.incbin "levels/menu/main_menu_seg7.0B548.ia8"
main_menu_seg7_texture_0700B588: # 0x0700B588
.incbin "levels/menu/main_menu_seg7.0B588.ia8"
main_menu_seg7_texture_0700B5C8: # 0x0700B5C8
.incbin "levels/menu/main_menu_seg7.0B5C8.ia8"
main_menu_seg7_texture_0700B608: # 0x0700B608
.incbin "levels/menu/main_menu_seg7.0B608.ia8"
main_menu_seg7_texture_0700B648: # 0x0700B648
.incbin "levels/menu/main_menu_seg7.0B648.ia8"
main_menu_seg7_texture_0700B688: # 0x0700B688
.incbin "levels/menu/main_menu_seg7.0B688.ia8"
main_menu_seg7_texture_0700B6C8: # 0x0700B6C8
.incbin "levels/menu/main_menu_seg7.0B6C8.ia8"
main_menu_seg7_texture_0700B708: # 0x0700B708
.incbin "levels/menu/main_menu_seg7.0B708.ia8"
main_menu_seg7_texture_0700B748: # 0x0700B748
.incbin "levels/menu/main_menu_seg7.0B748.ia8"
main_menu_seg7_texture_0700B788: # 0x0700B788
.incbin "levels/menu/main_menu_seg7.0B788.ia8"
main_menu_seg7_texture_0700B7C8: # 0x0700B7C8
.incbin "levels/menu/main_menu_seg7.0B7C8.ia8"
main_menu_seg7_texture_0700B808: # 0x0700B808
.incbin "levels/menu/main_menu_seg7.0B808.ia8"
main_menu_seg7_texture_0700B848: # 0x0700B848
.incbin "levels/menu/main_menu_seg7.0B848.ia8"
main_menu_seg7_texture_0700B888: # 0x0700B888
.incbin "levels/menu/main_menu_seg7.0B888.ia8"
main_menu_seg7_texture_0700B8C8: # 0x0700B8C8
.incbin "levels/menu/main_menu_seg7.0B8C8.ia8"
main_menu_seg7_texture_0700B908: # 0x0700B908
.incbin "levels/menu/main_menu_seg7.0B908.ia8"
main_menu_seg7_texture_0700B948: # 0x0700B948
.incbin "levels/menu/main_menu_seg7.0B948.ia8"
main_menu_seg7_texture_0700B988: # 0x0700B988
.incbin "levels/menu/main_menu_seg7.0B988.ia8"
main_menu_seg7_texture_0700B9C8: # 0x0700B9C8
.incbin "levels/menu/main_menu_seg7.0B9C8.ia8"
main_menu_seg7_texture_0700BA08: # 0x0700BA08
.incbin "levels/menu/main_menu_seg7.0BA08.ia8"
main_menu_seg7_texture_0700BA48: # 0x0700BA48
.incbin "levels/menu/main_menu_seg7.0BA48.ia8"
main_menu_seg7_texture_0700BA88: # 0x0700BA88
.incbin "levels/menu/main_menu_seg7.0BA88.ia8"
main_menu_seg7_texture_0700BAC8: # 0x0700BAC8
.incbin "levels/menu/main_menu_seg7.0BAC8.ia8"
main_menu_seg7_texture_0700BB08: # 0x0700BB08
.incbin "levels/menu/main_menu_seg7.0BB08.ia8"
main_menu_seg7_texture_0700BB48: # 0x0700BB48
.incbin "levels/menu/main_menu_seg7.0BB48.ia8"
main_menu_seg7_texture_0700BB88: # 0x0700BB88
.incbin "levels/menu/main_menu_seg7.0BB88.ia8"
main_menu_seg7_texture_0700BBC8: # 0x0700BBC8
.incbin "levels/menu/main_menu_seg7.0BBC8.ia8"
main_menu_seg7_texture_0700BC08: # 0x0700BC08
.incbin "levels/menu/main_menu_seg7.0BC08.ia8"
main_menu_seg7_texture_0700BC48: # 0x0700BC48
.incbin "levels/menu/main_menu_seg7.0BC48.ia8"
main_menu_seg7_texture_0700BC88: # 0x0700BC88
.incbin "levels/menu/main_menu_seg7.0BC88.ia8"
main_menu_seg7_texture_0700BCC8: # 0x0700BCC8
.incbin "levels/menu/main_menu_seg7.0BCC8.ia8"
main_menu_seg7_texture_0700BD08: # 0x0700BD08
.incbin "levels/menu/main_menu_seg7.0BD08.ia8"
main_menu_seg7_texture_0700BD48: # 0x0700BD48
.incbin "levels/menu/main_menu_seg7.0BD48.ia8"
main_menu_seg7_texture_0700BD88: # 0x0700BD88
.incbin "levels/menu/main_menu_seg7.0BD88.ia8"
main_menu_seg7_texture_0700BDC8: # 0x0700BDC8
.incbin "levels/menu/main_menu_seg7.0BDC8.ia8"
main_menu_seg7_texture_0700BE08: # 0x0700BE08
.incbin "levels/menu/main_menu_seg7.0BE08.ia8"
main_menu_seg7_texture_0700BE48: # 0x0700BE48
.incbin "levels/menu/main_menu_seg7.0BE48.ia8"
main_menu_seg7_texture_0700BE88: # 0x0700BE88
.incbin "levels/menu/main_menu_seg7.0BE88.ia8"
main_menu_seg7_texture_0700BEC8: # 0x0700BEC8
.incbin "levels/menu/main_menu_seg7.0BEC8.ia8"
main_menu_seg7_texture_0700BF08: # 0x0700BF08
.incbin "levels/menu/main_menu_seg7.0BF08.ia8"
main_menu_seg7_texture_0700BF48: # 0x0700BF48
.incbin "levels/menu/main_menu_seg7.0BF48.ia8"
main_menu_seg7_texture_0700BF88: # 0x0700BF88
.incbin "levels/menu/main_menu_seg7.0BF88.ia8"
main_menu_seg7_texture_0700BFC8: # 0x0700BFC8
.incbin "levels/menu/main_menu_seg7.0BFC8.ia8"
main_menu_seg7_texture_0700C008: # 0x0700C008
.incbin "levels/menu/main_menu_seg7.0C008.ia8"
main_menu_seg7_texture_0700C048: # 0x0700C048
.incbin "levels/menu/main_menu_seg7.0C048.ia8"
main_menu_seg7_texture_0700C088: # 0x0700C088
.incbin "levels/menu/main_menu_seg7.0C088.ia8"
main_menu_seg7_texture_0700C0C8: # 0x0700C0C8
.incbin "levels/menu/main_menu_seg7.0C0C8.ia8"
main_menu_seg7_texture_0700C108: # 0x0700C108
.incbin "levels/menu/main_menu_seg7.0C108.ia8"
main_menu_seg7_texture_0700C148: # 0x0700C148
.incbin "levels/menu/main_menu_seg7.0C148.ia8"
main_menu_seg7_texture_0700C188: # 0x0700C188
.incbin "levels/menu/main_menu_seg7.0C188.ia8"
main_menu_seg7_texture_0700C1C8: # 0x0700C1C8
.incbin "levels/menu/main_menu_seg7.0C1C8.ia8"
main_menu_seg7_texture_0700C208: # 0x0700C208
.incbin "levels/menu/main_menu_seg7.0C208.ia8"
main_menu_seg7_texture_0700C248: # 0x0700C248
.incbin "levels/menu/main_menu_seg7.0C248.ia8"
main_menu_seg7_texture_0700C288: # 0x0700C288
.incbin "levels/menu/main_menu_seg7.0C288.ia8"
main_menu_seg7_texture_0700C2C8: # 0x0700C2C8
.incbin "levels/menu/main_menu_seg7.0C2C8.ia8"
main_menu_seg7_texture_0700C308: # 0x0700C308
.incbin "levels/menu/main_menu_seg7.0C308.ia8"
main_menu_seg7_texture_0700C348: # 0x0700C348
.incbin "levels/menu/main_menu_seg7.0C348.ia8"
main_menu_seg7_texture_0700C388: # 0x0700C388
.incbin "levels/menu/main_menu_seg7.0C388.ia8"
main_menu_seg7_texture_0700C3C8: # 0x0700C3C8
.incbin "levels/menu/main_menu_seg7.0C3C8.ia8"
main_menu_seg7_texture_0700C408: # 0x0700C408
.incbin "levels/menu/main_menu_seg7.0C408.ia8"
main_menu_seg7_texture_0700C448: # 0x0700C448
.incbin "levels/menu/main_menu_seg7.0C448.ia8"
main_menu_seg7_texture_0700C488: # 0x0700C488
.incbin "levels/menu/main_menu_seg7.0C488.ia8"
main_menu_seg7_texture_0700C4C8: # 0x0700C4C8
.incbin "levels/menu/main_menu_seg7.0C4C8.ia8"
main_menu_seg7_texture_0700C508: # 0x0700C508
.incbin "levels/menu/main_menu_seg7.0C508.ia8"
main_menu_seg7_texture_0700C548: # 0x0700C548
.incbin "levels/menu/main_menu_seg7.0C548.ia8"
main_menu_seg7_texture_0700C588: # 0x0700C588
.incbin "levels/menu/main_menu_seg7.0C588.ia8"
main_menu_seg7_texture_0700C5C8: # 0x0700C5C8
.incbin "levels/menu/main_menu_seg7.0C5C8.ia8"
main_menu_seg7_texture_0700C608: # 0x0700C608
.incbin "levels/menu/main_menu_seg7.0C608.ia8"
main_menu_seg7_texture_0700C648: # 0x0700C648
.incbin "levels/menu/main_menu_seg7.0C648.ia8"
main_menu_seg7_texture_0700C688: # 0x0700C688
.incbin "levels/menu/main_menu_seg7.0C688.ia8"
main_menu_seg7_texture_0700C6C8: # 0x0700C6C8
.incbin "levels/menu/main_menu_seg7.0C6C8.ia8"
main_menu_seg7_texture_0700C708: # 0x0700C708
.incbin "levels/menu/main_menu_seg7.0C708.ia8"
main_menu_seg7_texture_0700C748: # 0x0700C748
.incbin "levels/menu/main_menu_seg7.0C748.ia8"
main_menu_seg7_texture_0700C788: # 0x0700C788
.incbin "levels/menu/main_menu_seg7.0C788.ia8"
main_menu_seg7_texture_0700C7C8: # 0x0700C7C8
.incbin "levels/menu/main_menu_seg7.0C7C8.ia8"
main_menu_seg7_texture_0700C808: # 0x0700C808
.incbin "levels/menu/main_menu_seg7.0C808.ia8"
main_menu_seg7_texture_0700C848: # 0x0700C848
.incbin "levels/menu/main_menu_seg7.0C848.ia8"
main_menu_seg7_texture_0700C888: # 0x0700C888
.incbin "levels/menu/main_menu_seg7.0C888.ia8"
main_menu_seg7_texture_0700C8C8: # 0x0700C8C8
.incbin "levels/menu/main_menu_seg7.0C8C8.ia8"
main_menu_seg7_texture_0700C908: # 0x0700C908
.incbin "levels/menu/main_menu_seg7.0C908.ia8"
main_menu_seg7_texture_0700C948: # 0x0700C948
.incbin "levels/menu/main_menu_seg7.0C948.ia8"
main_menu_seg7_texture_0700C988: # 0x0700C988
.incbin "levels/menu/main_menu_seg7.0C988.ia8"
main_menu_seg7_texture_0700C9C8: # 0x0700C9C8
.incbin "levels/menu/main_menu_seg7.0C9C8.ia8"
main_menu_seg7_texture_0700CA08: # 0x0700CA08
.incbin "levels/menu/main_menu_seg7.0CA08.ia8"
main_menu_seg7_texture_0700CA48: # 0x0700CA48
.incbin "levels/menu/main_menu_seg7.0CA48.ia8"
main_menu_seg7_texture_0700CA88: # 0x0700CA88
.incbin "levels/menu/main_menu_seg7.0CA88.ia8"
main_menu_seg7_texture_0700CAC8: # 0x0700CAC8
.incbin "levels/menu/main_menu_seg7.0CAC8.ia8"
main_menu_seg7_texture_0700CB08: # 0x0700CB08
.incbin "levels/menu/main_menu_seg7.0CB08.ia8"
main_menu_seg7_texture_0700CB48: # 0x0700CB48
.incbin "levels/menu/main_menu_seg7.0CB48.ia8"
main_menu_seg7_texture_0700CB88: # 0x0700CB88
.incbin "levels/menu/main_menu_seg7.0CB88.ia8"
main_menu_seg7_texture_0700CBC8: # 0x0700CBC8
.incbin "levels/menu/main_menu_seg7.0CBC8.ia8"
main_menu_seg7_texture_0700CC08: # 0x0700CC08
.incbin "levels/menu/main_menu_seg7.0CC08.ia8"
main_menu_seg7_texture_0700CC48: # 0x0700CC48
.incbin "levels/menu/main_menu_seg7.0CC48.ia8"
main_menu_seg7_texture_0700CC88: # 0x0700CC88
.incbin "levels/menu/main_menu_seg7.0CC88.ia8"
main_menu_seg7_texture_0700CCC8: # 0x0700CCC8
.incbin "levels/menu/main_menu_seg7.0CCC8.ia8"
.else
texture_0700AC40: # 0x0700AC40
.incbin "levels/menu/main_menu_seg7_us.0AC40.ia8"

texture_0700AC80: # 0x0700AC80
.incbin "levels/menu/main_menu_seg7_us.0AC80.ia8"

texture_0700ACC0: # 0x0700ACC0
.incbin "levels/menu/main_menu_seg7_us.0ACC0.ia8"

texture_0700AD00: # 0x0700AD00
.incbin "levels/menu/main_menu_seg7_us.0AD00.ia8"

texture_0700AD40: # 0x0700AD40
.incbin "levels/menu/main_menu_seg7_us.0AD40.ia8"

texture_0700AD80: # 0x0700AD80
.incbin "levels/menu/main_menu_seg7_us.0AD80.ia8"

texture_0700ADC0: # 0x0700ADC0
.incbin "levels/menu/main_menu_seg7_us.0ADC0.ia8"

texture_0700AE00: # 0x0700AE00
.incbin "levels/menu/main_menu_seg7_us.0AE00.ia8"

texture_0700AE40: # 0x0700AE40
.incbin "levels/menu/main_menu_seg7_us.0AE40.ia8"

texture_0700AE80: # 0x0700AE80
.incbin "levels/menu/main_menu_seg7_us.0AE80.ia8"

texture_0700AEC0: # 0x0700AEC0
.incbin "levels/menu/main_menu_seg7_us.0AEC0.ia8"

texture_0700AF00: # 0x0700AF00
.incbin "levels/menu/main_menu_seg7_us.0AF00.ia8"

texture_0700AF40: # 0x0700AF40
.incbin "levels/menu/main_menu_seg7_us.0AF40.ia8"

texture_0700AF80: # 0x0700AF80
.ifdef VERSION_EU
.incbin "levels/menu/main_menu_seg7_eu.0AF80.ia8"
.else
.incbin "levels/menu/main_menu_seg7_us.0AF80.ia8"
.endif

texture_0700AFC0: # 0x0700AFC0
.incbin "levels/menu/main_menu_seg7_us.0AFC0.ia8"

texture_0700B000: # 0x0700B000
.incbin "levels/menu/main_menu_seg7_us.0B000.ia8"

texture_0700B040: # 0x0700B040
.incbin "levels/menu/main_menu_seg7_us.0B040.ia8"

texture_0700B080: # 0x0700B080
.incbin "levels/menu/main_menu_seg7_us.0B080.ia8"

texture_0700B0C0: # 0x0700B0C0
.incbin "levels/menu/main_menu_seg7_us.0B0C0.ia8"

texture_0700B100: # 0x0700B100
.incbin "levels/menu/main_menu_seg7_us.0B100.ia8"

texture_0700B140: # 0x0700B140
.incbin "levels/menu/main_menu_seg7_us.0B140.ia8"

texture_0700B180: # 0x0700B180
.incbin "levels/menu/main_menu_seg7_us.0B180.ia8"

texture_0700B1C0: # 0x0700B1C0
.incbin "levels/menu/main_menu_seg7_us.0B1C0.ia8"

texture_0700B200: # 0x0700B200
.incbin "levels/menu/main_menu_seg7_us.0B200.ia8"

texture_0700B240: # 0x0700B240
.incbin "levels/menu/main_menu_seg7_us.0B240.ia8"

texture_0700B280: # 0x0700B280
.incbin "levels/menu/main_menu_seg7_us.0B280.ia8"

texture_0700B2C0: # 0x0700B2C0
.incbin "levels/menu/main_menu_seg7_us.0B2C0.ia8"

texture_0700B300: # 0x0700B300
.incbin "levels/menu/main_menu_seg7_us.0B300.ia8"

texture_0700B340: # 0x0700B340
.incbin "levels/menu/main_menu_seg7_us.0B340.ia8"

texture_0700B380: # 0x0700B380
.incbin "levels/menu/main_menu_seg7_us.0B380.ia8"

texture_0700B3C0: # 0x0700B3C0
.incbin "levels/menu/main_menu_seg7_us.0B3C0.ia8"

texture_0700B400: # 0x0700B400
.incbin "levels/menu/main_menu_seg7_us.0B400.ia8"

texture_0700B440: # 0x0700B440
.incbin "levels/menu/main_menu_seg7_us.0B440.ia8"

texture_0700B480: # 0x0700B480
.incbin "levels/menu/main_menu_seg7_us.0B480.ia8"

texture_0700B4C0: # 0x0700B4C0
.incbin "levels/menu/main_menu_seg7_us.0B4C0.ia8"

texture_0700B500: # 0x0700B500
.incbin "levels/menu/main_menu_seg7_us.0B500.ia8"

texture_0700B540: # 0x0700B540
.incbin "levels/menu/main_menu_seg7_us.0B540.ia8"

texture_0700B580: # 0x0700B580
.incbin "levels/menu/main_menu_seg7_us.0B580.ia8"

texture_0700B5C0: # 0x0700B5C0
.incbin "levels/menu/main_menu_seg7_us.0B5C0.ia8"

texture_0700B600: # 0x0700B600
.incbin "levels/menu/main_menu_seg7_us.0B600.ia8"

texture_0700B640: # 0x0700B640
.ifdef VERSION_EU
.incbin "levels/menu/main_menu_seg7_eu.0B640.ia8"
.else
.incbin "levels/menu/main_menu_seg7_us.0B640.ia8"
.endif

texture_0700B680: # 0x0700B680
.ifdef VERSION_EU
.incbin "levels/menu/main_menu_seg7_eu.0B680.ia8"
.else
.incbin "levels/menu/main_menu_seg7_us.0B680.ia8"
.endif

texture_0700B6C0: # 0x0700B6C0
.incbin "levels/menu/main_menu_seg7_us.0B6C0.ia8"

texture_0700B700: # 0x0700B700
.incbin "levels/menu/main_menu_seg7_us.0B700.ia8"

texture_0700B740: # 0x0700B740
.incbin "levels/menu/main_menu_seg7_us.0B740.ia8"

texture_0700B780: # 0x0700B780
.incbin "levels/menu/main_menu_seg7_us.0B780.ia8"

texture_0700B7C0: # 0x0700B7C0
.incbin "levels/menu/main_menu_seg7_us.0B7C0.ia8"

texture_0700B800: # 0x0700B800
.incbin "levels/menu/main_menu_seg7_us.0B800.ia8"
.endif

.ifdef VERSION_EU
texture_0700B840: # 0x0700B840
.incbin "levels/menu/main_menu_seg7_eu.0B840.ia8"

texture_0700B880: # 0x0700B880
.incbin "levels/menu/main_menu_seg7_eu.0B880.ia8"

texture_0700B8C0: # 0x0700B8C0
.incbin "levels/menu/main_menu_seg7_eu.0B8C0.ia8"
.endif

glabel main_menu_seg7_table_0700CD08 # 0x0700CD08
.ifdef VERSION_JP
.word main_menu_seg7_texture_0700AC48, main_menu_seg7_texture_0700AC88, main_menu_seg7_texture_0700ACC8, main_menu_seg7_texture_0700AD08
.word main_menu_seg7_texture_0700AD48, main_menu_seg7_texture_0700AD88, main_menu_seg7_texture_0700ADC8, main_menu_seg7_texture_0700AE08
.word main_menu_seg7_texture_0700AE48, main_menu_seg7_texture_0700AE88, main_menu_seg7_texture_0700CB08, main_menu_seg7_texture_0700CB48
.word main_menu_seg7_texture_0700CB88, main_menu_seg7_texture_0700CBC8, 0x00000000,         0x00000000
.word 0x00000000,         0x00000000,         0x00000000,         0x00000000
.word 0x00000000,         0x00000000,         0x00000000,         0x00000000
.word 0x00000000,         0x00000000,         0x00000000,         0x00000000
.word 0x00000000,         0x00000000,         0x00000000,         0x00000000
.word 0x00000000,         0x00000000,         0x00000000,         0x00000000
.word 0x00000000,         0x00000000,         0x00000000,         0x00000000
.word 0x00000000,         0x00000000,         0x00000000,         0x00000000
.word 0x00000000,         0x00000000,         0x00000000,         0x00000000
.word 0x00000000,         0x00000000,         0x00000000,         0x00000000
.word 0x00000000,         0x00000000,         0x00000000,         0x00000000
.word 0x00000000,         0x00000000,         0x00000000,         0x00000000
.word 0x00000000,         0x00000000,         0x00000000,         0x00000000
.word main_menu_seg7_texture_0700AEC8, main_menu_seg7_texture_0700AF08, main_menu_seg7_texture_0700AF48, main_menu_seg7_texture_0700AF88
.word main_menu_seg7_texture_0700AFC8, main_menu_seg7_texture_0700B008, main_menu_seg7_texture_0700B048, main_menu_seg7_texture_0700B088
.word main_menu_seg7_texture_0700B0C8, main_menu_seg7_texture_0700B108, main_menu_seg7_texture_0700B148, main_menu_seg7_texture_0700B188
.word main_menu_seg7_texture_0700B1C8, main_menu_seg7_texture_0700B208, main_menu_seg7_texture_0700B248, main_menu_seg7_texture_0700B288
.word main_menu_seg7_texture_0700B2C8, main_menu_seg7_texture_0700B308, main_menu_seg7_texture_0700B348, main_menu_seg7_texture_0700B388
.word main_menu_seg7_texture_0700B3C8, main_menu_seg7_texture_0700B408, main_menu_seg7_texture_0700B448, main_menu_seg7_texture_0700B488
.word main_menu_seg7_texture_0700B4C8, main_menu_seg7_texture_0700B508, main_menu_seg7_texture_0700B548, main_menu_seg7_texture_0700B588
.word main_menu_seg7_texture_0700B5C8, main_menu_seg7_texture_0700B608, main_menu_seg7_texture_0700B648, main_menu_seg7_texture_0700B688
.word main_menu_seg7_texture_0700B6C8, main_menu_seg7_texture_0700B708, main_menu_seg7_texture_0700B748, main_menu_seg7_texture_0700B788
.word main_menu_seg7_texture_0700B7C8, main_menu_seg7_texture_0700B808, main_menu_seg7_texture_0700B848, main_menu_seg7_texture_0700B888
.word main_menu_seg7_texture_0700B8C8, main_menu_seg7_texture_0700B908, main_menu_seg7_texture_0700B948, main_menu_seg7_texture_0700B988
.word main_menu_seg7_texture_0700B9C8, main_menu_seg7_texture_0700BA08, 0x00000000,         0x00000000
.word main_menu_seg7_texture_0700BD48, main_menu_seg7_texture_0700BD88, main_menu_seg7_texture_0700BDC8, main_menu_seg7_texture_0700BE08
.word main_menu_seg7_texture_0700BE48, main_menu_seg7_texture_0700BE88, main_menu_seg7_texture_0700BEC8, main_menu_seg7_texture_0700BF08
.word main_menu_seg7_texture_0700BF48, main_menu_seg7_texture_0700BF88, main_menu_seg7_texture_0700BFC8, main_menu_seg7_texture_0700C008
.word main_menu_seg7_texture_0700C048, main_menu_seg7_texture_0700C088, main_menu_seg7_texture_0700C0C8, main_menu_seg7_texture_0700C108
.word main_menu_seg7_texture_0700C148, main_menu_seg7_texture_0700C188, main_menu_seg7_texture_0700C1C8, main_menu_seg7_texture_0700C208
.word main_menu_seg7_texture_0700C248, main_menu_seg7_texture_0700C288, main_menu_seg7_texture_0700C2C8, main_menu_seg7_texture_0700C308
.word main_menu_seg7_texture_0700C348, main_menu_seg7_texture_0700C388, main_menu_seg7_texture_0700C3C8, main_menu_seg7_texture_0700C408
.word main_menu_seg7_texture_0700C448, main_menu_seg7_texture_0700C488, main_menu_seg7_texture_0700C4C8, main_menu_seg7_texture_0700C508
.word main_menu_seg7_texture_0700C548, main_menu_seg7_texture_0700C588, main_menu_seg7_texture_0700C5C8, main_menu_seg7_texture_0700C608
.word main_menu_seg7_texture_0700C648, main_menu_seg7_texture_0700C688, main_menu_seg7_texture_0700C6C8, main_menu_seg7_texture_0700C708
.word main_menu_seg7_texture_0700C748, main_menu_seg7_texture_0700C788, main_menu_seg7_texture_0700C7C8, main_menu_seg7_texture_0700C808
.word main_menu_seg7_texture_0700C848, main_menu_seg7_texture_0700C888, 0x00000000,         main_menu_seg7_texture_0700BD08
.word main_menu_seg7_texture_0700BB08, main_menu_seg7_texture_0700BC48, main_menu_seg7_texture_0700BB88, main_menu_seg7_texture_0700BBC8
.word main_menu_seg7_texture_0700BC08, main_menu_seg7_texture_0700BA48, main_menu_seg7_texture_0700BA88, main_menu_seg7_texture_0700BAC8
.word main_menu_seg7_texture_0700BB48, 0x00000000,         0x00000000,         0x00000000
.word 0x00000000,         0x00000000,         0x00000000,         0x00000000
.word 0x00000000,         0x00000000,         0x00000000,         0x00000000
.word 0x00000000,         0x00000000,         0x00000000,         0x00000000
.word 0x00000000,         0x00000000,         0x00000000,         0x00000000
.word 0x00000000,         0x00000000,         0x00000000,         0x00000000
.word 0x00000000,         0x00000000,         0x00000000,         0x00000000
.word 0x00000000,         0x00000000,         0x00000000,         0x00000000
.word 0x00000000,         0x00000000,         0x00000000,         0x00000000
.word 0x00000000,         0x00000000,         0x00000000,         0x00000000
.word main_menu_seg7_texture_0700C988, main_menu_seg7_texture_0700CAC8, main_menu_seg7_texture_0700CA08, main_menu_seg7_texture_0700CA48
.word main_menu_seg7_texture_0700CA88, main_menu_seg7_texture_0700C8C8, main_menu_seg7_texture_0700C908, main_menu_seg7_texture_0700C948
.word main_menu_seg7_texture_0700C9C8, 0x00000000,         0x00000000,         0x00000000
.word 0x00000000,         0x00000000,         0x00000000,         0x00000000
.word 0x00000000,         0x00000000,         0x00000000,         0x00000000
.word 0x00000000,         0x00000000,         0x00000000,         0x00000000
.word 0x00000000,         0x00000000,         0x00000000,         0x00000000
.word 0x00000000,         0x00000000,         0x00000000,         0x00000000
.word main_menu_seg7_texture_0700BCC8, main_menu_seg7_texture_0700BC88, main_menu_seg7_texture_0700CCC8, 0x00000000
.word 0x00000000,         0x00000000,         0x00000000,         0x00000000
.word 0x00000000,         main_menu_seg7_texture_0700CC08, main_menu_seg7_texture_0700CC48, main_menu_seg7_texture_0700CC88
.word 0x00000000,         0x00000000,         0x00000000,         0x00000000
.else
.word texture_0700AC40, texture_0700AC80, texture_0700ACC0, texture_0700AD00
.word texture_0700AD40, texture_0700AD80, texture_0700ADC0, texture_0700AE00
.word texture_0700AE40, texture_0700AE80, texture_0700AEC0, texture_0700AF00
.word texture_0700AF40, texture_0700AF80, texture_0700AFC0, texture_0700B000
.word texture_0700B040, texture_0700B080, texture_0700B0C0, texture_0700B100
.word texture_0700B140, texture_0700B180, texture_0700B1C0, texture_0700B200
.word texture_0700B240, texture_0700B280, texture_0700B2C0, texture_0700B300
.word texture_0700B340, texture_0700B380, texture_0700B3C0, texture_0700B400
.word texture_0700B440, texture_0700B480, texture_0700B4C0, texture_0700B500
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000, texture_0700B680, texture_0700B7C0
.word texture_0700B740, texture_0700B780,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000, texture_0700B640
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000, texture_0700B600
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.ifdef VERSION_EU
.word       0x00000000, texture_0700B800, texture_0700B8C0,       0x00000000
.word       0x00000000, texture_0700B840,       0x00000000,       0x00000000
.word       0x00000000, texture_0700B880,       0x00000000,       0x00000000
.else
.word       0x00000000, texture_0700B800,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.endif
.word       0x00000000,       0x00000000, texture_0700B6C0,       0x00000000
.word texture_0700B700,       0x00000000,       0x00000000,       0x00000000
.word       0x00000000, texture_0700B540, texture_0700B5C0, texture_0700B580
.word       0x00000000,       0x00000000,       0x00000000,       0x00000000
.endif

glabel main_menu_seg7_dl_0700D108 # 0x0700D108 - 0x0700D160
gsDPPipeSync
gsDPSetTexturePersp G_TP_NONE
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_ENVIRONMENT, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_ENVIRONMENT, G_ACMUX_0
gsDPSetEnvColor 255, 255, 255, 255
gsDPSetRenderMode G_RM_AA_XLU_SURF, G_RM_AA_XLU_SURF2
gsDPSetTextureFilter G_TF_POINT
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_8b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsDPTileSync
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_8b, 1, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 3, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 3, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 28, 28
gsSPEndDisplayList

glabel main_menu_seg7_dl_0700D160 # 0x0700D160 - 0x0700D1A0
gsDPPipeSync
gsDPSetTexturePersp G_TP_PERSP

# There were multiple matching pairs, so I don't know if this is correct or not.
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2
# It could also be one of these:
# G_RM_AA_ZB_OPA_SURF, G_RM_RA_ZB_OPA_SURF2; G_RM_AA_ZB_OPA_SURF, G_RM_AA_OPA_SURF2; G_RM_AA_ZB_OPA_SURF, G_RM_RA_OPA_SURF2;
# G_RM_RA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2; G_RM_RA_ZB_OPA_SURF, G_RM_AA_OPA_SURF2; G_RM_AA_OPA_SURF, G_RM_AA_ZB_OPA_SURF2;
# G_RM_AA_OPA_SURF, G_RM_RA_ZB_OPA_SURF2; G_RM_RA_OPA_SURF, G_RM_AA_ZB_OPA_SURF2

gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsDPSetEnvColor 255, 255, 255, 255
gsSPTexture -1, -1, 0, 0, 0
gsDPSetTextureFilter G_TF_BILERP
gsSPEndDisplayList

.word 0, 0

.ifdef VERSION_EU

main_menu_seg7_texture_course_upper: # 0x0700BDA0 - 0x0700CDA0
.incbin "levels/menu/main_menu_seg7_eu.0BDA0.rgba16"

main_menu_seg7_texture_niveau_upper: # 0x0700CDA0 - 0x0700DDA0
.incbin "levels/menu/main_menu_seg7_eu.0CDA0.rgba16"

main_menu_seg7_texture_kurs_upper: # 0x0700DDA0 - 0x0700EDA0
.incbin "levels/menu/main_menu_seg7_eu.0DDA0.rgba16"

main_menu_seg7_texture_course_lower: # 0x0700EDA0 - 0x0700FDA0
.incbin "levels/menu/main_menu_seg7_eu.0EDA0.rgba16"

.else

main_menu_seg7_texture_course_upper: # 0x0700D1A8 - 0x0700E1A8
.incbin "levels/menu/main_menu_seg7.0D1A8.rgba16"

main_menu_seg7_texture_course_lower: # 0x0700E1A8 - 0x0700F1A8
.incbin "levels/menu/main_menu_seg7.0E1A8.rgba16"

.endif

main_menu_seg7_vertex_0700F1A8: # 0x0700F1A8 - 0x0700F1E8
vertex    -32,      0,      0,      0,   1984,  0x00, 0x00, 0x7F, 0x00
vertex     32,      0,      0,   4032,   1984,  0x00, 0x00, 0x7F, 0x00
vertex     32,     32,      0,   4032,      0,  0x00, 0x00, 0x7F, 0x00
vertex    -32,     32,      0,      0,      0,  0x00, 0x00, 0x7F, 0x00

main_menu_seg7_vertex_0700F1E8: # 0x0700F1E8 - 0x0700F228
vertex    -32,    -32,      0,      0,   1984,  0x00, 0x00, 0x7F, 0x00
vertex     32,    -32,      0,   4032,   1984,  0x00, 0x00, 0x7F, 0x00
vertex     32,      0,      0,   4032,      0,  0x00, 0x00, 0x7F, 0x00
vertex    -32,      0,      0,      0,      0,  0x00, 0x00, 0x7F, 0x00

glabel main_menu_seg7_dl_0700F228 # 0x0700F228 - 0x0700F2F8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPTexture -32768, -32768, 0, 0, 1

# There were multiple matching pairs, so I don't know if this is correct or not.
gsDPSetRenderMode G_RM_AA_TEX_EDGE, G_RM_AA_TEX_EDGE2
# It could also be one of these:
# G_RM_RA_OPA_SURF, G_RM_AA_TEX_EDGE2; G_RM_AA_TEX_EDGE, G_RM_AA_OPA_SURF2; G_RM_AA_TEX_EDGE, G_RM_RA_OPA_SURF2;
# G_RM_AA_OPA_SURF, G_RM_AA_TEX_EDGE2;

.ifdef VERSION_EU
gsSPEndDisplayList
.else
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, main_menu_seg7_texture_course_upper
.endif
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPVertex main_menu_seg7_vertex_0700F1A8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, main_menu_seg7_texture_course_lower
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPVertex main_menu_seg7_vertex_0700F1E8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

# There were multiple matching pairs, so I don't know if this is correct or not.
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2
# It could also be one of these:
# G_RM_AA_ZB_OPA_SURF, G_RM_RA_ZB_OPA_SURF2; G_RM_AA_ZB_OPA_SURF, G_RM_AA_OPA_SURF2; G_RM_AA_ZB_OPA_SURF, G_RM_RA_OPA_SURF2;
# G_RM_RA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2; G_RM_RA_ZB_OPA_SURF, G_RM_AA_OPA_SURF2; G_RM_AA_OPA_SURF, G_RM_AA_ZB_OPA_SURF2;
# G_RM_AA_OPA_SURF, G_RM_RA_ZB_OPA_SURF2; G_RM_RA_OPA_SURF, G_RM_AA_ZB_OPA_SURF2

gsSPTexture 1, 1, 0, 0, 0
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPEndDisplayList

.ifdef VERSION_EU
glabel main_menu_seg7_dl_0700FEF0 # 0x0700FEF0 - 0x0700FF00
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, main_menu_seg7_texture_course_upper
gsSPEndDisplayList

glabel main_menu_seg7_dl_0700FF00 # 0x0700FF00 - 0x0700FF10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, main_menu_seg7_texture_niveau_upper
gsSPEndDisplayList

glabel main_menu_seg7_dl_0700FF10 # 0x0700FF10 - 0x0700FF20
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, main_menu_seg7_texture_kurs_upper
gsSPEndDisplayList
.endif

glabel main_menu_seg7_collision # 0x0700F2F8 - 0x0700F328
# collision vertices
.hword 0x0040, 0x0004
.hword  8192, -1000, -8192
.hword -8192, -1000, -8192
.hword -8192, -1000,  8192
.hword  8192, -1000,  8192
# collision 0x00 normal
.hword 0x0000,    2
.hword    0,    1,    2
.hword    0,    2,    3
.hword 0x0041
.hword 0x0042
