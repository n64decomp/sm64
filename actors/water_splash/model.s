# Water Splash

water_splash_seg4_vertex_0402A588: # 0x0402A588
vertex    -64,      0,      0,      0,   2016,  0xFF, 0xFF, 0xFF, 0xFF
vertex     64,      0,      0,    992,   2016,  0xFF, 0xFF, 0xFF, 0xFF
vertex     64,    256,      0,    992,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -64,    256,      0,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

water_splash_seg4_texture_0402A5C8: # 0x0402A5C8
.incbin "actors/water_splash/water_splash_0.rgba16"

water_splash_seg4_texture_0402B5C8: # 0x0402B5C8
.incbin "actors/water_splash/water_splash_1.rgba16"

water_splash_seg4_texture_0402C5C8: # 0x0402C5C8
.incbin "actors/water_splash/water_splash_2.rgba16"

water_splash_seg4_texture_0402D5C8: # 0x0402D5C8
.incbin "actors/water_splash/water_splash_3.rgba16"

water_splash_seg4_texture_0402E5C8: # 0x0402E5C8
.incbin "actors/water_splash/water_splash_4.rgba16"

water_splash_seg4_texture_0402F5C8: # 0x0402F5C8
.incbin "actors/water_splash/water_splash_5.rgba16"

water_splash_seg4_texture_040305C8: # 0x040305C8
.incbin "actors/water_splash/water_splash_6.rgba16"

water_splash_seg4_texture_040315C8: # 0x040315C8
.incbin "actors/water_splash/water_splash_7.rgba16"

glabel water_splash_seg4_dl_040325C8 # 0x040325C8 - 0x04032640
gsSPClearGeometryMode G_LIGHTING
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPTexture -1, -1, 0, 0, 1
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x100
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 252
gsSPVertex water_splash_seg4_vertex_0402A588, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPTexture -1, -1, 0, 0, 0
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

glabel water_splash_seg4_dl_04032640 # 0x04032640 - 0x04032658
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_splash_seg4_texture_0402A5C8
gsSPBranchList water_splash_seg4_dl_040325C8

glabel water_splash_seg4_dl_04032658 # 0x04032658 - 0x04032670
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_splash_seg4_texture_0402B5C8
gsSPBranchList water_splash_seg4_dl_040325C8

glabel water_splash_seg4_dl_04032670 # 0x04032670 - 0x04032688
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_splash_seg4_texture_0402C5C8
gsSPBranchList water_splash_seg4_dl_040325C8

glabel water_splash_seg4_dl_04032688 # 0x04032688 - 0x040326A0
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_splash_seg4_texture_0402D5C8
gsSPBranchList water_splash_seg4_dl_040325C8

glabel water_splash_seg4_dl_040326A0 # 0x040326A0 - 0x040326B8
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_splash_seg4_texture_0402E5C8
gsSPBranchList water_splash_seg4_dl_040325C8

glabel water_splash_seg4_dl_040326B8 # 0x040326B8 - 0x040326D0
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_splash_seg4_texture_0402F5C8
gsSPBranchList water_splash_seg4_dl_040325C8

glabel water_splash_seg4_dl_040326D0 # 0x040326D0 - 0x040326E8
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_splash_seg4_texture_040305C8
gsSPBranchList water_splash_seg4_dl_040325C8

glabel water_splash_seg4_dl_040326E8 # 0x040326E8 - 0x04032700
gsDPPipeSync
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_splash_seg4_texture_040315C8
gsSPBranchList water_splash_seg4_dl_040325C8
