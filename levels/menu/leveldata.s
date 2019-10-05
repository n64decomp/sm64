.section .rodata
.include "macros.inc"
.include "PR/gbi.inc"
.include "surface_terrains.inc"

ambient_light_menu_1: # 0x07000000 - 0x07000008
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

diffuse_light_menu_1: # 0x07000008 - 0x07000018
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

texture_menu_stone: # 0x07000018 - 0x07000818
.incbin "levels/menu/main_menu_seg7.00018.rgba16"

texture_menu_dark_stone: # 0x07000818 - 0x07001018
.incbin "levels/menu/main_menu_seg7.00818.rgba16"

texture_menu_mario_save: # 0x07001018 - 0x07002018
.incbin "levels/menu/main_menu_seg7.01018.rgba16"

texture_menu_mario_new: # 0x07002018 - 0x07003018
.incbin "levels/menu/main_menu_seg7.02018.rgba16"

vertex_menu_save_button_borders: # 0x07003018 - 0x07003118
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

vertex_menu_save_button_front: # 0x07003118 - 0x07003158
vertex    122,     81,     30,   2012,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -122,     81,     30,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    122,    -81,     30,   2012,    990,  0x00, 0x00, 0x7F, 0xFF
vertex   -122,    -81,     30,      0,    990,  0x00, 0x00, 0x7F, 0xFF

dl_tex_block_menu_save_button_base: # 0x07003158 - 0x070031A0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPEndDisplayList

dl_vertex_menu_save_button_borders: # 0x070031A0 - 0x07003218
gsSPLight diffuse_light_menu_1, 1
gsSPLight ambient_light_menu_1, 2
gsSPVertex vertex_menu_save_button_borders, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  5,  7,  6, 0x0
gsSP2Triangles  8,  9, 10, 0x0, 11,  8, 10, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 15, 12, 14, 0x0
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPEndDisplayList

dl_vertex_menu_save_button_front: # 0x07003218 - 0x07003258
gsSPVertex vertex_menu_save_button_front, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

vertex_menu_save_button_back: # 0x07003258 - 0x07003298
vertex    163,   -122,      0,      0,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -163,   -122,      0,    990,    990,  0x00, 0x00, 0x81, 0xFF
vertex    163,    122,      0,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex   -163,    122,      0,    990,      0,  0x00, 0x00, 0x81, 0xFF

dl_tex_block_menu_save_button_back: # 0x07003298 - 0x070032E0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPEndDisplayList

dl_vertex_menu_save_button_back: # 0x070032E0 - 0x07003330
gsSPLight diffuse_light_menu_1, 1
gsSPLight ambient_light_menu_1, 2
gsSPVertex vertex_menu_save_button_back, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

glabel dl_menu_mario_save_button_base # 0x07003330 - 0x07003380
gsSPDisplayList dl_tex_block_menu_save_button_base
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_menu_stone
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList dl_vertex_menu_save_button_borders
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_menu_mario_save
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList dl_vertex_menu_save_button_front
gsSPEndDisplayList

glabel dl_menu_mario_new_button_base # 0x07003380 - 0x070033D0
gsSPDisplayList dl_tex_block_menu_save_button_base
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_menu_stone
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList dl_vertex_menu_save_button_borders
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_menu_mario_new
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPDisplayList dl_vertex_menu_save_button_front
gsSPEndDisplayList

glabel dl_menu_save_button_back # 0x070033D0 - 0x07003400
gsSPDisplayList dl_tex_block_menu_save_button_back
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_menu_dark_stone
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList dl_vertex_menu_save_button_back
gsSPEndDisplayList

glabel dl_menu_save_button_fade_back # 0x07003400 - 0x07003450
gsDPPipeSync
gsSPClearGeometryMode G_SHADING_SMOOTH
gsSPLight diffuse_light_menu_1, 1
gsSPLight ambient_light_menu_1, 2
gsSPVertex vertex_menu_save_button_back, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  3,  2, 0x0
gsDPPipeSync
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

ambient_light_menu_2: # 0x07003450 - 0x07003458
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

diffuse_light_menu_2: # 0x07003458 - 0x07003468
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

texture_menu_erase: # 0x07003468 - 0x07003468
.incbin "levels/menu/main_menu_seg7.03468.rgba16"

texture_menu_copy: # 0x07003C68 - 0x07003C68
.incbin "levels/menu/main_menu_seg7.03C68.rgba16"

texture_menu_file: # 0x07004468 - 0x07004468
.incbin "levels/menu/main_menu_seg7.04468.rgba16"

texture_menu_score: # 0x07004C68 - 0x07004C68
.incbin "levels/menu/main_menu_seg7.04C68.rgba16"

texture_menu_sound: # 0x07005468 - 0x07005468
.incbin "levels/menu/main_menu_seg7.05468.rgba16"

vertex_menu_main_button_group1: # 0x07005C68 - 0x07005D68
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

vertex_menu_main_button_group2: # 0x07005D68 - 0x07005E68
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

vertex_menu_main_button_group3: # 0x07005E68 - 0x07005F48
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

vertex_menu_main_button_group4: # 0x07005F48 - 0x07006038
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

dl_vertex_menu_main_button: # 0x07006038 - 0x07006150
gsSPLight diffuse_light_menu_2, 1
gsSPLight ambient_light_menu_2, 2
gsSPVertex vertex_menu_main_button_group1, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  9,  7, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 13, 14, 15, 0x0
gsSPVertex vertex_menu_main_button_group2, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  6,  9,  7, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 13, 14, 15, 0x0
gsSPVertex vertex_menu_main_button_group3, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  0,  4,  3, 0x0,  5,  2,  6, 0x0
gsSP2Triangles  5,  6,  7, 0x0,  6,  3,  4, 0x0
gsSP2Triangles  6,  4,  7, 0x0,  8,  9, 10, 0x0
gsSP1Triangle 11, 12, 13, 0x0
gsSPVertex vertex_menu_main_button_group4, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9,  6,  8, 0x0
gsSP2Triangles 10,  0,  2, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 12, 14, 13, 0x0
gsSPEndDisplayList

dl_tex_block_menu_main_button: # 0x07006150 - 0x07006198
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPEndDisplayList

dl_menu_main_button: # 0x07006198 - 0x070061C8
gsSPDisplayList dl_vertex_menu_main_button
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

glabel dl_menu_erase_button # 0x070061C8 - 0x070061F8
gsSPDisplayList dl_tex_block_menu_main_button
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_menu_erase
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList dl_menu_main_button
gsSPEndDisplayList

glabel dl_menu_copy_button # 0x070061F8 - 0x07006228
gsSPDisplayList dl_tex_block_menu_main_button
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_menu_copy
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList dl_menu_main_button
gsSPEndDisplayList

glabel dl_menu_file_button # 0x07006228 - 0x07006258
gsSPDisplayList dl_tex_block_menu_main_button
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_menu_file
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList dl_menu_main_button
gsSPEndDisplayList

