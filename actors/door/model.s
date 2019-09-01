# Door

door_seg3_light_03009CE0: # 0x03009CE0
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

door_seg3_light_03009CE8: # 0x03009CE8
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

door_seg3_light_03009CF8: # 0x03009CF8
.byte 0x3F, 0x3F, 0x00, 0x00, 0x3F, 0x3F, 0x00, 0x00

door_seg3_light_03009D00: # 0x03009D00
.byte 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

door_seg3_texture_03009D10: # 0x03009D10
.incbin "actors/door/polished_wooden_door.rgba16"

door_seg3_texture_0300AD10: # 0x0300AD10
.incbin "actors/door/polished_wooden_door_overlay.rgba16"

door_seg3_texture_0300BD10: # 0x0300BD10
.incbin "actors/door/rough_wooden_door.rgba16"

door_seg3_texture_0300CD10: # 0x0300CD10
.incbin "actors/door/rough_wooden_door_overlay.rgba16"

door_seg3_texture_0300D510: # 0x0300D510
.incbin "actors/door/metal_door.rgba16"

door_seg3_texture_0300E510: # 0x0300E510
.incbin "actors/door/metal_door_overlay.rgba16"

door_seg3_texture_0300ED10: # 0x0300ED10
.incbin "actors/door/hmc_mural_door.rgba16"

door_seg3_texture_0300FD10: # 0x0300FD10
.incbin "actors/door/hmc_mural_door_overlay.rgba16"

door_seg3_texture_03010510: # 0x03010510
.incbin "actors/door/bbh_door.rgba16"

door_seg3_texture_03011510: # 0x03011510
.incbin "actors/door/bbh_door_overlay.rgba16"

door_seg3_texture_03011D10: # 0x03011D10
.incbin "actors/door/zero_star_door_sign.rgba16"

door_seg3_texture_03012510: # 0x03012510
.incbin "actors/door/one_star_door_sign.rgba16"

door_seg3_texture_03012D10: # 0x03012D10
.incbin "actors/door/three_star_door_sign.rgba16"

door_seg3_texture_03013510: # 0x03013510
.incbin "actors/door/door_lock.rgba16"

door_seg3_vertex_03013910: # 0x03013910
vertex    -12,      0,    -58,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex    -12,      0,     59,    990,      0,  0x81, 0x00, 0x00, 0xFF
vertex    -12,   1024,     59,    990,   2012,  0x81, 0x00, 0x00, 0xFF
vertex    -12,   1024,    -58,    990,   2012,  0x00, 0x7F, 0x00, 0xFF
vertex    -12,   1024,     59,      0,   2012,  0x00, 0x7F, 0x00, 0xFF
vertex    604,   1024,     59,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    604,   1024,    -58,    990,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    604,      0,    -58,      0,      0,  0x00, 0x81, 0x00, 0xFF
vertex    -12,      0,     59,    990,   2012,  0x00, 0x81, 0x00, 0xFF
vertex    -12,      0,    -58,      0,   2012,  0x00, 0x81, 0x00, 0xFF
vertex    604,      0,     59,    990,      0,  0x00, 0x81, 0x00, 0xFF
vertex    604,      0,     59,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    604,      0,    -58,    990,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    604,   1024,    -58,    990,   2012,  0x7F, 0x00, 0x00, 0xFF
vertex    604,   1024,     59,      0,   2012,  0x7F, 0x00, 0x00, 0xFF
vertex    -12,   1024,    -58,      0,   2012,  0x81, 0x00, 0x00, 0xFF

door_seg3_vertex_03013A10: # 0x03013A10
vertex    604,      0,    -58,    974,   1820,  0x00, 0x00, 0x81, 0xFF
vertex    -12,      0,    -58,      0,   1816,  0x00, 0x00, 0x81, 0xFF
vertex    -12,   1024,    -58,      0,    124,  0x00, 0x00, 0x81, 0xFF
vertex    604,   1024,    -58,    974,    128,  0x00, 0x00, 0x81, 0xFF
vertex    -12,      0,     59,      0,   1816,  0x00, 0x00, 0x7F, 0xFF
vertex    604,      0,     59,    974,   1812,  0x00, 0x00, 0x7F, 0xFF
vertex    604,   1024,     59,    974,    132,  0x00, 0x00, 0x7F, 0xFF
vertex    -12,   1024,     59,      0,    140,  0x00, 0x00, 0x7F, 0xFF

