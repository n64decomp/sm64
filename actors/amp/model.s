# Amp

amp_seg8_texture_08000F18: # 0x08000F18
.incbin "actors/amp/amp_electricity.rgba16"

amp_seg8_texture_08001318: # 0x08001318
.incbin "actors/amp/amp_eyes.rgba16"

amp_seg8_texture_08001B18: # 0x08001B18
.incbin "actors/amp/amp_body.rgba16"

amp_seg8_texture_08002318: # 0x08002318
.incbin "actors/amp/amp_mouth.rgba16"

amp_seg8_vertex_08002B18: # 0x08002B18
vertex    224,      0,    -89,      0,    480,  0xFF, 0xFF, 0xFF, 0xFF
vertex    187,    149,      0,    223,   1078,  0xFF, 0xFF, 0xFF, 0xFF
vertex    224,      0,     90,    479,    478,  0xFF, 0xFF, 0xFF, 0xFF
vertex    187,   -148,      0,    224,   -122,  0xFF, 0xFF, 0xFF, 0xFF
vertex    224,      0,    -89,      0,    478,  0xFF, 0xFF, 0xFF, 0xFF

glabel amp_seg8_dl_08002B68 # 0x08002B68 - 0x08002BA0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, amp_seg8_texture_08000F18
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x1FF, 0x200
gsSPVertex amp_seg8_vertex_08002B18, 5, 0
gsSP2Triangles  0,  1,  2, 0x0,  2,  3,  4, 0x0
gsSPEndDisplayList

glabel amp_seg8_dl_08002BA0 # 0x08002BA0 - 0x08002C10
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 4, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 60, 124
gsSPDisplayList amp_seg8_dl_08002B68
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList

amp_seg8_vertex_08002C10: # 0x08002C10
vertex     68,     72,    158,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -27,    -71,    164,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex     68,    -71,    158,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -27,     72,    164,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF

glabel amp_seg8_dl_08002C50 # 0x08002C50 - 0x08002C88
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, amp_seg8_texture_08001318
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex amp_seg8_vertex_08002C10, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel amp_seg8_dl_08002C88 # 0x08002C88 - 0x08002CF8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList amp_seg8_dl_08002C50
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

amp_seg8_vertex_08002CF8: # 0x08002CF8
vertex    -29,     72,    164,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -124,    -71,    121,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -29,    -71,    164,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -124,     72,    121,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF

glabel amp_seg8_dl_08002D38 # 0x08002D38 - 0x08002D70
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, amp_seg8_texture_08002318
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex amp_seg8_vertex_08002CF8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel amp_seg8_dl_08002D70 # 0x08002D70 - 0x08002DE0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList amp_seg8_dl_08002D38
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

amp_seg8_vertex_08002DE0: # 0x08002DE0
vertex    -39,    -39,      0,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex     40,     40,      0,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -39,     40,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex     40,    -39,      0,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF

glabel amp_seg8_dl_08002E20 # 0x08002E20 - 0x08002E58
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, amp_seg8_texture_08001B18
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex amp_seg8_vertex_08002DE0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel amp_seg8_dl_08002E58 # 0x08002E58 - 0x08002EC8
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList amp_seg8_dl_08002E20
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

amp_seg8_light_08002EC8: # 0x08002EC8
.byte 0x33, 0x3F, 0x00, 0x00, 0x33, 0x3F, 0x00, 0x00

amp_seg8_light_08002ED0: # 0x08002ED0
.byte 0xCF, 0xFF, 0x00, 0x00, 0xCF, 0xFF, 0x00, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

# //! Another malformed entry: Vertex interpreted as light
amp_seg8_vertex_08002EE0: # 0x08002EE0
vertex    280,      0,     35,      0,      0,  0x7B, 0xE2, 0x00, 0x00
vertex    240,   -160,      0,      0,      0,  0x7B, 0xE2, 0x00, 0x00
vertex    280,      0,    -35,      0,      0,  0x7B, 0xE2, 0x00, 0x00
vertex    280,      0,    -35,      0,      0,  0x7B, 0x1E, 0x00, 0xFF
vertex    240,    160,      0,      0,      0,  0x7B, 0x1E, 0x00, 0xFF
vertex    280,      0,     35,      0,      0,  0x7B, 0x1E, 0x00, 0xFF

