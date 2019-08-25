bbh_seg7_light_07020368: # 0x07020368 - 0x07020370
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

bbh_seg7_light_07020370: # 0x07020370 - 0x07020380
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bbh_seg7_vertex_07020380: # 0x07020380 - 0x07020480
vertex     58,      0,      0,    990,    479,  0x00, 0x00, 0x7F, 0xFF
vertex    -57,     77,      0,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    -57,      0,      0,      0,    479,  0x00, 0x00, 0x7F, 0xFF
vertex     58,     77,      0,    990,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    115,      0,   -306,   2006,    479,  0x7C, 0x00, 0x17, 0xFF
vertex     58,     77,      0,      0,      0,  0x7C, 0x00, 0x17, 0xFF
vertex     58,      0,      0,      0,    479,  0x7C, 0x00, 0x17, 0xFF
vertex    115,     77,   -306,   2006,      0,  0x7C, 0x00, 0x17, 0xFF
vertex     58,      0,   -460,    990,    479,  0x77, 0x00, 0xD4, 0xFF
vertex    115,     77,   -306,    -30,      0,  0x77, 0x00, 0xD4, 0xFF
vertex    115,      0,   -306,    -30,    479,  0x77, 0x00, 0xD4, 0xFF
vertex     58,     77,   -460,    990,      0,  0x77, 0x00, 0xD4, 0xFF
vertex    -57,      0,   -460,      0,    479,  0x00, 0x00, 0x81, 0xFF
vertex     58,     77,   -460,    990,      0,  0x00, 0x00, 0x81, 0xFF
vertex     58,      0,   -460,    990,    479,  0x00, 0x00, 0x81, 0xFF
vertex    -57,     77,   -460,      0,      0,  0x00, 0x00, 0x81, 0xFF

bbh_seg7_vertex_07020480: # 0x07020480 - 0x07020500
vertex   -114,      0,   -306,    -30,    479,  0x89, 0x00, 0xD4, 0xFF
vertex   -114,     77,   -306,    -30,      0,  0x89, 0x00, 0xD4, 0xFF
vertex    -57,     77,   -460,    990,      0,  0x89, 0x00, 0xD4, 0xFF
vertex    -57,      0,   -460,    990,    479,  0x89, 0x00, 0xD4, 0xFF
vertex    -57,      0,      0,      0,    479,  0x84, 0x00, 0x17, 0xFF
vertex   -114,     77,   -306,   2006,      0,  0x84, 0x00, 0x17, 0xFF
vertex   -114,      0,   -306,   2006,    479,  0x84, 0x00, 0x17, 0xFF
vertex    -57,     77,      0,      0,      0,  0x84, 0x00, 0x17, 0xFF

bbh_seg7_vertex_07020500: # 0x07020500 - 0x07020560
vertex    -57,      0,   -460,   3034,   1117,  0x00, 0x81, 0x00, 0xFF
vertex     58,      0,   -460,   3034,    351,  0x00, 0x81, 0x00, 0xFF
vertex    115,      0,   -306,   2012,      0,  0x00, 0x81, 0x00, 0xFF
vertex   -114,      0,   -306,   2012,   1500,  0x00, 0x81, 0x00, 0xFF
vertex    -57,      0,      0,      0,   1117,  0x00, 0x81, 0x00, 0xFF
vertex     58,      0,      0,      0,    351,  0x00, 0x81, 0x00, 0xFF

bbh_seg7_vertex_07020560: # 0x07020560 - 0x070205C0
vertex    -57,     77,      0,    224,   2012,  0x00, 0x7F, 0x00, 0xFF
vertex    115,     77,   -306,    990,    648,  0x00, 0x7F, 0x00, 0xFF
vertex   -114,     77,   -306,      0,    648,  0x00, 0x7F, 0x00, 0xFF
vertex     58,     77,      0,    734,   2012,  0x00, 0x7F, 0x00, 0xFF
vertex     58,     77,   -460,    734,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    -57,     77,   -460,    224,      0,  0x00, 0x7F, 0x00, 0xFF

bbh_seg7_dl_070205C0: # 0x070205C0 - 0x07020660
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bbh_seg7_texture_07004400
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x1FF, 0x100
gsSPLight bbh_seg7_light_07020370, 1
gsSPLight bbh_seg7_light_07020368, 2
gsSPVertex bbh_seg7_vertex_07020380, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 15, 13, 0x0
gsSPVertex bbh_seg7_vertex_07020480, 8, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  7,  5, 0x0
gsSPEndDisplayList

bbh_seg7_dl_07020660: # 0x07020660 - 0x070206A8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bbh_seg7_texture_07003000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x1FF, 0x100
gsSPVertex bbh_seg7_vertex_07020500, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  2,  4,  3, 0x0,  2,  5,  4, 0x0
gsSPEndDisplayList

bbh_seg7_dl_070206A8: # 0x070206A8 - 0x070206F0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bbh_seg7_texture_07003400
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsSPVertex bbh_seg7_vertex_07020560, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSP2Triangles  1,  4,  5, 0x0,  1,  5,  2, 0x0
gsSPEndDisplayList

glabel bbh_seg7_dl_070206F0 # 0x070206F0 - 0x070207A0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 60
gsSPDisplayList bbh_seg7_dl_070205C0
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 60
gsSPDisplayList bbh_seg7_dl_07020660
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPDisplayList bbh_seg7_dl_070206A8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