door_seg3_vertex_03013A90: # 0x03013A90
vertex    512,    512,    104,      0,      0,  0xFF, 0x7E, 0x01, 0xFF
vertex    456,    432,    160,      0,      0,  0xA6, 0x1F, 0x53, 0xFF
vertex    512,    488,    160,      0,      0,  0x16, 0x49, 0x65, 0xFF
vertex    512,    372,    160,      0,      0,  0xE7, 0xBA, 0x66, 0xFF
vertex    572,    432,    160,      0,      0,  0x5A, 0xE3, 0x53, 0xFF
vertex    596,    432,    104,      0,      0,  0x7E, 0x01, 0x01, 0xFF
vertex    512,    348,    104,      0,      0,  0xFF, 0x82, 0x01, 0xFF
vertex    432,    432,    104,      0,      0,  0x82, 0x01, 0x01, 0xFF
vertex    512,    488,     44,      0,      0,  0xDA, 0x70, 0xD4, 0xFF
vertex    456,    432,     44,      0,      0,  0x8F, 0xDE, 0xD4, 0xFF
vertex    512,    372,     44,      0,      0,  0x24, 0x90, 0xD3, 0xFF
vertex    572,    432,     44,      0,      0,  0x6F, 0x28, 0xD3, 0xFF

door_seg3_vertex_03013B50: # 0x03013B50
vertex    512,    488,   -156,      0,      0,  0xE8, 0x48, 0x9B, 0xFF
vertex    512,    372,   -156,      0,      0,  0x17, 0xB9, 0x9A, 0xFF
vertex    456,    432,   -156,      0,      0,  0xA5, 0xE4, 0xAE, 0xFF
vertex    432,    432,   -100,      0,      0,  0x82, 0x01, 0xFF, 0xFF
vertex    512,    512,   -100,      0,      0,  0xFF, 0x7E, 0xFF, 0xFF
vertex    572,    432,   -156,      0,      0,  0x59, 0x20, 0xAC, 0xFF
vertex    512,    348,   -100,      0,      0,  0xFF, 0x82, 0xFF, 0xFF
vertex    596,    432,   -100,      0,      0,  0x7E, 0x01, 0xFF, 0xFF
vertex    572,    432,    -40,      0,      0,  0x70, 0xDC, 0x2D, 0xFF
vertex    512,    372,    -40,      0,      0,  0xD8, 0x91, 0x2D, 0xFF
vertex    456,    432,    -40,      0,      0,  0x90, 0x26, 0x2C, 0xFF
vertex    512,    488,    -40,      0,      0,  0x22, 0x71, 0x2C, 0xFF

glabel door_seg3_dl_03013C10 # 0x03013C10 - 0x03013CC8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, door_seg3_texture_0300AD10
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPLight door_seg3_light_03009CE8, 1
gsSPLight door_seg3_light_03009CE0, 2
gsSPVertex door_seg3_vertex_03013910, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 13, 14, 0x0,  0,  2, 15, 0x0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, door_seg3_texture_03009D10
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex door_seg3_vertex_03013A10, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSPEndDisplayList

glabel door_seg3_dl_03013CC8 # 0x03013CC8 - 0x03013D78
gsSPLight door_seg3_light_03009D00, 1
gsSPLight door_seg3_light_03009CF8, 2
gsSPVertex door_seg3_vertex_03013A90, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  4, 0x0
gsSP2Triangles  2,  1,  3, 0x0,  5,  2,  4, 0x0
gsSP2Triangles  5,  0,  2, 0x0,  6,  4,  3, 0x0
gsSP2Triangles  7,  6,  3, 0x0,  7,  3,  1, 0x0
gsSP2Triangles  6,  5,  4, 0x0,  0,  7,  1, 0x0
gsSP2Triangles  8,  9,  7, 0x0,  9,  6,  7, 0x0
gsSP2Triangles  8,  7,  0, 0x0,  9, 10,  6, 0x0
gsSP2Triangles 10,  5,  6, 0x0, 10, 11,  5, 0x0
gsSP2Triangles 11,  0,  5, 0x0, 11,  8,  0, 0x0
gsSPEndDisplayList

glabel door_seg3_dl_03013D78 # 0x03013D78 - 0x03013E28
gsSPLight door_seg3_light_03009D00, 1
gsSPLight door_seg3_light_03009CF8, 2
gsSPVertex door_seg3_vertex_03013B50, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  0,  3,  4, 0x0,  0,  5,  1, 0x0
gsSP2Triangles  5,  0,  4, 0x0,  2,  1,  6, 0x0
gsSP2Triangles  1,  7,  6, 0x0,  1,  5,  7, 0x0
gsSP2Triangles  2,  6,  3, 0x0,  5,  4,  7, 0x0
gsSP2Triangles  6,  8,  9, 0x0,  3,  6,  9, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  4,  3, 10, 0x0
gsSP2Triangles  3,  9, 10, 0x0,  7,  4, 11, 0x0
gsSP2Triangles  7, 11,  8, 0x0,  4, 10, 11, 0x0
gsSPEndDisplayList

glabel door_seg3_dl_03013E28 # 0x03013E28 - 0x03013EA8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList door_seg3_dl_03013C10
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPDisplayList door_seg3_dl_03013CC8
gsSPDisplayList door_seg3_dl_03013D78
gsSPEndDisplayList

glabel door_seg3_dl_03013EA8 # 0x03013EA8 - 0x03013F20
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList door_seg3_dl_03013C10
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPDisplayList door_seg3_dl_03013CC8
gsSPEndDisplayList