glabel dl_menu_score_button # 0x07006258 - 0x07006288
gsSPDisplayList dl_tex_block_menu_main_button
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_menu_score
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList dl_menu_main_button
gsSPEndDisplayList

glabel dl_menu_sound_button # 0x07006288 - 0x070062B8
gsSPDisplayList dl_tex_block_menu_main_button
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_menu_sound
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList dl_menu_main_button
gsSPEndDisplayList

glabel dl_menu_generic_button # 0x070062B8 - 0x070062E8
gsSPDisplayList dl_tex_block_menu_main_button
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_menu_stone
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList dl_menu_main_button
gsSPEndDisplayList

vertex_menu_hand: # 0x070062E8 - 0x07006328
vertex      0,      0,      0,      0,   1984,  0x00, 0x00, 0x7F, 0xFF
vertex     32,      0,      0,   1984,   1984,  0x00, 0x00, 0x7F, 0xFF
vertex     32,     32,      0,   1984,      0,  0x00, 0x00, 0x7F, 0xFF
vertex      0,     32,      0,      0,      0,  0x00, 0x00, 0x7F, 0xFF

texture_menu_idle_hand: # 0x07006328 - 0x07006B28
.incbin "levels/menu/main_menu_seg7.06328.rgba16"

texture_menu_grabbing_hand: # 0x07006B28 - 0x07007328
.incbin "levels/menu/main_menu_seg7.06B28.rgba16"

dl_menu_hand: # 0x07007328 - 0x070073A0
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
gsSPVertex vertex_menu_hand, 4, 0
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

glabel dl_menu_idle_hand # 0x070073A0 - 0x070073B8
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_menu_idle_hand
gsSPBranchList dl_menu_hand

glabel dl_menu_grabbing_hand # 0x070073B8 - 0x070073D0
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_menu_grabbing_hand
gsSPBranchList dl_menu_hand

texture_menu_hud_char_katakana_hu: # 0x070073D0
.incbin "levels/menu/main_menu_seg7.073D0.rgba16"

texture_menu_hud_char_katakana_small_a: # 0x070075D0
.incbin "levels/menu/main_menu_seg7.075D0.rgba16"

texture_menu_hud_char_katakana_i: # 0x070077D0
.incbin "levels/menu/main_menu_seg7.077D0.rgba16"

texture_menu_hud_char_katakana_ru: # 0x070079D0
.incbin "levels/menu/main_menu_seg7.079D0.rgba16"

texture_menu_hud_char_katakana_se: # 0x07007BD0
.incbin "levels/menu/main_menu_seg7.07BD0.rgba16"

texture_menu_hud_char_katakana_re: # 0x07007DD0
.incbin "levels/menu/main_menu_seg7.07DD0.rgba16"

texture_menu_hud_char_katakana_ku: # 0x07007FD0
.incbin "levels/menu/main_menu_seg7.07FD0.rgba16"

texture_menu_hud_char_katakana_to: # 0x070081D0
.incbin "levels/menu/main_menu_seg7.081D0.rgba16"

texture_menu_hud_char_hiragana_wo: # 0x070083D0
.incbin "levels/menu/main_menu_seg7.083D0.rgba16"

texture_menu_hud_char_katakana_ko: # 0x070085D0
.incbin "levels/menu/main_menu_seg7.085D0.rgba16"

texture_menu_hud_char_kana_handakuten_pi: # 0x070087D0
.incbin "levels/menu/main_menu_seg7.087D0.rgba16"

texture_menu_hud_char_choonpu: # 0x070089D0
.incbin "levels/menu/main_menu_seg7.089D0.rgba16"

texture_menu_hud_char_hiragana_su: # 0x07008BD0
.incbin "levels/menu/main_menu_seg7.08BD0.rgba16"

texture_menu_hud_char_hiragana_ru: # 0x07008DD0
.incbin "levels/menu/main_menu_seg7.08DD0.rgba16"

texture_menu_hud_char_hiragana_ke: # 0x07008FD0
.incbin "levels/menu/main_menu_seg7.08FD0.rgba16"

texture_menu_hud_char_katakana_ma: # 0x070091D0
.incbin "levels/menu/main_menu_seg7.091D0.rgba16"

texture_menu_hud_char_katakana_ri: # 0x070093D0
.incbin "levels/menu/main_menu_seg7.093D0.rgba16"

texture_menu_hud_char_katakana_o: # 0x070095D0
.incbin "levels/menu/main_menu_seg7.095D0.rgba16"

texture_menu_hud_char_katakana_su: # 0x070097D0
.incbin "levels/menu/main_menu_seg7.097D0.rgba16"

texture_menu_hud_char_katakana_a: # 0x070099D0
.incbin "levels/menu/main_menu_seg7.099D0.rgba16"

texture_menu_hud_char_hiragana_mi: # 0x07009BD0
.incbin "levels/menu/main_menu_seg7.09BD0.rgba16"

texture_menu_hud_char_hira_dakuten_do: # 0x07009DD0
.incbin "levels/menu/main_menu_seg7.09DD0.rgba16"

texture_menu_hud_char_hiragana_no: # 0x07009FD0
.incbin "levels/menu/main_menu_seg7.09FD0.rgba16"

texture_menu_hud_char_question: # 0x0700A1D0
.incbin "levels/menu/main_menu_seg7.0A1D0.rgba16"

texture_menu_hud_char_katakana_sa: # 0x0700A3D0
.incbin "levels/menu/main_menu_seg7.0A3D0.rgba16"

texture_menu_hud_char_katakana_u: # 0x0700A5D0
.incbin "levels/menu/main_menu_seg7.0A5D0.rgba16"

texture_menu_hud_char_katakana_n: # 0x0700A7D0
.incbin "levels/menu/main_menu_seg7.0A7D0.rgba16"

texture_menu_hud_char_kana_dakuten_do: # 0x0700A9D0
.incbin "levels/menu/main_menu_seg7.0A9D0.rgba16"

# Menu HUD print table, only used in JP
glabel menu_hud_lut # 0x0700ABD0
.word texture_menu_hud_char_katakana_hu, texture_menu_hud_char_katakana_small_a,         texture_menu_hud_char_katakana_i, texture_menu_hud_char_katakana_ru
.word texture_menu_hud_char_katakana_se,      texture_menu_hud_char_katakana_re,        texture_menu_hud_char_katakana_ku, texture_menu_hud_char_katakana_to
.word texture_menu_hud_char_hiragana_wo,      texture_menu_hud_char_katakana_ko, texture_menu_hud_char_kana_handakuten_pi, texture_menu_hud_char_choonpu
.word texture_menu_hud_char_hiragana_su,      texture_menu_hud_char_hiragana_ru,        texture_menu_hud_char_hiragana_ke, texture_menu_hud_char_katakana_ma
.word texture_menu_hud_char_katakana_ri,       texture_menu_hud_char_katakana_o,        texture_menu_hud_char_katakana_su, texture_menu_hud_char_katakana_a
.word texture_menu_hud_char_hiragana_mi,  texture_menu_hud_char_hira_dakuten_do,        texture_menu_hud_char_hiragana_no, texture_menu_hud_char_question
.word texture_menu_hud_char_katakana_sa,       texture_menu_hud_char_katakana_u,         texture_menu_hud_char_katakana_n, texture_menu_hud_char_kana_dakuten_do

