bitfs_seg7_vertex_0700F238: # 0x0700F238 - 0x0700F278
vertex   -204,    154,    205,    650,    990,  0xBC, 0xCA, 0xBF, 0xFF
vertex    205,    154,   -204,   2012,    990,  0xBC, 0xCA, 0xBF, 0xFF
vertex   -204,    154,   -204,   1330,   1670,  0xBC, 0xCA, 0xBF, 0xFF
vertex    205,    154,    205,   1330,    308,  0xBC, 0xCA, 0xBF, 0xFF

bitfs_seg7_vertex_0700F278: # 0x0700F278 - 0x0700F378
vertex    184,      0,   -183,    938,    480,  0x67, 0x76, 0x64, 0xFF
vertex    205,    154,   -204,    990,      0,  0x67, 0x76, 0x64, 0xFF
vertex    205,    154,    205,      0,      0,  0x67, 0x76, 0x64, 0xFF
vertex    184,      0,    184,     20,    480,  0x67, 0x76, 0x64, 0xFF
vertex   -183,      0,    184,    938,    480,  0x67, 0x76, 0x64, 0xFF
vertex   -204,    154,    205,    990,      0,  0x67, 0x76, 0x64, 0xFF
vertex   -204,    154,   -204,      0,      0,  0x67, 0x76, 0x64, 0xFF
vertex   -183,      0,   -183,     20,    480,  0x67, 0x76, 0x64, 0xFF
vertex   -204,    154,   -204,    990,      0,  0x74, 0x86, 0x75, 0xFF
vertex    184,      0,   -183,     20,    480,  0x74, 0x86, 0x75, 0xFF
vertex   -183,      0,   -183,    938,    480,  0x74, 0x86, 0x75, 0xFF
vertex    205,    154,   -204,      0,      0,  0x74, 0x86, 0x75, 0xFF
vertex    205,    154,    205,    990,      0,  0x74, 0x86, 0x75, 0xFF
vertex   -204,    154,    205,      0,      0,  0x74, 0x86, 0x75, 0xFF
vertex   -183,      0,    184,     20,    478,  0x74, 0x86, 0x75, 0xFF
vertex    184,      0,    184,    938,    478,  0x74, 0x86, 0x75, 0xFF

bitfs_seg7_vertex_0700F378: # 0x0700F378 - 0x0700F3B8
vertex   -183,      0,   -183,      0,    990,  0x43, 0x56, 0x37, 0xFF
vertex    184,      0,    184,   2176,    254,  0x43, 0x56, 0x37, 0xFF
vertex   -183,      0,    184,    704,   -482,  0x43, 0x56, 0x37, 0xFF
vertex    184,      0,   -183,   1440,   1724,  0x43, 0x56, 0x37, 0xFF

bitfs_seg7_vertex_0700F3B8: # 0x0700F3B8 - 0x0700F3F8
vertex    205,    154,   -204,    990,      0,  0x79, 0xB2, 0xEB, 0xFF
vertex   -183,      0,   -183,     20,     20,  0x79, 0xB2, 0xEB, 0xFF
vertex    184,      0,   -183,    938,     20,  0x79, 0xB2, 0xEB, 0xFF
vertex   -204,    154,   -204,      0,      0,  0x79, 0xB2, 0xEB, 0xFF

bitfs_seg7_dl_0700F3F8: # 0x0700F3F8 - 0x0700F430
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09001800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bitfs_seg7_vertex_0700F238, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

bitfs_seg7_dl_0700F430: # 0x0700F430 - 0x0700F498
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09001000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bitfs_seg7_vertex_0700F278, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSP2Triangles  4,  5,  6, 0x0,  4,  6,  7, 0x0
gsSP2Triangles  8,  9, 10, 0x0,  8, 11,  9, 0x0
gsSP2Triangles 12, 13, 14, 0x0, 12, 14, 15, 0x0
gsSPEndDisplayList

bitfs_seg7_dl_0700F498: # 0x0700F498 - 0x0700F4D0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09007000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bitfs_seg7_vertex_0700F378, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

bitfs_seg7_dl_0700F4D0: # 0x0700F4D0 - 0x0700F508
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bitfs_seg7_texture_07001000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex bitfs_seg7_vertex_0700F3B8, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  3,  1, 0x0
gsSPEndDisplayList

glabel bitfs_seg7_dl_0700F508 # 0x0700F508 - 0x0700F590
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPClearGeometryMode G_LIGHTING
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList bitfs_seg7_dl_0700F3F8
gsSPDisplayList bitfs_seg7_dl_0700F430
gsSPDisplayList bitfs_seg7_dl_0700F498
gsSPDisplayList bitfs_seg7_dl_0700F4D0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList
