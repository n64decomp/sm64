# Pokey

pokey_seg5_vertex_05011710: # 0x05011710
vertex     26,     26,      0,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -25,     26,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -25,    -25,      0,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex     26,    -25,      0,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF

pokey_seg5_texture_05011750: # 0x05011750
.incbin "actors/pokey/pokey_face.rgba16"

pokey_seg5_texture_05011F50: # 0x05011F50
.incbin "actors/pokey/pokey_face_blink.rgba16"

glabel pokey_seg5_dl_05012750 # 0x05012750 - 0x05012798
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPEndDisplayList

glabel pokey_seg5_dl_05012798 # 0x05012798 - 0x050127D8
gsSPVertex pokey_seg5_vertex_05011710, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

glabel pokey_seg5_dl_050127D8 # 0x050127D8 - 0x05012808
gsSPDisplayList pokey_seg5_dl_05012750
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, pokey_seg5_texture_05011750
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList pokey_seg5_dl_05012798
gsSPEndDisplayList

glabel pokey_seg5_dl_05012808 # 0x05012808 - 0x05012838
gsSPDisplayList pokey_seg5_dl_05012750
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, pokey_seg5_texture_05011F50
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPDisplayList pokey_seg5_dl_05012798
gsSPEndDisplayList

pokey_seg5_vertex_05012838: # 0x05012838
vertex     26,     26,      0,    990,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -25,     26,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -25,    -25,      0,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex     26,    -25,      0,    990,    990,  0xFF, 0xFF, 0xFF, 0xFF

pokey_seg5_texture_05012878: # 0x05012878
.incbin "actors/pokey/pokey_body.rgba16"

glabel pokey_seg5_dl_05013078 # 0x05013078 - 0x050130B0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, pokey_seg5_texture_05012878
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex pokey_seg5_vertex_05012838, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel pokey_seg5_dl_050130B0 # 0x050130B0 - 0x05013120
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList pokey_seg5_dl_05013078
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
