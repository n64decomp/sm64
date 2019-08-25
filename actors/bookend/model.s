# Bookend

# Unreferenced Light
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

# Unreferenced Light
.byte 0x03, 0x19, 0x09, 0x00, 0x03, 0x19, 0x09, 0x00

.byte 0x0C, 0x66, 0x26, 0x00, 0x0C, 0x66, 0x26, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

# Unreferenced Light
.byte 0x3F, 0x3F, 0x3F, 0x00, 0x3F, 0x3F, 0x3F, 0x00

.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

# Unreferenced Light
.byte 0x3F, 0x00, 0x00, 0x00, 0x3F, 0x00, 0x00, 0x00

.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bookend_seg5_texture_05000060: # 0x05000060
.incbin "actors/bookend/bookend_spine.rgba16"

bookend_seg5_texture_05000460: # 0x05000460
.incbin "actors/bookend/bookend_tooth.rgba16"

bookend_seg5_texture_05000860: # 0x05000860
.incbin "actors/bookend/bookend_mouth.rgba16"

bookend_seg5_texture_05000C60: # 0x05000C60
.incbin "actors/bookend/bookend_pages.rgba16"

bookend_seg5_texture_05001060: # 0x05001060
.incbin "actors/bookend/bookend_cover.rgba16"

bookend_seg5_light_05001860: # 0x05001860
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

bookend_seg5_light_05001868: # 0x05001868
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bookend_seg5_vertex_05001878: # 0x05001878
vertex    -10,      0,    108,      0,    990,  0x83, 0xED, 0x00, 0xFF
vertex     -4,    -39,   -109,    479,      0,  0x83, 0xED, 0x00, 0xFF
vertex     -4,    -39,    108,    479,    990,  0x83, 0xED, 0x00, 0xFF
vertex    -10,      0,   -109,      0,      0,  0x83, 0xED, 0x00, 0xFF

bookend_seg5_vertex_050018B8: # 0x050018B8
vertex     -4,    -39,   -109,    479,      0,  0x00, 0x81, 0x00, 0xFF
vertex    185,    -39,    108,      0,    990,  0x00, 0x81, 0x00, 0xFF
vertex     -4,    -39,    108,    479,    990,  0x00, 0x81, 0x00, 0xFF
vertex    185,    -39,   -109,      0,      0,  0x00, 0x81, 0x00, 0xFF

glabel bookend_seg5_dl_050018F8 # 0x050018F8 - 0x05001940
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bookend_seg5_texture_05000060
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x1FF, 0x200
gsSPLight bookend_seg5_light_05001868, 1
gsSPLight bookend_seg5_light_05001860, 2
gsSPVertex bookend_seg5_vertex_05001878, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel bookend_seg5_dl_05001940 # 0x05001940 - 0x05001978
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bookend_seg5_texture_05001060
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bookend_seg5_vertex_050018B8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel bookend_seg5_dl_05001978 # 0x05001978 - 0x05001A08
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 60, 124
gsSPDisplayList bookend_seg5_dl_050018F8
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bookend_seg5_dl_05001940
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsSPEndDisplayList

bookend_seg5_light_05001A08: # 0x05001A08
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

bookend_seg5_light_05001A10: # 0x05001A10
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bookend_seg5_vertex_05001A20: # 0x05001A20
vertex     -4,    -39,   -107,    479,    990,  0x83, 0xED, 0x00, 0xFF
vertex     -4,    -39,    110,    479,      0,  0x83, 0xED, 0x00, 0xFF
vertex    -10,      0,    110,      0,      0,  0x83, 0xED, 0x00, 0xFF
vertex    -10,      0,   -107,      0,    990,  0x83, 0xED, 0x00, 0xFF

bookend_seg5_vertex_05001A60: # 0x05001A60
vertex     -4,    -39,   -107,      0,    990,  0x00, 0x81, 0x00, 0xFF
vertex    185,    -39,    110,    990,      0,  0x00, 0x81, 0x00, 0xFF
vertex     -4,    -39,    110,      0,      0,  0x00, 0x81, 0x00, 0xFF
vertex    185,    -39,   -107,    990,    990,  0x00, 0x81, 0x00, 0xFF

