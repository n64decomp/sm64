sl_seg7_vertex_07007480: # 0x07007480 - 0x07007570
vertex    -33,   2150,   1233,  -3506,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex     34,   2253,   1766,   1854,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -33,   2253,   1233,  -3506,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1504,   1741,   1650,   5130,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1404,   1843,   2246,   -898,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1404,   1741,   2246,   -898,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1504,   1843,   1650,   5130,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2116,   1998,    862,   9124,    -20,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1504,   1741,   1650,   -956,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2116,   1896,    862,   9124,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1504,   1843,   1650,   -956,    -20,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2116,   1896,    862,   -630,    994,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1897,   1896,    716,   1994,    994,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1897,   1999,    716,   1994,    -26,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2116,   1999,    862,   -630,    -26,  0xFF, 0xFF, 0xFF, 0xFF

sl_seg7_vertex_07007570: # 0x07007570 - 0x070075E0
vertex     34,   2150,   1766,   -800,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    899,   2150,   1531,   8144,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    899,   2253,   1531,   8144,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    -33,   2150,   1233,  -3506,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex     34,   2150,   1766,   1854,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex     34,   2253,   1766,   1854,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex     34,   2253,   1766,   -800,      0,  0xFF, 0xFF, 0xFF, 0xFF

sl_seg7_vertex_070075E0: # 0x070075E0 - 0x070076E0
vertex   -522,   1352,  -5052,   8824,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -522,   1249,  -5052,   8824,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -200,   1249,  -3761,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1725,   3328,    260,  14616,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex     63,   3226,   1704,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex     63,   3328,   1704,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1725,   3226,    260,  14616,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    365,   3328,   2052,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2027,   3226,    608,  14616,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   2027,   3328,    608,  14616,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    365,   3226,   2052,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -200,   1352,  -3761,   8824,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1091,   1249,  -4084,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1091,   1352,  -4084,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -200,   1249,  -3761,   8824,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    768,   1249,  -5375,   8824,      0,  0xFF, 0xFF, 0xFF, 0xFF

sl_seg7_vertex_070076E0: # 0x070076E0 - 0x07007770
vertex   -522,   1352,  -5052,   8824,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -200,   1249,  -3761,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -200,   1352,  -3761,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    768,   1249,  -5375,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    768,   1352,  -5375,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex   -522,   1249,  -5052,   8824,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex   1091,   1352,  -4084,      0,    990,  0xFF, 0xFF, 0xFF, 0xFF
vertex    768,   1249,  -5375,   8824,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    768,   1352,  -5375,   8824,    990,  0xFF, 0xFF, 0xFF, 0xFF

sl_seg7_dl_07007770: # 0x07007770 - 0x070077F0
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, snow_09005800
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsSPVertex sl_seg7_vertex_07007480, 15, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP1Triangle 11, 13, 14, 0x0
gsSPVertex sl_seg7_vertex_07007570, 7, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP1Triangle  0,  2,  6, 0x0
gsSPEndDisplayList

sl_seg7_dl_070077F0: # 0x070077F0 - 0x07007880
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, snow_09007000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPVertex sl_seg7_vertex_070075E0, 16, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  4,  5, 0x0
gsSP2Triangles  3,  6,  4, 0x0,  7,  8,  9, 0x0
gsSP2Triangles  7, 10,  8, 0x0, 11, 12, 13, 0x0
gsSP2Triangles 11, 14, 12, 0x0, 13, 12, 15, 0x0
gsSPVertex sl_seg7_vertex_070076E0, 9, 0
gsSP2Triangles  0,  1,  2, 0x0,  3,  0,  4, 0x0
gsSP2Triangles  3,  5,  0, 0x0,  6,  7,  8, 0x0
gsSPEndDisplayList

glabel sl_seg7_dl_07007880 # 0x07007880 - 0x07007910
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_TEXEL0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsSPTexture -1, -1, 0, 0, 1
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList sl_seg7_dl_07007770
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsSPDisplayList sl_seg7_dl_070077F0
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING | G_CULL_BACK
gsSPEndDisplayList