.ifdef VERSION_JP
.word 0, 0

texture_menu_font_char_jp_0: # 0x0700AC48
.incbin "levels/menu/main_menu_seg7.0AC48.ia8"

texture_menu_font_char_jp_1: # 0x0700AC88
.incbin "levels/menu/main_menu_seg7.0AC88.ia8"

texture_menu_font_char_jp_2: # 0x0700ACC8
.incbin "levels/menu/main_menu_seg7.0ACC8.ia8"

texture_menu_font_char_jp_3: # 0x0700AD08
.incbin "levels/menu/main_menu_seg7.0AD08.ia8"

texture_menu_font_char_jp_4: # 0x0700AD48
.incbin "levels/menu/main_menu_seg7.0AD48.ia8"

texture_menu_font_char_jp_5: # 0x0700AD88
.incbin "levels/menu/main_menu_seg7.0AD88.ia8"

texture_menu_font_char_jp_6: # 0x0700ADC8
.incbin "levels/menu/main_menu_seg7.0ADC8.ia8"

texture_menu_font_char_jp_7: # 0x0700AE08
.incbin "levels/menu/main_menu_seg7.0AE08.ia8"

texture_menu_font_char_jp_8: # 0x0700AE48
.incbin "levels/menu/main_menu_seg7.0AE48.ia8"

texture_menu_font_char_jp_9: # 0x0700AE88
.incbin "levels/menu/main_menu_seg7.0AE88.ia8"

texture_menu_font_char_jp_hiragana_a: # 0x0700AEC8
.incbin "levels/menu/main_menu_seg7.0AEC8.ia8"

texture_menu_font_char_jp_hiragana_i: # 0x0700AF08
.incbin "levels/menu/main_menu_seg7.0AF08.ia8"

texture_menu_font_char_jp_hiragana_u: # 0x0700AF48
.incbin "levels/menu/main_menu_seg7.0AF48.ia8"

texture_menu_font_char_jp_hiragana_c: # 0x0700AF88
.incbin "levels/menu/main_menu_seg7.0AF88.ia8"

texture_menu_font_char_jp_hiragana_o: # 0x0700AFC8
.incbin "levels/menu/main_menu_seg7.0AFC8.ia8"

texture_menu_font_char_jp_hiragana_ka: # 0x0700B008
.incbin "levels/menu/main_menu_seg7.0B008.ia8"

texture_menu_font_char_jp_hiragana_ki: # 0x0700B048
.incbin "levels/menu/main_menu_seg7.0B048.ia8"

texture_menu_font_char_jp_hiragana_ku: # 0x0700B088
.incbin "levels/menu/main_menu_seg7.0B088.ia8"

texture_menu_font_char_jp_hiragana_ke: # 0x0700B0C8
.incbin "levels/menu/main_menu_seg7.0B0C8.ia8"

texture_menu_font_char_jp_hiragana_ko: # 0x0700B108
.incbin "levels/menu/main_menu_seg7.0B108.ia8"

texture_menu_font_char_jp_hiragana_sa: # 0x0700B148
.incbin "levels/menu/main_menu_seg7.0B148.ia8"

texture_menu_font_char_jp_hiragana_shi: # 0x0700B188
.incbin "levels/menu/main_menu_seg7.0B188.ia8"

texture_menu_font_char_jp_hiragana_su: # 0x0700B1C8
.incbin "levels/menu/main_menu_seg7.0B1C8.ia8"

texture_menu_font_char_jp_hiragana_se: # 0x0700B208
.incbin "levels/menu/main_menu_seg7.0B208.ia8"

texture_menu_font_char_jp_hiragana_so: # 0x0700B248
.incbin "levels/menu/main_menu_seg7.0B248.ia8"

texture_menu_font_char_jp_hiragana_ta: # 0x0700B288
.incbin "levels/menu/main_menu_seg7.0B288.ia8"

texture_menu_font_char_jp_hiragana_chi: # 0x0700B2C8
.incbin "levels/menu/main_menu_seg7.0B2C8.ia8"

texture_menu_font_char_jp_hiragana_tsu: # 0x0700B308
.incbin "levels/menu/main_menu_seg7.0B308.ia8"

texture_menu_font_char_jp_hiragana_te: # 0x0700B348
.incbin "levels/menu/main_menu_seg7.0B348.ia8"

texture_menu_font_char_jp_hiragana_to: # 0x0700B388
.incbin "levels/menu/main_menu_seg7.0B388.ia8"

texture_menu_font_char_jp_hiragana_na: # 0x0700B3C8
.incbin "levels/menu/main_menu_seg7.0B3C8.ia8"

texture_menu_font_char_jp_hiragana_ni: # 0x0700B408
.incbin "levels/menu/main_menu_seg7.0B408.ia8"

texture_menu_font_char_jp_hiragana_nu: # 0x0700B448
.incbin "levels/menu/main_menu_seg7.0B448.ia8"

texture_menu_font_char_jp_hiragana_ne: # 0x0700B488
.incbin "levels/menu/main_menu_seg7.0B488.ia8"

texture_menu_font_char_jp_hiragana_no: # 0x0700B4C8
.incbin "levels/menu/main_menu_seg7.0B4C8.ia8"

texture_menu_font_char_jp_hiragana_ha: # 0x0700B508
.incbin "levels/menu/main_menu_seg7.0B508.ia8"

texture_menu_font_char_jp_hiragana_hi: # 0x0700B548
.incbin "levels/menu/main_menu_seg7.0B548.ia8"

texture_menu_font_char_jp_hiragana_hu: # 0x0700B588
.incbin "levels/menu/main_menu_seg7.0B588.ia8"

texture_menu_font_char_jp_hiragana_he: # 0x0700B5C8
.incbin "levels/menu/main_menu_seg7.0B5C8.ia8"

texture_menu_font_char_jp_hiragana_ho: # 0x0700B608
.incbin "levels/menu/main_menu_seg7.0B608.ia8"

texture_menu_font_char_jp_hiragana_ma: # 0x0700B648
.incbin "levels/menu/main_menu_seg7.0B648.ia8"

texture_menu_font_char_jp_hiragana_mi: # 0x0700B688
.incbin "levels/menu/main_menu_seg7.0B688.ia8"

texture_menu_font_char_jp_hiragana_mu: # 0x0700B6C8
.incbin "levels/menu/main_menu_seg7.0B6C8.ia8"

