# This file maps each sequence to a set of sound banks it needs.

.include "macros.inc"

.section .data

.macro banks name
    .hword (\name - gBankSetsData)
.endm

glabel gBankSetsData
banks bank_set_00
banks bank_set_01
banks bank_set_02
banks bank_set_03
banks bank_set_04
banks bank_set_05
banks bank_set_06
banks bank_set_07
banks bank_set_08
banks bank_set_09
banks bank_set_0A
banks bank_set_0B
banks bank_set_0C
banks bank_set_0D
banks bank_set_0E
banks bank_set_0F
banks bank_set_10
banks bank_set_11
banks bank_set_12
banks bank_set_13
banks bank_set_14
banks bank_set_15
banks bank_set_16
banks bank_set_17
banks bank_set_18
banks bank_set_19
banks bank_set_1A
banks bank_set_1B
banks bank_set_1C
banks bank_set_1D
banks bank_set_1E
banks bank_set_1F
banks bank_set_20
banks bank_set_21
.ifndef VERSION_JP
banks bank_set_22
.endif

bank_set_00:  # SEQ_SOUND_PLAYER
.byte 11, 0x0A, 0x09, 0x08, 0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00
bank_set_01:  # SEQ_EVENT_CUTSCENE_COLLECT_STAR
.byte 1, 0x22
bank_set_02:  # SEQ_MENU_TITLE_SCREEN
.byte 1, 0x11
bank_set_03:  # SEQ_LEVEL_GRASS
.byte 1, 0x22
bank_set_04:  # SEQ_LEVEL_INSIDE_CASTLE
.byte 1, 0x0E
bank_set_05:  # SEQ_LEVEL_WATER
.byte 1, 0x13
bank_set_06:  # SEQ_LEVEL_HOT
.byte 1, 0x0F
bank_set_07:  # SEQ_LEVEL_BOSS_KOOPA
.byte 1, 0x12
bank_set_08:  # SEQ_LEVEL_SNOW
.byte 1, 0x0B
bank_set_09:  # SEQ_LEVEL_SLIDE
.byte 1, 0x0D
bank_set_0A:  # SEQ_LEVEL_SPOOKY
.byte 2, 0x21, 0x10
bank_set_0B:  # SEQ_EVENT_PIRANHA_PLANT
.byte 1, 0x14
bank_set_0C:  # SEQ_LEVEL_UNDERGROUND
.byte 1, 0x15
bank_set_0D:  # SEQ_MENU_STAR_SELECT
.byte 1, 0x16
bank_set_0E:  # SEQ_EVENT_POWERUP
.byte 1, 0x17
bank_set_0F:  # SEQ_EVENT_METAL_CAP
.byte 1, 0x18
bank_set_10:  # SEQ_EVENT_KOOPA_MESSAGE
.byte 1, 0x12
bank_set_11:  # SEQ_LEVEL_KOOPA_ROAD
.byte 1, 0x19
bank_set_12:  # SEQ_EVENT_HIGH_SCORE
.byte 1, 0x1F
bank_set_13:  # SEQ_EVENT_MERRY_GO_ROUND
.byte 1, 0x21
bank_set_14:  # SEQ_EVENT_RACE
.byte 1, 0x1A
bank_set_15:  # SEQ_EVENT_CUTSCENE_STAR_SPAWN
.byte 1, 0x0E
bank_set_16:  # SEQ_EVENT_BOSS
.byte 1, 0x1B
bank_set_17:  # SEQ_EVENT_CUTSCENE_COLLECT_KEY
.byte 1, 0x1A
bank_set_18:  # SEQ_EVENT_ENDLESS_STAIRS
.byte 1, 0x1C
bank_set_19:  # SEQ_LEVEL_BOSS_KOOPA_FINAL
.byte 1, 0x1D
bank_set_1A:  # SEQ_EVENT_CUTSCENE_CREDITS
.byte 1, 0x25
bank_set_1B:  # SEQ_EVENT_SOLVE_PUZZLE
.byte 1, 0x14
bank_set_1C:  # SEQ_EVENT_TOAD_MESSAGE
.byte 1, 0x20
bank_set_1D:  # SEQ_EVENT_PEACH_MESSAGE
.byte 1, 0x1E
bank_set_1E:  # SEQ_EVENT_CUTSCENE_INTRO
.byte 1, 0x1B
bank_set_1F:  # SEQ_EVENT_CUTSCENE_VICTORY
.byte 1, 0x1A
bank_set_20:  # SEQ_EVENT_CUTSCENE_ENDING
.byte 1, 0x23
bank_set_21:  # SEQ_MENU_FILE_SELECT
.byte 1, 0x24
.ifndef VERSION_JP
bank_set_22:  # SEQ_EVENT_CUTSCENE_LAKITU
.byte 1, 0x1B
.endif
bank_sets_end:
