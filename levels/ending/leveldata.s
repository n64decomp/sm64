.section .rodata
.include "macros.inc"
.include "PR/gbi.inc"

.ifdef VERSION_EU

cake_end_texture_07000000: # 0x07000000 - 0x07000FFF
.incbin "levels/ending/eu_000000.rgba16"

cake_end_texture_07001000: # 0x07001000 - 0x07001FFF
.incbin "levels/ending/eu_001000.rgba16"

cake_end_texture_07002000: # 0x07002000 - 0x07002FFF
.incbin "levels/ending/eu_002000.rgba16"

cake_end_texture_07003000: # 0x07003000 - 0x07003FFF
.incbin "levels/ending/eu_003000.rgba16"

cake_end_texture_07004000: # 0x07004000 - 0x07004FFF
.incbin "levels/ending/eu_004000.rgba16"

cake_end_texture_07005000: # 0x07005000 - 0x07005FFF
.incbin "levels/ending/eu_005000.rgba16"

cake_end_texture_07006000: # 0x07006000 - 0x07006FFF
.incbin "levels/ending/eu_006000.rgba16"

cake_end_texture_07007000: # 0x07007000 - 0x07007FFF
.incbin "levels/ending/eu_007000.rgba16"

cake_end_texture_07008000: # 0x07008000 - 0x07008FFF
.incbin "levels/ending/eu_008000.rgba16"

cake_end_texture_07009000: # 0x07009000 - 0x07009FFF
.incbin "levels/ending/eu_009000.rgba16"

cake_end_texture_0700A000: # 0x0700A000 - 0x0700AFFF
.incbin "levels/ending/eu_00A000.rgba16"

cake_end_texture_0700B000: # 0x0700B000 - 0x0700BFFF
.incbin "levels/ending/eu_00B000.rgba16"

cake_end_texture_0700C000: # 0x0700C000 - 0x0700CFFF
.incbin "levels/ending/eu_00C000.rgba16"

cake_end_texture_0700D000: # 0x0700D000 - 0x0700DFFF
.incbin "levels/ending/eu_00D000.rgba16"

cake_end_texture_0700E000: # 0x0700E000 - 0x0700EFFF
.incbin "levels/ending/eu_00E000.rgba16"

cake_end_texture_0700F000: # 0x0700F000 - 0x0700FFFF
.incbin "levels/ending/eu_00F000.rgba16"

cake_end_texture_07010000: # 0x07010000 - 0x07010FFF
.incbin "levels/ending/eu_010000.rgba16"

cake_end_texture_07011000: # 0x07011000 - 0x07011FFF
.incbin "levels/ending/eu_011000.rgba16"

cake_end_texture_07012000: # 0x07012000 - 0x07012FFF
.incbin "levels/ending/eu_012000.rgba16"

cake_end_texture_07013000: # 0x07013000 - 0x07013FFF
.incbin "levels/ending/eu_013000.rgba16"

cake_end_texture_07014000: # 0x07014000 - 0x07014FFF
.incbin "levels/ending/eu_014000.rgba16"

cake_end_texture_07015000: # 0x07015000 - 0x07015FFF
.incbin "levels/ending/eu_015000.rgba16"

cake_end_texture_07016000: # 0x07016000 - 0x07016FFF
.incbin "levels/ending/eu_016000.rgba16"

cake_end_texture_07017000: # 0x07017000 - 0x07017FFF
.incbin "levels/ending/eu_017000.rgba16"

cake_end_texture_07018000: # 0x07018000 - 0x07018FFF
.incbin "levels/ending/eu_018000.rgba16"

cake_end_texture_07019000: # 0x07019000 - 0x07019FFF
.incbin "levels/ending/eu_019000.rgba16"

cake_end_texture_0701A000: # 0x0701A000 - 0x0701AFFF
.incbin "levels/ending/eu_01A000.rgba16"

cake_end_texture_0701B000: # 0x0701B000 - 0x0701BFFF
.incbin "levels/ending/eu_01B000.rgba16"

cake_end_texture_0701C000: # 0x0701C000 - 0x0701CFFF
.incbin "levels/ending/eu_01C000.rgba16"

cake_end_texture_0701D000: # 0x0701D000 - 0x0701DFFF
.incbin "levels/ending/eu_01D000.rgba16"

cake_end_texture_0701E000: # 0x0701E000 - 0x0701EFFF
.incbin "levels/ending/eu_01E000.rgba16"

