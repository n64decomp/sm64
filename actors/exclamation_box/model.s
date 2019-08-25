# Exclamation Box

exclamation_box_seg8_light_08012E10: # 0x08012E10
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

exclamation_box_seg8_light_08012E18: # 0x08012E18
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

exclamation_box_seg8_texture_08012E28: # 0x08012E28
.incbin "actors/exclamation_box/vanish_cap_box_front.rgba16"

exclamation_box_seg8_texture_08013628: # 0x08013628
.incbin "actors/exclamation_box/vanish_cap_box_sides.rgba16"

exclamation_box_seg8_texture_08014628: # 0x08014628
.incbin "actors/exclamation_box/metal_cap_box_front.rgba16"

exclamation_box_seg8_texture_08014E28: # 0x08014E28
.incbin "actors/exclamation_box/metal_cap_box_side.rgba16"

exclamation_box_seg8_texture_08015E28: # 0x08015E28
.incbin "actors/exclamation_box/wing_cap_box_front.rgba16"

exclamation_box_seg8_texture_08016628: # 0x08016628
.incbin "actors/exclamation_box/wing_cap_box_sides.rgba16"

exclamation_box_seg8_texture_08017628: # 0x08017628
.incbin "actors/exclamation_box/exclamation_box_front.rgba16"

exclamation_box_seg8_texture_08017E28: # 0x08017E28
.incbin "actors/exclamation_box/exclamation_box_side.rgba16"

exclamation_box_seg8_vertex_08018E28: # 0x08018E28
vertex    -25,      1,    -25,    992,    992,  0x00, 0x00, 0x81, 0xFF
vertex    -25,     52,    -25,    992,      0,  0x00, 0x00, 0x81, 0xFF
vertex     26,     52,    -25,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex    -25,      1,     26,      0,    992,  0x00, 0x00, 0x7F, 0xFF
vertex     26,      1,     26,    992,    992,  0x00, 0x00, 0x7F, 0xFF
vertex     26,     52,     26,    992,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    -25,     52,     26,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex     26,     52,    -25,    992,      0,  0x7F, 0x00, 0x00, 0xFF
vertex     26,      1,     26,      0,    992,  0x7F, 0x00, 0x00, 0xFF
vertex     26,      1,    -25,    992,    992,  0x7F, 0x00, 0x00, 0xFF
vertex     26,     52,     26,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    -25,      1,    -25,      0,    992,  0x81, 0x00, 0x00, 0xFF
vertex    -25,      1,     26,    992,    992,  0x81, 0x00, 0x00, 0xFF
vertex    -25,     52,     26,    992,      0,  0x81, 0x00, 0x00, 0xFF
vertex    -25,     52,    -25,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex     26,      1,    -25,      0,    992,  0x00, 0x00, 0x81, 0xFF

exclamation_box_seg8_vertex_08018F28: # 0x08018F28
vertex     26,      1,    -25,    992,   2014,  0x00, 0x81, 0x00, 0xFF
vertex     26,      1,     26,    992,      0,  0x00, 0x81, 0x00, 0xFF
vertex    -25,      1,     26,      0,      0,  0x00, 0x81, 0x00, 0xFF
vertex    -25,      1,    -25,      0,   2014,  0x00, 0x81, 0x00, 0xFF
vertex    -25,     52,    -25,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    -25,     52,     26,      0,   2014,  0x00, 0x7F, 0x00, 0xFF
vertex     26,     52,     26,    992,   2014,  0x00, 0x7F, 0x00, 0xFF
vertex     26,     52,    -25,    992,      0,  0x00, 0x7F, 0x00, 0xFF

glabel exclamation_box_seg8_dl_08018FA8 # 0x08018FA8 - 0x08019008
gsSPLight exclamation_box_seg8_light_08012E18, 1
gsSPLight exclamation_box_seg8_light_08012E10, 2
gsSPVertex exclamation_box_seg8_vertex_08018E28, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 13, 14, 0x0,  0,  2, 15, 0x0
gsSPEndDisplayList

glabel exclamation_box_seg8_dl_08019008 # 0x08019008 - 0x08019058
gsSPVertex exclamation_box_seg8_vertex_08018F28, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

glabel exclamation_box_seg8_dl_08019058 # 0x08019058 - 0x080190A0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPEndDisplayList

exclamation_box_seg8_vertex_080190A0: # 0x080190A0
vertex    -25,      1,     26,    992,    992,  0x81, 0x00, 0x00, 0xFF
vertex    -25,     52,     26,    992,      0,  0x81, 0x00, 0x00, 0xFF
vertex    -25,     52,    -25,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex     26,      1,     26,    992,    992,  0x00, 0x00, 0x7F, 0xFF
vertex     26,     52,     26,    992,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    -25,     52,     26,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    -25,      1,     26,      0,    992,  0x00, 0x00, 0x7F, 0xFF
vertex     26,      1,    -25,    992,    992,  0x7F, 0x00, 0x00, 0xFF
vertex     26,     52,    -25,    992,      0,  0x7F, 0x00, 0x00, 0xFF
vertex     26,     52,     26,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex     26,      1,     26,      0,    992,  0x7F, 0x00, 0x00, 0xFF
vertex    -25,      1,    -25,    992,    992,  0x00, 0x00, 0x81, 0xFF
vertex     26,     52,    -25,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex     26,      1,    -25,      0,    992,  0x00, 0x00, 0x81, 0xFF
vertex    -25,     52,    -25,    992,      0,  0x00, 0x00, 0x81, 0xFF
vertex    -25,      1,    -25,      0,    992,  0x81, 0x00, 0x00, 0xFF

exclamation_box_seg8_vertex_080191A0: # 0x080191A0
vertex    -25,     52,     26,      0,    992,  0x00, 0x7F, 0x00, 0xFF
vertex     26,     52,     26,   2014,    992,  0x00, 0x7F, 0x00, 0xFF
vertex     26,     52,    -25,   2014,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    -25,     52,    -25,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    -25,      1,     26,      0,      0,  0x00, 0x81, 0x00, 0xFF
vertex    -25,      1,    -25,      0,    992,  0x00, 0x81, 0x00, 0xFF
vertex     26,      1,    -25,   2014,    992,  0x00, 0x81, 0x00, 0xFF
vertex     26,      1,     26,   2014,      0,  0x00, 0x81, 0x00, 0xFF

glabel exclamation_box_seg8_dl_08019220 # 0x08019220 - 0x08019280
gsSPLight exclamation_box_seg8_light_08012E18, 1
gsSPLight exclamation_box_seg8_light_08012E10, 2
gsSPVertex exclamation_box_seg8_vertex_080190A0, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0,  0,  2, 15, 0x0
gsSPEndDisplayList

glabel exclamation_box_seg8_dl_08019280 # 0x08019280 - 0x080192D0
gsSPVertex exclamation_box_seg8_vertex_080191A0, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

glabel exclamation_box_seg8_dl_080192D0 # 0x080192D0 - 0x08019318
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPEndDisplayList

glabel exclamation_box_seg8_dl_08019318 # 0x08019318 - 0x08019378
gsSPDisplayList exclamation_box_seg8_dl_08019058
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, exclamation_box_seg8_texture_08015E28
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList exclamation_box_seg8_dl_08018FA8
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, exclamation_box_seg8_texture_08016628
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPBranchList exclamation_box_seg8_dl_08019008

glabel exclamation_box_seg8_dl_08019378 # 0x08019378 - 0x080193D8
gsSPDisplayList exclamation_box_seg8_dl_080192D0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, exclamation_box_seg8_texture_08014628
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList exclamation_box_seg8_dl_08019220
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, exclamation_box_seg8_texture_08014E28
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPBranchList exclamation_box_seg8_dl_08019280

glabel exclamation_box_seg8_dl_080193D8 # 0x080193D8 - 0x08019438
gsSPDisplayList exclamation_box_seg8_dl_08019058
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, exclamation_box_seg8_texture_08012E28
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList exclamation_box_seg8_dl_08018FA8
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, exclamation_box_seg8_texture_08013628
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPBranchList exclamation_box_seg8_dl_08019008

glabel exclamation_box_seg8_dl_08019438 # 0x08019438 - 0x08019498
gsSPDisplayList exclamation_box_seg8_dl_080192D0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, exclamation_box_seg8_texture_08017628
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList exclamation_box_seg8_dl_08019220
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, exclamation_box_seg8_texture_08017E28
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPBranchList exclamation_box_seg8_dl_08019280