glabel bookend_seg5_dl_05001AA0 # 0x05001AA0 - 0x05001AE8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bookend_seg5_texture_05000060
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x1FF, 0x200
gsSPLight bookend_seg5_light_05001A10, 1
gsSPLight bookend_seg5_light_05001A08, 2
gsSPVertex bookend_seg5_vertex_05001A20, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel bookend_seg5_dl_05001AE8 # 0x05001AE8 - 0x05001B20
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bookend_seg5_texture_05001060
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bookend_seg5_vertex_05001A60, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel bookend_seg5_dl_05001B20 # 0x05001B20 - 0x05001BB0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 60, 124
gsSPDisplayList bookend_seg5_dl_05001AA0
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bookend_seg5_dl_05001AE8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK | G_SHADING_SMOOTH
gsSPEndDisplayList

bookend_seg5_light_05001BB0: # 0x05001BB0
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

bookend_seg5_light_05001BB8: # 0x05001BB8
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bookend_seg5_vertex_05001BC8: # 0x05001BC8
vertex    -10,      0,    103,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    159,      0,   -104,    479,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    -10,      0,   -104,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    159,      0,    103,    479,    990,  0x00, 0x7F, 0x00, 0xFF

bookend_seg5_vertex_05001C08: # 0x05001C08
vertex    159,      0,    103,      0,     -6,  0x00, 0x00, 0x7F, 0xFF
vertex    -10,      0,    103,      0,    990,  0x00, 0x00, 0x7F, 0xFF
vertex     -4,    -38,    103,    479,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    170,    -38,    103,    479,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    159,      0,   -104,      0,      0,  0x79, 0x23, 0x00, 0xFF
vertex    159,      0,    103,      0,    990,  0x79, 0x23, 0x00, 0xFF
vertex    170,    -38,    103,    479,    990,  0x79, 0x23, 0x00, 0xFF
vertex    170,    -38,   -104,    479,      0,  0x79, 0x23, 0x00, 0xFF
vertex    -10,      0,   -104,      0,     -6,  0x00, 0x00, 0x81, 0xFF
vertex    159,      0,   -104,      0,    990,  0x00, 0x00, 0x81, 0xFF
vertex    170,    -38,   -104,    479,    990,  0x00, 0x00, 0x81, 0xFF
vertex     -4,    -38,   -104,    479,      0,  0x00, 0x00, 0x81, 0xFF

glabel bookend_seg5_dl_05001CC8 # 0x05001CC8 - 0x05001D10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bookend_seg5_texture_05000860
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x1FF, 0x200
gsSPLight bookend_seg5_light_05001BB8, 1
gsSPLight bookend_seg5_light_05001BB0, 2
gsSPVertex bookend_seg5_vertex_05001BC8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel bookend_seg5_dl_05001D10 # 0x05001D10 - 0x05001D68
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bookend_seg5_texture_05000C60
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x1FF, 0x200
gsSPVertex bookend_seg5_vertex_05001C08, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 10, 11, 0x0
gsSPEndDisplayList

glabel bookend_seg5_dl_05001D68 # 0x05001D68 - 0x05001DE0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 60, 124
gsSPDisplayList bookend_seg5_dl_05001CC8
gsSPDisplayList bookend_seg5_dl_05001D10
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

bookend_seg5_light_05001DE0: # 0x05001DE0
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

bookend_seg5_light_05001DE8: # 0x05001DE8
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bookend_seg5_vertex_05001DF8: # 0x05001DF8
vertex    -10,      0,    105,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex    159,      0,   -102,    479,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    -10,      0,   -102,      0,    990,  0x00, 0x7F, 0x00, 0xFF
vertex    159,      0,    105,    479,      0,  0x00, 0x7F, 0x00, 0xFF

bookend_seg5_vertex_05001E38: # 0x05001E38
vertex    170,    -38,   -102,    479,    990,  0x00, 0x00, 0x81, 0xFF
vertex     -4,    -38,   -102,    479,      0,  0x00, 0x00, 0x81, 0xFF
vertex    -10,      0,   -102,      0,     -6,  0x00, 0x00, 0x81, 0xFF
vertex    159,      0,   -102,      0,    990,  0x00, 0x00, 0x81, 0xFF
vertex    170,    -38,    105,    479,    990,  0x79, 0x23, 0x00, 0xFF
vertex    170,    -38,   -102,    479,      0,  0x79, 0x23, 0x00, 0xFF
vertex    159,      0,   -102,      0,      0,  0x79, 0x23, 0x00, 0xFF
vertex    159,      0,    105,      0,    990,  0x79, 0x23, 0x00, 0xFF
vertex     -4,    -38,    105,    479,    990,  0x00, 0x00, 0x7F, 0xFF
vertex    170,    -38,    105,    479,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    159,      0,    105,      0,     -6,  0x00, 0x00, 0x7F, 0xFF
vertex    -10,      0,    105,      0,    990,  0x00, 0x00, 0x7F, 0xFF