amp_seg8_vertex_08002F40: # 0x08002F40
vertex    280,      0,     35,      0,      0,  0x7B, 0xE2, 0x00, 0x00
vertex    240,   -160,      0,      0,      0,  0x7B, 0xE2, 0x00, 0x00
vertex    280,      0,    -35,      0,      0,  0x7B, 0xE2, 0x00, 0x00
vertex    280,      0,    -35,      0,      0,  0x7B, 0x1E, 0x00, 0xFF
vertex    240,    160,      0,      0,      0,  0x7B, 0x1E, 0x00, 0xFF
vertex    280,      0,     35,      0,      0,  0x7B, 0x1E, 0x00, 0xFF

amp_seg8_vertex_08002FA0: # 0x08002FA0
vertex    280,      0,     35,      0,      0,  0x7B, 0xE2, 0x00, 0x00
vertex    240,   -160,      0,      0,      0,  0x7B, 0xE2, 0x00, 0x00
vertex    280,      0,    -35,      0,      0,  0x7B, 0xE2, 0x00, 0x00
vertex    280,      0,    -35,      0,      0,  0x7B, 0x1E, 0x00, 0xFF
vertex    240,    160,      0,      0,      0,  0x7B, 0x1E, 0x00, 0xFF
vertex    280,      0,     35,      0,      0,  0x7B, 0x1E, 0x00, 0xFF

amp_seg8_vertex_08003000: # 0x08003000
vertex    280,      0,    -35,      0,      0,  0x7B, 0x1E, 0x00, 0x00
vertex    240,    160,      0,      0,      0,  0x7B, 0x1E, 0x00, 0x00
vertex    280,      0,     35,      0,      0,  0x7B, 0x1E, 0x00, 0x00
vertex    280,      0,     35,      0,      0,  0x7B, 0xE2, 0x00, 0xFF
vertex    240,   -160,      0,      0,      0,  0x7B, 0xE2, 0x00, 0xFF
vertex    280,      0,    -35,      0,      0,  0x7B, 0xE2, 0x00, 0xFF

amp_seg8_vertex_08003060: # 0x08003060
vertex   -184,    -54,    -54,      0,      0,  0x8B, 0xDE, 0xDE, 0x00
vertex   -184,    -76,      0,      0,      0,  0x8B, 0xD0, 0x00, 0x00
vertex   -200,      0,      0,      0,      0,  0x81, 0x00, 0x00, 0x00
vertex   -141,   -100,   -100,      0,      0,  0xA6, 0xC1, 0xC1, 0xFF
vertex   -141,   -141,      0,      0,      0,  0xA6, 0xA7, 0x00, 0xFF
vertex    -76,   -130,   -130,      0,      0,  0xD0, 0xAE, 0xAE, 0xFF
vertex    -76,   -184,      0,      0,      0,  0xD0, 0x8B, 0x00, 0xFF
vertex      0,   -141,   -141,      0,      0,  0x00, 0xA7, 0xA7, 0xFF
vertex      0,   -200,      0,      0,      0,  0x00, 0x81, 0x00, 0xFF
vertex     76,   -130,   -130,      0,      0,  0x30, 0xAE, 0xAE, 0xFF
vertex     76,   -184,      0,      0,      0,  0x30, 0x8B, 0x00, 0xFF
vertex    141,   -100,   -100,      0,      0,  0x5A, 0xC1, 0xC1, 0xFF
vertex    141,   -141,      0,      0,      0,  0x5A, 0xA7, 0x00, 0xFF
vertex    184,    -54,    -54,      0,      0,  0x75, 0xDE, 0xDE, 0xFF
vertex    184,    -76,      0,      0,      0,  0x75, 0xD0, 0x00, 0xFF
vertex    200,      0,      0,      0,      0,  0x7F, 0x00, 0x00, 0xFF

