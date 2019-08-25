ssl_seg7_light_0700BF90: # 0x0700BF90 - 0x0700BF98
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

ssl_seg7_light_0700BF98: # 0x0700BF98 - 0x0700BFA8
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

ssl_seg7_texture_0700BFA8: # 0x0700BFA8 - 0x0700C7A8
.incbin "levels/ssl/8.rgba16"

ssl_seg7_texture_0700C7A8: # 0x0700C7A8 - 0x0700D7A8
.incbin "levels/ssl/9.rgba16"

ssl_seg7_texture_0700D7A8: # 0x0700D7A8 - 0x0700E7A8
.incbin "levels/ssl/10.rgba16"

ssl_seg7_texture_0700E7A8: # 0x0700E7A8 - 0x0700F7A8
.incbin "levels/ssl/11.rgba16"

ssl_seg7_vertex_0700F7A8: # 0x0700F7A8 - 0x0700F898
vertex   -153,   -255,   -153,      0,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    154,   -255,   -153,    990,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    154,    154,   -153,    990,    -86,  0x00, 0x00, 0x7F, 0xFF
vertex   -153,    154,    154,      0,      0,  0x00, 0x81, 0x00, 0xFF
vertex   -153,    154,   -153,      0,    990,  0x00, 0x81, 0x00, 0xFF
vertex    154,    154,   -153,    990,    990,  0x00, 0x81, 0x00, 0xFF
vertex    154,    154,    154,    990,      0,  0x00, 0x81, 0x00, 0xFF
vertex   -153,    154,    154,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex   -153,   -255,    154,      0,    990,  0x7F, 0x00, 0x00, 0xFF
vertex   -153,   -255,   -153,    990,    990,  0x7F, 0x00, 0x00, 0xFF
vertex   -153,    154,   -153,    990,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    154,    154,   -153,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex    154,   -255,    154,    990,    990,  0x81, 0x00, 0x00, 0xFF
vertex    154,    154,    154,    990,      0,  0x81, 0x00, 0x00, 0xFF
vertex    154,   -255,   -153,      0,    990,  0x81, 0x00, 0x00, 0xFF

ssl_seg7_vertex_0700F898: # 0x0700F898 - 0x0700F908
vertex    154,   -255,    154,    -26,    990,  0x00, 0x00, 0x81, 0xFF
vertex   -153,    154,    154,    990,      0,  0x00, 0x00, 0x81, 0xFF
vertex    154,    154,    154,    -26,      0,  0x00, 0x00, 0x81, 0xFF
vertex   -153,   -255,   -153,      0,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    154,    154,   -153,    990,    -86,  0x00, 0x00, 0x7F, 0xFF
vertex   -153,    154,   -153,      0,    -86,  0x00, 0x00, 0x7F, 0xFF
vertex   -153,   -255,    154,    990,    990,  0x00, 0x00, 0x81, 0xFF

ssl_seg7_vertex_0700F908: # 0x0700F908 - 0x0700FA08
vertex    256,   -255,   -255,    990,   2012,  0x7F, 0x00, 0x00, 0xFF
vertex    256,    256,   -255,    990,      0,  0x7F, 0x00, 0x00, 0xFF
vertex    256,    256,    256,      0,      0,  0x7F, 0x00, 0x00, 0xFF
vertex   -255,   -255,    256,    990,   2012,  0x81, 0x00, 0x00, 0xFF
vertex   -255,    256,   -255,      0,      0,  0x81, 0x00, 0x00, 0xFF
vertex   -255,   -255,   -255,      0,   2012,  0x81, 0x00, 0x00, 0xFF
vertex   -255,    256,    256,    990,      0,  0x81, 0x00, 0x00, 0xFF
vertex    154,   -255,    154,    172,   2012,  0x00, 0x81, 0x00, 0xFF
vertex    154,   -255,   -153,    786,   2012,  0x00, 0x81, 0x00, 0xFF
vertex    256,   -255,   -255,    990,   2012,  0x00, 0x81, 0x00, 0xFF
vertex    256,   -255,    256,      0,   2012,  0x7F, 0x00, 0x00, 0xFF
vertex    256,   -255,    256,      0,   2012,  0x00, 0x81, 0x00, 0xFF
vertex   -255,   -255,   -255,      0,   2012,  0x00, 0x81, 0x00, 0xFF
vertex   -153,   -255,    154,    786,   2012,  0x00, 0x81, 0x00, 0xFF
vertex   -255,   -255,    256,    990,   2012,  0x00, 0x81, 0x00, 0xFF
vertex   -153,   -255,   -153,    172,   2012,  0x00, 0x81, 0x00, 0xFF

