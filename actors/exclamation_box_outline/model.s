# Exclamation Box Outline

exclamation_box_outline_seg8_light_08024CB8: # 0x08024CB8
.byte 0x7F, 0x00, 0x00, 0x00, 0x7F, 0x00, 0x00, 0x00

exclamation_box_outline_seg8_light_08024CC0: # 0x08024CC0
.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

exclamation_box_outline_seg8_light_08024CD0: # 0x08024CD0
.byte 0x00, 0x7F, 0x00, 0x00, 0x00, 0x7F, 0x00, 0x00

exclamation_box_outline_seg8_light_08024CD8: # 0x08024CD8
.byte 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

exclamation_box_outline_seg8_light_08024CE8: # 0x08024CE8
.byte 0x00, 0x00, 0x7F, 0x00, 0x00, 0x00, 0x7F, 0x00

exclamation_box_outline_seg8_light_08024CF0: # 0x08024CF0
.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

exclamation_box_outline_seg8_light_08024D00: # 0x08024D00
.byte 0x7F, 0x6A, 0x00, 0x00, 0x7F, 0x6A, 0x00, 0x00

exclamation_box_outline_seg8_light_08024D08: # 0x08024D08
.byte 0xFF, 0xD4, 0x00, 0x00, 0xFF, 0xD4, 0x00, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

exclamation_box_outline_seg8_vertex_08024D18: # 0x08024D18
vertex     26,      1,    -25,      0,      0,  0x7F, 0x00, 0x00, 0x50
vertex     26,     52,     26,      0,      0,  0x7F, 0x00, 0x00, 0x50
vertex     26,      1,     26,      0,      0,  0x7F, 0x00, 0x00, 0x50
vertex     26,      1,     26,      0,      0,  0x00, 0x81, 0x00, 0x50
vertex    -25,      1,     26,      0,      0,  0x00, 0x81, 0x00, 0x50
vertex    -25,      1,    -25,      0,      0,  0x00, 0x81, 0x00, 0x50
vertex     26,      1,    -25,      0,      0,  0x00, 0x81, 0x00, 0x50
vertex     26,      1,     26,      0,      0,  0x00, 0x00, 0x7F, 0x50
vertex     26,     52,     26,      0,      0,  0x00, 0x00, 0x7F, 0x50
vertex    -25,     52,     26,      0,      0,  0x00, 0x00, 0x7F, 0x50
vertex    -25,      1,     26,      0,      0,  0x00, 0x00, 0x7F, 0x50
vertex    -25,      1,     26,      0,      0,  0x81, 0x00, 0x00, 0x50
vertex    -25,     52,     26,      0,      0,  0x81, 0x00, 0x00, 0x50
vertex    -25,     52,    -25,      0,      0,  0x81, 0x00, 0x00, 0x50
vertex    -25,      1,    -25,      0,      0,  0x81, 0x00, 0x00, 0x50

exclamation_box_outline_seg8_vertex_08024E08: # 0x08024E08
vertex    -25,      1,    -25,      0,      0,  0x00, 0x00, 0x81, 0x50
vertex    -25,     52,    -25,      0,      0,  0x00, 0x00, 0x81, 0x50
vertex     26,     52,    -25,      0,      0,  0x00, 0x00, 0x81, 0x50
vertex     26,      1,    -25,      0,      0,  0x00, 0x00, 0x81, 0x50
vertex     26,      1,    -25,      0,      0,  0x7F, 0x00, 0x00, 0x50
vertex     26,     52,    -25,      0,      0,  0x7F, 0x00, 0x00, 0x50
vertex     26,     52,     26,      0,      0,  0x7F, 0x00, 0x00, 0x50
vertex    -25,     52,     26,      0,      0,  0x00, 0x7F, 0x00, 0x50
vertex     26,     52,     26,      0,      0,  0x00, 0x7F, 0x00, 0x50
vertex     26,     52,    -25,      0,      0,  0x00, 0x7F, 0x00, 0x50
vertex    -25,     52,    -25,      0,      0,  0x00, 0x7F, 0x00, 0x50

glabel exclamation_box_outline_seg8_dl_08024EB8 # 0x08024EB8 - 0x08024F30
gsSPVertex exclamation_box_outline_seg8_vertex_08024D18, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex exclamation_box_outline_seg8_vertex_08024E08, 11, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP1Triangle  7,  9, 10, 0x0
gsSPEndDisplayList

glabel exclamation_box_outline_seg8_dl_08024F30 # 0x08024F30 - 0x08024F58
gsDPPipeSync
gsDPSetEnvColor 255, 255, 255, 80
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_ENVIRONMENT
gsSPEndDisplayList

glabel exclamation_box_outline_seg8_dl_08024F58 # 0x08024F58 - 0x08024F88
gsSPDisplayList exclamation_box_outline_seg8_dl_08024EB8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsDPSetEnvColor 255, 255, 255, 255
gsSPEndDisplayList

glabel exclamation_box_outline_seg8_dl_08024F88 # 0x08024F88 - 0x08024FA8
gsSPDisplayList exclamation_box_outline_seg8_dl_08024F30
gsSPLight exclamation_box_outline_seg8_light_08024CC0, 1
gsSPLight exclamation_box_outline_seg8_light_08024CB8, 2
gsSPBranchList exclamation_box_outline_seg8_dl_08024F58

glabel exclamation_box_outline_seg8_dl_08024FA8 # 0x08024FA8 - 0x08024FC8
gsSPDisplayList exclamation_box_outline_seg8_dl_08024F30
gsSPLight exclamation_box_outline_seg8_light_08024CD8, 1
gsSPLight exclamation_box_outline_seg8_light_08024CD0, 2
gsSPBranchList exclamation_box_outline_seg8_dl_08024F58

glabel exclamation_box_outline_seg8_dl_08024FC8 # 0x08024FC8 - 0x08024FE8
gsSPDisplayList exclamation_box_outline_seg8_dl_08024F30
gsSPLight exclamation_box_outline_seg8_light_08024CF0, 1
gsSPLight exclamation_box_outline_seg8_light_08024CE8, 2
gsSPBranchList exclamation_box_outline_seg8_dl_08024F58

glabel exclamation_box_outline_seg8_dl_08024FE8 # 0x08024FE8 - 0x08025008
gsSPDisplayList exclamation_box_outline_seg8_dl_08024F30
gsSPLight exclamation_box_outline_seg8_light_08024D08, 1
gsSPLight exclamation_box_outline_seg8_light_08024D00, 2
gsSPBranchList exclamation_box_outline_seg8_dl_08024F58

exclamation_box_outline_seg8_vertex_08025008: # 0x08025008
vertex    -25,     52,     26,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex     26,     52,     26,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex     26,     52,    -25,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -25,     52,    -25,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex     26,      1,     26,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -25,     52,     26,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -25,      1,     26,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex     26,      1,    -25,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex     26,     52,    -25,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex     26,     52,     26,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex     26,      1,     26,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -25,      1,    -25,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex     26,      1,    -25,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -25,     52,    -25,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF

exclamation_box_outline_seg8_vertex_080250E8: # 0x080250E8
vertex    -25,      1,     26,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -25,     52,     26,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -25,     52,    -25,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -25,      1,    -25,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -25,      1,     26,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -25,      1,    -25,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex     26,      1,    -25,    996,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex     26,      1,     26,    -26,      0,  0xFF, 0xFF, 0xFF, 0xFF

exclamation_box_outline_seg8_texture_08025168: # 0x08025168
.incbin "actors/exclamation_box_outline/exclamation_box_outline.rgba16"

glabel exclamation_box_outline_seg8_dl_08025968 # 0x08025968 - 0x080259F8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, exclamation_box_outline_seg8_texture_08025168
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex exclamation_box_outline_seg8_vertex_08025008, 14, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  1,  5, 0x0,  4,  5,  6, 0x0
gsSP2Triangles  7,  8,  9, 0x0,  7,  9, 10, 0x0
gsSP2Triangles 11,  8, 12, 0x0, 11, 13,  8, 0x0
gsSPVertex exclamation_box_outline_seg8_vertex_080250E8, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSPEndDisplayList

glabel exclamation_box_outline_seg8_dl_080259F8 # 0x080259F8 - 0x08025A68
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList exclamation_box_outline_seg8_dl_08025968
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList

exclamation_box_outline_seg8_light_08025A68: # 0x08025A68
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

exclamation_box_outline_seg8_light_08025A70: # 0x08025A70
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

exclamation_box_outline_seg8_texture_08025A80: # 0x08025A80
.incbin "actors/exclamation_box_outline/exclamation_point.rgba16"

exclamation_box_outline_seg8_vertex_08025E80: # 0x08025E80
vertex    -22,     49,      0,   -157,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    -22,      4,      0,   -157,   1048,  0x00, 0x00, 0x7F, 0xFF
vertex     23,      4,      0,    605,   1048,  0x00, 0x00, 0x7F, 0xFF
vertex     23,     49,      0,    605,      0,  0x00, 0x00, 0x7F, 0xFF

glabel exclamation_box_outline_seg8_dl_08025EC0 # 0x08025EC0 - 0x08025F08
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, exclamation_box_outline_seg8_texture_08025A80
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x1FF, 0x200
gsSPLight exclamation_box_outline_seg8_light_08025A70, 1
gsSPLight exclamation_box_outline_seg8_light_08025A68, 2
gsSPVertex exclamation_box_outline_seg8_vertex_08025E80, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel exclamation_box_outline_seg8_dl_08025F08 # 0x08025F08 - 0x08025F78
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 60, 124
gsSPDisplayList exclamation_box_outline_seg8_dl_08025EC0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsSPEndDisplayList
