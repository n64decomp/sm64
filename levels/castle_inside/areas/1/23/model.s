inside_castle_seg7_light_070382B0: # 0x070382B0 - 0x070382B8
.byte 0x5F, 0x5F, 0x5F, 0x00, 0x5F, 0x5F, 0x5F, 0x00

inside_castle_seg7_light_070382B8: # 0x070382B8 - 0x070382C8
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

inside_castle_seg7_vertex_070382C8: # 0x070382C8 - 0x07038308
vertex   1616,    512,  -1089,      0,      0,  0x59, 0x00, 0x5A, 0xFF
vertex   1616,    358,  -1089,      0,    990,  0x59, 0x00, 0x5A, 0xFF
vertex   1725,    358,  -1197,    990,    990,  0x59, 0x00, 0x5A, 0xFF
vertex   1725,    512,  -1197,    990,      0,  0x59, 0x00, 0x5A, 0xFF

inside_castle_seg7_dl_07038308: # 0x07038308 - 0x07038350
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_07003000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight inside_castle_seg7_light_070382B8, 1
gsSPLight inside_castle_seg7_light_070382B0, 2
gsSPVertex inside_castle_seg7_vertex_070382C8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  2, 0x0
gsSPEndDisplayList

glabel inside_castle_seg7_dl_07038350 # 0x07038350 - 0x070383C0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList inside_castle_seg7_dl_07038308
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