ssl_seg7_vertex_0700FA08: # 0x0700FA08 - 0x0700FB08
vertex   -255,   -255,   -255,    990,   2012,  0x00, 0x00, 0x81, 0xFF
vertex   -255,    256,   -255,    990,      0,  0x00, 0x00, 0x81, 0xFF
vertex    256,    256,   -255,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex    256,   -255,   -255,      0,   2012,  0x00, 0x00, 0x81, 0xFF
vertex   -255,   -255,   -255,    990,   2012,  0x00, 0x81, 0x00, 0xFF
vertex    256,   -255,   -255,      0,   2012,  0x00, 0x81, 0x00, 0xFF
vertex    154,   -255,   -153,    172,   2012,  0x00, 0x81, 0x00, 0xFF
vertex   -153,   -255,   -153,    786,   2012,  0x00, 0x81, 0x00, 0xFF
vertex    256,   -255,    256,    990,   2012,  0x00, 0x00, 0x7F, 0xFF
vertex    256,    256,    256,    990,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -255,    256,    256,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -255,   -255,    256,      0,   2012,  0x00, 0x81, 0x00, 0xFF
vertex    154,   -255,    154,    786,   2012,  0x00, 0x81, 0x00, 0xFF
vertex    256,   -255,    256,    990,   2012,  0x00, 0x81, 0x00, 0xFF
vertex   -255,   -255,    256,      0,   2012,  0x00, 0x00, 0x7F, 0xFF
vertex   -153,   -255,    154,    172,   2012,  0x00, 0x81, 0x00, 0xFF

ssl_seg7_vertex_0700FB08: # 0x0700FB08 - 0x0700FB48
vertex   -255,    256,    256,      0,   2012,  0x00, 0x7F, 0x00, 0xFF
vertex    256,    256,    256,    990,   2012,  0x00, 0x7F, 0x00, 0xFF
vertex    256,    256,   -255,    990,      0,  0x00, 0x7F, 0x00, 0xFF
vertex   -255,    256,   -255,      0,      0,  0x00, 0x7F, 0x00, 0xFF

ssl_seg7_dl_0700FB48: # 0x0700FB48 - 0x0700FBD8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, ssl_seg7_texture_0700BFA8
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight ssl_seg7_light_0700BF98, 1
gsSPLight ssl_seg7_light_0700BF90, 2
gsSPVertex ssl_seg7_vertex_0700F7A8, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 14, 12, 0x0
gsSPVertex ssl_seg7_vertex_0700F898, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP1Triangle  0,  6,  1, 0x0
gsSPEndDisplayList

ssl_seg7_dl_0700FBD8: # 0x0700FBD8 - 0x0700FC40
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, ssl_seg7_texture_0700C7A8
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex ssl_seg7_vertex_0700F908, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  0,  2, 10, 0x0,  7,  9, 11, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 15, 13, 0x0
gsSPEndDisplayList

ssl_seg7_dl_0700FC40: # 0x0700FC40 - 0x0700FCA8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, ssl_seg7_texture_0700E7A8
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex ssl_seg7_vertex_0700FA08, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP2Triangles  8, 10, 14, 0x0, 11, 15, 12, 0x0
gsSPEndDisplayList

ssl_seg7_dl_0700FCA8: # 0x0700FCA8 - 0x0700FCE0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, ssl_seg7_texture_0700D7A8
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex ssl_seg7_vertex_0700FB08, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel ssl_seg7_dl_0700FCE0  # 0x0700FCE0 - 0x0700FD80
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList ssl_seg7_dl_0700FB48
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList ssl_seg7_dl_0700FBD8
gsSPDisplayList ssl_seg7_dl_0700FC40
gsSPDisplayList ssl_seg7_dl_0700FCA8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