amp_seg8_vertex_08003160: # 0x08003160
vertex   -184,      0,    -76,      0,      0,  0x8B, 0x00, 0xD0, 0xFF
vertex   -184,    -54,    -54,      0,      0,  0x8B, 0xDE, 0xDE, 0x00
vertex   -200,      0,      0,      0,      0,  0x81, 0x00, 0x00, 0x00
vertex   -141,      0,   -141,      0,      0,  0xA6, 0x00, 0xA7, 0xFF
vertex   -141,   -100,   -100,      0,      0,  0xA6, 0xC1, 0xC1, 0xFF
vertex    -76,      0,   -184,      0,      0,  0xD0, 0x00, 0x8B, 0xFF
vertex    -76,   -130,   -130,      0,      0,  0xD0, 0xAE, 0xAE, 0xFF
vertex      0,      0,   -200,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex      0,   -141,   -141,      0,      0,  0x00, 0xA7, 0xA7, 0xFF
vertex     76,      0,   -184,      0,      0,  0x30, 0x00, 0x8B, 0xFF
vertex     76,   -130,   -130,      0,      0,  0x30, 0xAE, 0xAE, 0xFF
vertex    141,      0,   -141,      0,      0,  0x5A, 0x00, 0xA7, 0xFF
vertex    141,   -100,   -100,      0,      0,  0x5A, 0xC1, 0xC1, 0xFF
vertex    184,      0,    -76,      0,      0,  0x75, 0x00, 0xD0, 0xFF
vertex    184,    -54,    -54,      0,      0,  0x75, 0xDE, 0xDE, 0xFF
vertex    200,      0,      0,      0,      0,  0x7F, 0x00, 0x00, 0xFF

amp_seg8_vertex_08003260: # 0x08003260
vertex   -184,     54,    -54,      0,      0,  0x8B, 0x22, 0xDE, 0xFF
vertex   -184,      0,    -76,      0,      0,  0x8B, 0x00, 0xD0, 0x00
vertex   -200,      0,      0,      0,      0,  0x81, 0x00, 0x00, 0x00
vertex   -141,    100,   -100,      0,      0,  0xA6, 0x3F, 0xC1, 0xFF
vertex   -141,      0,   -141,      0,      0,  0xA6, 0x00, 0xA7, 0xFF
vertex    -76,    130,   -130,      0,      0,  0xD0, 0x52, 0xAE, 0xFF
vertex    -76,      0,   -184,      0,      0,  0xD0, 0x00, 0x8B, 0xFF
vertex      0,    141,   -141,      0,      0,  0x00, 0x59, 0xA7, 0xFF
vertex      0,      0,   -200,      0,      0,  0x00, 0x00, 0x81, 0xFF
vertex     76,    130,   -130,      0,      0,  0x30, 0x52, 0xAE, 0xFF
vertex     76,      0,   -184,      0,      0,  0x30, 0x00, 0x8B, 0xFF
vertex    141,    100,   -100,      0,      0,  0x5A, 0x3F, 0xC1, 0xFF
vertex    141,      0,   -141,      0,      0,  0x5A, 0x00, 0xA7, 0xFF
vertex    184,     54,    -54,      0,      0,  0x75, 0x22, 0xDE, 0xFF
vertex    184,      0,    -76,      0,      0,  0x75, 0x00, 0xD0, 0xFF
vertex    200,      0,      0,      0,      0,  0x7F, 0x00, 0x00, 0xFF

amp_seg8_vertex_08003360: # 0x08003360
vertex   -184,     76,      0,      0,      0,  0x8B, 0x30, 0x00, 0xFF
vertex   -184,     54,    -54,      0,      0,  0x8B, 0x22, 0xDE, 0x00
vertex   -200,      0,      0,      0,      0,  0x81, 0x00, 0x00, 0x00
vertex   -141,    141,      0,      0,      0,  0xA6, 0x59, 0x00, 0xFF
vertex   -141,    100,   -100,      0,      0,  0xA6, 0x3F, 0xC1, 0xFF
vertex    -76,    184,      0,      0,      0,  0xD0, 0x75, 0x00, 0xFF
vertex    -76,    130,   -130,      0,      0,  0xD0, 0x52, 0xAE, 0xFF
vertex      0,    200,      0,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex      0,    141,   -141,      0,      0,  0x00, 0x59, 0xA7, 0xFF
vertex     76,    184,      0,      0,      0,  0x30, 0x75, 0x00, 0xFF
vertex     76,    130,   -130,      0,      0,  0x30, 0x52, 0xAE, 0xFF
vertex    141,    141,      0,      0,      0,  0x5A, 0x59, 0x00, 0xFF
vertex    141,    100,   -100,      0,      0,  0x5A, 0x3F, 0xC1, 0xFF
vertex    184,     76,      0,      0,      0,  0x75, 0x30, 0x00, 0xFF
vertex    184,     54,    -54,      0,      0,  0x75, 0x22, 0xDE, 0xFF
vertex    200,      0,      0,      0,      0,  0x7F, 0x00, 0x00, 0xFF