texture_menu_font_char_jp_hiragana_me: # 0x0700B708
.incbin "levels/menu/main_menu_seg7.0B708.ia8"

texture_menu_font_char_jp_hiragana_mo: # 0x0700B748
.incbin "levels/menu/main_menu_seg7.0B748.ia8"

texture_menu_font_char_jp_hiragana_ya: # 0x0700B788
.incbin "levels/menu/main_menu_seg7.0B788.ia8"

texture_menu_font_char_jp_hiragana_yu: # 0x0700B7C8
.incbin "levels/menu/main_menu_seg7.0B7C8.ia8"

texture_menu_font_char_jp_hiragana_yo: # 0x0700B808
.incbin "levels/menu/main_menu_seg7.0B808.ia8"

texture_menu_font_char_jp_hiragana_ra: # 0x0700B848
.incbin "levels/menu/main_menu_seg7.0B848.ia8"

texture_menu_font_char_jp_hiragana_ri: # 0x0700B888
.incbin "levels/menu/main_menu_seg7.0B888.ia8"

texture_menu_font_char_jp_hiragana_ru: # 0x0700B8C8
.incbin "levels/menu/main_menu_seg7.0B8C8.ia8"

texture_menu_font_char_jp_hiragana_re: # 0x0700B908
.incbin "levels/menu/main_menu_seg7.0B908.ia8"

texture_menu_font_char_jp_hiragana_ro: # 0x0700B948
.incbin "levels/menu/main_menu_seg7.0B948.ia8"

texture_menu_font_char_jp_hiragana_wa: # 0x0700B988
.incbin "levels/menu/main_menu_seg7.0B988.ia8"

texture_menu_font_char_jp_hiragana_wo: # 0x0700B9C8
.incbin "levels/menu/main_menu_seg7.0B9C8.ia8"

texture_menu_font_char_jp_hiragana_n: # 0x0700BA08
.incbin "levels/menu/main_menu_seg7.0BA08.ia8"

texture_menu_font_char_jp_hiragana_small_a: # 0x0700BA48
.incbin "levels/menu/main_menu_seg7.0BA48.ia8"

texture_menu_font_char_jp_hiragana_small_i: # 0x0700BA88
.incbin "levels/menu/main_menu_seg7.0BA88.ia8"

texture_menu_font_char_jp_hiragana_small_u: # 0x0700BAC8
.incbin "levels/menu/main_menu_seg7.0BAC8.ia8"

texture_menu_font_char_jp_hiragana_small_e: # 0x0700BB08
.incbin "levels/menu/main_menu_seg7.0BB08.ia8"

texture_menu_font_char_jp_hiragana_small_o: # 0x0700BB48
.incbin "levels/menu/main_menu_seg7.0BB48.ia8"

texture_menu_font_char_jp_hiragana_small_ka: # 0x0700BB88
.incbin "levels/menu/main_menu_seg7.0BB88.ia8"

texture_menu_font_char_jp_hiragana_small_yu: # 0x0700BBC8
.incbin "levels/menu/main_menu_seg7.0BBC8.ia8"

texture_menu_font_char_jp_hiragana_small_yo: # 0x0700BC08
.incbin "levels/menu/main_menu_seg7.0BC08.ia8"

texture_menu_font_char_jp_hiragana_small_tsu: # 0x0700BC48
.incbin "levels/menu/main_menu_seg7.0BC48.ia8"

texture_menu_font_char_jp_handakuten: # 0x0700BC88
.incbin "levels/menu/main_menu_seg7.0BC88.ia8"

texture_menu_font_char_jp_dakuten: # 0x0700BCC8
.incbin "levels/menu/main_menu_seg7.0BCC8.ia8"

texture_menu_font_char_jp_long_vowel: # 0x0700BD08
.incbin "levels/menu/main_menu_seg7.0BD08.ia8"

texture_menu_font_char_jp_katakana_a: # 0x0700BD48
.incbin "levels/menu/main_menu_seg7.0BD48.ia8"

texture_menu_font_char_jp_katakana_i: # 0x0700BD88
.incbin "levels/menu/main_menu_seg7.0BD88.ia8"

texture_menu_font_char_jp_katakana_u: # 0x0700BDC8
.incbin "levels/menu/main_menu_seg7.0BDC8.ia8"

texture_menu_font_char_jp_katakana_e: # 0x0700BE08
.incbin "levels/menu/main_menu_seg7.0BE08.ia8"

texture_menu_font_char_jp_katakana_o: # 0x0700BE48
.incbin "levels/menu/main_menu_seg7.0BE48.ia8"

texture_menu_font_char_jp_katakana_ka: # 0x0700BE88
.incbin "levels/menu/main_menu_seg7.0BE88.ia8"

texture_menu_font_char_jp_katakana_ki: # 0x0700BEC8
.incbin "levels/menu/main_menu_seg7.0BEC8.ia8"

texture_menu_font_char_jp_katakana_ku: # 0x0700BF08
.incbin "levels/menu/main_menu_seg7.0BF08.ia8"

texture_menu_font_char_jp_katakana_ke: # 0x0700BF48
.incbin "levels/menu/main_menu_seg7.0BF48.ia8"

texture_menu_font_char_jp_katakana_ko: # 0x0700BF88
.incbin "levels/menu/main_menu_seg7.0BF88.ia8"

texture_menu_font_char_jp_katakana_sa: # 0x0700BFC8
.incbin "levels/menu/main_menu_seg7.0BFC8.ia8"

texture_menu_font_char_jp_katakana_shi: # 0x0700C008
.incbin "levels/menu/main_menu_seg7.0C008.ia8"

texture_menu_font_char_jp_katakana_su: # 0x0700C048
.incbin "levels/menu/main_menu_seg7.0C048.ia8"

texture_menu_font_char_jp_katakana_se: # 0x0700C088
.incbin "levels/menu/main_menu_seg7.0C088.ia8"

texture_menu_font_char_jp_katakana_so: # 0x0700C0C8
.incbin "levels/menu/main_menu_seg7.0C0C8.ia8"

texture_menu_font_char_jp_katakana_ta: # 0x0700C108
.incbin "levels/menu/main_menu_seg7.0C108.ia8"

texture_menu_font_char_jp_katakana_chi: # 0x0700C148
.incbin "levels/menu/main_menu_seg7.0C148.ia8"

texture_menu_font_char_jp_katakana_tsu: # 0x0700C188
.incbin "levels/menu/main_menu_seg7.0C188.ia8"

texture_menu_font_char_jp_katakana_te: # 0x0700C1C8
.incbin "levels/menu/main_menu_seg7.0C1C8.ia8"

texture_menu_font_char_jp_katakana_to: # 0x0700C208
.incbin "levels/menu/main_menu_seg7.0C208.ia8"

texture_menu_font_char_jp_katakana_na: # 0x0700C248
.incbin "levels/menu/main_menu_seg7.0C248.ia8"

texture_menu_font_char_jp_katakana_ni: # 0x0700C288
.incbin "levels/menu/main_menu_seg7.0C288.ia8"

