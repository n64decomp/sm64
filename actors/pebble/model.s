# Pebble

pebble_seg3_vertex_0301C2C0: # 0x0301C2C0
vertex    -15,    -15,      0,      0,    992,  0xFF, 0xFF, 0xFF, 0xFF
vertex     15,    -15,      0,    992,    992,  0xFF, 0xFF, 0xFF, 0xFF
vertex     15,     15,      0,    992,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -15,     15,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

pebble_seg3_texture_0301C300: # 0x0301C300
.incbin "actors/pebble/pebble.rgba16"

glabel pebble_seg3_dl_0301CB00 # 0x0301CB00 - 0x0301CB98
gsDPPipeSync
gsSPClearGeometryMode G_LIGHTING
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, pebble_seg3_texture_0301C300
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsDPPipeSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPTexture -1, -1, 0, 0, 1
gsSPVertex pebble_seg3_vertex_0301C2C0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