amp_seg8_vertex_08003460: # 0x08003460
vertex   -184,     54,     54,      0,      0,  0x8B, 0x22, 0x22, 0xFF
vertex   -184,     76,      0,      0,      0,  0x8B, 0x30, 0x00, 0x00
vertex   -200,      0,      0,      0,      0,  0x81, 0x00, 0x00, 0x00
vertex   -141,    100,    100,      0,      0,  0xA6, 0x3F, 0x3F, 0xFF
vertex   -141,    141,      0,      0,      0,  0xA6, 0x59, 0x00, 0xFF
vertex    -76,    130,    130,      0,      0,  0xD0, 0x52, 0x52, 0xFF
vertex    -76,    184,      0,      0,      0,  0xD0, 0x75, 0x00, 0xFF
vertex      0,    141,    141,      0,      0,  0x00, 0x59, 0x59, 0xFF
vertex      0,    200,      0,      0,      0,  0x00, 0x7F, 0x00, 0xFF
vertex     76,    130,    130,      0,      0,  0x30, 0x52, 0x52, 0xFF
vertex     76,    184,      0,      0,      0,  0x30, 0x75, 0x00, 0xFF
vertex    141,    100,    100,      0,      0,  0x5A, 0x3F, 0x3F, 0xFF
vertex    141,    141,      0,      0,      0,  0x5A, 0x59, 0x00, 0xFF
vertex    184,     54,     54,      0,      0,  0x75, 0x22, 0x22, 0xFF
vertex    184,     76,      0,      0,      0,  0x75, 0x30, 0x00, 0xFF
vertex    200,      0,      0,      0,      0,  0x7F, 0x00, 0x00, 0xFF

amp_seg8_vertex_08003560: # 0x08003560
vertex   -184,      0,     76,      0,      0,  0x8B, 0x00, 0x30, 0xFF
vertex   -184,     54,     54,      0,      0,  0x8B, 0x22, 0x22, 0x00
vertex   -200,      0,      0,      0,      0,  0x81, 0x00, 0x00, 0x00
vertex   -141,      0,    141,      0,      0,  0xA6, 0x00, 0x59, 0xFF
vertex   -141,    100,    100,      0,      0,  0xA6, 0x3F, 0x3F, 0xFF
vertex    -76,      0,    184,      0,      0,  0xD0, 0x00, 0x75, 0xFF
vertex    -76,    130,    130,      0,      0,  0xD0, 0x52, 0x52, 0xFF
vertex      0,      0,    200,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex      0,    141,    141,      0,      0,  0x00, 0x59, 0x59, 0xFF
vertex     76,      0,    184,      0,      0,  0x30, 0x00, 0x75, 0xFF
vertex     76,    130,    130,      0,      0,  0x30, 0x52, 0x52, 0xFF
vertex    141,      0,    141,      0,      0,  0x5A, 0x00, 0x59, 0xFF
vertex    141,    100,    100,      0,      0,  0x5A, 0x3F, 0x3F, 0xFF
vertex    184,      0,     76,      0,      0,  0x75, 0x00, 0x30, 0xFF
vertex    184,     54,     54,      0,      0,  0x75, 0x22, 0x22, 0xFF
vertex    200,      0,      0,      0,      0,  0x7F, 0x00, 0x00, 0xFF

amp_seg8_vertex_08003660: # 0x08003660
vertex   -184,    -54,     54,      0,      0,  0x8B, 0xDE, 0x22, 0xFF
vertex   -184,      0,     76,      0,      0,  0x8B, 0x00, 0x30, 0x00
vertex   -200,      0,      0,      0,      0,  0x81, 0x00, 0x00, 0x00
vertex   -141,   -100,    100,      0,      0,  0xA6, 0xC1, 0x3F, 0xFF
vertex   -141,      0,    141,      0,      0,  0xA6, 0x00, 0x59, 0xFF
vertex    -76,   -130,    130,      0,      0,  0xD0, 0xAE, 0x52, 0xFF
vertex    -76,      0,    184,      0,      0,  0xD0, 0x00, 0x75, 0xFF
vertex      0,   -141,    141,      0,      0,  0x00, 0xA7, 0x59, 0xFF
vertex      0,      0,    200,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex     76,   -130,    130,      0,      0,  0x30, 0xAE, 0x52, 0xFF
vertex     76,      0,    184,      0,      0,  0x30, 0x00, 0x75, 0xFF
vertex    141,   -100,    100,      0,      0,  0x5A, 0xC1, 0x3F, 0xFF
vertex    141,      0,    141,      0,      0,  0x5A, 0x00, 0x59, 0xFF
vertex    184,    -54,     54,      0,      0,  0x75, 0xDE, 0x22, 0xFF
vertex    184,      0,     76,      0,      0,  0x75, 0x00, 0x30, 0xFF
vertex    200,      0,      0,      0,      0,  0x7F, 0x00, 0x00, 0xFF

amp_seg8_vertex_08003760: # 0x08003760
vertex   -184,    -76,      0,      0,      0,  0x8B, 0xD0, 0x00, 0xFF
vertex   -184,    -54,     54,      0,      0,  0x8B, 0xDE, 0x22, 0x00
vertex   -200,      0,      0,      0,      0,  0x81, 0x00, 0x00, 0x00
vertex   -141,   -141,      0,      0,      0,  0xA6, 0xA7, 0x00, 0xFF
vertex   -141,   -100,    100,      0,      0,  0xA6, 0xC1, 0x3F, 0xFF
vertex    -76,   -184,      0,      0,      0,  0xD0, 0x8B, 0x00, 0xFF
vertex    -76,   -130,    130,      0,      0,  0xD0, 0xAE, 0x52, 0xFF
vertex      0,   -200,      0,      0,      0,  0x00, 0x81, 0x00, 0xFF
vertex      0,   -141,    141,      0,      0,  0x00, 0xA7, 0x59, 0xFF
vertex     76,   -184,      0,      0,      0,  0x30, 0x8B, 0x00, 0xFF
vertex     76,   -130,    130,      0,      0,  0x30, 0xAE, 0x52, 0xFF
vertex    141,   -141,      0,      0,      0,  0x5A, 0xA7, 0x00, 0xFF
vertex    141,   -100,    100,      0,      0,  0x5A, 0xC1, 0x3F, 0xFF
vertex    184,    -76,      0,      0,      0,  0x75, 0xD0, 0x00, 0xFF
vertex    184,    -54,     54,      0,      0,  0x75, 0xDE, 0x22, 0xFF
vertex    200,      0,      0,      0,      0,  0x7F, 0x00, 0x00, 0xFF

amp_seg8_vertex_08003860: # 0x08003860
vertex    -37,     90,    205,      0,      0,  0xCC, 0x00, 0x73, 0x00
vertex   -129,     90,    163,      0,      0,  0xCC, 0x00, 0x73, 0x00
vertex   -129,    -90,    163,      0,      0,  0xCC, 0x00, 0x73, 0x00
vertex    -37,    -90,    205,      0,      0,  0xCC, 0x00, 0x73, 0xFF

amp_seg8_vertex_080038A0: # 0x080038A0
vertex    112,     -7,    182,      0,      0,  0x4C, 0xD8, 0x5C, 0x00
vertex     66,   -139,    162,      0,      0,  0x4C, 0xD8, 0x5C, 0x00
vertex    175,    -77,     98,      0,      0,  0x4C, 0xD8, 0x5C, 0x00

amp_seg8_vertex_080038D0: # 0x080038D0
vertex     63,     90,    198,      0,      0,  0x08, 0x00, 0x7E, 0x00
vertex    -35,     90,    205,      0,      0,  0x08, 0x00, 0x7E, 0x00
vertex    -35,    -90,    205,      0,      0,  0x08, 0x00, 0x7E, 0x00
vertex     63,    -90,    198,      0,      0,  0x08, 0x00, 0x7E, 0xFF

glabel amp_seg8_dl_08003910 # 0x08003910 - 0x08003940
gsSPLight amp_seg8_light_08002ED0, 1
gsSPLight amp_seg8_light_08002EC8, 2
gsSPVertex amp_seg8_vertex_08002EE0, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPEndDisplayList

glabel amp_seg8_dl_08003940 # 0x08003940 - 0x08003970
gsSPLight amp_seg8_light_08002ED0, 1
gsSPLight amp_seg8_light_08002EC8, 2
gsSPVertex amp_seg8_vertex_08002F40, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPEndDisplayList

glabel amp_seg8_dl_08003970 # 0x08003970 - 0x080039A0
gsSPLight amp_seg8_light_08002ED0, 1
gsSPLight amp_seg8_light_08002EC8, 2
gsSPVertex amp_seg8_vertex_08002FA0, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPEndDisplayList

glabel amp_seg8_dl_080039A0 # 0x080039A0 - 0x080039D0
gsSPLight amp_seg8_light_08002ED0, 1
gsSPLight amp_seg8_light_08002EC8, 2
gsSPVertex amp_seg8_vertex_08003000, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPEndDisplayList

glabel amp_seg8_dl_080039D0 # 0x080039D0 - 0x08003DA8
gsSPLight amp_seg8_vertex_08002EE0 + 0x8, 1
gsSPLight amp_seg8_vertex_08002EE0, 2
gsSPVertex amp_seg8_vertex_08003060, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  0,  3, 0x0
gsSP2Triangles  1,  3,  4, 0x0,  4,  3,  5, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  6,  5,  7, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  8,  7,  9, 0x0
gsSP2Triangles  8,  9, 10, 0x0, 10,  9, 11, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 12, 11, 13, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 14, 13, 15, 0x0
gsSPVertex amp_seg8_vertex_08003160, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  0,  3, 0x0
gsSP2Triangles  1,  3,  4, 0x0,  4,  3,  5, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  6,  5,  7, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  8,  7,  9, 0x0
gsSP2Triangles  8,  9, 10, 0x0, 10,  9, 11, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 12, 11, 13, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 14, 13, 15, 0x0
gsSPVertex amp_seg8_vertex_08003260, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  0,  3, 0x0
gsSP2Triangles  1,  3,  4, 0x0,  4,  3,  5, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  6,  5,  7, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  8,  7,  9, 0x0
gsSP2Triangles  8,  9, 10, 0x0, 10,  9, 11, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 12, 11, 13, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 14, 13, 15, 0x0
gsSPVertex amp_seg8_vertex_08003360, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  0,  3, 0x0
gsSP2Triangles  1,  3,  4, 0x0,  4,  3,  5, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  6,  5,  7, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  8,  7,  9, 0x0
gsSP2Triangles  8,  9, 10, 0x0, 10,  9, 11, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 12, 11, 13, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 14, 13, 15, 0x0
gsSPVertex amp_seg8_vertex_08003460, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  0,  3, 0x0
gsSP2Triangles  1,  3,  4, 0x0,  4,  3,  5, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  6,  5,  7, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  8,  7,  9, 0x0
gsSP2Triangles  8,  9, 10, 0x0, 10,  9, 11, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 12, 11, 13, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 14, 13, 15, 0x0
gsSPVertex amp_seg8_vertex_08003560, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  0,  3, 0x0
gsSP2Triangles  1,  3,  4, 0x0,  4,  3,  5, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  6,  5,  7, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  8,  7,  9, 0x0
gsSP2Triangles  8,  9, 10, 0x0, 10,  9, 11, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 12, 11, 13, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 14, 13, 15, 0x0
gsSPVertex amp_seg8_vertex_08003660, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  0,  3, 0x0
gsSP2Triangles  1,  3,  4, 0x0,  4,  3,  5, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  6,  5,  7, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  8,  7,  9, 0x0
gsSP2Triangles  8,  9, 10, 0x0, 10,  9, 11, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 12, 11, 13, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 14, 13, 15, 0x0
gsSPVertex amp_seg8_vertex_08003760, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  1,  0,  3, 0x0
gsSP2Triangles  1,  3,  4, 0x0,  4,  3,  5, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  6,  5,  7, 0x0
gsSP2Triangles  6,  7,  8, 0x0,  8,  7,  9, 0x0
gsSP2Triangles  8,  9, 10, 0x0, 10,  9, 11, 0x0
gsSP2Triangles 10, 11, 12, 0x0, 12, 11, 13, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 14, 13, 15, 0x0
gsSPEndDisplayList

glabel amp_seg8_dl_08003DA8 # 0x08003DA8 - 0x08003DD8
gsSPLight amp_seg8_vertex_08002EE0 + 0x8, 1
gsSPLight amp_seg8_vertex_08002EE0, 2
gsSPVertex amp_seg8_vertex_08003860, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel amp_seg8_dl_08003DD8 # 0x08003DD8 - 0x08003E00
gsSPLight amp_seg8_vertex_08002EE0 + 0x8, 1
gsSPLight amp_seg8_vertex_08002EE0, 2
gsSPVertex amp_seg8_vertex_080038A0, 3, 0
gsSP1Triangle  0,  1,  2, 0x0
gsSPEndDisplayList