door_seg3_vertex_03013F20: # 0x03013F20
vertex    591,      0,    -58,    976,   1808,  0x00, 0x00, 0x81, 0xFF
vertex     -8,   1010,    -58,    -16,    148,  0x00, 0x00, 0x81, 0xFF
vertex    591,   1010,    -58,    990,    140,  0x00, 0x00, 0x81, 0xFF
vertex     -8,      0,    -58,    -30,   1812,  0x00, 0x00, 0x81, 0xFF
vertex     -8,      0,     59,      0,   1816,  0x00, 0x00, 0x7F, 0xFF
vertex    591,   1010,     59,    974,    132,  0x00, 0x00, 0x7F, 0xFF
vertex     -8,   1010,     59,      0,    140,  0x00, 0x00, 0x7F, 0xFF
vertex    591,      0,     59,    974,   1812,  0x00, 0x00, 0x7F, 0xFF

door_seg3_vertex_03013FA0: # 0x03013FA0
vertex    492,    468,   -152,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex    546,    412,   -152,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex    492,    357,   -152,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex    437,    412,   -152,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex    492,    468,    153,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    492,    357,    153,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    546,    412,    153,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    437,    412,    153,      0,      0,  0x00, 0x00, 0x7F, 0xFF

glabel door_seg3_dl_03014020 # 0x03014020 - 0x03014100
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, door_seg3_texture_03009D10
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPLight door_seg3_light_03009CE8, 1
gsSPLight door_seg3_light_03009CE0, 2
gsSPVertex door_seg3_vertex_03013F20, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPLight door_seg3_light_03009D00, 1
gsSPLight door_seg3_light_03009CF8, 2
gsSPVertex door_seg3_vertex_03013FA0, 8, 0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

glabel door_seg3_dl_03014100 # 0x03014100 - 0x03014128
gsSPDisplayList door_seg3_dl_03014020
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

glabel door_seg3_dl_03014128 # 0x03014128 - 0x03014140
gsSPDisplayList door_seg3_dl_03014020
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

door_seg3_vertex_03014140: # 0x03014140
vertex    441,    850,     64,    992,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    141,    850,     64,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    141,    550,     64,      0,    992,  0x00, 0x00, 0x7F, 0xFF
vertex    441,    550,     64,    992,    992,  0x00, 0x00, 0x7F, 0xFF

door_seg3_vertex_03014180: # 0x03014180
vertex    441,    850,     59,    992,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    141,    850,     59,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    141,    550,     59,      0,    992,  0x00, 0x00, 0x7F, 0xFF
vertex    441,    550,     59,    992,    992,  0x00, 0x00, 0x7F, 0xFF

glabel door_seg3_dl_030141C0 # 0x030141C0 - 0x03014218
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPLight door_seg3_light_03009CE8, 1
gsSPLight door_seg3_light_03009CE0, 2
gsSPEndDisplayList

glabel door_seg3_dl_03014218 # 0x03014218 - 0x03014250
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

glabel door_seg3_dl_03014250 # 0x03014250 - 0x03014280
gsSPDisplayList door_seg3_dl_030141C0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, door_seg3_texture_03011D10
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex door_seg3_vertex_03014140, 4, 0
gsSPBranchList door_seg3_dl_03014218

glabel door_seg3_dl_03014280 # 0x03014280 - 0x030142B0
gsSPDisplayList door_seg3_dl_030141C0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, door_seg3_texture_03011D10
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex door_seg3_vertex_03014180, 4, 0
gsSPBranchList door_seg3_dl_03014218

glabel door_seg3_dl_030142B0 # 0x030142B0 - 0x030142E0
gsSPDisplayList door_seg3_dl_030141C0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, door_seg3_texture_03012510
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex door_seg3_vertex_03014140, 4, 0
gsSPBranchList door_seg3_dl_03014218

glabel door_seg3_dl_030142E0 # 0x030142E0 - 0x03014310
gsSPDisplayList door_seg3_dl_030141C0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, door_seg3_texture_03012510
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex door_seg3_vertex_03014180, 4, 0
gsSPBranchList door_seg3_dl_03014218

glabel door_seg3_dl_03014310 # 0x03014310 - 0x03014340
gsSPDisplayList door_seg3_dl_030141C0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, door_seg3_texture_03012D10
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex door_seg3_vertex_03014140, 4, 0
gsSPBranchList door_seg3_dl_03014218

glabel door_seg3_dl_03014340 # 0x03014340 - 0x03014370
gsSPDisplayList door_seg3_dl_030141C0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, door_seg3_texture_03012D10
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex door_seg3_vertex_03014180, 4, 0
gsSPBranchList door_seg3_dl_03014218