glabel bookend_seg5_dl_05001EF8 # 0x05001EF8 - 0x05001F40
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bookend_seg5_texture_05000860
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x1FF, 0x200
gsSPLight bookend_seg5_light_05001DE8, 1
gsSPLight bookend_seg5_light_05001DE0, 2
gsSPVertex bookend_seg5_vertex_05001DF8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel bookend_seg5_dl_05001F40 # 0x05001F40 - 0x05001F98
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bookend_seg5_texture_05000C60
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x1FF, 0x200
gsSPVertex bookend_seg5_vertex_05001E38, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 10, 11, 0x0
gsSPEndDisplayList

glabel bookend_seg5_dl_05001F98 # 0x05001F98 - 0x05002010
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 60, 124
gsSPDisplayList bookend_seg5_dl_05001EF8
gsSPDisplayList bookend_seg5_dl_05001F40
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList

bookend_seg5_light_05002010: # 0x05002010
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

bookend_seg5_light_05002018: # 0x05002018
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bookend_seg5_vertex_05002028: # 0x05002028
vertex    157,     -1,    -48,      6,    358,  0x83, 0xEE, 0x00, 0xFF
vertex    151,     39,    -72,    475,    624,  0x83, 0xEE, 0x00, 0xFF
vertex    157,     -1,    -99,    372,  -1002,  0x83, 0xEE, 0x00, 0xFF
vertex    157,     -1,      0,    106,    390,  0x83, 0xEE, 0x00, 0xFF
vertex    151,     39,    -24,    465,    636,  0x83, 0xEE, 0x00, 0xFF
vertex    157,     -1,    -48,    461,   -950,  0x83, 0xEE, 0x00, 0xFF
vertex    157,     -1,     51,    -54,    352,  0x83, 0xEE, 0x00, 0xFF
vertex    151,     39,     26,    478,    570,  0x83, 0xEE, 0x00, 0xFF
vertex    157,     -1,      0,    446,   -978,  0x83, 0xEE, 0x00, 0xFF
vertex    157,     -1,    103,     66,    302,  0x83, 0xEE, 0x00, 0xFF
vertex    151,     39,     78,    495,    590,  0x83, 0xEE, 0x00, 0xFF
vertex    157,     -1,     51,    462,   -962,  0x83, 0xEE, 0x00, 0xFF

glabel bookend_seg5_dl_050020E8 # 0x050020E8 - 0x05002140
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bookend_seg5_texture_05000460
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x1FF, 0x200
gsSPLight bookend_seg5_light_05002018, 1
gsSPLight bookend_seg5_light_05002010, 2
gsSPVertex bookend_seg5_vertex_05002028, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSPEndDisplayList

glabel bookend_seg5_dl_05002140 # 0x05002140 - 0x050021B0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 60, 124
gsSPDisplayList bookend_seg5_dl_050020E8
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK
gsSPEndDisplayList

bookend_seg5_light_050021B0: # 0x050021B0
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

bookend_seg5_light_050021B8: # 0x050021B8
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

bookend_seg5_vertex_050021C8: # 0x050021C8
vertex    157,     -1,    100,     32,    394,  0x83, 0xEE, 0x00, 0xFF
vertex    151,     39,     73,    426,    774,  0x83, 0xEE, 0x00, 0xFF
vertex    157,     -1,     49,    414,   -722,  0x83, 0xEE, 0x00, 0xFF
vertex    157,     -1,     49,    -39,    392,  0x83, 0xEE, 0x00, 0xFF
vertex    151,     39,     25,    457,    852,  0x83, 0xEE, 0x00, 0xFF
vertex    157,     -1,      0,    363,   -564,  0x83, 0xEE, 0x00, 0xFF
vertex    157,     -1,      0,     -1,    360,  0x83, 0xEE, 0x00, 0xFF
vertex    151,     39,    -25,    473,    906,  0x83, 0xEE, 0x00, 0xFF
vertex    157,     -1,    -50,    372,   -932,  0x83, 0xEE, 0x00, 0xFF
vertex    157,     -1,    -50,     12,    240,  0x83, 0xEE, 0x00, 0xFF
vertex    151,     39,    -77,    491,    632,  0x83, 0xEE, 0x00, 0xFF
vertex    157,     -1,   -102,    365,  -1004,  0x83, 0xEE, 0x00, 0xFF