cake_end_texture_0701F000: # 0x0701F000 - 0x0701FFFF
.incbin "levels/ending/eu_01F000.rgba16"

cake_end_texture_07020000: # 0x07020000 - 0x07020FFF
.incbin "levels/ending/eu_020000.rgba16"

cake_end_texture_07021000: # 0x07021000 - 0x07021FFF
.incbin "levels/ending/eu_021000.rgba16"

cake_end_texture_07022000: # 0x07022000 - 0x07022FFF
.incbin "levels/ending/eu_022000.rgba16"

cake_end_texture_07023000: # 0x07023000 - 0x07023FFF
.incbin "levels/ending/eu_023000.rgba16"

cake_end_texture_07024000: # 0x07024000 - 0x07024FFF
.incbin "levels/ending/eu_024000.rgba16"

cake_end_texture_07025000: # 0x07025000 - 0x07025FFF
.incbin "levels/ending/eu_025000.rgba16"

cake_end_texture_07026000: # 0x07026000 - 0x07026FFF
.incbin "levels/ending/eu_026000.rgba16"

cake_end_texture_07027000: # 0x07027000 - 0x07027FFF
.incbin "levels/ending/eu_027000.rgba16"

cake_end_texture_07028000: # 0x07028000 - 0x07028FFF
.incbin "levels/ending/eu_028000.rgba16"