door_seg3_vertex_03014370: # 0x03014370
vertex    595,    916,     59,    478,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    405,    544,     59,      0,    992,  0x00, 0x00, 0x7F, 0xFF
vertex    595,    544,     59,    478,    992,  0x00, 0x00, 0x7F, 0xFF
vertex    405,    916,     59,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    595,    544,    -58,    478,    992,  0x00, 0x00, 0x81, 0xFF
vertex    405,    544,    -58,      0,    992,  0x00, 0x00, 0x81, 0xFF
vertex    405,    916,    -58,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex    595,    916,    -58,    478,      0,  0x00, 0x00, 0x81, 0xFF

door_seg3_vertex_030143F0: # 0x030143F0
vertex    595,    916,     64,    480,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    405,    544,     64,      0,    992,  0x00, 0x00, 0x7F, 0xFF
vertex    595,    544,     64,    480,    992,  0x00, 0x00, 0x7F, 0xFF
vertex    405,    916,     64,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    595,    544,    -63,    480,    992,  0x00, 0x00, 0x81, 0xFF
vertex    405,    544,    -63,      0,    992,  0x00, 0x00, 0x81, 0xFF
vertex    405,    916,    -63,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex    595,    916,    -63,    480,      0,  0x00, 0x00, 0x81, 0xFF

glabel door_seg3_dl_03014470 # 0x03014470 - 0x030144E0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 60, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, door_seg3_texture_03013510
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x1FF, 0x200
gsSPLight door_seg3_light_03009CE8, 1
gsSPLight door_seg3_light_03009CE0, 2
gsSPEndDisplayList

glabel door_seg3_dl_030144E0 # 0x030144E0 - 0x03014528
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

glabel door_seg3_dl_03014528 # 0x03014528 - 0x03014540
gsSPDisplayList door_seg3_dl_03014470
gsSPVertex door_seg3_vertex_03014370, 8, 0
gsSPBranchList door_seg3_dl_030144E0

glabel door_seg3_dl_03014540 # 0x03014540 - 0x03014558
gsSPDisplayList door_seg3_dl_03014470
gsSPVertex door_seg3_vertex_030143F0, 8, 0
gsSPBranchList door_seg3_dl_030144E0

door_seg3_vertex_03014558: # 0x03014558
vertex     -8,   1000,    -58,      0,     70,  0x81, 0x00, 0x00, 0xFF
vertex     -8,      0,    -58,      0,    936,  0x81, 0x00, 0x00, 0xFF
vertex     -8,      0,     59,    990,    936,  0x81, 0x00, 0x00, 0xFF
vertex     -8,      0,    -58,    990,    114,  0x00, 0x81, 0x00, 0xFF
vertex    591,      0,    -58,    990,    856,  0x00, 0x81, 0x00, 0xFF
vertex    591,      0,     59,      0,    856,  0x00, 0x81, 0x00, 0xFF
vertex     -8,      0,     59,      0,    114,  0x00, 0x81, 0x00, 0xFF
vertex     -8,   1000,     59,      0,    114,  0x00, 0x7F, 0x00, 0xFF
vertex    591,   1000,    -58,    990,    856,  0x00, 0x7F, 0x00, 0xFF
vertex     -8,   1000,    -58,    990,    114,  0x00, 0x7F, 0x00, 0xFF
vertex    591,   1000,     59,      0,    856,  0x00, 0x7F, 0x00, 0xFF
vertex    591,   1000,     59,    990,     70,  0x7F, 0x00, 0x00, 0xFF
vertex    591,      0,     59,    990,    936,  0x7F, 0x00, 0x00, 0xFF
vertex    591,      0,    -58,      0,    936,  0x7F, 0x00, 0x00, 0xFF
vertex    591,   1000,    -58,      0,     70,  0x7F, 0x00, 0x00, 0xFF
vertex     -8,   1000,     59,    990,     70,  0x81, 0x00, 0x00, 0xFF

door_seg3_vertex_03014658: # 0x03014658
vertex     -8,      0,     59,    990,   2012,  0x00, 0x00, 0x7F, 0xFF
vertex    591,   1000,     59,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex     -8,   1000,     59,    990,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    591,      0,     59,      0,   2012,  0x00, 0x00, 0x7F, 0xFF
vertex    591,      0,    -58,      0,   2012,  0x00, 0x00, 0x81, 0xFF
vertex     -8,      0,    -58,    990,   2012,  0x00, 0x00, 0x81, 0xFF
vertex     -8,   1000,    -58,    990,      0,  0x00, 0x00, 0x81, 0xFF
vertex    591,   1000,    -58,      0,      0,  0x00, 0x00, 0x81, 0xFF

