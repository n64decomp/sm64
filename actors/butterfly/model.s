# Butterfly

butterfly_seg3_vertex_03004348: # 0x03004348
vertex      0,      0,    -78,   2004,    -48,  0xFF, 0xFF, 0xFF, 0xFF
vertex     79,      0,     39,    -60,   4056,  0xFF, 0xFF, 0xFF, 0xFF
vertex     79,      0,    -78,    -56,    -48,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,    -78,   2004,    -48,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,     39,   2004,   4056,  0xFF, 0xFF, 0xFF, 0xFF
vertex     79,      0,     39,    -60,   4056,  0xFF, 0xFF, 0xFF, 0xFF

butterfly_seg3_texture_030043A8: # 0x030043A8
.incbin "actors/butterfly/butterfly_wing.rgba16"

butterfly_seg3_vertex_030053A8: # 0x030053A8
vertex     79,      0,    -78,    -56,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,     39,   1972,   4024,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,    -78,   2000,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex     79,      0,    -78,    -56,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex     79,      0,     39,    -80,   4032,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,      0,     39,   1972,   4024,  0xFF, 0xFF, 0xFF, 0xFF

glabel butterfly_seg3_dl_03005408 # 0x03005408 - 0x030054A0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsSPTexture -32768, -32768, 0, 0, 1
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, butterfly_seg3_texture_030043A8
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsDPPipeSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPVertex butterfly_seg3_vertex_03004348, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPTexture -32768, -32768, 1, 1, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList

glabel butterfly_seg3_dl_030054A0 # 0x030054A0 - 0x03005538
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsSPTexture -32768, -32768, 0, 0, 1
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, butterfly_seg3_texture_030043A8
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsDPPipeSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPVertex butterfly_seg3_vertex_030053A8, 6, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSPTexture -32768, -32768, 1, 1, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList

butterfly_seg3_animvalue_03005538: # 0x03005538
.hword 0x0000, 0x352F, 0x28EE, 0x122D, 0x05EC, 0x0D4E, 0x1D8D, 0x2DCC
.hword 0x352F, 0x4B1B, 0x569E, 0x6C00, 0x7784, 0x7093, 0x614F, 0x520B
.hword 0x4B1B, 0x0000

butterfly_seg3_animindex_0300555C: # 0x0300555C
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0008, 0x0001, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0008, 0x0009, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000

butterfly_seg3_anim_030055B0: # 0x030055B0
.hword 0
.hword 0
.hword 7
.hword 0
.hword 0x08
.hword 0x06
.word butterfly_seg3_animvalue_03005538
.word butterfly_seg3_animindex_0300555C
.word 0

butterfly_seg3_animvalue_030055C8: # 0x030055C8
.hword 0x0000, 0x3A7B, 0x3A7B, 0x3998, 0x3721, 0x3360, 0x2E9D, 0x2923
.hword 0x233A, 0x1D2D, 0x1744, 0x11CA, 0x0D07, 0x0945, 0x06CF, 0x05EC
.hword 0x0697, 0x087A, 0x0B63, 0x0F24, 0x138C, 0x186C, 0x1D94, 0x22D3
.hword 0x27FB, 0x2CDB, 0x3143, 0x3503, 0x37ED, 0x39CF, 0x3A7B, 0x4637
.hword 0x4637, 0x470C, 0x495C, 0x4CE1, 0x5159, 0x567C, 0x5C07, 0x61B4
.hword 0x673F, 0x6C63, 0x70DA, 0x7460, 0x76AF, 0x7784, 0x76E3, 0x751F
.hword 0x7263, 0x6EDE, 0x6ABC, 0x6629, 0x6154, 0x5C68, 0x5792, 0x52FF
.hword 0x4EDD, 0x4B58, 0x489D, 0x46D8, 0x4637, 0x0000

butterfly_seg3_animindex_03005644: # 0x03005644
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x001E, 0x0001, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000, 0x001E, 0x001F, 0x0001, 0x0000, 0x0001, 0x0000
.hword 0x0001, 0x0000

butterfly_seg3_anim_03005698: # 0x03005698
.hword 0
.hword 0
.hword 7
.hword 0
.hword 0x1E
.hword 0x06
.word butterfly_seg3_animvalue_030055C8
.word butterfly_seg3_animindex_03005644
.word 0

glabel butterfly_seg3_anims_030056B0 # 0x030056B0
.word butterfly_seg3_anim_030055B0
.word butterfly_seg3_anim_03005698