texture_menu_font_char_jp_katakana_nu: # 0x0700C2C8
.incbin "levels/menu/main_menu_seg7.0C2C8.ia8"

texture_menu_font_char_jp_katakana_ne: # 0x0700C308
.incbin "levels/menu/main_menu_seg7.0C308.ia8"

texture_menu_font_char_jp_katakana_no: # 0x0700C348
.incbin "levels/menu/main_menu_seg7.0C348.ia8"

texture_menu_font_char_jp_katakana_ha: # 0x0700C388
.incbin "levels/menu/main_menu_seg7.0C388.ia8"

texture_menu_font_char_jp_katakana_hi: # 0x0700C3C8
.incbin "levels/menu/main_menu_seg7.0C3C8.ia8"

texture_menu_font_char_jp_katakana_hu: # 0x0700C408
.incbin "levels/menu/main_menu_seg7.0C408.ia8"

texture_menu_font_char_jp_katakana_he: # 0x0700C448
.incbin "levels/menu/main_menu_seg7.0C448.ia8"

texture_menu_font_char_jp_katakana_ho: # 0x0700C488
.incbin "levels/menu/main_menu_seg7.0C488.ia8"

texture_menu_font_char_jp_katakana_ma: # 0x0700C4C8
.incbin "levels/menu/main_menu_seg7.0C4C8.ia8"

texture_menu_font_char_jp_katakana_mi: # 0x0700C508
.incbin "levels/menu/main_menu_seg7.0C508.ia8"

texture_menu_font_char_jp_katakana_mu: # 0x0700C548
.incbin "levels/menu/main_menu_seg7.0C548.ia8"

texture_menu_font_char_jp_katakana_me: # 0x0700C588
.incbin "levels/menu/main_menu_seg7.0C588.ia8"

texture_menu_font_char_jp_katakana_mo: # 0x0700C5C8
.incbin "levels/menu/main_menu_seg7.0C5C8.ia8"

texture_menu_font_char_jp_katakana_ya: # 0x0700C608
.incbin "levels/menu/main_menu_seg7.0C608.ia8"

texture_menu_font_char_jp_katakana_yu: # 0x0700C648
.incbin "levels/menu/main_menu_seg7.0C648.ia8"

texture_menu_font_char_jp_katakana_yo: # 0x0700C688
.incbin "levels/menu/main_menu_seg7.0C688.ia8"

texture_menu_font_char_jp_katakana_ra: # 0x0700C6C8
.incbin "levels/menu/main_menu_seg7.0C6C8.ia8"

texture_menu_font_char_jp_katakana_ri: # 0x0700C708
.incbin "levels/menu/main_menu_seg7.0C708.ia8"

texture_menu_font_char_jp_katakana_ru: # 0x0700C748
.incbin "levels/menu/main_menu_seg7.0C748.ia8"

texture_menu_font_char_jp_katakana_re: # 0x0700C788
.incbin "levels/menu/main_menu_seg7.0C788.ia8"

texture_menu_font_char_jp_katakana_ro: # 0x0700C7C8
.incbin "levels/menu/main_menu_seg7.0C7C8.ia8"

texture_menu_font_char_jp_katakana_wa: # 0x0700C808
.incbin "levels/menu/main_menu_seg7.0C808.ia8"

texture_menu_font_char_jp_katakana_wo: # 0x0700C848
.incbin "levels/menu/main_menu_seg7.0C848.ia8"

texture_menu_font_char_jp_katakana_n: # 0x0700C888
.incbin "levels/menu/main_menu_seg7.0C888.ia8"

texture_menu_font_char_jp_katakana_small_a: # 0x0700C8C8
.incbin "levels/menu/main_menu_seg7.0C8C8.ia8"

texture_menu_font_char_jp_katakana_small_i: # 0x0700C908
.incbin "levels/menu/main_menu_seg7.0C908.ia8"

texture_menu_font_char_jp_katakana_small_u: # 0x0700C948
.incbin "levels/menu/main_menu_seg7.0C948.ia8"

texture_menu_font_char_jp_katakana_small_e: # 0x0700C988
.incbin "levels/menu/main_menu_seg7.0C988.ia8"

texture_menu_font_char_jp_katakana_small_o: # 0x0700C9C8
.incbin "levels/menu/main_menu_seg7.0C9C8.ia8"

texture_menu_font_char_jp_katakana_small_ka: # 0x0700CA08
.incbin "levels/menu/main_menu_seg7.0CA08.ia8"

texture_menu_font_char_jp_katakana_small_yu: # 0x0700CA48
.incbin "levels/menu/main_menu_seg7.0CA48.ia8"

texture_menu_font_char_jp_katakana_small_yo: # 0x0700CA88
.incbin "levels/menu/main_menu_seg7.0CA88.ia8"

texture_menu_font_char_jp_katakana_small_tsu: # 0x0700CAC8
.incbin "levels/menu/main_menu_seg7.0CAC8.ia8"

texture_menu_font_char_jp_A: # 0x0700CB08
.incbin "levels/menu/main_menu_seg7.0CB08.ia8"

texture_menu_font_char_jp_B: # 0x0700CB48
.incbin "levels/menu/main_menu_seg7.0CB48.ia8"

texture_menu_font_char_jp_C: # 0x0700CB88
.incbin "levels/menu/main_menu_seg7.0CB88.ia8"

texture_menu_font_char_jp_D: # 0x0700CBC8
.incbin "levels/menu/main_menu_seg7.0CBC8.ia8"

texture_menu_font_char_jp_coin: # 0x0700CC08
.incbin "levels/menu/main_menu_seg7.0CC08.ia8"

texture_menu_font_char_jp_star_filled: # 0x0700CC48
.incbin "levels/menu/main_menu_seg7.0CC48.ia8"

texture_menu_font_char_jp_multiply: # 0x0700CC88
.incbin "levels/menu/main_menu_seg7.0CC88.ia8"

texture_menu_font_char_jp_exclamation: # 0x0700CCC8
.incbin "levels/menu/main_menu_seg7.0CCC8.ia8"
.else
texture_menu_font_char_0: # 0x0700AC40
.incbin "levels/menu/main_menu_seg7_us.0AC40.ia8"

texture_menu_font_char_1: # 0x0700AC80
.incbin "levels/menu/main_menu_seg7_us.0AC80.ia8"

texture_menu_font_char_2: # 0x0700ACC0
.incbin "levels/menu/main_menu_seg7_us.0ACC0.ia8"

texture_menu_font_char_3: # 0x0700AD00
.incbin "levels/menu/main_menu_seg7_us.0AD00.ia8"

texture_menu_font_char_4: # 0x0700AD40
.incbin "levels/menu/main_menu_seg7_us.0AD40.ia8"

texture_menu_font_char_5: # 0x0700AD80
.incbin "levels/menu/main_menu_seg7_us.0AD80.ia8"