door_seg3_vertex_030146D8: # 0x030146D8
vertex    492,    468,   -152,      0,      0,  0xE8, 0x47, 0x9A, 0xFF
vertex    414,    412,    -98,      0,      0,  0x82, 0x00, 0x00, 0xFF
vertex    492,    491,    -98,      0,      0,  0x00, 0x7E, 0x00, 0xFF
vertex    492,    468,    153,      0,      0,  0x18, 0x47, 0x66, 0xFF
vertex    492,    357,    153,      0,      0,  0xE9, 0xB8, 0x65, 0xFF
vertex    546,    412,    153,      0,      0,  0x5B, 0xE2, 0x53, 0xFF
vertex    437,    412,    153,      0,      0,  0xA5, 0x1D, 0x53, 0xFF
vertex    492,    491,     99,      0,      0,  0x00, 0x7E, 0x00, 0xFF
vertex    569,    412,     99,      0,      0,  0x7E, 0x00, 0x00, 0xFF
vertex    492,    334,     99,      0,      0,  0x00, 0x82, 0x00, 0xFF
vertex    414,    412,     99,      0,      0,  0x82, 0x00, 0x00, 0xFF
vertex    492,    468,     44,      0,      0,  0xDB, 0x6F, 0xD1, 0xFF
vertex    437,    412,     44,      0,      0,  0x91, 0xDB, 0xD2, 0xFF
vertex    492,    357,     44,      0,      0,  0x26, 0x91, 0xD2, 0xFF
vertex    546,    412,     44,      0,      0,  0x70, 0x24, 0xD2, 0xFF

door_seg3_vertex_030147C8: # 0x030147C8
vertex    492,    491,    -98,      0,      0,  0x00, 0x7E, 0x00, 0xFF
vertex    437,    412,    -43,      0,      0,  0x90, 0x24, 0x2E, 0xFF
vertex    492,    468,    -43,      0,      0,  0x26, 0x6F, 0x2F, 0xFF
vertex    492,    468,   -152,      0,      0,  0xE8, 0x47, 0x9A, 0xFF
vertex    546,    412,   -152,      0,      0,  0x5B, 0x1D, 0xAE, 0xFF
vertex    492,    357,   -152,      0,      0,  0x18, 0xB9, 0x9B, 0xFF
vertex    437,    412,   -152,      0,      0,  0xA6, 0xE2, 0xAD, 0xFF
vertex    414,    412,    -98,      0,      0,  0x82, 0x00, 0x00, 0xFF
vertex    569,    412,    -98,      0,      0,  0x7E, 0x00, 0x00, 0xFF
vertex    492,    334,    -98,      0,      0,  0x00, 0x82, 0x00, 0xFF
vertex    492,    357,    -43,      0,      0,  0xDB, 0x90, 0x2E, 0xFF
vertex    546,    412,    -43,      0,      0,  0x70, 0xDB, 0x2E, 0xFF

glabel door_seg3_dl_03014888 # 0x03014888 - 0x030149C0
gsSPVertex door_seg3_vertex_030146D8, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  6,  3, 0x0
gsSP2Triangles  8,  3,  5, 0x0,  8,  7,  3, 0x0
gsSP2Triangles  9,  5,  4, 0x0, 10,  9,  4, 0x0
gsSP2Triangles 10,  4,  6, 0x0,  9,  8,  5, 0x0
gsSP2Triangles  7, 10,  6, 0x0, 11, 12, 10, 0x0
gsSP2Triangles 11, 10,  7, 0x0, 12,  9, 10, 0x0
gsSP2Triangles 12, 13,  9, 0x0, 13,  8,  9, 0x0
gsSP2Triangles 14,  7,  8, 0x0, 13, 14,  8, 0x0
gsSP1Triangle 14, 11,  7, 0x0
gsSPVertex door_seg3_vertex_030147C8, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  7, 0x0,  4,  3,  0, 0x0
gsSP2Triangles  5,  4,  8, 0x0,  6,  5,  9, 0x0
gsSP2Triangles  5,  8,  9, 0x0,  3,  5,  6, 0x0
gsSP2Triangles  6,  9,  7, 0x0,  4,  0,  8, 0x0
gsSP2Triangles  7,  9, 10, 0x0,  9, 11, 10, 0x0
gsSP2Triangles  9,  8, 11, 0x0,  0,  7,  1, 0x0
gsSP2Triangles  7, 10,  1, 0x0,  8,  0,  2, 0x0
gsSP1Triangle  8,  2, 11, 0x0
gsSPEndDisplayList

glabel door_seg3_dl_030149C0 # 0x030149C0 - 0x03014A20
gsSPLight door_seg3_light_03009CE8, 1
gsSPLight door_seg3_light_03009CE0, 2
gsSPVertex door_seg3_vertex_03014558, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 13, 14, 0x0,  0,  2, 15, 0x0
gsSPEndDisplayList

glabel door_seg3_dl_03014A20 # 0x03014A20 - 0x03014A50
gsSPVertex door_seg3_vertex_03014658, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSPEndDisplayList

glabel door_seg3_dl_03014A50 # 0x03014A50 - 0x03014A80
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsSPEndDisplayList

glabel door_seg3_dl_03014A80 # 0x03014A80 - 0x03014B30
gsSPDisplayList door_seg3_dl_03014A50
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, door_seg3_texture_0300CD10
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList door_seg3_dl_030149C0
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, door_seg3_texture_0300BD10
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList door_seg3_dl_03014A20
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPLight door_seg3_light_03009D00, 1
gsSPLight door_seg3_light_03009CF8, 2
gsSPBranchList door_seg3_dl_03014888

