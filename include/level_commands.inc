.include "model_ids.inc"
.include "seq_ids.inc"

.set OP_AND,  0
.set OP_NAND, 1
.set OP_EQ,   2
.set OP_NEQ,  3
.set OP_LT,   4
.set OP_LEQ,  5
.set OP_GT,   6
.set OP_GEQ,  7

.set OP_SET,  0
.set OP_GET,  1

.set VAR_CURR_SAVE_FILE_NUM, 0
.set VAR_CURR_COURSE_NUM,    1
.set VAR_CURR_ACT_NUM,       2
.set VAR_CURR_LEVEL_NUM,     3
.set VAR_CURR_AREA_INDEX,    4


.macro execute seg, script, scriptEnd, entry
    .byte 0x00, 0x04 + 3 * PTR_WIDTH
    .hword \seg
    .word \script
    .word \scriptEnd
    .word \entry
.endm

.macro exit_and_execute seg, script, scriptEnd, entry
    .byte 0x01, 0x04 + 3 * PTR_WIDTH
    .hword \seg
    .word \script
    .word \scriptEnd
    .word \entry
.endm

.macro exit
    .byte 0x02, 0x04
    .hword 0
.endm

.macro sleep frames
    .byte 0x03, 0x04
    .hword \frames
.endm

.macro sleep_before_exit frames
    .byte 0x04, 0x04
    .hword \frames
.endm

.macro jump target
    .byte 0x05, 0x04 + PTR_WIDTH
    .hword 0
    .word \target
.endm

.macro jump_link target
    .byte 0x06, 0x04 + PTR_WIDTH
    .hword 0
    .word \target
.endm

.macro return
    .byte 0x07, 0x04
    .hword 0
.endm

.macro jump_link_push_arg arg
    .byte 0x08, 0x04
    .hword \arg
.endm

.macro jump_n_times
    .byte 0x09, 0x04
    .hword 0
.endm

.macro loop_begin
    .byte 0x0A, 0x04
    .hword 0
.endm

.macro loop_until op, arg
    .byte 0x0B, 0x04 + PTR_WIDTH
    .byte \op
    .byte 0
    .word \arg
.endm

.macro jump_if op, arg, target
    .byte 0x0C, 0x08 + PTR_WIDTH
    .byte \op
    .byte 0
    .word32 \arg
    .word \target
.endm

.macro jump_link_if op, arg, target
    .byte 0x0D, 0x08 + PTR_WIDTH
    .byte \op
    .byte 0
    .word32 \arg
    .word \target
.endm

.macro skip_if op, arg
    .byte 0x0E, 0x08
    .byte \op
    .byte 0
    .word32 \arg
.endm

.macro skip
    .byte 0x0F, 0x04
    .hword 0
.endm

.macro skip_nop
    .byte 0x10, 0x04
    .hword 0
.endm

.macro call arg, func
    .byte 0x11, 0x04 + PTR_WIDTH
    .hword \arg
    .word \func
.endm

.macro call_loop arg, func
    .byte 0x12, 0x04 + PTR_WIDTH
    .hword \arg
    .word \func
.endm

.macro set_reg value
    .byte 0x13, 0x04
    .hword \value
.endm

.macro push_pool
    .byte 0x14, 0x04
    .hword 0
.endm

.macro pop_pool
    .byte 0x15, 0x04
    .hword 0
.endm

.macro fixed_load loadAddr, romStart, romEnd
    .byte 0x16, 0x04 + 3 * PTR_WIDTH
    .hword 0
    .word \loadAddr
    .word \romStart
    .word \romEnd
.endm

.macro load_raw seg, romStart, romEnd
    .byte 0x17, 0x04 + 2 * PTR_WIDTH
    .hword \seg
    .word \romStart
    .word \romEnd
.endm

.macro load_mio0 seg, romStart, romEnd
    .byte 0x18, 0x04 + 2 * PTR_WIDTH
    .hword \seg
    .word \romStart
    .word \romEnd
.endm

.macro load_mario_head sethead
    .byte 0x19, 0x04
    .hword \sethead
.endm

.macro load_mio0_texture seg, romStart, romEnd
    .byte 0x1A, 0x04 + 2 * PTR_WIDTH
    .hword \seg
    .word \romStart
    .word \romEnd
.endm

.macro init_level
    .byte 0x1B, 0x04
    .hword 0
.endm

.macro clear_level
    .byte 0x1C, 0x04
    .hword 0
.endm

.macro alloc_level_pool
    .byte 0x1D, 0x04
    .hword 0
.endm

.macro free_level_pool
    .byte 0x1E, 0x04
    .hword 0
.endm

.macro area index, geo
    .byte 0x1F, 0x04 + PTR_WIDTH
    .byte \index
    .byte 0
    .word \geo
