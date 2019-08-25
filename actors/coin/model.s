# Coin

coin_seg3_vertex_030056C0: # 0x030056C0
vertex    -32,      0,      0,      0,   1984,  0xFF, 0xFF, 0x00, 0xFF
vertex     32,      0,      0,   1984,   1984,  0xFF, 0xFF, 0x00, 0xFF
vertex     32,     64,      0,   1984,      0,  0xFF, 0xFF, 0x00, 0xFF
vertex    -32,     64,      0,      0,      0,  0xFF, 0xFF, 0x00, 0xFF

coin_seg3_vertex_03005700: # 0x03005700
vertex    -50,      0,      0,      0,   1984,  0x78, 0x78, 0xFF, 0xFF
vertex     50,      0,      0,   1984,   1984,  0x78, 0x78, 0xFF, 0xFF
vertex     50,    100,      0,   1984,      0,  0x78, 0x78, 0xFF, 0xFF
vertex    -50,    100,      0,      0,      0,  0x78, 0x78, 0xFF, 0xFF

coin_seg3_vertex_03005740: # 0x03005740
vertex    -35,      0,      0,      0,   1984,  0xFF, 0x00, 0x00, 0xFF
vertex     35,      0,      0,   1984,   1984,  0xFF, 0x00, 0x00, 0xFF
vertex     35,     70,      0,   1984,      0,  0xFF, 0x00, 0x00, 0xFF
vertex    -35,     70,      0,      0,      0,  0xFF, 0x00, 0x00, 0xFF

coin_seg3_texture_03005780: # 0x03005780
.incbin "actors/coin/coin_front.ia16"

coin_seg3_texture_03005F80: # 0x03005F80
.incbin "actors/coin/coin_tilt_right.ia16"

coin_seg3_texture_03006780: # 0x03006780
.incbin "actors/coin/coin_side.ia16"

coin_seg3_texture_03006F80: # 0x03006F80
.incbin "actors/coin/coin_tilt_left.ia16"

glabel coin_seg3_dl_03007780 # 0x03007780 - 0x030077D0
gsDPPipeSync
gsSPClearGeometryMode G_LIGHTING
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPTexture -32768, -32768, 0, 0, 1
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsDPSetTile G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPEndDisplayList

glabel coin_seg3_dl_030077D0 # 0x030077D0 - 0x03007800
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture 1, 1, 0, 0, 0
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

glabel coin_seg3_dl_03007800 # 0x03007800 - 0x03007828
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, coin_seg3_texture_03005780
gsSPDisplayList coin_seg3_dl_03007780
gsSPVertex coin_seg3_vertex_030056C0, 4, 0
gsSPBranchList coin_seg3_dl_030077D0

glabel coin_seg3_dl_03007828 # 0x03007828 - 0x03007850
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, coin_seg3_texture_03005F80
gsSPDisplayList coin_seg3_dl_03007780
gsSPVertex coin_seg3_vertex_030056C0, 4, 0
gsSPBranchList coin_seg3_dl_030077D0

glabel coin_seg3_dl_03007850 # 0x03007850 - 0x03007878
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, coin_seg3_texture_03006780
gsSPDisplayList coin_seg3_dl_03007780
gsSPVertex coin_seg3_vertex_030056C0, 4, 0
gsSPBranchList coin_seg3_dl_030077D0

glabel coin_seg3_dl_03007878 # 0x03007878 - 0x030078A0
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, coin_seg3_texture_03006F80
gsSPDisplayList coin_seg3_dl_03007780
gsSPVertex coin_seg3_vertex_030056C0, 4, 0
gsSPBranchList coin_seg3_dl_030077D0

glabel coin_seg3_dl_030078A0 # 0x030078A0 - 0x030078C8
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, coin_seg3_texture_03005780
gsSPDisplayList coin_seg3_dl_03007780
gsSPVertex coin_seg3_vertex_03005700, 4, 0
gsSPBranchList coin_seg3_dl_030077D0

glabel coin_seg3_dl_030078C8 # 0x030078C8 - 0x030078F0
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, coin_seg3_texture_03005F80
gsSPDisplayList coin_seg3_dl_03007780
gsSPVertex coin_seg3_vertex_03005700, 4, 0
gsSPBranchList coin_seg3_dl_030077D0

glabel coin_seg3_dl_030078F0 # 0x030078F0 - 0x03007918
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, coin_seg3_texture_03006780
gsSPDisplayList coin_seg3_dl_03007780
gsSPVertex coin_seg3_vertex_03005700, 4, 0
gsSPBranchList coin_seg3_dl_030077D0

glabel coin_seg3_dl_03007918 # 0x03007918 - 0x03007940
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, coin_seg3_texture_03006F80
gsSPDisplayList coin_seg3_dl_03007780
gsSPVertex coin_seg3_vertex_03005700, 4, 0
gsSPBranchList coin_seg3_dl_030077D0

glabel coin_seg3_dl_03007940 # 0x03007940 - 0x03007968
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, coin_seg3_texture_03005780
gsSPDisplayList coin_seg3_dl_03007780
gsSPVertex coin_seg3_vertex_03005740, 4, 0
gsSPBranchList coin_seg3_dl_030077D0

glabel coin_seg3_dl_03007968 # 0x03007968 - 0x03007990
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, coin_seg3_texture_03005F80
gsSPDisplayList coin_seg3_dl_03007780
gsSPVertex coin_seg3_vertex_03005740, 4, 0
gsSPBranchList coin_seg3_dl_030077D0

glabel coin_seg3_dl_03007990 # 0x03007990 - 0x030079B8
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, coin_seg3_texture_03006780
gsSPDisplayList coin_seg3_dl_03007780
gsSPVertex coin_seg3_vertex_03005740, 4, 0
gsSPBranchList coin_seg3_dl_030077D0

glabel coin_seg3_dl_030079B8 # 0x030079B8 - 0x030079E0
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_IA, G_IM_SIZ_16b, 1, coin_seg3_texture_03006F80
gsSPDisplayList coin_seg3_dl_03007780
gsSPVertex coin_seg3_vertex_03005740, 4, 0
gsSPBranchList coin_seg3_dl_030077D0
