# Tree

tree_seg3_light_0302DE10: # 0x0302DE10
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

tree_seg3_light_0302DE18: # 0x0302DE18
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

tree_seg3_texture_0302DE28: # 0x0302DE28
.incbin "actors/tree/tree_left_side.rgba16"

tree_seg3_texture_0302EE28: # 0x0302EE28
.incbin "actors/tree/tree_right_side.rgba16"

tree_seg3_vertex_0302FE28: # 0x0302FE28
vertex   -356,     -9,      0,   -796,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,     -9,      0,    990,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    800,      0,    990,   -712,  0xFF, 0xFF, 0xFF, 0xFF

tree_seg3_vertex_0302FE58: # 0x0302FE58
vertex      0,     -9,      0,      0,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex    358,     -9,      0,   1756,   2012,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    800,      0,      0,   -712,  0xFF, 0xFF, 0xFF, 0xFF

glabel tree_seg3_dl_0302FE88 # 0x0302FE88 - 0x0302FEB8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, tree_seg3_texture_0302DE28
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex tree_seg3_vertex_0302FE28, 3, 0
gsSP1Triangle  0,  1,  2, 0x0
gsSPEndDisplayList

glabel tree_seg3_dl_0302FEB8 # 0x0302FEB8 - 0x0302FEE8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, tree_seg3_texture_0302EE28
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex tree_seg3_vertex_0302FE58, 3, 0
gsSP1Triangle  0,  1,  2, 0x0
gsSPEndDisplayList

glabel tree_seg3_dl_0302FEE8 # 0x0302FEE8 - 0x0302FF60
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList tree_seg3_dl_0302FE88
gsSPDisplayList tree_seg3_dl_0302FEB8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

tree_seg3_texture_0302FF60: # 0x0302FF60
.incbin "actors/tree/pine_tree.rgba16"

tree_seg3_vertex_03030F60: # 0x03030F60
vertex    128,    512,      0,    990,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -127,    512,      0,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -127,      0,      0,      0,   2012,  0x00, 0x00, 0x7F, 0xFF
vertex    128,      0,      0,    990,   2012,  0x00, 0x00, 0x7F, 0xFF

glabel tree_seg3_dl_03030FA0 # 0x03030FA0 - 0x03031048
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, tree_seg3_texture_0302FF60
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPLight tree_seg3_light_0302DE18, 1
gsSPLight tree_seg3_light_0302DE10, 2
gsSPVertex tree_seg3_vertex_03030F60, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

tree_seg3_texture_03031048: # 0x03031048
.incbin "actors/tree/snowy_pine_tree.rgba16"

tree_seg3_vertex_03032048: # 0x03032048
vertex    128,    512,      0,    990,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -127,    512,      0,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -127,      0,      0,      0,   2012,  0x00, 0x00, 0x7F, 0xFF
vertex    128,      0,      0,    990,   2012,  0x00, 0x00, 0x7F, 0xFF

glabel tree_seg3_dl_03032088 # 0x03032088 - 0x03032130
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, tree_seg3_texture_03031048
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPLight tree_seg3_light_0302DE18, 1
gsSPLight tree_seg3_light_0302DE10, 2
gsSPVertex tree_seg3_vertex_03032048, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

tree_seg3_vertex_03032130: # 0x03032130
vertex    128,    512,      0,    990,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -127,    512,      0,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -127,      0,      0,      0,   2012,  0x00, 0x00, 0x7F, 0xFF
vertex    128,      0,      0,    990,   2012,  0x00, 0x00, 0x7F, 0xFF

glabel tree_seg3_dl_03032170 # 0x03032170 - 0x03032218
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, tree_seg3_texture_0302FF60
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPLight tree_seg3_light_0302DE18, 1
gsSPLight tree_seg3_light_0302DE10, 2
gsSPVertex tree_seg3_vertex_03032130, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

tree_seg3_texture_03032218: # 0x03032218
.incbin "actors/tree/palm_tree.rgba16"

tree_seg3_vertex_03033218: # 0x03033218
vertex    170,    512,      0,    990,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -169,    512,      0,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -169,      0,      0,      0,   2012,  0x00, 0x00, 0x7F, 0xFF
vertex    170,      0,      0,    990,   2012,  0x00, 0x00, 0x7F, 0xFF

glabel tree_seg3_dl_03033258 # 0x03033258 - 0x03033300
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, tree_seg3_texture_03032218
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPLight tree_seg3_light_0302DE18, 1
gsSPLight tree_seg3_light_0302DE10, 2
gsSPVertex tree_seg3_vertex_03033218, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
