wf_seg7_light_0700EBB8: # 0x0700EBB8 - 0x0700EBC0
.byte 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00

wf_seg7_light_0700EBC0: # 0x0700EBC0 - 0x0700EBD0
.byte 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0x00
.byte 0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00

wf_seg7_vertex_0700EBD0: # 0x0700EBD0 - 0x0700ECC0
vertex    505,      0,     85,   -562,    992,  0x00, 0x81, 0x00, 0xFF
vertex   -214,      0,   -204,    990,      0,  0x00, 0x81, 0x00, 0xFF
vertex    215,      0,   -204,      0,      0,  0x00, 0x81, 0x00, 0xFF
vertex   -214,    102,   -204,      0,      0,  0xA7, 0x00, 0xA7, 0xFF
vertex   -214,      0,   -204,      0,    478,  0xA7, 0x00, 0xA7, 0xFF
vertex   -504,      0,     85,   2012,    478,  0xA7, 0x00, 0xA7, 0xFF
vertex   -504,    102,     85,   2012,      0,  0xA7, 0x00, 0xA7, 0xFF
vertex   -504,    102,     85,      0,      0,  0x00, 0x00, 0x7F, 0xFF
vertex   -504,      0,     85,      0,    478,  0x00, 0x00, 0x7F, 0xFF
vertex    505,      0,     85,   2012,    478,  0x00, 0x00, 0x7F, 0xFF
vertex    505,    102,     85,   2012,      0,  0x00, 0x00, 0x7F, 0xFF
vertex    215,    102,   -204,   1502,      0,  0x00, 0x7F, 0x00, 0xFF
vertex   -214,    102,   -204,    480,      0,  0x00, 0x7F, 0x00, 0xFF
vertex   -504,    102,     85,    -52,    992,  0x00, 0x7F, 0x00, 0xFF
vertex    505,    102,     85,   2034,    992,  0x00, 0x7F, 0x00, 0xFF

wf_seg7_vertex_0700ECC0: # 0x0700ECC0 - 0x0700ED30
vertex    505,    102,     85,      0,      0,  0x59, 0x00, 0xA7, 0xFF
vertex    215,      0,   -204,   2012,    478,  0x59, 0x00, 0xA7, 0xFF
vertex    215,    102,   -204,   2012,      0,  0x59, 0x00, 0xA7, 0xFF
vertex    505,      0,     85,   -562,    992,  0x00, 0x81, 0x00, 0xFF
vertex   -504,      0,     85,   1522,    992,  0x00, 0x81, 0x00, 0xFF
vertex   -214,      0,   -204,    990,      0,  0x00, 0x81, 0x00, 0xFF
vertex    505,      0,     85,      0,    478,  0x59, 0x00, 0xA7, 0xFF

wf_seg7_dl_0700ED30: # 0x0700ED30 - 0x0700EDC0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09007000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPLight wf_seg7_light_0700EBC0, 1
gsSPLight wf_seg7_light_0700EBB8, 2
gsSPVertex wf_seg7_vertex_0700EBD0, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  5,  6, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7,  9, 10, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex wf_seg7_vertex_0700ECC0, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP1Triangle  0,  6,  1, 0x0
gsSPEndDisplayList

glabel wf_seg7_dl_0700EDC0 # 0x0700EDC0 - 0x0700EE30
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_SHADING_SMOOTH
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList wf_seg7_dl_0700ED30
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_SHADING_SMOOTH
gsSPEndDisplayList