glabel bookend_seg5_dl_05002288 # 0x05002288 - 0x050022E0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bookend_seg5_texture_05000460
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x1FF, 0x200
gsSPLight bookend_seg5_light_050021B8, 1
gsSPLight bookend_seg5_light_050021B0, 2
gsSPVertex bookend_seg5_vertex_050021C8, 12, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  9, 10, 11, 0x0
gsSPEndDisplayList

glabel bookend_seg5_dl_050022E0 # 0x050022E0 - 0x05002350
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 60, 124
gsSPDisplayList bookend_seg5_dl_05002288
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_CULL_BACK
gsSPEndDisplayList

bookend_seg5_animvalue_05002350: # 0x05002350
.hword 0x0000, 0xC001, 0x071C, 0x0D90, 0x198B, 0x1FFF, 0x198B, 0x0D90
.hword 0x0AAA, 0x1032, 0x1A77, 0x1FFF, 0x1A77, 0x1032, 0x3FFF, 0x8001

bookend_seg5_animindex_05002370: # 0x05002370
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0001
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0006, 0x0002, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x000E, 0x0001, 0x000F
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0006, 0x0008
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000

bookend_seg5_anim_050023F4: # 0x050023F4
.hword 0
.hword 0
.hword 0
.hword 0
.hword 0x06
.hword 0x0A
.word bookend_seg5_animvalue_05002350
.word bookend_seg5_animindex_05002370
.word 0

bookend_seg5_animvalue_0500240C: # 0x0500240C
.hword 0x0000, 0xC001, 0x3FFF, 0x3FFF, 0x3FFF, 0x3FFF, 0x3FFF, 0x3FFF
.hword 0x3FFF, 0x3FFF, 0x3FFF, 0x3FFF, 0x3FFF, 0x3FFF, 0x3FFF, 0x3FFF
.hword 0x3FFF, 0x3CB4, 0x381F, 0x3282, 0x2C20, 0x253E, 0x1E1D, 0x1701
.hword 0x102D, 0x09E4, 0x0469, 0x0000, 0xFEFB, 0x01A8, 0x0549, 0x071C
.hword 0x3FFF, 0x3FFF, 0x3FFF, 0x3FFF, 0x3FFF, 0x3FFF, 0x3FFF, 0x3FFF
.hword 0x3FFF, 0x3FFF, 0x3FFF, 0x3FFF, 0x3FFF, 0x3FFF, 0x3FFF, 0x3CAF
.hword 0x380D, 0x325E, 0x2BE8, 0x24F3, 0x1DC3, 0x169F, 0x0FCD, 0x0993
.hword 0x0437, 0x0000, 0xFFAB, 0x038E, 0x0855, 0x0AAA, 0x3FFF, 0x8001

bookend_seg5_animindex_0500248C: # 0x0500248C
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0001
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x001E, 0x0002, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x003E, 0x0001, 0x003F
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x001E, 0x0020
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000

bookend_seg5_anim_05002510: # 0x05002510
.hword 0
.hword 0
.hword 0
.hword 0
.hword 0x1E
.hword 0x0A
.word bookend_seg5_animvalue_0500240C
.word bookend_seg5_animindex_0500248C
.word 0

# what the hell? no values/indexes for the table?

bookend_seg5_anim_05002528: # 0x05002528
.hword 0
.hword 0
.hword 0
.hword 0
.hword 0x01
.hword 0x0A
.word bookend_seg5_animvalue_0500240C
.word bookend_seg5_animindex_0500248C
.word 0

glabel bookend_seg5_anims_05002540 # 0x05002540
.word bookend_seg5_anim_05002528
.word bookend_seg5_anim_050023F4
.word bookend_seg5_anim_05002510
.word 0