.endm

.macro end_area
    .byte 0x20, 0x04
    .hword 0
.endm

.macro load_model_from_dl model, dl, layer
    .byte 0x21, 0x04 + PTR_WIDTH
    .hword (\layer << 12) | \model
    .word \dl
.endm

.macro load_model_from_geo model, geo
    .byte 0x22, 0x04 + PTR_WIDTH
    .hword \model
    .word \geo
.endm

.macro cmd23 model, unk4, unk8
    .byte 0x23, 0x08 + PTR_WIDTH
    .hword \model
    .word \unk4
    .float \unk8
.endm

.macro object model, posX, posY, posZ, angleX, angleY, angleZ, behParam, beh, acts=0x1F
    .byte 0x24, 0x14 + PTR_WIDTH
    .byte \acts
    .byte \model
    .hword \posX
    .hword \posY
    .hword \posZ
    .hword \angleX
    .hword \angleY
    .hword \angleZ
    .word32 \behParam
    .word \beh
.endm

.macro mario unk3, behArg, beh
    .byte 0x25, 0x08 + PTR_WIDTH
    .byte 0
    .byte \unk3
    .word32 \behArg
    .word \beh
.endm

.macro warp_node id, destLevel, destArea, destNode, unk6
    .byte 0x26, 0x08
    .byte \id, \destLevel, \destArea, \destNode
    .hword \unk6
.endm

.macro painting_warp_node id, destLevel, destArea, destNode, unk6
    .byte 0x27, 0x08
    .byte \id, \destLevel, \destArea, \destNode
    .hword \unk6
.endm

.macro instant_warp index, destArea, displaceX, displaceY, displaceZ
    .byte 0x28, 0x0C
    .byte \index
    .byte \destArea
    .hword \displaceX
    .hword \displaceY
    .hword \displaceZ
    .hword 0
.endm

.macro load_area area
    .byte 0x29, 0x04
    .byte \area
    .byte 0
.endm

.macro cmd2A unk2
    .byte 0x2A, 0x04
    .byte \unk2
    .byte 0
.endm

.macro mario_pos area, yaw, posX, posY, posZ
    .byte 0x2B, 0x0C
    .byte \area
    .byte 0
    .hword \yaw
    .hword \posX
    .hword \posY
    .hword \posZ
.endm

.macro cmd2C
    .byte 0x2C, 0x04
    .hword 0
.endm

.macro cmd2D
    .byte 0x2D, 0x04
    .hword 0
.endm

.macro terrain terrainData
    .byte 0x2E, 0x04 + PTR_WIDTH
    .hword 0
    .word \terrainData
.endm

.macro rooms surfaceRooms
    .byte 0x2F, 0x04 + PTR_WIDTH
    .hword 0
    .word \surfaceRooms
.endm

.macro show_dialog unk2, unk3
    .byte 0x30, 0x04
    .byte \unk2
    .byte \unk3
.endm

.macro terrain_type terrainType
    .byte 0x31, 0x04
    .hword \terrainType
.endm

.macro nop
    .byte 0x32, 0x04
    .hword 0
.endm

.macro transition unk2, unk3, colorR, colorG, colorB
    .byte 0x33, 0x08
    .byte \unk2
    .byte \unk3
    .byte \colorR
    .byte \colorG
    .byte \colorB
    .byte 0
.endm

.macro blackout active
    .byte 0x34, 0x04
    .byte \active
    .byte 0
.endm

.macro gamma enabled
    .byte 0x35, 0x04
    .byte \enabled
    .byte 0
.endm

.macro set_background_music unk2, seq
    .byte 0x36, 0x08
    .hword \unk2
    .hword \seq
    .hword 0
.endm

.macro set_menu_music seq
    .byte 0x37, 0x04
    .hword \seq
.endm

.macro cmd38 unk2
    .byte 0x38, 0x04
    .hword \unk2
.endm

.macro macro_objects objList
    .byte 0x39, 0x04 + PTR_WIDTH
    .hword 0
    .word \objList
.endm

.macro cmd3A unk2, unk4, unk6, unk8, unk10
    .byte 0x3A, 0x0C
    .hword \unk2
    .hword \unk4
    .hword \unk6
    .hword \unk8
    .hword \unk10
.endm

.macro whirlpool unk2, unk3, posX, posY, posZ, strength
    .byte 0x3B, 0x0C
    .byte \unk2
    .byte \unk3
    .hword \posX
    .hword \posY
    .hword \posZ
    .hword \strength
.endm

.macro get_or_set op, var
    .byte 0x3C, 0x04
    .byte \op
    .byte \var
.endm

/* Head Defines */

.set REGULAR_FACE,   0x0002
.set DIZZY_FACE,     0x0003