texture_menu_font_char_6: # 0x0700ADC0
.incbin "levels/menu/main_menu_seg7_us.0ADC0.ia8"

texture_menu_font_char_7: # 0x0700AE00
.incbin "levels/menu/main_menu_seg7_us.0AE00.ia8"

texture_menu_font_char_8: # 0x0700AE40
.incbin "levels/menu/main_menu_seg7_us.0AE40.ia8"

texture_menu_font_char_9: # 0x0700AE80
.incbin "levels/menu/main_menu_seg7_us.0AE80.ia8"

texture_menu_font_char_A: # 0x0700AEC0
.incbin "levels/menu/main_menu_seg7_us.0AEC0.ia8"

texture_menu_font_char_B: # 0x0700AF00
.incbin "levels/menu/main_menu_seg7_us.0AF00.ia8"

texture_menu_font_char_C: # 0x0700AF40
.incbin "levels/menu/main_menu_seg7_us.0AF40.ia8"

texture_menu_font_char_D: # 0x0700AF80
.ifdef VERSION_EU
.incbin "levels/menu/main_menu_seg7_eu.0AF80.ia8"
.else
.incbin "levels/menu/main_menu_seg7_us.0AF80.ia8"
.endif

texture_menu_font_char_E: # 0x0700AFC0
.incbin "levels/menu/main_menu_seg7_us.0AFC0.ia8"

texture_menu_font_char_F: # 0x0700B000
.incbin "levels/menu/main_menu_seg7_us.0B000.ia8"

texture_menu_font_char_G: # 0x0700B040
.incbin "levels/menu/main_menu_seg7_us.0B040.ia8"

texture_menu_font_char_H: # 0x0700B080
.incbin "levels/menu/main_menu_seg7_us.0B080.ia8"

texture_menu_font_char_I: # 0x0700B0C0
.incbin "levels/menu/main_menu_seg7_us.0B0C0.ia8"

texture_menu_font_char_J: # 0x0700B100
.incbin "levels/menu/main_menu_seg7_us.0B100.ia8"

texture_menu_font_char_K: # 0x0700B140
.incbin "levels/menu/main_menu_seg7_us.0B140.ia8"

texture_menu_font_char_L: # 0x0700B180
.incbin "levels/menu/main_menu_seg7_us.0B180.ia8"

texture_menu_font_char_M: # 0x0700B1C0
.incbin "levels/menu/main_menu_seg7_us.0B1C0.ia8"

texture_menu_font_char_N: # 0x0700B200
.incbin "levels/menu/main_menu_seg7_us.0B200.ia8"

texture_menu_font_char_O: # 0x0700B240
.incbin "levels/menu/main_menu_seg7_us.0B240.ia8"

texture_menu_font_char_P: # 0x0700B280
.incbin "levels/menu/main_menu_seg7_us.0B280.ia8"

texture_menu_font_char_Q: # 0x0700B2C0
.incbin "levels/menu/main_menu_seg7_us.0B2C0.ia8"

texture_menu_font_char_R: # 0x0700B300
.incbin "levels/menu/main_menu_seg7_us.0B300.ia8"

texture_menu_font_char_S: # 0x0700B340
.incbin "levels/menu/main_menu_seg7_us.0B340.ia8"

texture_menu_font_char_T: # 0x0700B380
.incbin "levels/menu/main_menu_seg7_us.0B380.ia8"

texture_menu_font_char_U: # 0x0700B3C0
.incbin "levels/menu/main_menu_seg7_us.0B3C0.ia8"

texture_menu_font_char_V: # 0x0700B400
.incbin "levels/menu/main_menu_seg7_us.0B400.ia8"

texture_menu_font_char_W: # 0x0700B440
.incbin "levels/menu/main_menu_seg7_us.0B440.ia8"

texture_menu_font_char_X: # 0x0700B480
.incbin "levels/menu/main_menu_seg7_us.0B480.ia8"

texture_menu_font_char_Y: # 0x0700B4C0
.incbin "levels/menu/main_menu_seg7_us.0B4C0.ia8"

texture_menu_font_char_Z: # 0x0700B500
.incbin "levels/menu/main_menu_seg7_us.0B500.ia8"

texture_menu_font_char_coin: # 0x0700B540
.incbin "levels/menu/main_menu_seg7_us.0B540.ia8"

texture_menu_font_char_multiply: # 0x0700B580
.incbin "levels/menu/main_menu_seg7_us.0B580.ia8"

texture_menu_font_char_star_filled: # 0x0700B5C0
.incbin "levels/menu/main_menu_seg7_us.0B5C0.ia8"

texture_menu_font_char_dash: # 0x0700B600
.incbin "levels/menu/main_menu_seg7_us.0B600.ia8"

texture_menu_font_char_comma: # 0x0700B640
.ifdef VERSION_EU
.incbin "levels/menu/main_menu_seg7_eu.0B640.ia8"
.else
.incbin "levels/menu/main_menu_seg7_us.0B640.ia8"
.endif

texture_menu_font_char_apostrophe: # 0x0700B680
.ifdef VERSION_EU
.incbin "levels/menu/main_menu_seg7_eu.0B680.ia8"
.else
.incbin "levels/menu/main_menu_seg7_us.0B680.ia8"
.endif

texture_menu_font_char_exclamation: # 0x0700B6C0
.incbin "levels/menu/main_menu_seg7_us.0B6C0.ia8"

texture_menu_font_char_question: # 0x0700B700
.incbin "levels/menu/main_menu_seg7_us.0B700.ia8"

texture_menu_font_char_mface1: # 0x0700B740
.incbin "levels/menu/main_menu_seg7_us.0B740.ia8"

texture_menu_font_char_mface2: # 0x0700B780
.incbin "levels/menu/main_menu_seg7_us.0B780.ia8"

texture_menu_font_char_period: # 0x0700B7C0
.incbin "levels/menu/main_menu_seg7_us.0B7C0.ia8"

texture_menu_font_char_ampersand: # 0x0700B800
.incbin "levels/menu/main_menu_seg7_us.0B800.ia8"
.endif

.ifdef VERSION_EU
texture_menu_font_char_umlaut: # 0x0700B840
.incbin "levels/menu/main_menu_seg7_eu.0B840.ia8"

texture_menu_font_char_cedilla_mayus: # 0x0700B880
.incbin "levels/menu/main_menu_seg7_eu.0B880.ia8"

texture_menu_font_char_colon: # 0x0700B8C0
.incbin "levels/menu/main_menu_seg7_eu.0B8C0.ia8"
.endif