glabel dl_cake_end_screen # 0x07029000 - 0x070296D8
gsDPPipeSync
gsDPSetCycleType G_CYC_COPY
gsDPSetTexturePersp G_TP_NONE
gsDPSetRenderMode G_RM_NOOP, G_RM_NOOP2
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD
gsDPTileSync
gsDPSetTile G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_CLAMP | G_TX_NOMIRROR, 6, G_TX_NOLOD
gsDPSetTileSize 0, 0, 0, 252, 124
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_07000000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 0 << 2, 8 << 2, (0 + 63) << 2, (8 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_07001000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 64 << 2, 8 << 2, (64 + 63) << 2, (8 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_07002000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 128 << 2, 8 << 2, (128 + 63) << 2, (8 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_07003000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 192 << 2, 8 << 2, (192 + 63) << 2, (8 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_07004000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 256 << 2, 8 << 2, (256 + 63) << 2, (8 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_07005000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 0 << 2, 40 << 2, (0 + 63) << 2, (40 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_07006000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 64 << 2, 40 << 2, (64 + 63) << 2, (40 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_07007000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 128 << 2, 40 << 2, (128 + 63) << 2, (40 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_07008000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 192 << 2, 40 << 2, (192 + 63) << 2, (40 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_07009000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 256 << 2, 40 << 2, (256 + 63) << 2, (40 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_0700A000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 0 << 2, 72 << 2, (0 + 63) << 2, (72 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_0700B000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 64 << 2, 72 << 2, (64 + 63) << 2, (72 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_0700C000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 128 << 2, 72 << 2, (128 + 63) << 2, (72 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_0700D000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 192 << 2, 72 << 2, (192 + 63) << 2, (72 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_0700E000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 256 << 2, 72 << 2, (256 + 63) << 2, (72 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_0700F000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 0 << 2, 104 << 2, (0 + 63) << 2, (104 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_07010000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 64 << 2, 104 << 2, (64 + 63) << 2, (104 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_07011000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 128 << 2, 104 << 2, (128 + 63) << 2, (104 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_07012000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 192 << 2, 104 << 2, (192 + 63) << 2, (104 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_07013000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 256 << 2, 104 << 2, (256 + 63) << 2, (104 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_07014000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 0 << 2, 136 << 2, (0 + 63) << 2, (136 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_07015000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 64 << 2, 136 << 2, (64 + 63) << 2, (136 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_07016000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 128 << 2, 136 << 2, (128 + 63) << 2, (136 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_07017000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 192 << 2, 136 << 2, (192 + 63) << 2, (136 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_07018000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 256 << 2, 136 << 2, (256 + 63) << 2, (136 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_07019000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 0 << 2, 168 << 2, (0 + 63) << 2, (168 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_0701A000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 64 << 2, 168 << 2, (64 + 63) << 2, (168 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_0701B000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 128 << 2, 168 << 2, (128 + 63) << 2, (168 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_0701C000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 192 << 2, 168 << 2, (192 + 63) << 2, (168 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_0701D000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 256 << 2, 168 << 2, (256 + 63) << 2, (168 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_0701E000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 0 << 2, 200 << 2, (0 + 63) << 2, (200 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_0701F000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 64 << 2, 200 << 2, (64 + 63) << 2, (200 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_07020000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 128 << 2, 200 << 2, (128 + 63) << 2, (200 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_07021000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 192 << 2, 200 << 2, (192 + 63) << 2, (200 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_07022000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 256 << 2, 200 << 2, (256 + 63) << 2, (200 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsSPEndDisplayList

dl_cake_end_eu_070296D8: # 0x070296D8 - 0x070296F8
gsDPPipeSync
gsDPSetCycleType G_CYC_1CYCLE
gsDPSetTexturePersp G_TP_PERSP
gsSPEndDisplayList

glabel dl_cake_end_screen_eu_070296F8 # 0x070296F8 - 0x07029768
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_07026000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 128 << 2, 200 << 2, (128 + 63) << 2, (200 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_07023000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 128 << 2, 125 << 2, (128 + 63) << 2, (125 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsSPDisplayList dl_cake_end_eu_070296D8
gsSPEndDisplayList

glabel dl_cake_end_screen_eu_07029768 # 0x07029768 - 0x070297D8
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_07027000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 128 << 2, 200 << 2, (128 + 63) << 2, (200 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_07024000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 128 << 2, 125 << 2, (128 + 63) << 2, (125 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsSPDisplayList dl_cake_end_eu_070296D8
gsSPEndDisplayList

glabel dl_cake_end_screen_eu_070297D8 # 0x070297D8 - 0x07029848
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_07028000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 128 << 2, 200 << 2, (128 + 63) << 2, (200 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsDPSetTextureImage G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, cake_end_texture_07025000
gsDPLoadSync
gsDPLoadBlock 7, 0, 0, 0x7FF, 0x080
gsSPTextureRectangle 128 << 2, 125 << 2, (128 + 63) << 2, (125 + 31) << 2, G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10
gsSPDisplayList dl_cake_end_eu_070296D8
gsSPEndDisplayList

.else # VERSION_EU

cake_end_texture_07000000: # 0x07000000 - 0x07000C80
.incbin "levels/ending/0.rgba16"

cake_end_texture_07000C80: # 0x07000C80 - 0x07001900
.incbin "levels/ending/1.rgba16"

cake_end_texture_07001900: # 0x07001900 - 0x07002580
.incbin "levels/ending/2.rgba16"

cake_end_texture_07002580: # 0x07002580 - 0x07003200
.incbin "levels/ending/3.rgba16"

cake_end_texture_07003200: # 0x07003200 - 0x07003E80
.incbin "levels/ending/4.rgba16"

cake_end_texture_07003E80: # 0x07003E80 - 0x07004B00
.incbin "levels/ending/5.rgba16"

cake_end_texture_07004B00: # 0x07004B00 - 0x07005780
.incbin "levels/ending/6.rgba16"

cake_end_texture_07005780: # 0x07005780 - 0x07006400
.incbin "levels/ending/7.rgba16"

cake_end_texture_07006400: # 0x07006400 - 0x07007080
.incbin "levels/ending/8.rgba16"

cake_end_texture_07007080: # 0x07007080 - 0x07007D00
.incbin "levels/ending/9.rgba16"

cake_end_texture_07007D00: # 0x07007D00 - 0x07008980
.incbin "levels/ending/10.rgba16"

cake_end_texture_07008980: # 0x07008980 - 0x07009600
.incbin "levels/ending/11.rgba16"

cake_end_texture_07009600: # 0x07009600 - 0x0700A280
.incbin "levels/ending/12.rgba16"

cake_end_texture_0700A280: # 0x0700A280 - 0x0700AF00
.incbin "levels/ending/13.rgba16"

cake_end_texture_0700AF00: # 0x0700AF00 - 0x0700BB80
.incbin "levels/ending/14.rgba16"

cake_end_texture_0700BB80: # 0x0700BB80 - 0x0700C800
.incbin "levels/ending/15.rgba16"

cake_end_texture_0700C800: # 0x0700C800 - 0x0700D480
.incbin "levels/ending/16.rgba16"

cake_end_texture_0700D480: # 0x0700D480 - 0x0700E100
.incbin "levels/ending/17.rgba16"

cake_end_texture_0700E100: # 0x0700E100 - 0x0700ED80
.incbin "levels/ending/18.rgba16"

cake_end_texture_0700ED80: # 0x0700ED80 - 0x0700FA00
.incbin "levels/ending/19.rgba16"

cake_end_texture_0700FA00: # 0x0700FA00 - 0x07010680
.incbin "levels/ending/20.rgba16"

cake_end_texture_07010680: # 0x07010680 - 0x07011300
.incbin "levels/ending/21.rgba16"

cake_end_texture_07011300: # 0x07011300 - 0x07011F80
.incbin "levels/ending/22.rgba16"

cake_end_texture_07011F80: # 0x07011F80 - 0x07012C00
.incbin "levels/ending/23.rgba16"

cake_end_texture_07012C00: # 0x07012C00 - 0x07013880
.incbin "levels/ending/24.rgba16"

cake_end_texture_07013880: # 0x07013880 - 0x07014500
.incbin "levels/ending/25.rgba16"

cake_end_texture_07014500: # 0x07014500 - 0x07015180
.incbin "levels/ending/26.rgba16"

cake_end_texture_07015180: # 0x07015180 - 0x07015E00
.incbin "levels/ending/27.rgba16"

cake_end_texture_07015E00: # 0x07015E00 - 0x07016A80
.incbin "levels/ending/28.rgba16"

cake_end_texture_07016A80: # 0x07016A80 - 0x07017700
.incbin "levels/ending/29.rgba16"

cake_end_texture_07017700: # 0x07017700 - 0x07018380
.incbin "levels/ending/30.rgba16"

cake_end_texture_07018380: # 0x07018380 - 0x07019000
.incbin "levels/ending/31.rgba16"

cake_end_texture_07019000: # 0x07019000 - 0x07019C80
.incbin "levels/ending/32.rgba16"

cake_end_texture_07019C80: # 0x07019C80 - 0x0701A900
.incbin "levels/ending/33.rgba16"

cake_end_texture_0701A900: # 0x0701A900 - 0x0701B580
.incbin "levels/ending/34.rgba16"

cake_end_texture_0701B580: # 0x0701B580 - 0x0701C200
.incbin "levels/ending/35.rgba16"

cake_end_texture_0701C200: # 0x0701C200 - 0x0701CE80
.incbin "levels/ending/36.rgba16"

cake_end_texture_0701CE80: # 0x0701CE80 - 0x0701DB00
.incbin "levels/ending/37.rgba16"

cake_end_texture_0701DB00: # 0x0701DB00 - 0x0701E780
.incbin "levels/ending/38.rgba16"

cake_end_texture_0701E780: # 0x0701E780 - 0x0701F400
.incbin "levels/ending/39.rgba16"

cake_end_texture_0701F400: # 0x0701F400 - 0x07020080
.incbin "levels/ending/40.rgba16"

cake_end_texture_07020080: # 0x07020080 - 0x07020D00
.incbin "levels/ending/41.rgba16"

cake_end_texture_07020D00: # 0x07020D00 - 0x07021980
.incbin "levels/ending/42.rgba16"

cake_end_texture_07021980: # 0x07021980 - 0x07022600
.incbin "levels/ending/43.rgba16"

cake_end_texture_07022600: # 0x07022600 - 0x07023280
.incbin "levels/ending/44.rgba16"

cake_end_texture_07023280: # 0x07023280 - 0x07023F00
.incbin "levels/ending/45.rgba16"

cake_end_texture_07023F00: # 0x07023F00 - 0x07024B80
.incbin "levels/ending/46.rgba16"

cake_end_texture_07024B80: # 0x07024B80 - 0x07025800
.incbin "levels/ending/47.rgba16"

cake_end_vertex_07025800: # 0x07025800 - 0x07025840
vertex      0,    220,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,    220,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,    240,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    240,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07025840: # 0x07025840 - 0x07025880
vertex     80,    220,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,    220,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,    240,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,    240,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07025880: # 0x07025880 - 0x070258C0
vertex    160,    220,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,    220,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,    240,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,    240,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_070258C0: # 0x070258C0 - 0x07025900
vertex    240,    220,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    320,    220,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    320,    240,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,    240,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07025900: # 0x07025900 - 0x07025940
vertex      0,    200,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,    200,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,    220,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    220,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07025940: # 0x07025940 - 0x07025980
vertex     80,    200,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,    200,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,    220,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,    220,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07025980: # 0x07025980 - 0x070259C0
vertex    160,    200,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,    200,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,    220,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,    220,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_070259C0: # 0x070259C0 - 0x07025A00
vertex    240,    200,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    320,    200,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    320,    220,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,    220,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07025A00: # 0x07025A00 - 0x07025A40
vertex      0,    180,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,    180,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,    200,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    200,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07025A40: # 0x07025A40 - 0x07025A80
vertex     80,    180,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,    180,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,    200,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,    200,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07025A80: # 0x07025A80 - 0x07025AC0
vertex    160,    180,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,    180,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,    200,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,    200,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07025AC0: # 0x07025AC0 - 0x07025B00
vertex    240,    180,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    320,    180,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    320,    200,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,    200,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07025B00: # 0x07025B00 - 0x07025B40
vertex      0,    160,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,    160,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,    180,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    180,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07025B40: # 0x07025B40 - 0x07025B80
vertex     80,    160,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,    160,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,    180,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,    180,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07025B80: # 0x07025B80 - 0x07025BC0
vertex    160,    160,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,    160,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,    180,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,    180,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07025BC0: # 0x07025BC0 - 0x07025C00
vertex    240,    160,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    320,    160,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    320,    180,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,    180,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07025C00: # 0x07025C00 - 0x07025C40
vertex      0,    140,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,    140,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,    160,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    160,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07025C40: # 0x07025C40 - 0x07025C80
vertex     80,    140,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,    140,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,    160,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,    160,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07025C80: # 0x07025C80 - 0x07025CC0
vertex    160,    140,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,    140,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,    160,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,    160,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07025CC0: # 0x07025CC0 - 0x07025D00
vertex    240,    140,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    320,    140,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    320,    160,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,    160,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07025D00: # 0x07025D00 - 0x07025D40
vertex      0,    120,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,    120,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,    140,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    140,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07025D40: # 0x07025D40 - 0x07025D80
vertex     80,    120,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,    120,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,    140,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,    140,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07025D80: # 0x07025D80 - 0x07025DC0
vertex    160,    120,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,    120,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,    140,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,    140,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07025DC0: # 0x07025DC0 - 0x07025E00
vertex    240,    120,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    320,    120,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    320,    140,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,    140,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07025E00: # 0x07025E00 - 0x07025E40
vertex      0,    100,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,    100,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,    120,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    120,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07025E40: # 0x07025E40 - 0x07025E80
vertex     80,    100,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,    100,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,    120,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,    120,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07025E80: # 0x07025E80 - 0x07025EC0
vertex    160,    100,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,    100,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,    120,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,    120,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07025EC0: # 0x07025EC0 - 0x07025F00
vertex    240,    100,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    320,    100,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    320,    120,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,    120,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07025F00: # 0x07025F00 - 0x07025F40
vertex      0,     80,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,     80,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,    100,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,    100,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07025F40: # 0x07025F40 - 0x07025F80
vertex     80,     80,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,     80,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,    100,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,    100,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07025F80: # 0x07025F80 - 0x07025FC0
vertex    160,     80,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,     80,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,    100,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,    100,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07025FC0: # 0x07025FC0 - 0x07026000
vertex    240,     80,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    320,     80,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    320,    100,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,    100,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07026000: # 0x07026000 - 0x07026040
vertex      0,     60,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,     60,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,     80,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,     80,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07026040: # 0x07026040 - 0x07026080
vertex     80,     60,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,     60,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,     80,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,     80,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07026080: # 0x07026080 - 0x070260C0
vertex    160,     60,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,     60,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,     80,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,     80,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_070260C0: # 0x070260C0 - 0x07026100
vertex    240,     60,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    320,     60,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    320,     80,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,     80,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07026100: # 0x07026100 - 0x07026140
vertex      0,     40,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,     40,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,     60,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,     60,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07026140: # 0x07026140 - 0x07026180
vertex     80,     40,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,     40,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,     60,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,     60,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07026180: # 0x07026180 - 0x070261C0
vertex    160,     40,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,     40,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,     60,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,     60,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_070261C0: # 0x070261C0 - 0x07026200
vertex    240,     40,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    320,     40,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    320,     60,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,     60,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07026200: # 0x07026200 - 0x07026240
vertex      0,     20,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,     20,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,     40,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,     40,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07026240: # 0x07026240 - 0x07026280
vertex     80,     20,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,     20,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,     40,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,     40,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07026280: # 0x07026280 - 0x070262C0
vertex    160,     20,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,     20,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,     40,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,     40,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_070262C0: # 0x070262C0 - 0x07026300
vertex    240,     20,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    320,     20,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    320,     40,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,     40,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07026300: # 0x07026300 - 0x07026340
vertex      0,      0,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,      0,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,     20,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex      0,     20,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07026340: # 0x07026340 - 0x07026380
vertex     80,      0,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,      0,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,     20,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex     80,     20,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_07026380: # 0x07026380 - 0x070263C0
vertex    160,      0,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,      0,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,     20,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    160,     20,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

cake_end_vertex_070263C0: # 0x070263C0 - 0x07026400
vertex    240,      0,     -1,      0,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    320,      0,     -1,   2528,    608,  0xFF, 0xFF, 0xFF, 0xFF
vertex    320,     20,     -1,   2528,      0,  0xFF, 0xFF, 0xFF, 0xFF
vertex    240,     20,     -1,      0,      0,  0xFF, 0xFF, 0xFF, 0xFF

glabel dl_cake_end_screen # 0x07026400 - 0x07027350
gsDPPipeSync
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_TEXEL0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE

# There were multiple matching pairs, so I don't know if this is correct or not.
gsDPSetRenderMode G_RM_AA_OPA_SURF, G_RM_AA_OPA_SURF2
# It could also be one of these:
# G_RM_AA_OPA_SURF, G_RM_RA_OPA_SURF2; G_RM_RA_OPA_SURF, G_RM_AA_OPA_SURF2

gsSPTexture -1, -1, 0, 0, 1

gsDPLoadTextureBlock cake_end_texture_07000000, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025800, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07000C80, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025840, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07001900, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025880, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07002580, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_070258C0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07003200, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025900, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07003E80, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025940, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07004B00, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025980, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07005780, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_070259C0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07006400, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025A00, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07007080, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025A40, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07007D00, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025A80, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07008980, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025AC0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07009600, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025B00, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_0700A280, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025B40, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_0700AF00, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025B80, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_0700BB80, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025BC0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_0700C800, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025C00, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_0700D480, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025C40, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_0700E100, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025C80, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_0700ED80, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025CC0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_0700FA00, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025D00, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07010680, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025D40, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07011300, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025D80, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07011F80, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025DC0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07012C00, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025E00, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07013880, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025E40, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07014500, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025E80, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07015180, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025EC0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07015E00, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025F00, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07016A80, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025F40, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07017700, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025F80, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07018380, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07025FC0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07019000, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07026000, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07019C80, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07026040, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_0701A900, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07026080, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_0701B580, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_070260C0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_0701C200, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07026100, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_0701CE80, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07026140, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_0701DB00, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07026180, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_0701E780, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_070261C0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_0701F400, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07026200, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07020080, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07026240, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07020D00, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07026280, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07021980, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_070262C0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07022600, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07026300, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07023280, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07026340, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07023F00, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_07026380, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPLoadTextureBlock cake_end_texture_07024B80, G_IM_FMT_RGBA, G_IM_SIZ_16b, 80, 20, 0, G_TX_CLAMP | G_TX_NOMIRROR, G_TX_CLAMP | G_TX_NOMIRROR, 7, 6, G_TX_NOLOD, G_TX_NOLOD
gsSPVertex cake_end_vertex_070263C0, 4, 0
gsSP2Triangles  0,  1,  2, 0x0,  0,  2,  3, 0x0

gsDPPipeSync
gsSPTexture -1, -1, 0, 0, 0
gsSPSetGeometryMode G_LIGHTING
gsDPSetCombineModeLERP1Cycle G_CCMUX_0, G_CCMUX_0, G_CCMUX_0, G_CCMUX_SHADE, G_ACMUX_0, G_ACMUX_0, G_ACMUX_0, G_ACMUX_SHADE

# There were multiple matching pairs, so I don't know if this is correct or not.
gsDPSetRenderMode G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2
# It could also be one of these:
# G_RM_AA_ZB_OPA_SURF, G_RM_RA_ZB_OPA_SURF2; G_RM_AA_ZB_OPA_SURF, G_RM_AA_OPA_SURF2; G_RM_AA_ZB_OPA_SURF, G_RM_RA_OPA_SURF2;
# G_RM_RA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2; G_RM_RA_ZB_OPA_SURF, G_RM_AA_OPA_SURF2; G_RM_AA_OPA_SURF, G_RM_AA_ZB_OPA_SURF2;
# G_RM_AA_OPA_SURF, G_RM_RA_ZB_OPA_SURF2; G_RM_RA_OPA_SURF, G_RM_AA_ZB_OPA_SURF2

gsSPEndDisplayList

.endif