glabel door_seg3_dl_03014B30 # 0x03014B30 - 0x03014BE0
gsSPDisplayList door_seg3_dl_03014A50
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, door_seg3_texture_0300CD10
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList door_seg3_dl_030149C0
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, door_seg3_texture_0300BD10
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList door_seg3_dl_03014A20
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPLight door_seg3_light_03009D00, 1
gsSPLight door_seg3_light_03009CF8, 2
gsSPBranchList door_seg3_dl_03014888

glabel door_seg3_dl_03014BE0 # 0x03014BE0 - 0x03014C90
gsSPDisplayList door_seg3_dl_03014A50
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, door_seg3_texture_0300E510
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList door_seg3_dl_030149C0
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, door_seg3_texture_0300D510
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList door_seg3_dl_03014A20
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPLight door_seg3_light_03009D00, 1
gsSPLight door_seg3_light_03009CF8, 2
gsSPBranchList door_seg3_dl_03014888

glabel door_seg3_dl_03014C90 # 0x03014C90 - 0x03014D40
gsSPDisplayList door_seg3_dl_03014A50
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, door_seg3_texture_0300FD10
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList door_seg3_dl_030149C0
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, door_seg3_texture_0300ED10
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList door_seg3_dl_03014A20
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPLight door_seg3_light_03009D00, 1
gsSPLight door_seg3_light_03009CF8, 2
gsSPBranchList door_seg3_dl_03014888

glabel door_seg3_dl_03014D40 # 0x03014D40 - 0x03014DF0
gsSPDisplayList door_seg3_dl_03014A50
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, door_seg3_texture_03011510
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList door_seg3_dl_030149C0
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, door_seg3_texture_03010510
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList door_seg3_dl_03014A20
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPLight door_seg3_light_03009D00, 1
gsSPLight door_seg3_light_03009CF8, 2
gsSPBranchList door_seg3_dl_03014888

door_seg3_vertex_03014DF0: # 0x03014DF0
vertex    591,      0,    -58,      0,   2012,  0x00, 0x00, 0x81, 0xFF
vertex     -8,   1000,    -58,    990,      0,  0x00, 0x00, 0x81, 0xFF
vertex    591,   1000,    -58,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex     -8,      0,    -58,    990,   2012,  0x00, 0x00, 0x81, 0xFF
vertex     -8,      0,     59,    990,   2012,  0x00, 0x00, 0x7F, 0xFF
vertex    591,   1000,     59,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex     -8,   1000,     59,    990,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    591,      0,     59,      0,   2012,  0x00, 0x00, 0x7F, 0xFF

door_seg3_vertex_03014E70: # 0x03014E70
vertex    492,    468,    153,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    492,    357,    153,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    546,    412,    153,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    437,    412,    153,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    492,    468,   -152,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex    546,    412,   -152,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex    492,    357,   -152,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex    437,    412,   -152,      0,      0,  0x00, 0x00, 0x81, 0xFF

glabel door_seg3_dl_03014EF0 # 0x03014EF0 - 0x03014F30
gsSPLight door_seg3_light_03009CE8, 1
gsSPLight door_seg3_light_03009CE0, 2
gsSPVertex door_seg3_vertex_03014DF0, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

glabel door_seg3_dl_03014F30 # 0x03014F30 - 0x03014F68
gsSPVertex door_seg3_vertex_03014E70, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

glabel door_seg3_dl_03014F68 # 0x03014F68 - 0x03014F98
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsSPEndDisplayList

glabel door_seg3_dl_03014F98 # 0x03014F98 - 0x03015008
gsSPDisplayList door_seg3_dl_03014F68
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, door_seg3_texture_0300BD10
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList door_seg3_dl_03014EF0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPLight door_seg3_light_03009D00, 1
gsSPLight door_seg3_light_03009CF8, 2
gsSPBranchList door_seg3_dl_03014F30

glabel door_seg3_dl_03015008 # 0x03015008 - 0x03015078
gsSPDisplayList door_seg3_dl_03014F68
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, door_seg3_texture_0300BD10
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList door_seg3_dl_03014EF0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPLight door_seg3_light_03009D00, 1
gsSPLight door_seg3_light_03009CF8, 2
gsSPBranchList door_seg3_dl_03014F30

glabel door_seg3_dl_03015078 # 0x03015078 - 0x030150E8
gsSPDisplayList door_seg3_dl_03014F68
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, door_seg3_texture_0300D510
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList door_seg3_dl_03014EF0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPLight door_seg3_light_03009D00, 1
gsSPLight door_seg3_light_03009CF8, 2
gsSPBranchList door_seg3_dl_03014F30

glabel door_seg3_dl_030150E8 # 0x030150E8 - 0x03015158
gsSPDisplayList door_seg3_dl_03014F68
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, door_seg3_texture_0300ED10
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList door_seg3_dl_03014EF0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPLight door_seg3_light_03009D00, 1
gsSPLight door_seg3_light_03009CF8, 2
gsSPBranchList door_seg3_dl_03014F30