# Menu small font print table
glabel menu_font_lut # 0x0700CD08
.ifdef VERSION_JP
.word texture_menu_font_char_jp_0, texture_menu_font_char_jp_1, texture_menu_font_char_jp_2, texture_menu_font_char_jp_3
.word texture_menu_font_char_jp_4, texture_menu_font_char_jp_5, texture_menu_font_char_jp_6, texture_menu_font_char_jp_7
.word texture_menu_font_char_jp_8, texture_menu_font_char_jp_9, texture_menu_font_char_jp_A, texture_menu_font_char_jp_B
.word texture_menu_font_char_jp_C, texture_menu_font_char_jp_D,                   0x0,                      0x0
.word                           0x0,                      0x0,                      0x0,                      0x0
.word                           0x0,                      0x0,                      0x0,                      0x0
.word                           0x0,                      0x0,                      0x0,                      0x0
.word                           0x0,                      0x0,                      0x0,                      0x0
.word                           0x0,                      0x0,                      0x0,                      0x0
.word                           0x0,                      0x0,                      0x0,                      0x0
.word                           0x0,                      0x0,                      0x0,                      0x0
.word                           0x0,                      0x0,                      0x0,                      0x0
.word                           0x0,                      0x0,                      0x0,                      0x0
.word                           0x0,                      0x0,                      0x0,                      0x0
.word                           0x0,                      0x0,                      0x0,                      0x0
.word                           0x0,                      0x0,                      0x0,                      0x0
.word texture_menu_font_char_jp_hiragana_a, texture_menu_font_char_jp_hiragana_i, texture_menu_font_char_jp_hiragana_u, texture_menu_font_char_jp_hiragana_c
.word texture_menu_font_char_jp_hiragana_o, texture_menu_font_char_jp_hiragana_ka, texture_menu_font_char_jp_hiragana_ki, texture_menu_font_char_jp_hiragana_ku
.word texture_menu_font_char_jp_hiragana_ke, texture_menu_font_char_jp_hiragana_ko, texture_menu_font_char_jp_hiragana_sa, texture_menu_font_char_jp_hiragana_shi
.word texture_menu_font_char_jp_hiragana_su, texture_menu_font_char_jp_hiragana_se, texture_menu_font_char_jp_hiragana_so, texture_menu_font_char_jp_hiragana_ta
.word texture_menu_font_char_jp_hiragana_chi, texture_menu_font_char_jp_hiragana_tsu, texture_menu_font_char_jp_hiragana_te, texture_menu_font_char_jp_hiragana_to
.word texture_menu_font_char_jp_hiragana_na, texture_menu_font_char_jp_hiragana_ni, texture_menu_font_char_jp_hiragana_nu, texture_menu_font_char_jp_hiragana_ne
.word texture_menu_font_char_jp_hiragana_no, texture_menu_font_char_jp_hiragana_ha, texture_menu_font_char_jp_hiragana_hi, texture_menu_font_char_jp_hiragana_hu
.word texture_menu_font_char_jp_hiragana_he, texture_menu_font_char_jp_hiragana_ho, texture_menu_font_char_jp_hiragana_ma, texture_menu_font_char_jp_hiragana_mi
.word texture_menu_font_char_jp_hiragana_mu, texture_menu_font_char_jp_hiragana_me, texture_menu_font_char_jp_hiragana_mo, texture_menu_font_char_jp_hiragana_ya
.word texture_menu_font_char_jp_hiragana_yu, texture_menu_font_char_jp_hiragana_yo, texture_menu_font_char_jp_hiragana_ra, texture_menu_font_char_jp_hiragana_ri
.word texture_menu_font_char_jp_hiragana_ru, texture_menu_font_char_jp_hiragana_re, texture_menu_font_char_jp_hiragana_ro, texture_menu_font_char_jp_hiragana_wa
.word texture_menu_font_char_jp_hiragana_wo, texture_menu_font_char_jp_hiragana_n, 0x0,                                0x0
.word texture_menu_font_char_jp_katakana_a, texture_menu_font_char_jp_katakana_i, texture_menu_font_char_jp_katakana_u, texture_menu_font_char_jp_katakana_e
.word texture_menu_font_char_jp_katakana_o, texture_menu_font_char_jp_katakana_ka, texture_menu_font_char_jp_katakana_ki, texture_menu_font_char_jp_katakana_ku
.word texture_menu_font_char_jp_katakana_ke, texture_menu_font_char_jp_katakana_ko, texture_menu_font_char_jp_katakana_sa, texture_menu_font_char_jp_katakana_shi
.word texture_menu_font_char_jp_katakana_su, texture_menu_font_char_jp_katakana_se, texture_menu_font_char_jp_katakana_so, texture_menu_font_char_jp_katakana_ta
.word texture_menu_font_char_jp_katakana_chi, texture_menu_font_char_jp_katakana_tsu, texture_menu_font_char_jp_katakana_te, texture_menu_font_char_jp_katakana_to
.word texture_menu_font_char_jp_katakana_na, texture_menu_font_char_jp_katakana_ni, texture_menu_font_char_jp_katakana_nu, texture_menu_font_char_jp_katakana_ne
.word texture_menu_font_char_jp_katakana_no, texture_menu_font_char_jp_katakana_ha, texture_menu_font_char_jp_katakana_hi, texture_menu_font_char_jp_katakana_hu
.word texture_menu_font_char_jp_katakana_he, texture_menu_font_char_jp_katakana_ho, texture_menu_font_char_jp_katakana_ma, texture_menu_font_char_jp_katakana_mi
.word texture_menu_font_char_jp_katakana_mu, texture_menu_font_char_jp_katakana_me, texture_menu_font_char_jp_katakana_mo, texture_menu_font_char_jp_katakana_ya
.word texture_menu_font_char_jp_katakana_yu, texture_menu_font_char_jp_katakana_yo, texture_menu_font_char_jp_katakana_ra, texture_menu_font_char_jp_katakana_ri
.word texture_menu_font_char_jp_katakana_ru, texture_menu_font_char_jp_katakana_re, texture_menu_font_char_jp_katakana_ro, texture_menu_font_char_jp_katakana_wa
.word texture_menu_font_char_jp_katakana_wo, texture_menu_font_char_jp_katakana_n,                                   0x0, texture_menu_font_char_jp_long_vowel
.word texture_menu_font_char_jp_hiragana_small_e, texture_menu_font_char_jp_hiragana_small_tsu, texture_menu_font_char_jp_hiragana_small_ka, texture_menu_font_char_jp_hiragana_small_yu
.word texture_menu_font_char_jp_hiragana_small_yo, texture_menu_font_char_jp_hiragana_small_a, texture_menu_font_char_jp_hiragana_small_i, texture_menu_font_char_jp_hiragana_small_u
.word texture_menu_font_char_jp_hiragana_small_o,          0x0,                      0x0,                      0x0
.word 0x0,                      0x0,                      0x0,                      0x0
.word 0x0,                      0x0,                      0x0,                      0x0
.word 0x0,                      0x0,                      0x0,                      0x0
.word 0x0,                      0x0,                      0x0,                      0x0
.word 0x0,                      0x0,                      0x0,                      0x0
.word 0x0,                      0x0,                      0x0,                      0x0
.word 0x0,                      0x0,                      0x0,                      0x0
.word 0x0,                      0x0,                      0x0,                      0x0
.word 0x0,                      0x0,                      0x0,                      0x0
.word texture_menu_font_char_jp_katakana_small_e, texture_menu_font_char_jp_katakana_small_tsu, texture_menu_font_char_jp_katakana_small_ka, texture_menu_font_char_jp_katakana_small_yu
.word texture_menu_font_char_jp_katakana_small_yo, texture_menu_font_char_jp_katakana_small_a, texture_menu_font_char_jp_katakana_small_i, texture_menu_font_char_jp_katakana_small_u
.word texture_menu_font_char_jp_katakana_small_o, 0x0,                      0x0,                      0x0
.word 0x0,                      0x0,                      0x0,                      0x0
.word 0x0,                      0x0,                      0x0,                      0x0
.word 0x0,                      0x0,                      0x0,                      0x0
.word 0x0,                      0x0,                      0x0,                      0x0
.word 0x0,                      0x0,                      0x0,                      0x0
.word texture_menu_font_char_jp_dakuten, texture_menu_font_char_jp_handakuten, texture_menu_font_char_jp_exclamation, 0x0
.word 0x0,                      0x0,                      0x0,                      0x0
.word 0x0,                      texture_menu_font_char_jp_coin, texture_menu_font_char_jp_star_filled, texture_menu_font_char_jp_multiply
.word 0x0,                      0x0,                      0x0,                      0x0
.else
.word texture_menu_font_char_0, texture_menu_font_char_1, texture_menu_font_char_2, texture_menu_font_char_3
.word texture_menu_font_char_4, texture_menu_font_char_5, texture_menu_font_char_6, texture_menu_font_char_7
.word texture_menu_font_char_8, texture_menu_font_char_9, texture_menu_font_char_A, texture_menu_font_char_B
.word texture_menu_font_char_C, texture_menu_font_char_D, texture_menu_font_char_E, texture_menu_font_char_F
.word texture_menu_font_char_G, texture_menu_font_char_H, texture_menu_font_char_I, texture_menu_font_char_J
.word texture_menu_font_char_K, texture_menu_font_char_L, texture_menu_font_char_M, texture_menu_font_char_N
.word texture_menu_font_char_O, texture_menu_font_char_P, texture_menu_font_char_Q, texture_menu_font_char_R
.word texture_menu_font_char_S, texture_menu_font_char_T, texture_menu_font_char_U, texture_menu_font_char_V
.word texture_menu_font_char_W, texture_menu_font_char_X, texture_menu_font_char_Y, texture_menu_font_char_Z
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0, texture_menu_font_char_apostrophe, texture_menu_font_char_period
.word texture_menu_font_char_mface1, texture_menu_font_char_mface2,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0, texture_menu_font_char_comma
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0, texture_menu_font_char_dash
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.ifdef VERSION_EU
.word       0x0, texture_menu_font_char_ampersand, texture_menu_font_char_colon,       0x0
.word       0x0, texture_menu_font_char_umlaut,       0x0,       0x0
.word       0x0, texture_menu_font_char_cedilla_mayus,       0x0,       0x0
.else
.word       0x0, texture_menu_font_char_ampersand,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.word       0x0,       0x0,       0x0,       0x0
.endif
.word       0x0,       0x0, texture_menu_font_char_exclamation,       0x0
.word texture_menu_font_char_question,       0x0,       0x0,       0x0
.word       0x0, texture_menu_font_char_coin, texture_menu_font_char_star_filled, texture_menu_font_char_multiply
.word       0x0,       0x0,       0x0,       0x0
.endif

