wf_seg7_vertex_0700F680: # 0x0700F680 - 0x0700F6C0
vertex    -96,      0,    300,   -480,   -480,  0x00, 0x00, 0x00, 0x96
vertex     95,      0,    300,    480,   -480,  0x00, 0x00, 0x00, 0x96
vertex     95,      0,      0,    480,    480,  0x00, 0x00, 0x00, 0x96
vertex    -96,      0,      0,   -480,    480,  0x00, 0x00, 0x00, 0x96

glabel wf_seg7_dl_0700F6C0 # 0x0700F6C0 - 0x0700F758
gsDPPipeSync
gsSPClearGeometryMode G_LIGHTING
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPTexture -1, -1, 0, 0, 1
gsDPLoadTextureBlock wf_seg7_texture_07002800, G_IM_FMT_IA, G_IM_SIZ_8b, 16, 16, 0, G_TX_WRAP | G_TX_MIRROR, G_TX_WRAP | G_TX_MIRROR, 4, 4, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex wf_seg7_vertex_0700F680, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
