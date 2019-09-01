# Book (Pushable Book)

# This actor file requires including actor bookend because of bookend_seg5_texture_05000C60

book_seg5_light_05002558: # 0x05002558
.byte 0x7F, 0x7F, 0x7F, 0x00, 0x7F, 0x7F, 0x7F, 0x00

book_seg5_light_05002560: # 0x05002560
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

book_seg5_texture_05002570: # 0x05002570
.incbin "actors/book/book_cover.rgba16"

book_seg5_vertex_05002D70: # 0x05002D70
vertex     -9,     31,    -50,    990,      0,  0x00, 0x7F, 0x00, 0xFF
vertex     10,     31,      0,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex     10,     31,    -50,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex     -9,     31,      0,    479,    990,  0x00, 0x7F, 0x00, 0xFF
vertex     10,    -30,    -50,      0,    990,  0x00, 0x81, 0x00, 0xFF
vertex     10,    -30,      0,      0,      0,  0x00, 0x81, 0x00, 0xFF
vertex     -9,    -30,      0,    479,      0,  0x00, 0x81, 0x00, 0xFF
vertex     -9,    -30,    -50,    990,    990,  0x00, 0x81, 0x00, 0xFF
vertex     10,    -30,    -50,      0,    990,  0x00, 0x00, 0x81, 0xFF
vertex     -9,     31,    -50,    990,      0,  0x00, 0x00, 0x81, 0xFF
vertex     10,     31,    -50,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex     -9,    -30,    -50,    990,    990,  0x00, 0x00, 0x81, 0xFF

book_seg5_vertex_05002E30: # 0x05002E30
vertex     10,     31,      0,    990,      0,  0x00, 0x00, 0x7F, 0xFF
vertex     -9,     31,      0,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex     -9,    -30,      0,      0,    990,  0x00, 0x00, 0x7F, 0xFF
vertex     10,    -30,      0,    990,    990,  0x00, 0x00, 0x7F, 0xFF
vertex     -9,    -30,    -50,    990,    990,  0x81, 0x00, 0x00, 0xFF
vertex     -9,     31,      0,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex     -9,     31,    -50,    990,      0,  0x81, 0x00, 0x00, 0xFF
vertex     -9,    -30,      0,      0,    990,  0x81, 0x00, 0x00, 0xFF
vertex     10,     31,    -50,    990,      0,  0x7F, 0x00, 0x00, 0xFF
vertex     10,     31,      0,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex     10,    -30,      0,      0,    990,  0x7F, 0x00, 0x00, 0xFF
vertex     10,    -30,    -50,    990,    990,  0x7F, 0x00, 0x00, 0xFF

glabel book_seg5_dl_05002EF0 # 0x05002EF0 - 0x05002F58
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bookend_seg5_texture_05000C60
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x1FF, 0x200
gsSPLight book_seg5_light_05002560, 1
gsSPLight book_seg5_light_05002558, 2
gsSPVertex book_seg5_vertex_05002D70, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSPEndDisplayList

glabel book_seg5_dl_05002F58 # 0x05002F58 - 0x05002FB0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, book_seg5_texture_05002570
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex book_seg5_vertex_05002E30, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 10, 11, 0x0
gsSPEndDisplayList

glabel book_seg5_dl_05002FB0 # 0x05002FB0 - 0x05003040
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 60, 124
gsSPDisplayList book_seg5_dl_05002EF0
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList book_seg5_dl_05002F58
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