glabel door_seg3_dl_03015158 # 0x03015158 - 0x030151C8
gsSPDisplayList door_seg3_dl_03014F68
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, door_seg3_texture_03010510
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPDisplayList door_seg3_dl_03014EF0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPLight door_seg3_light_03009D00, 1
gsSPLight door_seg3_light_03009CF8, 2
gsSPBranchList door_seg3_dl_03014F30

door_seg3_animvalue_030151C8: # 0x030151C8
.hword 0x0000, 0xFED4

door_seg3_animindex_030151CC: # 0x030151CC
.hword 0x0001, 0x0001, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000

door_seg3_anim_03015208: # 0x03015208
.hword 0
.hword 0
.hword 0
.hword 0
.hword 0x50
.hword 0x04
.word door_seg3_animvalue_030151C8
.word door_seg3_animindex_030151CC
.word 0

door_seg3_animvalue_03015220: # 0x03015220
.hword 0x0000, 0xFED4, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
.hword 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0002, 0x0006, 0x0005
.hword 0x0003, 0x0001, 0x0000, 0x0000, 0x0000, 0xFFFF, 0xFFFE, 0xFFFF
.hword 0x0000, 0x0002, 0x0007, 0x000D, 0x0014, 0x001B, 0x0023, 0x002B
.hword 0x0034, 0x003D, 0x0046, 0x004F, 0x0058, 0x0061, 0x006A, 0x0073
.hword 0x007C, 0x0085, 0x008D, 0x0095, 0x009D, 0x00A4, 0x00AB, 0x00B1
.hword 0x00B6, 0x00BB, 0x00BF, 0x00C3, 0x00C7, 0x00CA, 0x00CD, 0x00CF
.hword 0x00D1, 0x00D2, 0x00D3, 0x00D3, 0x00D3, 0x00D1, 0x00D0, 0x00CD
.hword 0x00CA, 0x00C6, 0x00C1, 0x00BB, 0x00B3, 0x00A8, 0x009A, 0x008A
.hword 0x0078, 0x0066, 0x0053, 0x0040, 0x002E, 0x001C, 0x000D, 0x0000
.hword 0xFFF9, 0xFFF7, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
.hword 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0068, 0x0285, 0x0803
.hword 0x0DAB, 0x0FB3, 0x1184, 0x1529, 0x194B, 0x1DAB, 0x220E, 0x2635
.hword 0x29E2, 0x2CD9, 0x2EDA, 0x3048, 0x31AC, 0x3305, 0x3451, 0x3591
.hword 0x36C2, 0x37E3, 0x38F4, 0x39F4, 0x3AE1, 0x3BBA, 0x3C7F, 0x3D2E
.hword 0x3DC6, 0x3E45, 0x3EAC, 0x3EF9, 0x3F2B, 0x3F40, 0x3F38, 0x3F12
.hword 0x3ECC, 0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3E66
.hword 0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3E66
.hword 0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3CAC, 0x3AF1, 0x3937, 0x377D
.hword 0x35C2, 0x3408, 0x324E, 0x3093, 0x246E, 0x1849, 0x0C24, 0x0000
.hword 0x012E, 0x01EB, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
.hword 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0002, 0x0006, 0x0005
.hword 0x0003, 0x0003, 0x0005, 0x0005, 0x0005, 0x0005, 0x0005, 0x0005
.hword 0x0007, 0x000A, 0x000F, 0x0015, 0x001C, 0x0023, 0x002B, 0x0033
.hword 0x003C, 0x0044, 0x004D, 0x0056, 0x005F, 0x0068, 0x0071, 0x007A
.hword 0x0083, 0x008B, 0x0094, 0x009C, 0x00A3, 0x00AA, 0x00B1, 0x00B7
.hword 0x00BC, 0x00C1, 0x00C5, 0x00C9, 0x00CC, 0x00D0, 0x00D3, 0x00D5
.hword 0x00D7, 0x00D8, 0x00D9, 0x00D9, 0x00D9, 0x00D8, 0x00D6, 0x00D3
.hword 0x00D0, 0x00CC, 0x00C7, 0x00C1, 0x00B9, 0x00AD, 0x009F, 0x008E
.hword 0x007C, 0x0069, 0x0056, 0x0042, 0x002F, 0x001E, 0x000D, 0x0000
.hword 0xFFF8, 0xFFF6

door_seg3_animindex_03015404: # 0x03015404
.hword 0x0001, 0x0001, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0050, 0x0002, 0x0050, 0x0052
.hword 0x0050, 0x00A2, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000

door_seg3_anim_03015440: # 0x03015440
.hword 1
.hword 0
.hword 0
.hword 0
.hword 0x50
.hword 0x04
.word door_seg3_animvalue_03015220
.word door_seg3_animindex_03015404
.word 0