glabel amp_seg8_dl_08003E00 # 0x08003E00 - 0x08003E30
gsSPLight amp_seg8_vertex_08002EE0 + 0x8, 1
gsSPLight amp_seg8_vertex_08002EE0, 2
gsSPVertex amp_seg8_vertex_080038D0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

amp_seg8_animvalue_08003E30: # 0x08003E30
.hword 0x0000, 0x0000, 0x0D79, 0x1AF2, 0x286B, 0x35E4, 0x435D, 0x50D6
.hword 0x5E50, 0x6BC9, 0x7942, 0x86BE, 0x9437, 0xA1B0, 0xAF2A, 0xBCA3
.hword 0xCA1C, 0xD795, 0xE50E, 0xF287, 0x1872, 0x0000, 0x1AF2, 0x35E4
.hword 0x50D6, 0x6BC9, 0x86BE, 0xA1B0, 0xBCA3, 0xD795, 0xF287, 0x0D79
.hword 0x286B, 0x435D, 0x5E50, 0x7942, 0x9437, 0xAF2A, 0xCA1C, 0xE50E
.hword 0x0000, 0x1AF2, 0x35E4, 0x50D6, 0x6BC9, 0x86BE, 0xA1B0, 0xBCA3
.hword 0xD795, 0xF287, 0x0D79, 0x286B, 0x435D, 0x5E50, 0x7942, 0x9437
.hword 0xAF2A, 0xCA1C, 0xE50E, 0x8001, 0x5793, 0x2F28, 0x06BC, 0xDE52
.hword 0xB5E6, 0x8D7B, 0x650C, 0x3CA1, 0x1435, 0xEBCB, 0xC35F, 0x9AF4
.hword 0x7285, 0x4A1A, 0x21AE, 0xF944, 0xD0D8, 0xA86D, 0x3FFF, 0x0000
.hword 0x0D7C, 0x1AF9, 0x2876, 0x35F3, 0x4370, 0x50ED, 0x5E6A, 0x6BE7
.hword 0x7964, 0x86E3, 0x9460, 0xA1DD, 0xAF5A, 0xBCD7, 0xCA54, 0xD7D1
.hword 0xE54E, 0xF2CB, 0xC001, 0x3FFF, 0x0000, 0x0D7B, 0x1AF7, 0x2873
.hword 0x35EF, 0x436B, 0x50E6, 0x5E62, 0x6BDE, 0x795A, 0x86D9, 0x9455
.hword 0xA1D0, 0xAF4C, 0xBCC8, 0xCA44, 0xD7C0, 0xE53B, 0xF2B7, 0xC001
.hword 0x3FFF, 0xC001, 0xCD7A, 0xDAF2, 0xE86B, 0xF5E3, 0x035B, 0x10D3
.hword 0x1E4C, 0x2BC4, 0x393D, 0x46B5, 0x542E, 0x61A6, 0x6F1F, 0x7C97
.hword 0x8A13, 0x978B, 0xA504, 0xB27D, 0xC001, 0x3FFF, 0x4D79, 0x5AF2
.hword 0x686C, 0x75E5, 0x8362, 0x90DB, 0x9E55, 0xABCF, 0xB948, 0xC6C2
.hword 0xD43B, 0xE1B5, 0xEF2F, 0xFCA8, 0x0A21, 0x179A, 0x2514, 0x328D
.hword 0xC001, 0x3FFF

amp_seg8_animindex_08003F74: # 0x08003F74
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x00A1, 0x0001, 0x0000, 0x0013, 0x008D, 0x0001, 0x00A0
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0013, 0x0001, 0x0001, 0x0000
.hword 0x0013, 0x0079, 0x0001, 0x008C, 0x0001, 0x0014, 0x0001, 0x0000
.hword 0x0013, 0x0015, 0x0001, 0x0000, 0x0013, 0x0064, 0x0001, 0x0077
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0013, 0x0028, 0x0001, 0x0000
.hword 0x0013, 0x004F, 0x0001, 0x0062, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0013, 0x003B, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0078
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0063, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x004E

amp_seg8_anim_0800401C: # 0x0800401C
.hword 0
.hword 0
.hword 0
.hword 0
.hword 0x13
.hword 0x0D
.word amp_seg8_animvalue_08003E30
.word amp_seg8_animindex_08003F74
.word 0

glabel amp_seg8_anims_08004034 # 0x08004034
.word amp_seg8_anim_0800401C
