# Burn Smoke

burn_smoke_seg4_vertex_040217C0: # 0x040217C0
vertex    -50,    -50,      0,      0,    992,  0x14, 0x0A, 0x0A, 0xFF
vertex     50,    -50,      0,    992,    992,  0x14, 0x0A, 0x0A, 0xFF
vertex     50,     50,      0,    992,      0,  0x14, 0x0A, 0x0A, 0xFF
vertex    -50,     50,      0,      0,      0,  0x14, 0x0A, 0x0A, 0xFF

# //! Wrong texture format. Called as rgba16, which makes the burn smoke appear
#     as a transparent black burn smoke. Probably meant to show up as white-ish
#     burn smoke, but mistakened for being intended as black smoke.
burn_smoke_seg4_texture_04021800: # 0x04021800
.incbin "actors/burn_smoke/burn_smoke.ia16"

glabel burn_smoke_seg4_dl_04022000 # 0x04022000 - 0x04022028
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_TEXEL0, G_CCMUX_0, G_CCMUX_SHADE, G_CCMUX_0, G_ACMUX_TEXEL0, G_ACMUX_0, G_ACMUX_SHADE, G_ACMUX_0
gsSPClearGeometryMode G_LIGHTING | G_CULL_BACK
gsSPTexture -1, -1, 0, 0, 1
gsSPEndDisplayList

glabel burn_smoke_seg4_dl_04022028 # 0x04022028 - 0x04022048
gsSPVertex burn_smoke_seg4_vertex_040217C0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0
gsSPEndDisplayList

glabel burn_smoke_seg4_dl_04022048 # 0x04022048 - 0x04022070
gsSPTexture -1, -1, 0, 0, 0
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE
gsSPSetGeometryMode G_LIGHTING
gsSPEndDisplayList

glabel burn_smoke_seg4_dl_04022070 # 0x04022070 - 0x040220C8
gsSPDisplayList burn_smoke_seg4_dl_04022000
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, burn_smoke_seg4_texture_04021800
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x3FF, 0x100
gsDPPipeSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 124, 124
gsSPDisplayList burn_smoke_seg4_dl_04022028
gsSPDisplayList burn_smoke_seg4_dl_04022048
gsSPEndDisplayList