glabel dl_menu_ia8_text_begin # 0x0700D108 - 0x0700D160
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

glabel dl_menu_ia8_text_end # 0x0700D160 - 0x0700D1A0
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

texture_menu_course_upper: # 0x0700BDA0 - 0x0700CDA0
.incbin "levels/menu/main_menu_seg7_eu.0BDA0.rgba16"

texture_menu_niveau_upper: # 0x0700CDA0 - 0x0700DDA0
.incbin "levels/menu/main_menu_seg7_eu.0CDA0.rgba16"

texture_menu_kurs_upper: # 0x0700DDA0 - 0x0700EDA0
.incbin "levels/menu/main_menu_seg7_eu.0DDA0.rgba16"

texture_menu_course_lower: # 0x0700EDA0 - 0x0700FDA0
.incbin "levels/menu/main_menu_seg7_eu.0EDA0.rgba16"

.else

texture_menu_course_upper: # 0x0700D1A8 - 0x0700E1A8
.incbin "levels/menu/main_menu_seg7.0D1A8.rgba16"

texture_menu_course_lower: # 0x0700E1A8 - 0x0700F1A8
.incbin "levels/menu/main_menu_seg7.0E1A8.rgba16"

.endif

vertex_menu_course_upper: # 0x0700F1A8 - 0x0700F1E8
vertex    -32,      0,      0,      0,   1984,  0x00, 0x00, 0x7F, 0x00
vertex     32,      0,      0,   4032,   1984,  0x00, 0x00, 0x7F, 0x00
vertex     32,     32,      0,   4032,      0,  0x00, 0x00, 0x7F, 0x00
vertex    -32,     32,      0,      0,      0,  0x00, 0x00, 0x7F, 0x00

vertex_menu_course_lower: # 0x0700F1E8 - 0x0700F228
vertex    -32,    -32,      0,      0,   1984,  0x00, 0x00, 0x7F, 0x00
vertex     32,    -32,      0,   4032,   1984,  0x00, 0x00, 0x7F, 0x00
vertex     32,      0,      0,   4032,      0,  0x00, 0x00, 0x7F, 0x00
vertex    -32,      0,      0,      0,      0,  0x00, 0x00, 0x7F, 0x00

glabel dl_menu_rgba16_wood_course # 0x0700F228 - 0x0700F2F8
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
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_menu_course_upper
.endif
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPVertex vertex_menu_course_upper, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_menu_course_lower
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPVertex vertex_menu_course_lower, 4, 0
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
glabel dl_menu_texture_course_upper # 0x0700FEF0 - 0x0700FF00
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_menu_course_upper
gsSPEndDisplayList

glabel dl_menu_texture_niveau_upper # 0x0700FF00 - 0x0700FF10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_menu_niveau_upper
gsSPEndDisplayList

glabel dl_menu_texture_kurs_upper # 0x0700FF10 - 0x0700FF20
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_menu_kurs_upper
gsSPEndDisplayList
.endif

glabel main_menu_seg7_collision # 0x0700F2F8 - 0x0700F328
colInit
colVertexInit 0x4
colVertex  8192, -1000, -8192
colVertex -8192, -1000, -8192
colVertex -8192, -1000,  8192
colVertex  8192, -1000,  8192
colTriInit SURFACE_DEFAULT, 2
colTri 0, 1, 2
colTri 0, 2, 3
colTriStop
colEnd