door_seg3_anim_03015458: # 0x03015458
.hword 1
.hword 0
.hword 40
.hword 40
.hword 0x50
.hword 0x04
.word door_seg3_animvalue_03015220
.word door_seg3_animindex_03015404
.word 0

door_seg3_animvalue_03015470: # 0x03015470
.hword 0x0000, 0xFED4, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
.hword 0x0000, 0x0000, 0x0001, 0x0003, 0x0001, 0x0000, 0xFFF7, 0xFFDF
.hword 0xFFC1, 0xFFA6, 0xFF98, 0xFF9F, 0xFFC6, 0x0013, 0x00A5, 0x017E
.hword 0x0281, 0x0395, 0x049C, 0x057C, 0x061A, 0x065A, 0x0650, 0x0629
.hword 0x05E7, 0x058F, 0x0525, 0x04AE, 0x042D, 0x03A6, 0x031E, 0x0299
.hword 0x021B, 0x01A8, 0x0144, 0x00F4, 0x00BB, 0x0094, 0x0077, 0x0063
.hword 0x0056, 0x004F, 0x004F, 0x0053, 0x005C, 0x0067, 0x0074, 0x0083
.hword 0x0091, 0x009F, 0x00AC, 0x00B6, 0x00BC, 0x00BE, 0x00BB, 0x00B3
.hword 0x00A8, 0x009A, 0x008A, 0x0078, 0x0066, 0x0053, 0x0040, 0x002E
.hword 0x001C, 0x000D, 0x0000, 0xFFF9, 0xFFF7, 0xFFF9, 0xFFFA, 0xFFFC
.hword 0xFFFF, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
.hword 0x0000, 0x0000, 0x05B0, 0x0DAB, 0x101D, 0x1255, 0x16C3, 0x1BA6
.hword 0x20C9, 0x25F7, 0x2AFB, 0x2FA1, 0x33B5, 0x3700, 0x3983, 0x3B6E
.hword 0x3CDA, 0x3DDE, 0x3E91, 0x3F0C, 0x3F65, 0x3FB4, 0x3FFF, 0x403B
.hword 0x4069, 0x4088, 0x4099, 0x409C, 0x4091, 0x4078, 0x4053, 0x4020
.hword 0x3FE1, 0x3F94, 0x3F3C, 0x3ED7, 0x3E66, 0x3E66, 0x3E66, 0x3E66
.hword 0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3E66
.hword 0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3CAC
.hword 0x3AF1, 0x3937, 0x377D, 0x35C2, 0x3408, 0x324E, 0x3093, 0x246E
.hword 0x1849, 0x0C24, 0x0000, 0x012E, 0x01EB, 0x024D, 0x0268, 0x0214
.hword 0x0137, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
.hword 0x0000, 0x0000, 0x0001, 0x0003, 0x0001, 0x0000, 0xFFF7, 0xFFDF
.hword 0xFFC1, 0xFFA5, 0xFF97, 0xFF9E, 0xFFC5, 0x0013, 0x00A6, 0x0180
.hword 0x0285, 0x039A, 0x04A3, 0x0585, 0x0624, 0x0664, 0x065B, 0x0633
.hword 0x05F1, 0x0599, 0x052F, 0x04B7, 0x0436, 0x03AE, 0x0326, 0x02A0
.hword 0x0222, 0x01AE, 0x014A, 0x00FA, 0x00C1, 0x009A, 0x007D, 0x0068
.hword 0x005B, 0x0055, 0x0055, 0x0059, 0x0062, 0x006D, 0x007A, 0x0089
.hword 0x0098, 0x00A6, 0x00B2, 0x00BC, 0x00C2, 0x00C4, 0x00C1, 0x00B9
.hword 0x00AD, 0x009F, 0x008E, 0x007C, 0x0069, 0x0056, 0x0042, 0x002F
.hword 0x001E, 0x000D, 0x0000, 0xFFF8, 0xFFF6, 0xFFF7, 0xFFF8, 0xFFFB
.hword 0xFFFE, 0x0000

door_seg3_animindex_03015654: # 0x03015654
.hword 0x0001, 0x0001, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0050, 0x0002, 0x0050, 0x0052
.hword 0x0050, 0x00A2, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000

door_seg3_anim_03015690: # 0x03015690
.hword 0
.hword 0
.hword 0
.hword 0
.hword 0x50
.hword 0x04
.word door_seg3_animvalue_03015470
.word door_seg3_animindex_03015654
.word 0

door_seg3_anim_030156A8: # 0x030156A8
.hword 1
.hword 0
.hword 40
.hword 40
.hword 0x50
.hword 0x04
.word door_seg3_animvalue_03015470
.word door_seg3_animindex_03015654
.word 0

glabel door_seg3_anim_030156C0 # 0x030156C0
.word door_seg3_anim_03015208
.word door_seg3_anim_03015440
.word door_seg3_anim_03015690
.word door_seg3_anim_03015458
.word door_seg3_anim_030156A8
.word 0
