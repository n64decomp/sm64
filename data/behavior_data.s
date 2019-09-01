.include "macros.inc"
.include "model_ids.inc"

# see include/object_lists.h for comments

# TODO: Use C preprocessor define instead of redefining the lists seperately.
.set OBJ_LIST_PLAYER,         0
.set OBJ_LIST_UNUSED_1,       1
.set OBJ_LIST_DESTRUCTIVE,    2
.set OBJ_LIST_UNUSED_3,       3
.set OBJ_LIST_GENACTOR,       4
.set OBJ_LIST_PUSHABLE,       5
.set OBJ_LIST_LEVEL,          6
.set OBJ_LIST_UNUSED_7,       7
.set OBJ_LIST_DEFAULT,        8
.set OBJ_LIST_SURFACE,        9
.set OBJ_LIST_POLELIKE,       10
.set OBJ_LIST_SPAWNER,        11
.set OBJ_LIST_UNIMPORTANT,    12

# TODO: Use C preprocessor define instead of redefining the lists seperately. (object_constants.h)
.set OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE,         (1 <<  0) # 0x0001
.set OBJ_FLAG_MOVE_XZ_USING_FVEL,               (1 <<  1) # 0x0002
.set OBJ_FLAG_MOVE_Y_WITH_TERMINAL_VEL,         (1 <<  2) # 0x0004
.set OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW,         (1 <<  3) # 0x0008
.set OBJ_FLAG_0010,                             (1 <<  4) # 0x0010
.set OBJ_FLAG_0020,                             (1 <<  5) # 0x0020
.set OBJ_FLAG_COMPUTE_DIST_TO_MARIO,            (1 <<  6) # 0x0040
.set OBJ_FLAG_ACTIVE_FROM_AFAR,                 (1 <<  7) # 0x0080
.set OBJ_FLAG_0100,                             (1 <<  8) # 0x0100
.set OBJ_FLAG_TRANSFORM_RELATIVE_TO_PARENT,     (1 <<  9) # 0x0200
.set OBJ_FLAG_HOLDABLE,                         (1 << 10) # 0x0400
.set OBJ_FLAG_0800,                             (1 << 11) # 0x0800
.set OBJ_FLAG_1000,                             (1 << 12) # 0x1000
.set OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO,           (1 << 13) # 0x2000
.set OBJ_FLAG_PERSISTENT_RESPAWN,               (1 << 14) # 0x4000
.set OBJ_FLAG_8000,                             (1 << 15) # 0x8000

# TODO: Use C preprocessor define instead of redefining the lists seperately. (object_fields.h)
.set objUnk88, 0x00
.set objFlags, 0x01
.set objDialogResponse, 0x02
.set objUnk94, 0x03
.set objUnk98, 0x04
.set objIntangibleTimer, 0x05
.set objPosX, 0x06
.set objPosY, 0x07
.set objPosZ, 0x08
.set objVelX, 0x09
.set objVelY, 0x0A
.set objVelZ, 0x0B
.set objForwardVel, 0x0C
.set objUnkBC, 0x0D
.set objUnkC0, 0x0E
.set objMoveAnglePitch, 0x0F
.set objMoveAngleYaw, 0x10
.set objMoveAngleRoll, 0x11
.set objFaceAnglePitch, 0x12
.set objFaceAngleYaw, 0x13
.set objFaceAngleRoll, 0x14
.set objGraphYOffset, 0x15
.set objUnkE0, 0x16
.set objGravity, 0x17
.set objFloorHeight, 0x18
.set objMoveFlags, 0x19
.set objAnimState, 0x1A
# object-specific fields
.set objVarF4, 0x1B
.set objVarF8, 0x1C
.set objVarFC, 0x1D
.set objVar100, 0x1E
.set objVar104, 0x1F
.set objVar108, 0x20
.set objVar10C, 0x21
.set objVar110, 0x22
#
.set objAngleVelPitch, 0x23
.set objAngleVelYaw, 0x24
.set objAngleVelRoll, 0x25
.set objAnimations, 0x26
.set objHeldState, 0x27
.set objWallHitboxRadius, 0x28
.set objDragStrength, 0x29
.set objInteractType, 0x2A
.set objInteractStatus, 0x2B
.set objParentRelativePosX, 0x2C
.set objParentRelativePosY, 0x2D
.set objParentRelativePosZ, 0x2E
.set objBehParams2ndByte, 0x2F
.set objUnk148, 0x30
.set objAction, 0x31
.set objSubAction, 0x32
.set objTimer, 0x33
.set objBounce, 0x34
.set objDistanceToMario, 0x35
.set objAngleToMario, 0x36
.set objHomeX, 0x37
.set objHomeY, 0x38
.set objHomeZ, 0x39
.set objFriction, 0x3A
.set objBuoyancy, 0x3B
.set objSoundStateID, 0x3C
.set objOpacity, 0x3D
.set objDamageOrCoinValue, 0x3E
.set objHealth, 0x3F
.set objBehParams, 0x40
.set objPrevAction, 0x41
.set objInteractSubtype, 0x42
.set objCollisionDistance, 0x43
.set objNumLootCoins, 0x44
.set objDrawingDistance, 0x45
.set objRoom, 0x46
.set objUnk1A4, 0x47
.set objUnk1A8, 0x48
# Object specific, only used in this file by big boos (where it is oBigBooNumMinionBoosKilled)
.set objVar1AC, 0x49
#
.set objUnk1B0, 0x4A
.set objWallAngle, 0x4B
.set objFloorType, 0x4C
.set objUnk1BC, 0x4D
.set objFloor, 0x4E
.set objDeathSound, 0x4F

# Interactions only used
.set INTERACT_DAMAGE,          0x00000008
.set INTERACT_POLE,            0x00000040
.set INTERACT_STAR_OR_KEY,     0x00001000
.set INTERACT_WATER_RING,      0x00010000
.set INTERACT_FLAME,           0x00040000
.set INTERACT_TEXT,            0x00800000
.set INTERACT_IGLOO_BARRIER,   0x40000000

.macro bytes4 byte1, byte2, byte3, byte4
    .word ((\byte1 & 0xFF) << 24) | ((\byte2 & 0xFF) << 16) | ((\byte3 & 0xFF) << 8) | (\byte4 & 0xFF)
.endm

.macro begin arg1
    bytes4 0x00, \arg1, 0x00, 0x00
.endm

.macro delay frames
    .word (0x01 << 24) | (0x00 << 16) | (\frames & 0xFFFF)
.endm

.macro call addr
    bytes4 0x02, 0x00, 0x00, 0x00
    .word \addr
.endm

.macro return
    bytes4 0x03, 0x00, 0x00, 0x00
.endm

.macro goto addr
    bytes4 0x04, 0x00, 0x00, 0x00
    .word \addr
.endm

.macro begin_repeat times
    .word (0x05 << 24) | (0x00 << 16) | (\times & 0xFFFF)
.endm

.macro end_repeat
    bytes4 0x06, 0x00, 0x00, 0x00
.endm

.macro end_repeat_nobreak
    bytes4 0x07, 0x00, 0x00, 0x00
.endm

.macro begin_loop
    bytes4 0x08, 0x00, 0x00, 0x00
.endm

.macro end_loop
    bytes4 0x09, 0x00, 0x00, 0x00
.endm

.macro break
    bytes4 0x0A, 0x00, 0x00, 0x00
.endm

.macro callnative addr
    bytes4 0x0C, 0x00, 0x00, 0x00
    .word \addr
.endm

.macro obj_add_float field, value
    .word (0x0D << 24) | ((\field & 0xFF) << 16) | (\value & 0xFFFF)
.endm

.macro obj_set_float field, value
    .word (0x0E << 24) | ((\field & 0xFF) << 16) | (\value & 0xFFFF)
.endm

.macro obj_add_int field, value
    .word (0x0F << 24) | ((\field & 0xFF) << 16) | (\value & 0xFFFF)
.endm

.macro obj_set_int field, value
    .word (0x10 << 24) | ((\field & 0xFF) << 16) | (\value & 0xFFFF)
.endm

.macro obj_or_int field, value
    .word (0x11 << 24) | ((\field & 0xFF) << 16) | (\value & 0xFFFF)
.endm

.macro obj_bit_clear_int field, value
    .word (0x12 << 24) | ((\field & 0xFF) << 16) | (\value & 0xFFFF)
.endm

.macro obj_set_int_rand_rshift field, min, rshift
    .word (0x13 << 24) | ((\field & 0xFF) << 16) | (\min & 0xFFFF)
    .word ((\rshift & 0xFFFF) << 16) | 0x0000
.endm

.macro obj_set_float_rand field, min, max
    .word (0x14 << 24) | ((\field & 0xFF) << 16) | (\min & 0xFFFF)
    .word ((\max & 0xFFFF) << 16) | 0x0000
.endm

.macro obj_set_int_rand field, min, max
    .word (0x15 << 24) | ((\field & 0xFF) << 16) | (\min & 0xFFFF)
    .word ((\max & 0xFFFF) << 16) | 0x0000
.endm

.macro obj_add_float_rand field, min, max
    .word (0x16 << 24) | ((\field & 0xFF) << 16) | (\min & 0xFFFF)
    .word ((\max & 0xFFFF) << 16) | 0x0000
.endm

.macro obj_add_int_rand_rshift field, min, rshift
    .word (0x17 << 24) | ((\field & 0xFF) << 16) | (\min & 0xFFFF)
    .word ((\rshift & 0xFFFF) << 16) | 0x0000
.endm

.macro geo_layout model_id
    .word (0x1B << 24) | (0x00 << 16) | (\model_id & 0xFFFF)
.endm

.macro obj_child model_id, beh
    bytes4 0x1C, 0x00, 0x00, 0x00
    .word \model_id, \beh
.endm

.macro deactivate
    bytes4 0x1D, 0x00, 0x00, 0x00
.endm

.macro drop_floor
    bytes4 0x1E, 0x00, 0x00, 0x00
.endm

.macro obj_sum_float fieldDest, fieldSrc1, fieldSrc2
    bytes4 0x1F, \fieldDest, \fieldSrc1, \fieldSrc2
.endm

.macro obj_sum_int fieldDest, fieldSrc1, fieldSrc2
    bytes4 0x20, \fieldDest, \fieldSrc1, \fieldSrc2
.endm

.macro billboard
    bytes4 0x21, 0x00, 0x00, 0x00
.endm

.macro unhide
    bytes4 0x22, 0x00, 0x00, 0x00
.endm

.macro set_hitbox radius, height
    bytes4 0x23, 0x00, 0x00, 0x00
    .word ((\radius & 0xFFFF) << 16) | (\height & 0xFFFF)
.endm

.macro delay_var field
    bytes4 0x25, \field, 0x00, 0x00
.endm

.macro obj_set_int32 field, value
    bytes4 0x27, \field, 0x00, 0x00
    .word \value
.endm

.macro animate animIndex
    bytes4 0x28, \animIndex, 0x00, 0x00
.endm

.macro obj_child_param behParam, model_id, beh
    .word (0x29 << 24) | (0x00 << 16) | (\behParam & 0xFFFF)
    .word \model_id
    .word \beh
.endm

.macro collision_data addr
    bytes4 0x2A, 0x00, 0x00, 0x00
    .word \addr
.endm

.macro collision_sphere radius, height, arg3
    bytes4 0x2B, 0x00, 0x00, 0x00
    .word ((\radius & 0xFFFF) << 16) | (\height & 0xFFFF)
    .word ((\arg3 & 0xFFFF) << 16) | 0x0000
.endm

.macro obj_spawn model_id, beh
    bytes4 0x2C, 0x00, 0x00, 0x00
    .word \model_id
    .word \beh
.endm

.macro obj_set_pos
    bytes4 0x2D, 0x00, 0x00, 0x00
.endm

.macro obj_set_float2 arg1, arg2
    bytes4 0x2E, 0x00, 0x00, 0x00
    .word ((\arg1 & 0xFFFF) << 16) | (\arg2 & 0xFFFF)
.endm

.macro interact_type type
    bytes4 0x2F, 0x00, 0x00, 0x00
    .word \type
.endm

.macro gravity arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8
    bytes4 0x30, 0x00, 0x00, 0x00
    .word ((\arg1 & 0xFFFF) << 16) | (\arg2 & 0xFFFF)
    .word ((\arg3 & 0xFFFF) << 16) | (\arg4 & 0xFFFF)
    .word ((\arg5 & 0xFFFF) << 16) | (\arg6 & 0xFFFF)
    .word ((\arg7 & 0xFFFF) << 16) | (\arg8 & 0xFFFF)
.endm

.macro scale percent
    .word (0x32 << 24) | (0x00 << 16) | (\percent & 0xFFFF)
.endm

.macro obj_bit_clear_int32 field, value
    bytes4 0x33, \field, 0x00, 0x00
    .word \value
.endm

.macro text_anim_rate field, arg2
    .word (0x34 << 24) | ((\field & 0xFF) << 16) | (\arg2 & 0xFFFF)
.endm

.macro graph_clear
    bytes4 0x35, 0x00, 0x00, 0x00
.endm

.macro spawn_addr arg1
    bytes4 0x37, 0x00, 0x00, 0x00
    .word \arg1
.endm

# TODO: Go through these and rename a bunch of them, some of these names are really bad.

.section .behavior, "a"


glabel behavior_data
glabel bhvStarDoor # 0000
    begin OBJ_LIST_SURFACE
    obj_set_int objInteractType, 4
    collision_data inside_castle_seg7_collision_star_door
    obj_set_int objInteractSubtype, 32
    obj_or_int objFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    set_hitbox 80, 100
    obj_set_pos
    obj_set_float objDrawingDistance, 20000
    callnative bhv_door_init
    obj_set_int objIntangibleTimer, 0
    begin_loop
        callnative bhv_star_door_loop
        callnative bhv_star_door_loop_2
        callnative load_object_collision_model
    end_loop

glabel bhvMrI # 0054
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_pos
    obj_child MODEL_MR_I_IRIS, bhvMrIBody
    geo_layout MODEL_MR_I
    billboard
    callnative bhv_init_room
    begin_loop
        callnative bhv_mr_i_loop
    end_loop

glabel bhvMrIBody # 008C
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    callnative bhv_init_room
    begin_loop
        callnative bhv_mr_i_body_loop
    end_loop

glabel bhvMrIParticle # 00AC
    begin OBJ_LIST_LEVEL
    billboard
    obj_or_int objFlags, (OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int objIntangibleTimer, 0
    set_hitbox 50, 50
    obj_set_int objDamageOrCoinValue, 1
    obj_set_int objInteractType, 8
    gravity 0x001E, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
    callnative bhv_init_room
    begin_loop
        callnative bhv_mr_i_particle_loop
    end_loop

glabel bhvPurpleParticle # 00F8
    begin OBJ_LIST_UNIMPORTANT
    billboard
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    begin_repeat 10
        callnative bhv_piranha_particle_loop
    end_repeat
    deactivate

glabel bhvGiantPole # 0118
    begin OBJ_LIST_POLELIKE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_int objInteractType, 0x40
    set_hitbox 0x0050, 0x0834
    obj_set_pos
    obj_set_int objIntangibleTimer, 0
    begin_loop
        callnative bhv_giant_pole_loop
    end_loop

glabel bhvPoleGrabbing # 0144
    begin OBJ_LIST_POLELIKE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_int objInteractType, 0x40
    set_hitbox 0x0050, 0x05DC
    callnative bhv_pole_init
    obj_set_int objIntangibleTimer, 0
    begin_loop
        callnative BehClimbDetectLoop
    end_loop

glabel bhvThiHugeIslandTop # 0174
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data thi_seg7_collision_top_trap
    begin_loop
        callnative bhv_thi_huge_island_top_loop
    end_loop

glabel bhvThiTinyIslandTop # 0194
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    begin_loop
        callnative bhv_thi_tiny_island_top_loop
    end_loop

glabel bhvCapSwitchBase # 01AC
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data capswitch_collision_05003448
    begin_loop
        callnative load_object_collision_model
    end_loop

glabel bhvCapSwitch # 01CC
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data capswitch_collision_050033D0
    begin_loop
        callnative bhv_cap_switch_loop
        callnative load_object_collision_model
    end_loop

glabel bhvKingBobomb # 01F4
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, king_bobomb_seg5_anims_0500FE30
    obj_set_int objInteractType, 0x02
    set_hitbox 0x0064, 0x0064
    gravity 0x001E, 0xFE70, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    obj_set_int objIntangibleTimer, 0
    drop_floor
    obj_set_pos
    obj_spawn MODEL_NONE, bhvBobombAnchorMario
    obj_set_int objHealth, 0x0003
    obj_set_int objDamageOrCoinValue, 1
    begin_loop
        callnative bhv_king_bobomb_loop
    end_loop

glabel bhvBobombAnchorMario # 0254
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    obj_set_float objParentRelativePosX, 0x0064
    obj_set_float objParentRelativePosZ, 0x0096
    begin_loop
        callnative bhv_bobomb_anchor_mario_loop
    end_loop

glabel bhvBetaChestBottom # 0278
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    drop_floor
    callnative bhv_beta_chest_bottom_init
    begin_loop
        callnative bhv_beta_chest_bottom_loop
    end_loop

glabel bhvBetaChestLid # 029C
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_pos
    begin_loop
        callnative bhv_beta_chest_lid_loop
    end_loop

glabel bhvBubbleMario # 02B8
    begin OBJ_LIST_DEFAULT
    graph_clear
    obj_set_int_rand objVarF4, 0x0002, 0x0009
    delay_var objVarF4
    obj_child MODEL_BUBBLE, bhvSmallWaterWave
    obj_bit_clear_int32 objUnkE0, 0x00000020
    deactivate

glabel bhvBubbleMaybe # 02E4
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    callnative bhv_bubble_wave_init
    obj_set_float_rand objVarF4, 0xFFB5, 0x0096
    obj_set_float_rand objVarF8, 0xFFB5, 0x0096
    obj_set_float_rand objVarFC, 0xFFB5, 0x0096
    obj_sum_float objPosX, objPosX, objVarF4
    obj_sum_float objPosZ, objPosZ, objVarF8
    obj_sum_float objPosY, objPosY, objVarFC
    obj_set_int objAnimState, -1
    begin_repeat 60
        obj_add_int objAnimState, 1
        callnative bhv_bubble_maybe_loop
    end_repeat
    deactivate

glabel bhvSmallWaterWave # 0338
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    callnative bhv_bubble_wave_init
    obj_set_float_rand objVarF4, 0xFFCE, 0x0064
    obj_set_float_rand objVarF8, 0xFFCE, 0x0064
    obj_sum_float objPosX, objPosX, objVarF4
    obj_sum_float objPosZ, objPosZ, objVarF8
    obj_set_float_rand objVarFC, 0x0000, 0x0032
    obj_sum_float objPosY, objPosY, objVarFC
    obj_set_int objAnimState, -1
    call bhvSmallWaterWave398
    begin_repeat 60
        call bhvSmallWaterWave398
        callnative bhv_small_water_wave_loop
    end_repeat
    deactivate

glabel bhvSmallWaterWave398 # 0398
    obj_add_int objAnimState, 1
    obj_add_float objPosY, 7
    obj_set_float_rand objVarF4, -2, 5
    obj_set_float_rand objVarF8, -2, 5
    obj_sum_float objPosX, objPosX, objVarF4
    obj_sum_float objPosZ, objPosZ, objVarF8
    return

glabel bhvWaterAirBubble # 03BC
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    collision_sphere 0x0190, 0x0096, 0xFF6A
    obj_set_int objIntangibleTimer, 0
    interact_type INTERACT_WATER_RING
    obj_set_int objDamageOrCoinValue, 5
    callnative bhv_water_air_bubble_init
    obj_set_int objAnimState, -1
    begin_loop
        callnative bhv_water_air_bubble_loop
    end_loop

glabel bhvSmallParticle # 0400
    begin OBJ_LIST_UNIMPORTANT
    billboard
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    callnative bhv_particle_init
    begin_repeat 70
        callnative bhv_particle_loop
    end_repeat
    deactivate

glabel bhvWaterWaves # 0428
    begin OBJ_LIST_DEFAULT
    obj_bit_clear_int32 objUnkE0, 0x00000200
    graph_clear
    callnative bhv_water_waves_init
    deactivate

glabel bhvSmallParticleSnow # 0444
    begin OBJ_LIST_UNIMPORTANT
    billboard
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    callnative bhv_particle_init
    begin_repeat 30
        callnative bhv_particle_loop
    end_repeat
    deactivate

glabel bhvSmallParticleBubbles # 046C
    begin OBJ_LIST_UNIMPORTANT
    billboard
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    callnative bhv_particle_init
    begin_repeat 70
        callnative bhv_small_bubbles_loop
    end_repeat
    deactivate

glabel bhvFishGroup # 0494
    begin OBJ_LIST_DEFAULT
    begin_loop
        callnative bhv_fish_group_loop
    end_loop

glabel bhvCannon # 04A8
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_child MODEL_CANNON_BARREL, bhvCannonBarrel
    obj_set_int objInteractType, 0x4000
    obj_add_float objPosY, -340
    obj_set_pos
    set_hitbox 0x0096, 0x0096
    obj_set_int objIntangibleTimer, 0
    begin_loop
        callnative bhv_cannon_base_loop
    end_loop

glabel bhvCannonBarrel # 04E4
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    drop_floor
    begin_loop
        callnative bhv_cannon_barrel_loop
    end_loop

glabel bhvCannonBaseUnused # 0500
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    obj_set_int objAnimState, -1
    begin_repeat 8
        callnative bhv_cannon_base_unused_loop
        obj_add_int objAnimState, 1
    end_repeat
    deactivate

glabel bhvChuckya # 0528
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_HOLDABLE | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, chuckya_seg8_anims_0800C070
    animate 0x05
    obj_set_int objInteractType, 0x02
    set_hitbox 0x0096, 0x0064
    gravity 0x001E, 0xFE70, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    obj_spawn MODEL_NONE, bhvChuckyaAnchorMario
    obj_set_int objNumLootCoins, 5
    obj_set_int objIntangibleTimer, 0
    obj_set_pos
    begin_loop
        callnative bhv_chuckya_loop
    end_loop

glabel bhvChuckyaAnchorMario # 0584
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    obj_set_float objParentRelativePosY, 0xFFC4
    obj_set_float objParentRelativePosZ, 0x0096
    begin_loop
        callnative bhv_chuckya_anchor_mario_loop
    end_loop

glabel bhvUnused05A8 # 05A8
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    break

glabel bhvRotatingPlatform # 05B4
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_pos
    begin_loop
        callnative bhv_rotating_platform_loop
        callnative load_object_collision_model
    end_loop

glabel bhvTower # 05D8
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data wf_seg7_collision_tower
    obj_set_float objCollisionDistance, 0x0BB8
    obj_set_float objDrawingDistance, 0x4E20
    begin_loop
        callnative load_object_collision_model
    end_loop

glabel bhvBulletBillCannon # 0600
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data wf_seg7_collision_bullet_bill_cannon
    obj_set_float objCollisionDistance, 0x012C
    begin_loop
        callnative load_object_collision_model
    end_loop

glabel bhvWfBreakableWallRight # 0624
    begin OBJ_LIST_SURFACE
    collision_data wf_seg7_collision_breakable_wall
    goto .L13000644

glabel bhvWfBreakableWallLeft # 0638
    begin OBJ_LIST_SURFACE
    collision_data wf_seg7_collision_breakable_wall_2
.L13000644: # 0644
    obj_or_int objFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    set_hitbox 0x012C, 0x0190
    obj_set_int objIntangibleTimer, 0
    begin_loop
        callnative bhv_wf_breakable_wall_loop
        callnative load_object_collision_model
    end_loop

glabel bhvKickableBoard # 066C
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data wf_seg7_collision_kickable_board
    set_hitbox 0x0064, 0x04B0
    obj_set_float2 0x0001, 0x0001
    obj_set_float objCollisionDistance, 0x05DC
    obj_set_int objIntangibleTimer, 0
    begin_loop
        callnative bhv_kickable_board_loop
    end_loop

glabel bhvTowerDoor # 06A4
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data wf_seg7_collision_tower_door
    set_hitbox 0x0064, 0x0064
    obj_set_int objIntangibleTimer, 0
    begin_loop
        callnative bhv_tower_door_loop
        callnative load_object_collision_model
    end_loop

glabel bhvRotatingCounterClockwise # 06D8
    begin OBJ_LIST_DEFAULT
    break

glabel bhvWfRotatingWoodenPlatform # 06E0
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data wf_seg7_collision_clocklike_rotation
    begin_loop
        callnative bhv_wf_rotating_wooden_platform_loop
        callnative load_object_collision_model
    end_loop

glabel bhvKoopaShellUnderwater # 0708
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_HOLDABLE | OBJ_FLAG_COMPUTE_DIST_TO_MARIO  | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    begin_loop
        callnative bhv_koopa_shell_underwater_loop
    end_loop

glabel bhvExitPodiumWarp # 0720
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int objInteractType, 0x2000
    drop_floor
    obj_set_float objCollisionDistance, 0x1F40
    collision_data ttm_seg7_collision_podium_warp
    obj_set_int objIntangibleTimer, 0
    set_hitbox 0x0032, 0x0032
    begin_loop
        callnative load_object_collision_model
        obj_set_int objInteractStatus, 0
    end_loop

glabel bhvFadingWarp # 075C
    begin OBJ_LIST_LEVEL
    obj_set_int objInteractSubtype, 0x0001
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int objInteractType, 0x2000
    obj_set_int objIntangibleTimer, 0
    begin_loop
        callnative BehFadingWarpLoop
    end_loop

glabel bhvWarp # 0780
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int objInteractType, 0x2000
    obj_set_int objIntangibleTimer, 0
    begin_loop
        callnative bhv_warp_loop
    end_loop

glabel bhvWarpPipe # 07A0
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int objInteractType, 0x2000
    collision_data warp_pipe_seg3_collision_03009AC8
    obj_set_float objDrawingDistance, 0x3E80
    obj_set_int objIntangibleTimer, 0
    set_hitbox 0x0046, 0x0032
    begin_loop
        callnative bhv_warp_loop
        callnative load_object_collision_model
    end_loop

glabel bhvWhitePuffExplosion # 07DC
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    begin_loop
        callnative bhv_white_puff_exploding_loop
    end_loop

glabel bhvSpawnedStar # 07F8
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_int objBehParams2ndByte, 1
    goto .L13000814

glabel bhvUnused080C # 080C
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
.L13000814: # 0814
    obj_set_pos
    callnative bhv_unused_080c_init
    begin_loop
        callnative bhv_unused_080c_loop
    end_loop

glabel bhvMrIBlueCoin # 0830
    begin OBJ_LIST_LEVEL
    obj_set_int objInteractType, 0x10
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    obj_set_int objIntangibleTimer, 0
    obj_set_float objVar110, 0x0014
    obj_set_int objAnimState, -1
    gravity 0x001E, 0xFE70, 0xFFBA, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    callnative bhv_coin_init
    obj_set_int objDamageOrCoinValue, 0x0005
    set_hitbox 0x0078, 0x0040
    begin_loop
        callnative bhv_coin_loop
        obj_add_int objAnimState, 1
    end_loop

glabel bhvCoinInsideBoo # 0888
    begin OBJ_LIST_LEVEL
    set_hitbox 0x0064, 0x0040
    obj_set_int objInteractType, 0x10
    obj_or_int objFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    gravity 0x001E, 0xFE70, 0xFFBA, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    billboard
    callnative bhv_init_room
    begin_loop
        callnative bhv_coin_inside_boo_loop
        obj_add_int objAnimState, 1
    end_loop

glabel bhvCoinFormationSpawn # 08D0
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    begin_loop
        callnative bhv_coin_formation_spawn_loop
    end_loop

glabel bhvCoinFormation # 08EC
    begin OBJ_LIST_SPAWNER
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    callnative bhv_coin_formation_init
    begin_loop
        callnative bhv_coin_formation_loop
    end_loop

glabel bhvOneCoin # 090C
    begin OBJ_LIST_LEVEL
    obj_set_int objBehParams2ndByte, 1
    goto .L13000920

glabel bhvYellowCoin # 091C
    begin OBJ_LIST_LEVEL
.L13000920: # 0920
    billboard
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    callnative bhv_yellow_coin_init
    begin_loop
        callnative bhv_yellow_coin_loop
    end_loop

glabel bhvTemporaryYellowCoin # 0940
    begin OBJ_LIST_LEVEL
    billboard
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    callnative bhv_yellow_coin_init
    begin_loop
        callnative bhv_temp_coin_loop
    end_loop

glabel bhvThreeCoinsSpawn # 0964
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    begin_repeat 3
        obj_child MODEL_YELLOW_COIN, bhvSingleCoinGetsSpawned
    end_repeat
    deactivate

glabel bhvTenCoinsSpawn # 0984
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    begin_repeat 10
        obj_child MODEL_YELLOW_COIN, bhvSingleCoinGetsSpawned
    end_repeat
    deactivate

glabel bhvSingleCoinGetsSpawned # 09A4
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    callnative bhv_coin_init
    gravity 0x001E, 0xFE70, 0xFFBA, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    begin_loop
        callnative bhv_coin_loop
        obj_add_int objAnimState, 1
    end_loop

glabel bhvCoinSparkles # 09E0
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    obj_set_float objGraphYOffset, 25
    obj_set_int objAnimState, -1
    begin_repeat 8
        obj_add_int objAnimState, 1
    end_repeat
    begin_repeat 2
        callnative bhv_coin_sparkles_loop
    end_repeat
    deactivate

glabel bhvGoldenCoinSparkles # 0A14
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    graph_clear
    begin_repeat 3
        callnative bhv_golden_coin_sparkles_loop
    end_repeat
    deactivate

glabel bhvWallTinyStarParticle # 0A34
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    begin_repeat 10
        callnative bhv_wall_tiny_star_particle_loop
    end_repeat
    deactivate

glabel bhvWallTinyStarParticleSpawn # 0A54
    begin OBJ_LIST_DEFAULT
    graph_clear
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_bit_clear_int32 objUnkE0, 0x00040000
    callnative bhv_tiny_star_particles_init
    delay 1
    deactivate

glabel bhvPoundTinyStarParticle # 0A78
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    begin_repeat 10
        callnative bhv_pound_tiny_star_particle_loop
    end_repeat
    deactivate

glabel bhvPoundTinyStarParticleSpawn # 0A98
    begin OBJ_LIST_DEFAULT
    graph_clear
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_bit_clear_int32 objUnkE0, 0x00000010
    callnative bhv_pound_tiny_star_particle_init
    delay 1
    deactivate

glabel bhvPunchTinyTriangle # 0ABC
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    begin_loop
        callnative bhv_punch_tiny_triangle_loop
    end_loop

glabel bhvPunchTinyTriangleSpawn # 0AD8
    begin OBJ_LIST_DEFAULT
    graph_clear
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_bit_clear_int32 objUnkE0, 0x00080000
    callnative bhv_punch_tiny_triangle_init
    delay 1
    deactivate

glabel bhvDoorWarp # 0AFC
    begin OBJ_LIST_SURFACE
    obj_set_int objInteractType, 0x800
    goto .L13000B14

glabel bhvDoor # 0B0C
    begin OBJ_LIST_SURFACE
    obj_set_int objInteractType, 0x04
.L13000B14: # 0B14
    obj_or_int objFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, door_seg3_anim_030156C0
    animate 0x00
    collision_data door_seg3_collision_0301CE78
    set_hitbox 0x0050, 0x0064
    obj_set_int objIntangibleTimer, 0
    obj_set_float objCollisionDistance, 0x03E8
    obj_set_pos
    callnative bhv_door_init
    begin_loop
        callnative bhv_door_loop
    end_loop

glabel bhvGrindel # 0B58
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data ssl_seg7_collision_grindel
    drop_floor
    obj_add_float objPosY, 1
    obj_set_pos
    begin_loop
        callnative bhv_grindel_thwomp_loop
        callnative load_object_collision_model
    end_loop

glabel bhvThwomp2 # 0B8C
    begin OBJ_LIST_SURFACE
    collision_data thwomp_seg5_collision_0500B92C
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    drop_floor
    obj_add_float objPosY, 1
    obj_set_pos
    scale 140
    obj_set_float objDrawingDistance, 0x0FA0
    begin_loop
        callnative bhv_grindel_thwomp_loop
        callnative load_object_collision_model
    end_loop

glabel bhvThwomp # 0BC8
    begin OBJ_LIST_SURFACE
    collision_data thwomp_seg5_collision_0500B7D0
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    drop_floor
    obj_add_float objPosY, 1
    scale 140
    obj_set_pos
    obj_set_float objDrawingDistance, 0x0FA0
    begin_loop
        callnative bhv_grindel_thwomp_loop
        callnative load_object_collision_model
    end_loop

glabel bhvTumblingBridgePlatform # 0C04
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_float objCollisionDistance, 0x012C
    begin_loop
        callnative bhv_tumbling_bridge_platform_loop
        callnative load_object_collision_model
    end_loop

glabel bhvWfTumblingBridge # 0C28
    begin OBJ_LIST_SPAWNER
    obj_or_int objFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_pos
    begin_loop
        callnative bhv_tumbling_bridge_loop
    end_loop

glabel bhvBbhTumblingBridge # 0C44
    begin OBJ_LIST_SPAWNER
    obj_or_int objFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_pos
    obj_set_int objBehParams2ndByte, 1
    begin_loop
        callnative bhv_tumbling_bridge_loop
    end_loop

glabel bhvLllTumblingBridge # 0C64
    begin OBJ_LIST_SPAWNER
    obj_or_int objFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_pos
    obj_set_int objBehParams2ndByte, 2
    begin_loop
        callnative bhv_tumbling_bridge_loop
    end_loop

glabel bhvFlame # 0C84
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    obj_set_pos
    scale 700
    interact_type INTERACT_FLAME
    collision_sphere 0x0032, 0x0019, 0x0019
    obj_set_int objIntangibleTimer, 0
    callnative bhv_init_room
    begin_loop
        obj_set_int objInteractStatus, 0
        text_anim_rate objAnimState, 0x0002
    end_loop

glabel bhvAnotherElavator # 0CC8
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data hmc_seg7_collision_elevator
    obj_set_pos
    callnative bhv_elevator_init
    begin_loop
        callnative bhv_elevator_loop
        callnative load_object_collision_model
    end_loop

glabel bhvRrElevatorPlatform # 0CFC
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data rr_seg7_collision_elevator_platform
    obj_set_pos
    callnative bhv_elevator_init
    begin_loop
        callnative bhv_elevator_loop
        callnative load_object_collision_model
    end_loop

glabel bhvHmcElevatorPlatform # 0D30
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data hmc_seg7_collision_elevator
    obj_set_pos
    callnative bhv_elevator_init
    callnative bhv_init_room
    begin_loop
        callnative bhv_elevator_loop
        callnative load_object_collision_model
    end_loop

glabel bhvWaterMist # 0D6C
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    obj_set_int objOpacity, 0xFE
    obj_set_float objForwardVel, 0x0014
    obj_set_float objVelY, 0xFFF8
    obj_add_float objPosY, 62
    begin_loop
        callnative bhv_water_mist_loop
    end_loop

glabel bhvWaterMistSpawn # 0D98
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    begin_repeat 8
        callnative bhv_water_mist_spawn_loop
    end_repeat
    deactivate

glabel bhvBreakBoxTriangle # 0DB4
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    begin_repeat 18
        callnative obj_rotate_face_angle_using_vel
        callnative obj_move_using_fvel_and_gravity
    end_repeat
    deactivate

glabel bhvWaterMist2 # 0DD8
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_pos
    obj_set_int objFaceAnglePitch, 0xC000
    scale 2100
    begin_loop
        callnative bhv_water_mist_2_loop
    end_loop

glabel bhvUnused0DFC # 0DFC
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_int objAnimState, -1
    obj_set_float objFaceAnglePitch, 0
    obj_set_float objFaceAngleYaw, 0
    obj_set_float objFaceAngleRoll, 0
    begin_repeat 6
        obj_add_int objAnimState, 1
    end_repeat
    deactivate

glabel bhvPoundWhitePuffs # 0E24
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    callnative bhv_pound_white_puffs_init
    delay 1
    deactivate

glabel bhvGroundSand # 0E3C
    begin OBJ_LIST_DEFAULT
glabel bhvUnused0E40 # 0E40
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    callnative bhv_unused_0e40_init
    delay 1
    deactivate

glabel bhvGroundSnow # 0E58
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    callnative bhv_ground_snow_init
    delay 1
    deactivate

glabel bhvWind # 0E70
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    begin_loop
        callnative bhv_wind_loop
    end_loop

glabel bhvEndToad # 0E88
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_int32 objAnimations, toad_seg6_anims_0600FB58
    animate 0x00
    begin_loop
        callnative BehEndToadLoop
    end_loop

glabel bhvEndPeach # 0EAC
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_int32 objAnimations, peach_seg5_anims_0501C41C
    animate 0x00
    begin_loop
        callnative BehEndPeachLoop
    end_loop

glabel bhvUnusedParticleSpawn # 0ED0
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    gravity 0x001E, 0xFE70, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    obj_set_int objIntangibleTimer, 0
    set_hitbox 0x0028, 0x0028
    begin_loop
        callnative bhv_unused_particle_spawn_loop
    end_loop

glabel bhvUkiki # 0F08
    begin OBJ_LIST_GENACTOR
    goto ukikiData

glabel bhvUkikiCageChild # 0F14
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_float objPosX, 0x0A00
    obj_set_float objPosY, 0x05B1
    obj_set_float objPosZ, 0x076A
    break

glabel bhvUkikiCageStar # 0F2C
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_pos
    begin_loop
        callnative bhv_ukiki_cage_star_loop
    end_loop

glabel bhvUkikiCage # 0F48
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_pos
    collision_data ttm_seg7_collision_ukiki_cage
    obj_child MODEL_STAR, bhvUkikiCageStar
    obj_child MODEL_NONE, bhvUkikiCageChild
    obj_set_float objCollisionDistance, 0x4E20
    gravity 0x001E, 0xFE70, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    begin_loop
        callnative bhv_ukiki_cage_loop
    end_loop

glabel bhvBitfsSinkingPlatforms # 0F9C
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data bitfs_seg7_collision_sinking_platform
    obj_set_pos
    begin_loop
        callnative bhv_bitfs_sinking_platform_loop
        callnative load_object_collision_model
    end_loop

glabel bhvBitfsSinkingCagePlatform # 0FC8
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data bitfs_seg7_collision_sinking_cage_platform
    obj_set_pos
    obj_child MODEL_BITFS_BLUE_POLE, bhvDddMovingPole
    begin_loop
        callnative bhv_bitfs_sinking_cage_platform_loop
        callnative load_object_collision_model
    end_loop

glabel bhvDddMovingPole # 1000
    begin OBJ_LIST_POLELIKE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_int objInteractType, 0x40
    set_hitbox 0x0050, 0x02C6
    obj_set_int objIntangibleTimer, 0
    begin_loop
        callnative bhv_ddd_moving_pole_loop
        callnative BehClimbDetectLoop
    end_loop

glabel bhvBitfsTiltingSquarePlatform # 1030
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data bitfs_seg7_collision_inverted_pyramid
    obj_set_pos
    callnative bhv_tilting_platform_init
    begin_loop
        callnative bhv_tilting_platform_loop
        callnative load_object_collision_model
    end_loop

glabel bhvSquishablePlatform # 1064
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data bitfs_seg7_collision_squishable_platform
    obj_set_float objCollisionDistance, 0x2710
    callnative bhv_tilting_platform_init
    begin_loop
        callnative bhv_squishable_platform_loop
        callnative load_object_collision_model
    end_loop

glabel bhvCutOutObject # 1098
    begin OBJ_LIST_GENACTOR
    graph_clear
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    break

glabel bhvBetaMovingFlamesSpawn # 10A8
    begin_loop
        callnative bhv_beta_moving_flames_spawn_loop
    end_loop

glabel bhvBetaMovingFlames # 10B8
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    begin_loop
        callnative bhv_beta_moving_flames_loop
        obj_add_int objAnimState, 1
    end_loop

glabel bhvRrRotatingBridgePlatform # 10D8
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data rr_seg7_collision_rotating_platform_with_fire
    obj_set_float objCollisionDistance, 0x05DC
    obj_set_pos
    begin_loop
        callnative bhv_rr_rotating_bridge_platform_loop
        callnative load_object_collision_model
    end_loop

glabel bhvFlamethrower # 1108
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_pos
    begin_loop
        callnative bhv_flamethrower_loop
    end_loop

glabel bhvFlamethrowerFlame # 1124
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    interact_type INTERACT_FLAME
    collision_sphere 0x0032, 0x0019, 0x0019
    billboard
    obj_set_pos
    obj_set_int objIntangibleTimer, 0
    callnative bhv_init_room
    begin_loop
        callnative bhv_flamethrower_flame_loop
        obj_add_int objAnimState, 1
    end_loop

glabel bhvBouncingFireball # 1168
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    graph_clear
    begin_loop
        callnative bhv_bouncing_fireball_loop
    end_loop

glabel bhvBouncingFireballFlame # 1184
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    interact_type INTERACT_FLAME
    obj_set_float objGraphYOffset, 30
    collision_sphere 0x0032, 0x0019, 0x0019
    gravity 0x001E, 0xFE70, 0xFFBA, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    billboard
    begin_loop
        callnative bhv_bouncing_fireball_flame_loop
        obj_add_int objAnimState, 1
    end_loop

glabel bhvBowserShockWave # 11D0
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int objOpacity, 0x00FF
    begin_loop
        callnative bhv_bowser_shock_wave_loop
    end_loop

glabel bhvFlameMario # 11EC
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    obj_set_float objGraphYOffset, 0x0046
    obj_set_int objAnimState, -1
    begin_loop
        obj_add_int objAnimState, 1
        callnative bhv_flame_mario_loop
    end_loop

glabel bhvBlackSmokeMario # 1214
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    obj_set_int objAnimState, 0x0004
    obj_set_float objGraphYOffset, 0x0032
    begin_repeat 8
        callnative bhv_black_smoke_mario_loop
        delay 1
        callnative bhv_black_smoke_mario_loop
        delay 1
        callnative bhv_black_smoke_mario_loop
    end_repeat
    deactivate

glabel bhvBlackSmokeBowser # 1254
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    obj_set_float objGraphYOffset, 0x0000
    begin_repeat 8
        callnative bhv_black_smoke_bowser_loop
        text_anim_rate objAnimState, 0x0004
    end_repeat
    deactivate

glabel bhvBlackSmokeUpward # 127C
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    begin_repeat 4
        callnative bhv_black_smoke_upward_loop
    end_repeat
    deactivate

glabel bhvBetaFishSplashSpawner # 1298
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    graph_clear
    begin_loop
        callnative bhv_beta_fish_splash_spawner_loop
    end_loop

glabel bhvSpindrift # 12B4
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, spindrift_seg5_anims_05002D68
    animate 0x00
    gravity 0x001E, 0xFE70, 0x0000, 0x0000, 0x0000, 0x00C8, 0x0000, 0x0000
    obj_set_pos
    obj_set_int objInteractSubtype, 0x0080
    begin_loop
        callnative bhv_spindrift_loop
    end_loop

glabel bhvTowerPlatformGroup # 12F4
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    graph_clear
    obj_add_float objPosY, 300
    obj_set_pos
    begin_loop
        callnative bhv_tower_platform_group_loop
    end_loop

glabel bhvWfSlidingTowerPlatform # 1318
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data wf_seg7_collision_platform
    begin_loop
        callnative bhv_wf_sliding_tower_platform_loop
        callnative load_object_collision_model
    end_loop

glabel bhvWfElevatorTowerPlatform # 1340
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data wf_seg7_collision_platform
    begin_loop
        callnative bhv_wf_elevator_tower_platform_loop
        callnative load_object_collision_model
    end_loop

glabel bhvWfSolidTowerPlatform # 1368
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data wf_seg7_collision_platform
    begin_loop
        callnative bhv_wf_solid_tower_platform_loop
        callnative load_object_collision_model
    end_loop

glabel bhvSnowLeafParticleSpawn # 1390
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    callnative bhv_snow_leaf_particle_spawn_init
    delay 1
    deactivate

glabel bhvTreeSnow # 13A8
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, (OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    begin_loop
        callnative bhv_tree_snow_or_leaf_loop
    end_loop

glabel bhvTreeLeaf # 13C4
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, (OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    begin_loop
        callnative bhv_tree_snow_or_leaf_loop
    end_loop

glabel bhvAnotherTiltingPlatform # 13DC
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_pos
    callnative bhv_tilting_platform_init
    begin_loop
        callnative bhv_tilting_platform_loop
        callnative load_object_collision_model
    end_loop

glabel bhvSquarishPathMoving # 1408
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data bitdw_seg7_collision_moving_pyramid
    obj_set_pos
    begin_loop
        callnative bhv_squarish_path_moving_loop
    end_loop

glabel bhvPiranhaPlantBubble # 142C
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    begin_loop
        callnative bhv_piranha_plant_bubble_loop
    end_loop

glabel bhvPiranhaPlantWakingBubbles # 1448
    begin OBJ_LIST_UNIMPORTANT
    billboard
    obj_or_int objFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    begin_repeat 10
        callnative bhv_piranha_plant_waking_bubbles_loop
    end_repeat
    deactivate

glabel bhvFloorSwitchAnimatesObject # 1468
    begin OBJ_LIST_SURFACE
    obj_set_int objBehParams2ndByte, 1
    goto .Lbeh_floor_switch_1488

glabel bhvFloorSwitchGrills # 1478
    begin OBJ_LIST_SURFACE
    goto .Lbeh_floor_switch_1488

glabel bhvFloorSwitchHardcodedModel # 1484
    begin OBJ_LIST_SURFACE
.Lbeh_floor_switch_1488: # 1488
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data purple_switch_seg8_collision_0800C7A8
    begin_loop
        callnative bhv_purple_switch_loop
        callnative load_object_collision_model
    end_loop

glabel bhvFloorSwitchHiddenObjects # 14AC
    begin OBJ_LIST_SURFACE
    obj_set_int objBehParams2ndByte, 2
    goto .Lbeh_floor_switch_1488

glabel bhvHiddenObject # 14BC
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data breakable_box_seg8_collision_08012D70
    obj_set_float objCollisionDistance, 0x012C
    begin_loop
        callnative bhv_hidden_object_loop
    end_loop

glabel bhvBreakableBox # 14E0
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data breakable_box_seg8_collision_08012D70
    obj_set_float objCollisionDistance, 0x01F4
    callnative bhv_init_room
    begin_loop
        callnative bhv_breakable_box_loop
        callnative load_object_collision_model
    end_loop
    break

glabel bhvPushableMetalBox # 1518
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data metal_box_seg8_collision_08024C28
    obj_set_float objCollisionDistance, 0x01F4
    obj_set_pos
    begin_loop
        callnative bhv_pushable_loop
        callnative load_object_collision_model
    end_loop

glabel bhvHeaveHo # 1548
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_HOLDABLE | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, heave_ho_seg5_anims_0501534C
    animate 0x00
    gravity 0x00C8, 0xFE70, 0xFFCE, 0x03E8, 0x03E8, 0x0258, 0x0000, 0x0000
    obj_spawn MODEL_NONE, bhvHeaveHoThrowMario
    obj_set_int objInteractType, 0x02
    obj_set_int objInteractSubtype, 0x0204
    set_hitbox 0x0078, 0x0064
    obj_set_pos
    obj_set_int objIntangibleTimer, 0
    begin_loop
        callnative bhv_heave_ho_loop
    end_loop

glabel bhvHeaveHoThrowMario # 15A4
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    begin_loop
        callnative bhv_heave_ho_throw_mario_loop
    end_loop

glabel bhvCcmTouchedStarSpawn # 15C0
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, (OBJ_FLAG_PERSISTENT_RESPAWN | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    set_hitbox 0x01F4, 0x01F4
    obj_set_int objIntangibleTimer, 0
    begin_loop
        callnative bhv_ccm_touched_star_spawn_loop
    end_loop

glabel bhvUnusedPoundablePlatform # 15E4
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data sl_seg7_collision_pound_explodes
    obj_set_pos
    begin_loop
        callnative bhv_unused_poundable_platform
    end_loop

glabel bhvBetaTrampolineTop # 1608
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data springboard_collision_05001A28
    obj_set_pos
    begin_loop
        callnative bhv_beta_trampoline_top_loop
        callnative load_object_collision_model
    end_loop

glabel bhvBetaTrampolineSpring # 1634
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_pos
    begin_loop
        callnative bhv_beta_trampoline_spring_loop
    end_loop

glabel bhvJumpingBox # 1650
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_HOLDABLE | OBJ_FLAG_COMPUTE_DIST_TO_MARIO  | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    gravity 0x001E, 0xFE70, 0xFFCE, 0x03E8, 0x03E8, 0x0258, 0x0000, 0x0000
    begin_loop
        callnative bhv_jumping_box_loop
    end_loop

glabel bhvBooCage # 167C
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_float objGraphYOffset, 0x000A
    gravity 0x001E, 0xFE70, 0xFFCE, 0x0000, 0x0000, 0x00C8, 0x0000, 0x0000
    begin_loop
        callnative bhv_boo_cage_loop
    end_loop

glabel bhvStub # 16AC
    begin OBJ_LIST_DEFAULT
    graph_clear
    break

glabel bhvIgloo # 16B8
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    interact_type INTERACT_IGLOO_BARRIER
    set_hitbox 0x0064, 0x00C8
    obj_set_int objIntangibleTimer, 0
    obj_set_pos
    begin_loop
        obj_set_int objInteractStatus, 0
    end_loop

glabel bhvBowserKey # 16E4
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_pos
    gravity 0x001E, 0xFE70, 0xFFBA, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    begin_loop
        callnative bhv_bowser_key_loop
    end_loop

glabel bhvGrandStar # 1714
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    interact_type INTERACT_STAR_OR_KEY
    obj_set_int objInteractSubtype, 0x0800
    set_hitbox 0x00A0, 0x0064
    obj_set_pos
    begin_loop
        callnative bhv_grand_star_loop
    end_loop

glabel bhvBetaBooKey # 1744
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    set_hitbox 0x0020, 0x0040
    gravity 0x001E, 0xFE70, 0xFFBA, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    begin_loop
        callnative bhv_beta_boo_key_loop
    end_loop

glabel bhvAlphaBooKey # 1778
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    set_hitbox 0x0020, 0x0040
    obj_set_int objIntangibleTimer, 0
    begin_loop
        callnative bhv_alpha_boo_key_loop
    end_loop

glabel bhvBulletBill # 179C
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_pos
    collision_sphere 0x0032, 0x0032, 0x0032
    interact_type INTERACT_DAMAGE
    obj_set_int objDamageOrCoinValue, 3
    scale 40
    obj_set_int objIntangibleTimer, 0
    gravity 0x001E, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
    callnative bhv_bullet_bill_init
    begin_loop
        callnative bhv_bullet_bill_loop
    end_loop

glabel bhvWhitePuffSmoke # 17F4
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    obj_add_float objPosY, -100
    callnative bhv_white_puff_smoke_init
    obj_set_int objAnimState, -1
    begin_repeat 10
        obj_add_int objAnimState, 1
    end_repeat
    deactivate

glabel bhvUnused1820 # 1820
    begin OBJ_LIST_DEFAULT
    break

glabel bhvBowserTailAnchor # 1828
    begin OBJ_LIST_GENACTOR
    collision_sphere 0x0064, 0x0032, 0xFFCE
    obj_set_int objIntangibleTimer, 0
    graph_clear
    begin_loop
        callnative bhv_bowser_tail_anchor_loop
    end_loop

glabel bhvBowser # 1850
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_HOLDABLE | OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int objInteractType, 0x02
    set_hitbox 0x0190, 0x0190
    drop_floor
    obj_set_pos
    obj_set_int32 objAnimations, bowser_seg6_anims_06057690
    obj_child MODEL_NONE, bhvBowserBodyAnchor
    obj_child MODEL_BOWSER_BOMB_CHILD_OBJ, bhvBowserFlameSpawn
    obj_spawn MODEL_NONE, bhvBowserTailAnchor
    obj_set_int objNumLootCoins, 0x0032
    gravity 0x0000, 0xFE70, 0xFFBA, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    obj_set_pos
    callnative bhv_bowser_init
    begin_loop
        callnative bhv_bowser_loop
    end_loop

glabel bhvBowserBodyAnchor # 18CC
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    set_hitbox 0x0064, 0x012C
    interact_type INTERACT_DAMAGE
    obj_set_int objInteractSubtype, 0x0008
    graph_clear
    obj_set_int objDamageOrCoinValue, 2
    obj_set_int objIntangibleTimer, 0
    begin_loop
        callnative bhv_bowser_body_anchor_loop
    end_loop

glabel bhvBowserFlameSpawn # 1904
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    geo_layout MODEL_NONE
    begin_loop
        callnative bhv_bowser_flame_spawn_loop
    end_loop

glabel bhvTiltingBowserLavaPlatform # 1920
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data bowser_2_seg7_collision_tilting_platform
    obj_set_float objDrawingDistance, 0x4E20
    obj_set_float objCollisionDistance, 0x4E20
    obj_set_int objFaceAngleYaw, 0x0000
    obj_set_pos
    begin_loop
        callnative obj_rotate_face_angle_using_vel
        callnative load_object_collision_model
    end_loop

glabel bhvFallingBowserPlatform # 1958
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_float objDrawingDistance, 0x4E20
    obj_set_float objCollisionDistance, 0x4E20
    obj_set_pos
    begin_loop
        callnative bhv_falling_bowser_platform_loop
        callnative load_object_collision_model
    end_loop

glabel bhvBlueBowserFlame # 1984
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    interact_type INTERACT_FLAME
    billboard
    gravity 0x0000, 0xFE70, 0xFFBA, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    callnative bhv_blue_bowser_flame_init
    begin_loop
        callnative bhv_blue_bowser_flame_loop
        text_anim_rate objAnimState, 0x0002
    end_loop

glabel bhvFlameFloatingLanding # 19C8
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    interact_type INTERACT_FLAME
    billboard
    gravity 0x0000, 0xFE70, 0xFFBA, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    callnative bhv_flame_floating_landing_init
    begin_loop
        callnative bhv_flame_floating_landing_loop
        text_anim_rate objAnimState, 0x0002
    end_loop

glabel bhvBlueFlamesGroup # 1A0C
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    interact_type INTERACT_FLAME
    billboard
    begin_loop
        callnative bhv_blue_flames_group_loop
    end_loop

glabel bhvFlameBouncing # 1A30
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    interact_type INTERACT_FLAME
    billboard
    callnative bhv_flame_bouncing_init
    gravity 0x0000, 0xFE70, 0xFFBA, 0x0000, 0x0000, 0x00C8, 0x0000, 0x0000
    begin_loop
        callnative bhv_flame_bouncing_loop
        text_anim_rate objAnimState, 0x0002
    end_loop

glabel bhvFlameMovingForwardGrowing # 1A74
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    interact_type INTERACT_FLAME
    billboard
    callnative bhv_flame_moving_forward_growing_init
    begin_loop
        callnative bhv_flame_moving_forward_growing_loop
        text_anim_rate objAnimState, 0x0002
    end_loop

glabel bhvFlameBowser # 1AA4
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    interact_type INTERACT_FLAME
    billboard
    callnative bhv_flame_bowser_init
    gravity 0x0000, 0xFE70, 0xFFBA, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    begin_loop
        callnative bhv_flame_bowser_loop
        text_anim_rate objAnimState, 0x0002
    end_loop

glabel bhvFlameLargeBurningOut # 1AE8
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    interact_type INTERACT_FLAME
    billboard
    callnative bhv_flame_large_burning_out_init
    gravity 0x0000, 0xFE70, 0xFFBA, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    begin_loop
        callnative bhv_flame_bowser_loop
        text_anim_rate objAnimState, 0x0002
    end_loop

glabel bhvBlueFish # 1B2C
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_pos
    obj_set_int32 objAnimations, blue_fish_seg3_anims_0301C2B0
    animate 0x00
    begin_loop
        callnative bhv_blue_fish_loop
    end_loop

glabel bhvTankFishGroup # 1B54
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_pos
    begin_loop
        callnative bhv_tank_fish_group_loop
    end_loop

glabel bhvCheckerboardElevatorGroup # 1B70
    begin OBJ_LIST_SPAWNER
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    callnative bhv_checkerboard_elevator_group_init
    delay 1
    deactivate

glabel bhvCheckerboardPlatformSub # 1B88
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data checkerboard_platform_seg8_collision_0800D710
    callnative bhv_checkerboard_platform_init
    obj_set_pos
    begin_loop
        callnative bhv_checkerboard_platform_loop
    end_loop

glabel bhvBowserKeyUnlockDoor # 1BB4
    begin OBJ_LIST_DEFAULT
    obj_set_int32 objAnimations, bowser_key_seg3_anims_list
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    begin_loop
        callnative bhv_bowser_key_unlock_door_loop
    end_loop

glabel bhvBowserKeyCourseExit # 1BD4
    begin OBJ_LIST_DEFAULT
    obj_set_int32 objAnimations, bowser_key_seg3_anims_list
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    begin_loop
        callnative bhv_bowser_key_course_exit_loop
    end_loop

glabel bhvInvisibleObjectsUnderBridge # 1BF4
    begin OBJ_LIST_DEFAULT
    callnative bhv_invisible_objects_under_bridge_init
    break

glabel bhvWaterLevelPillar # 1C04
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data inside_castle_seg7_collision_water_level_pillar
    callnative bhv_water_level_pillar_init
    begin_loop
        callnative bhv_water_level_pillar_loop
        callnative load_object_collision_model
    end_loop

glabel bhvDddWarp # 1C34
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_float objCollisionDistance, 0x7530
    begin_loop
        callnative bhv_ddd_warp_loop
        callnative load_object_collision_model
    end_loop

glabel bhvMoatGrills # 1C58
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data castle_grounds_seg7_collision_moat_grills
    obj_set_float objCollisionDistance, 0x7530
    begin_loop
        callnative bhv_moat_grills_loop
    end_loop

glabel bhvClockMinuteHand # 1C7C
    begin OBJ_LIST_DEFAULT
    obj_set_int objAngleVelRoll, 0xFE80
    goto .L13001C94
glabel bhvClockHourHand # 1C8C
    begin OBJ_LIST_DEFAULT
    obj_set_int objAngleVelRoll, 0xFFE0
.L13001C94: # 1C94
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    callnative bhv_init_room
    begin_loop
        callnative bhv_rotating_clock_arm_loop
    end_loop

glabel bhvMacroUkiki # 1CB0
    begin OBJ_LIST_GENACTOR
ukikiData: # 1CB4
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_HOLDABLE | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int objInteractType, 0x02
    obj_set_int objInteractSubtype, 0x0010
    set_hitbox 0x0028, 0x0028
    obj_set_int objIntangibleTimer, 0
    drop_floor
    obj_set_int32 objAnimations, ukiki_seg5_anims_05015784
    animate 0x00
    gravity 0x001E, 0xFE70, 0xFFCE, 0x0000, 0x0000, 0x00C8, 0x0000, 0x0000
    obj_set_pos
    callnative bhv_ukiki_init
    begin_loop
        callnative bhv_ukiki_loop
    end_loop

glabel bhvStub1D0C # 1D0C
    begin OBJ_LIST_DEFAULT
    deactivate

glabel bhvLllRotatingHexagonalPlatform # 1D14
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data lll_seg7_collision_hexagonal_platform
    obj_set_pos
    begin_loop
        obj_set_int objAngleVelYaw,  0x100
        obj_add_int objMoveAngleYaw, 0x100
        callnative load_object_collision_model
    end_loop

glabel bhvLllSinkingRockBlock # 1D40
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data lll_seg7_collision_floating_block
    obj_add_float objPosY, -50
    obj_set_pos
    begin_loop
        callnative bhv_lll_sinking_rock_block_loop
        callnative load_object_collision_model
    end_loop

glabel bhvStub1D70 # 1D70
    begin OBJ_LIST_DEFAULT
    break

glabel bhvLllMovingOctagonalMeshPlatform # 1D78
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_add_float objPosY, -50
    collision_data lll_seg7_collision_octagonal_moving_platform
    begin_loop
        callnative bhv_lll_moving_octagonal_mesh_platform_loop
        callnative load_object_collision_model
    end_loop

glabel bhvSnowBall # 1DA4
    break

glabel bhvLllRotatingBlockWithFireBars # 1DA8
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data lll_seg7_collision_rotating_fire_bars
    obj_set_float objCollisionDistance, 0x0FA0
    begin_loop
        callnative bhv_lll_rotating_block_fire_bars_loop
    end_loop

glabel bhvLllRotatingHexFlame # 1DCC
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    interact_type INTERACT_FLAME
    collision_sphere 0x0032, 0x0064, 0x0032
    obj_set_int objIntangibleTimer, 0
    billboard
    begin_loop
        callnative bhv_lll_rotating_hex_flame_loop
        obj_add_int objAnimState, 1
    end_loop

glabel bhvLllWoodPiece # 1E04
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data lll_seg7_collision_wood_piece
    obj_set_pos
    begin_loop
        callnative bhv_lll_wood_piece_loop
        callnative load_object_collision_model
    end_loop

glabel bhvLllFloatingWoodBridge # 1E30
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    geo_layout MODEL_NONE
    begin_loop
        callnative bhv_lll_floating_wood_bridge_loop
    end_loop

glabel bhvVolcanoFlames # 1E4C
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    begin_loop
        obj_add_int objAnimState, 1
        callnative bhv_volcano_flames_loop
    end_loop

glabel bhvLllRotatingHexagonalRing # 1E6C
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data lll_seg7_collision_rotating_platform
    begin_loop
        callnative bhv_lll_rotating_hexagonal_ring_loop
        callnative load_object_collision_model
    end_loop

glabel bhvLllSinkingRectangularPlatform # 1E94
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data lll_seg7_collision_slow_tilting_platform
    obj_set_float objCollisionDistance, 0x07D0
    obj_set_pos
    begin_loop
        callnative bhv_lll_sinking_rectangular_platform_loop
        callnative load_object_collision_model
    end_loop

glabel bhvLllSinkingSquarePlatforms # 1EC4
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data lll_seg7_collision_sinking_pyramids
    obj_add_float objPosY, 5
    obj_set_float objCollisionDistance, 0x07D0
    obj_set_pos
    begin_loop
        callnative bhv_lll_sinking_square_platforms_loop
        callnative load_object_collision_model
    end_loop

glabel bhvLllTiltingSquarePlatform # 1EF8
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data lll_seg7_collision_inverted_pyramid
    obj_add_float objPosY, 5
    obj_set_pos
    callnative bhv_tilting_platform_init
    begin_loop
        callnative bhv_tilting_platform_loop
        callnative load_object_collision_model
    end_loop

glabel bhvUnused1F30 # 1F30
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    break

glabel bhvKoopaShell # 1F3C
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    gravity 0x001E, 0xFE70, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    begin_loop
        callnative bhv_koopa_shell_loop
    end_loop

glabel bhvKoopaShellFlame # 1F68
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    interact_type INTERACT_FLAME
    billboard
    begin_loop
        callnative bhv_koopa_shell_flame_loop
        text_anim_rate objAnimState, 0x0002
    end_loop

glabel bhvToxBox # 1F90
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data ssl_seg7_collision_tox_box
    obj_add_float objPosY, 256
    obj_set_float objDrawingDistance, 0x1F40
    obj_set_pos
    begin_loop
        callnative bhv_tox_box_loop
    end_loop

glabel bhvPiranhaPlant # 1FBC
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, piranha_plant_seg6_anims_0601C31C
    animate 0x00
    interact_type INTERACT_DAMAGE
    set_hitbox 0x0064, 0x00C8
    obj_set_float2 0x0032, 0x00C8
    obj_set_int objIntangibleTimer, 0
    obj_set_int objDamageOrCoinValue, 3
    obj_set_int objNumLootCoins, 5
    obj_child MODEL_BUBBLE, bhvPiranhaPlantBubble
    obj_set_float objDrawingDistance, 0x07D0
    obj_set_pos
    begin_loop
        callnative bhv_piranha_plant_loop
    end_loop

glabel bhvLllHexagonalMesh # 2018
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data lll_hexagonal_mesh_seg3_collision_0301CECC
    begin_loop
        callnative load_object_collision_model
    end_loop

glabel bhvLllBowserPuzzlePiece # 2038
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data lll_seg7_collision_puzzle_piece
    obj_set_pos
    obj_set_float objCollisionDistance, 0x0BB8
    begin_loop
        callnative bhv_lll_bowser_puzzle_piece_loop
        callnative load_object_collision_model
    end_loop

glabel bhvLllBowserPuzzle # 2068
    begin OBJ_LIST_SPAWNER
    graph_clear
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_add_float objPosZ, -50
    begin_loop
        callnative bhv_lll_bowser_puzzle_loop
    end_loop

glabel bhvTuxiesMother # 2088
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, penguin_seg5_anims_05008B74
    animate 0x03
    gravity 0x001E, 0xFE70, 0xFFCE, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
    obj_set_pos
    interact_type INTERACT_TEXT
    set_hitbox 0x00C8, 0x012C
    obj_set_int objIntangibleTimer, 0
    begin_loop
        callnative bhv_tuxies_mother_loop
    end_loop

glabel bhvPenguinBaby # 20D8
    begin OBJ_LIST_GENACTOR
    break

glabel bhvUnused20E0 # 20E0
    begin OBJ_LIST_GENACTOR
    break

glabel bhvSmallPenguin # 20E8
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_HOLDABLE | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    drop_floor
    obj_set_int32 objAnimations, penguin_seg5_anims_05008B74
    animate 0x00
    gravity 0x001E, 0xFE70, 0xFFCE, 0x0000, 0x0000, 0x00C8, 0x0000, 0x0000
    obj_set_int objInteractType, 0x02
    obj_set_int objInteractSubtype, 0x0010
    obj_set_int objIntangibleTimer, 0
    set_hitbox 0x0028, 0x0028
    obj_set_pos
    begin_loop
        callnative bhv_small_penguin_loop
    end_loop

glabel bhvFish2 # 213C
    begin OBJ_LIST_DEFAULT
    obj_set_int objBehParams2ndByte, 0x0000
    goto bhvFishCommon
glabel bhvFish3 # 214C
    begin OBJ_LIST_DEFAULT
    obj_set_int objBehParams2ndByte, 1
    goto bhvFishCommon
glabel bhvLargeFishGroup # 215C
    begin OBJ_LIST_DEFAULT
glabel bhvFishCommon # 2160
    graph_clear
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    begin_loop
        callnative bhv_fish_loop
    end_loop

glabel bhvFishGroup2 # 2178
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_pos
    begin_loop
        callnative bhv_fish_group_2_loop
    end_loop

glabel bhvWdwExpressElevator # 2194
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data wdw_seg7_collision_express_elevator_platform
    obj_set_pos
    begin_loop
        callnative bhv_wdw_express_elevator_loop
        callnative load_object_collision_model
    end_loop

glabel bhvWdwExpressElevatorPlatform # 21C0
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data wdw_seg7_collision_express_elevator_platform
    obj_set_pos
    begin_loop
        callnative load_object_collision_model
    end_loop

glabel bhvChirpChirp # 21E4
    begin OBJ_LIST_DEFAULT
    obj_set_int objVarF4, 1
    goto .LbhvChirpChirp_21F4

glabel bhvChirpChirpUnused # 21F4
.LbhvChirpChirp_21F4:
    graph_clear
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    begin_loop
        callnative bhv_bird_chirp_chirp_loop
    end_loop

glabel bhvBub # 220C
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, bub_seg6_anims_06012354
    animate 0x00
    collision_sphere 0x0014, 0x000A, 0x000A
    interact_type INTERACT_DAMAGE
    obj_set_int objDamageOrCoinValue, 1
    obj_set_pos
    obj_set_int objIntangibleTimer, 0
    begin_loop
        callnative bhv_cheep_cheep_loop
    end_loop

glabel bhvExclamationBox # 2250
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data exclamation_box_outline_seg8_collision_08025F78
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_float objCollisionDistance, 0x012C
    obj_set_pos
    begin_loop
        callnative bhv_exclamation_box_loop
    end_loop

glabel bhvRotatingExclamationMark # 227C
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    scale 200
    begin_loop
        callnative bhv_rotatin_exclamation_box_loop
        obj_add_int objMoveAngleYaw, 0x800
    end_loop

glabel bhvSoundSpawner # 229C
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    delay 3
    callnative bhv_sound_spawner_init
    delay 30
    deactivate

glabel bhvRockSolid # 22B8
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data jrb_seg7_collision_rock_solid
    begin_loop
        callnative load_object_collision_model
    end_loop

glabel bhvBowserSubDoor # 22D8
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data ddd_seg7_collision_bowser_sub_door
    obj_set_float objDrawingDistance, 0x4E20
    obj_set_float objCollisionDistance, 0x4E20
    begin_loop
        callnative bhv_bowsers_sub_loop
        callnative load_object_collision_model
    end_loop

glabel bhvBowsersSub # 2308
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_float objDrawingDistance, 0x4E20
    obj_set_float objCollisionDistance, 0x4E20
    collision_data ddd_seg7_collision_submarine
    begin_loop
        callnative bhv_bowsers_sub_loop
        callnative load_object_collision_model
    end_loop

glabel bhvSushiShark # 2338
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, sushi_seg5_anims_0500AE54
    obj_spawn MODEL_NONE, bhvSushiSharkCollisionChild
    collision_sphere 0x0064, 0x0032, 0x0032
    interact_type INTERACT_DAMAGE
    obj_set_int objDamageOrCoinValue, 3
    obj_set_pos
    animate 0x00
    obj_set_int objIntangibleTimer, 0
    begin_loop
        callnative bhv_sushi_shark_loop
    end_loop

glabel bhvSushiSharkCollisionChild # 2388
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    graph_clear
    begin_loop
        callnative bhv_sushi_shark_collision_loop
    end_loop

glabel bhvJrbSlidingBox # 23A4
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data jrb_seg7_collision_floating_box
    obj_set_pos
    begin_loop
        callnative bhv_jrb_sliding_box_loop
        callnative load_object_collision_model
    end_loop

glabel bhvShipPart3 # 23D0
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_pos
    begin_loop
        callnative bhv_ship_part_3_loop
    end_loop

glabel bhvInSunkenShip3 # 23EC
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data jrb_seg7_collision_in_sunken_ship_3
    obj_set_pos
    obj_set_float objCollisionDistance, 0x0FA0
    begin_loop
        callnative bhv_ship_part_3_loop
        callnative load_object_collision_model
    end_loop

glabel bhvSunkenShipPart # 241C
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    scale 50
    obj_set_pos
    begin_loop
        callnative bhv_sunken_ship_part_loop
    end_loop

glabel bhvUnused243C # 243C
    obj_set_int objFaceAnglePitch, 0xE958
    obj_set_int objFaceAngleYaw, 0xEE6C
    obj_set_int objFaceAngleRoll, 0x0C80
    return
glabel bhvSunkenShipPart2 # 244C
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    scale 100
    obj_set_float objDrawingDistance, 0x1770
    obj_set_pos
    call bhvUnused243C
    break

glabel bhvInSunkenShip # 246C
    begin OBJ_LIST_SURFACE
    collision_data jrb_seg7_collision_in_sunken_ship
    goto .LbhvInSunkenShip248C
glabel bhvInSunkenShip2 # 2480
    begin OBJ_LIST_SURFACE
    collision_data jrb_seg7_collision_in_sunken_ship_2
.LbhvInSunkenShip248C: # 248C
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_float objCollisionDistance, 0x0FA0
    call bhvUnused243C
    begin_loop
        callnative load_object_collision_model
    end_loop

glabel bhvMarioDustGenerator # 24AC
    begin OBJ_LIST_DEFAULT
    obj_bit_clear_int32 objUnkE0, 0x00000001
    graph_clear
    obj_child MODEL_MIST, bhvWhitePuff1
    obj_child MODEL_SMOKE, bhvWhitePuff2
    delay 1
    deactivate

glabel bhvWhitePuff1 # 24DC
    begin OBJ_LIST_DEFAULT
    obj_bit_clear_int32 objUnkE0, 0x00000001
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    begin_loop
        callnative bhv_white_puff_1_loop
    end_loop

glabel bhvWhitePuff2 # 2500
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, (OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    obj_set_int objAnimState, -1
    begin_repeat 7
        callnative bhv_white_puff_2_loop
        obj_add_int objAnimState, 1
    end_repeat
    deactivate

glabel bhvWhitePuffSmoke2 # 2528
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    obj_set_int objAnimState, -1
    begin_repeat 7
        callnative bhv_white_puff_2_loop
        callnative obj_move_using_fvel_and_gravity
        obj_add_int objAnimState, 1
    end_repeat
    deactivate

glabel bhvPurpleSwitchHiddenBoxes # 2558
    begin OBJ_LIST_SURFACE
    obj_set_int objBehParams2ndByte, 2
    goto .Lbeh_floor_switch_1488

glabel bhvBlueCoinSwitch # 2568
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data blue_coin_switch_seg8_collision_08000E98
    begin_loop
        callnative bhv_blue_coin_switch_loop
    end_loop

glabel bhvHiddenBlueCoin # 2588
    begin OBJ_LIST_LEVEL
    obj_set_int objInteractType, 0x10
    obj_or_int objFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    set_hitbox 0x0064, 0x0040
    obj_set_int objDamageOrCoinValue, 0x0005
    obj_set_int objIntangibleTimer, 0
    obj_set_int objAnimState, -1
    begin_loop
        callnative bhv_hidden_blue_coin_loop
        obj_add_int objAnimState, 1
    end_loop

glabel bhvOpenableCageDoor # 25C0
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    begin_loop
        callnative bhv_openable_cage_door_loop
        callnative load_object_collision_model
    end_loop

glabel bhvOpenableGrill # 25E0
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    begin_loop
        callnative bhv_openable_grill_loop
    end_loop

glabel bhvWaterLevelDiamond # 25F8
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    set_hitbox 0x0046, 0x001E
    obj_set_float objCollisionDistance, 0x00C8
    obj_set_int objIntangibleTimer, 0
    begin_loop
        callnative bhv_water_level_diamond_loop
    end_loop

glabel bhvInitializeChangingWaterLevel # 2620
    begin OBJ_LIST_DEFAULT
    begin_loop
        callnative bhv_init_changing_water_level_loop
    end_loop

glabel bhvTornadoSandParticle # 2634
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, (OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    begin_loop
        callnative bhv_tweester_sand_particle_loop
    end_loop

glabel bhvTornado # 2650
    begin OBJ_LIST_POLELIKE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    gravity 0x001E, 0xFE70, 0x0000, 0x0000, 0x0000, 0x00C8, 0x0000, 0x0000
    drop_floor
    obj_set_pos
    begin_loop
        callnative bhv_tweester_loop
    end_loop

glabel bhvMerryGoRoundBooManager # 2684
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    begin_loop
        callnative bhv_merry_go_round_boo_manager_loop
    end_loop

glabel bhvAnimatedTexture # 269C
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    gravity 0x001E, 0xFE70, 0xFFBA, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    billboard
    begin_loop
        callnative bhv_animated_texture_loop
        obj_add_int objAnimState, 1
        text_anim_rate objAnimState, 0x0002
    end_loop

glabel bhvBooInCastle # 26D4
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_pos
    obj_set_float objGraphYOffset, 0x003C
    gravity 0x001E, 0x0000, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    callnative bhv_init_room
    begin_loop
        callnative bhv_boo_in_castle_loop
    end_loop

glabel bhvBooWithCage # 2710
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_pos
    obj_set_int objDamageOrCoinValue, 3
    obj_set_float2 0x0050, 0x0078
    set_hitbox 0x00B4, 0x008C
    obj_set_float objGraphYOffset, 0x003C
    gravity 0x001E, 0x0000, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    callnative bhv_boo_with_cage_init
    callnative bhv_init_room
    begin_loop
        callnative bhv_boo_with_cage_loop
    end_loop

glabel bhvBalconyBigBoo # 2768
    begin OBJ_LIST_GENACTOR
    obj_set_int objBehParams2ndByte, 2
    obj_set_int objVar1AC, 10
    goto common_big_boo_bhv

glabel bhvMerryGoRoundBigBoo # 277C
    begin OBJ_LIST_GENACTOR
    obj_set_int objBehParams2ndByte, 1
    # Set number of minion boos killed to 10, which is greater than 5 so that the boo always loads without needing to kill any boos.
    obj_set_int objVar1AC, 10
    goto common_big_boo_bhv

glabel bhvGhostHuntBigBoo # 2790
    begin OBJ_LIST_GENACTOR
common_big_boo_bhv: # 2794
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_pos
    gravity 0x001E, 0x0000, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    callnative bhv_init_room
    callnative bhv_boo_init
    begin_loop
        callnative bhv_big_boo_loop
    end_loop

glabel bhvCourtyardBooTriplet # 27D0
    begin OBJ_LIST_DEFAULT
    graph_clear
    callnative bhv_courtyard_boo_triplet_init
    deactivate

glabel bhvBoo # 27E4
    begin OBJ_LIST_GENACTOR
    obj_set_int objBehParams2ndByte, 1
    goto common_boo_bhv

glabel bhvMerryGoRoundBoo # 27F4
    begin OBJ_LIST_GENACTOR
    obj_set_int objBehParams2ndByte, 2
    goto common_boo_bhv

glabel bhvGhostHuntBoo # 2804
    begin OBJ_LIST_GENACTOR
common_boo_bhv: # 2808
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int objIntangibleTimer, 0
    obj_set_pos
    obj_set_int objDamageOrCoinValue, 2
    set_hitbox 0x008C, 0x0050
    obj_set_float2 0x0028, 0x003C
    obj_set_float objGraphYOffset, 30
    callnative bhv_init_room
    obj_child MODEL_YELLOW_COIN, bhvCoinInsideBoo
    gravity 0x001E, 0x0000, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    callnative bhv_boo_init
    begin_loop
        callnative bhv_boo_loop
    end_loop

glabel bhvHiddenStaircaseStep # 286C
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data bbh_seg7_collision_staircase_step
    obj_set_int objRoom, 0x0001
    obj_set_float objCollisionDistance, 0x03E8
    obj_set_pos
    begin_loop
        callnative load_object_collision_model
    end_loop

glabel bhvBooBossSpawnedBridge # 2898
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data bbh_seg7_collision_staircase_step
    obj_set_int objRoom, 0x0001
    obj_set_float objCollisionDistance, 0x03E8
    obj_set_pos
    begin_loop
        callnative bhv_boo_boss_spawned_bridge_loop
        callnative load_object_collision_model
    end_loop

glabel bhvBbhTiltingTrapPlatform # 28CC
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data bbh_seg7_collision_tilt_floor_platform
    obj_set_pos
    obj_set_int objRoom, 0x0002
    begin_loop
        callnative bhv_bbh_tilting_trap_platform_loop
        callnative load_object_collision_model
    end_loop

glabel bhvHauntedBookshelf # 28FC
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data bbh_seg7_collision_haunted_bookshelf
    obj_set_pos
    obj_set_int objRoom, 0x0006
    begin_loop
        callnative bhv_haunted_bookshelf_loop
        callnative load_object_collision_model
    end_loop

glabel bhvMeshElevator # 292C
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data bbh_seg7_collision_mesh_elevator
    obj_set_pos
    obj_set_int objRoom, 0x000C
    obj_set_int objBehParams2ndByte, 0x0004
    callnative bhv_elevator_init
    begin_loop
        callnative bhv_elevator_loop
        callnative load_object_collision_model
    end_loop

glabel bhvMerryGoRound # 2968
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data bbh_seg7_collision_merry_go_round
    obj_set_float objCollisionDistance, 0x07D0
    obj_set_int objRoom, 0x000A
    begin_loop
        callnative bhv_merry_go_round_loop
        callnative load_object_collision_model
    end_loop

.ifndef VERSION_JP
glabel bhvPlaysMusicTrackWhenTouched # 2998
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    begin_loop
        callnative bhv_play_music_track_when_touched_loop
    end_loop
.endif

glabel bhvInsideCannon # 2998
    break

glabel bhvBetaBowserAnchor # 299C
    begin OBJ_LIST_DESTRUCTIVE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    obj_set_pos
    set_hitbox 0x0064, 0x012C
    obj_set_int objIntangibleTimer, 0
    begin_loop
        obj_add_int objAnimState, 1
        callnative bhv_beta_bowser_anchor_loop
    end_loop

glabel bhvStaticCheckeredPlatform # 29CC
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data checkerboard_platform_seg8_collision_0800D710
    obj_set_pos
    begin_loop
        callnative bhv_static_checkered_platform_loop
        callnative load_object_collision_model
    end_loop

glabel bhvUnused2A10 # 29F8
    begin OBJ_LIST_DEFAULT
    billboard
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    break

glabel bhvUnusedFakeStar # 2A08
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    begin_loop
        obj_add_int objFaceAnglePitch, 256
        obj_add_int objFaceAngleYaw, 256
    end_loop

# What is this?
    break
    break
    break
    break

glabel bhvStaticObject # 2A30
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    break

glabel bhvUnused2A54 # 2A3C
    begin OBJ_LIST_DEFAULT
    break

glabel bhvCastleFloorTrap # 2A44
    begin OBJ_LIST_DEFAULT
    graph_clear
    callnative bhv_castle_floor_trap_init
    begin_loop
        callnative bhv_castle_floor_trap_loop
    end_loop

glabel bhvFloorTrapInCastle # 2A64
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data inside_castle_seg7_collision_floor_trap
    begin_loop
        callnative bhv_floor_trap_in_castle_loop
        callnative load_object_collision_model
    end_loop

glabel bhvTree # 2A8C
    begin OBJ_LIST_POLELIKE
    billboard
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_int objInteractType, 0x40
    set_hitbox 0x0050, 0x01F4
    obj_set_int objIntangibleTimer, 0
    begin_loop
        callnative BehClimbDetectLoop
    end_loop

glabel bhvSparkle # 2AB8
    begin OBJ_LIST_UNIMPORTANT
    billboard
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_int objAnimState, -1
    begin_repeat 9
        obj_add_int objAnimState, 1
    end_repeat
    deactivate

glabel bhvSparkleSpawn # 2AD8
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    begin_loop
        callnative bhv_sparkle_spawn_loop
    end_loop

glabel bhvSpecialTripleJumpSparkles # 2AF0
    begin OBJ_LIST_DEFAULT
    obj_bit_clear_int32 objUnkE0, 0x00000008
glabel bhvSomeGfx # 2AFC
    begin OBJ_LIST_UNIMPORTANT
    billboard
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_float objGraphYOffset, 25
    obj_set_float_rand objVarF4, 0xFFCE, 0x0064
    obj_sum_float objPosX, objPosX, objVarF4
    obj_set_float_rand objVarF4, 0xFFCE, 0x0064
    obj_sum_float objPosZ, objPosZ, objVarF4
    obj_set_float_rand objVarF4, 0xFFCE, 0x0064
    obj_sum_float objPosY, objPosY, objVarF4
    obj_set_int objAnimState, -1
    begin_repeat 12
        obj_add_int objAnimState, 1
    end_repeat
    deactivate

glabel bhvScuttlebug # 2B44
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, scuttlebug_seg6_anims_06015064
    animate 0x00
    gravity 0x0050, 0xFE70, 0xFFCE, 0x0000, 0x0000, 0x00C8, 0x0000, 0x0000
    obj_set_pos
    callnative bhv_init_room
    begin_loop
        callnative bhv_scuttlebug_loop
    end_loop

glabel bhvScuttlebugSpawn # 2B88
    begin OBJ_LIST_SPAWNER
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    begin_loop
        callnative bhv_scuttlebug_spawn_loop
    end_loop

glabel bhvWhompKingBoss # 2BA0
    begin OBJ_LIST_SURFACE
    obj_set_int objBehParams2ndByte, 1
    obj_set_int objHealth, 0x0003
    goto .Lbeh_whomp_2BD4
glabel bhvSmallWhomp # 2BB4
    begin OBJ_LIST_SURFACE
    obj_set_int objNumLootCoins, 5
.Lbeh_whomp_2BD4: # 2BBC
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, whomp_seg6_anims_06020A04
    collision_data whomp_seg6_collision_06020A0C
    animate 0x00
    gravity 0x0000, 0xFE70, 0xFFCE, 0x0000, 0x0000, 0x00C8, 0x0000, 0x0000
    obj_set_pos
    begin_loop
        callnative bhv_whomp_loop
    end_loop

glabel bhvWaterSplash # 2BFC
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    obj_set_int objAnimState, -1
    begin_repeat 3
        obj_add_int objAnimState, 1
        callnative bhv_water_splash_loop
        delay 1
        callnative bhv_water_splash_loop
    end_repeat
    begin_repeat 5
        obj_add_int objAnimState, 1
        delay 1
    end_repeat
    obj_bit_clear_int32 objUnkE0, 0x00000040
    deactivate

glabel bhvWaterDrops # 2C48
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    begin_loop
        callnative bhv_water_drops_loop
    end_loop

glabel bhvWaterSurfaceWhiteWave # 2C64
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
.ifndef VERSION_JP
    obj_set_int objFaceAnglePitch, 0
    obj_set_int objFaceAngleYaw, 0
    obj_set_int objFaceAngleRoll, 0
.endif
    callnative bhv_water_surface_white_wave_init
    obj_add_float objPosY, 5
    obj_set_int objAnimState, -1
    begin_repeat 6
        obj_add_int objAnimState, 1
    end_repeat
    deactivate

glabel bhvObjectBubbleRipples # 2C8C
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
.ifdef VERSION_JP
    obj_set_float objFaceAnglePitch, 0
    obj_set_float objFaceAngleYaw, 0
    obj_set_float objFaceAngleRoll, 0
.endif
.ifndef VERSION_JP
    obj_set_int objFaceAnglePitch, 0
    obj_set_int objFaceAngleYaw, 0
    obj_set_int objFaceAngleRoll, 0
.endif
    obj_set_int objAnimState, -1
    callnative bhv_object_bubble_ripples_init
    begin_repeat 6
        obj_add_int objAnimState, 1
    end_repeat
    deactivate

glabel bhvSurfaceWaves # 2CBC
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
.ifdef VERSION_JP
    obj_set_float objFaceAnglePitch, 0
    obj_set_float objFaceAngleYaw, 0
    obj_set_float objFaceAngleRoll, 0
.endif
.ifndef VERSION_JP
    obj_set_int objFaceAnglePitch, 0
    obj_set_int objFaceAngleYaw, 0
    obj_set_int objFaceAngleRoll, 0
.endif
    obj_set_int objAnimState, -1
    obj_add_int objAnimState, 1
    begin_loop
        callnative bhv_surface_waves_loop
        obj_add_int objAnimState, 1
        begin_repeat 6
            callnative bhv_surface_waves_loop
        end_repeat
        callnative bhv_surface_waves_loop
    end_loop

glabel bhvWaterSurfaceWhiteWave2 # 2D04
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
.ifdef VERSION_JP
    obj_set_float objFaceAnglePitch, 0
    obj_set_float objFaceAngleYaw, 0
    obj_set_float objFaceAngleRoll, 0
.endif
.ifndef VERSION_JP
    obj_set_int objFaceAnglePitch, 0
    obj_set_int objFaceAngleYaw, 0
    obj_set_int objFaceAngleRoll, 0
.endif
    obj_set_int objAnimState, -1
    begin_repeat 6
        obj_add_int objAnimState, 1
    end_repeat
    deactivate

glabel bhvWavesGenerator # 2D2C
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    graph_clear
    begin_repeat 5
        spawn_addr D_8032FE18
    end_repeat_nobreak
    delay 1
    obj_bit_clear_int32 objUnkE0, 0x00000100
    deactivate

glabel bhvSurfaceWaveShrinking # 2D58
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    graph_clear
    begin_repeat 18
        spawn_addr D_8032FDD0
    end_repeat_nobreak
    callnative bhv_surface_wave_shrinking_init
    delay 1
    obj_bit_clear_int32 objUnkE0, 0x00001000
    deactivate

glabel bhvWaterType # 2D8C
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    goto .Lbeh_wave_trail_2DD0
glabel bhvWaveTrailOnSurface # 2D9C
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_bit_clear_int32 objUnkE0, 0x00000400
.Lbeh_wave_trail_2DD0: # 2DAC
    obj_set_float objFaceAnglePitch, 0
    obj_set_float objFaceAngleYaw, 0
    obj_set_float objFaceAngleRoll, 0
    obj_set_int objAnimState, -1
    begin_repeat 8
        obj_add_int objAnimState, 1
        callnative bhv_wave_trail_loop
        delay 1
        callnative bhv_wave_trail_loop
    end_repeat
    deactivate

glabel bhvTinyWhiteWindParticle # 2DE0
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    begin_loop
        callnative bhv_white_wind_particle_loop
    end_loop

glabel bhvWindParticle # 2DFC
    begin OBJ_LIST_POLELIKE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    begin_loop
        callnative bhv_white_wind_particle_loop
    end_loop

glabel bhvSnowmanWindBlowing # 2E18
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_pos
    begin_loop
        callnative bhv_snowman_wind_blowing_loop
    end_loop

glabel bhvWalkingPenguin # 2E34
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data penguin_seg5_collision_05008B88
    obj_set_int32 objAnimations, penguin_seg5_anims_05008B74
    animate 0x00
    gravity 0x0000, 0xFE70, 0xFFCE, 0x0000, 0x0000, 0x00C8, 0x0000, 0x0000
    scale 600
    obj_set_pos
    begin_loop
        callnative bhv_walking_penguin_loop
        callnative load_object_collision_model
    end_loop

glabel bhvYellowBall # 2E84
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    break

    .align 4
glabel bhvMario # 2EA0
    begin OBJ_LIST_PLAYER
    obj_set_int objIntangibleTimer, 0
    obj_or_int objFlags, OBJ_FLAG_0100
    obj_or_int objUnk94, 0x0001
    set_hitbox 0x0025, 0x00A0
    begin_loop
        callnative try_print_debug_mario_level_info
        callnative bhv_mario_update
        callnative try_do_mario_debug_object_spawn
    end_loop

glabel bhvToadMessage # 2ED8
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_PERSISTENT_RESPAWN | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, toad_seg6_anims_0600FB58
    animate 0x06
    interact_type INTERACT_TEXT
    set_hitbox 0x0050, 0x0064
    obj_set_int objIntangibleTimer, 0
    callnative bhv_init_room
    callnative bhvToadMessage_init
    begin_loop
        callnative bhvToadMessage_loop
    end_loop

glabel bhvUnlockDoorStar # 2F20
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    callnative bhvUnlockDoorStar_init
    begin_loop
        callnative bhvUnlockDoorStar_loop
    end_loop

glabel bhvWarps60 # 2F40
    break
glabel bhvWarps64 # 2F44
    break
glabel bhvWarps68 # 2F48
    break
glabel bhvWarps6C # 2F4C
    break
glabel bhvWarps70 # 2F50
    break
glabel bhvWarps74 # 2F54
    break
glabel bhvWarps78 # 2F58
    break
glabel bhvWarps7C # 2F5C
    break
glabel bhvWarps80 # 2F60
    break
glabel bhvWarps84 # 2F64
    break
glabel bhvWarps88 # 2F68
    break
glabel bhvWarps8C # 2F6C
    break
glabel bhvWarps90 # 2F70
    break
glabel bhvWarps94 # 2F74
    break

    .align 4
glabel bhvRandomAnimatedTexture # 2F80
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_float objGraphYOffset, 0xFFF0
    billboard
    obj_set_int objAnimState, -1
    begin_loop
        obj_add_int objAnimState, 1
    end_loop

glabel bhvYellowBackgroundInMenu # 2FA0
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    callnative beh_yellow_background_menu_init
    begin_loop
        obj_set_int objIntangibleTimer, 0
        callnative beh_yellow_background_menu_loop
    end_loop

glabel bhvMenuButton # 2FC4
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    callnative bhvMenuButton_init
    begin_loop
        obj_set_int objIntangibleTimer, 0
        callnative bhvMenuButton_loop
    end_loop

glabel bhvMenuButtonManager # 2FE8
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, (OBJ_FLAG_0800 | OBJ_FLAG_0020 | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    callnative bhvMenuButtonManager_init
    begin_loop
        obj_set_int objIntangibleTimer, 0
        callnative bhvMenuButtonManager_loop
    end_loop

glabel bhvStarInActSelector # 300C
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_pos
    begin_loop
        callnative BehStarActSelectorLoop
    end_loop

glabel bhvActSelector # 3028
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    callnative BehActSelectorInit
    begin_loop
        callnative BehActSelectorLoop
    end_loop

glabel bhvMovingYellowCoin # 3048
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    set_hitbox 0x0064, 0x0040
    obj_set_int objInteractType, 0x10
    obj_set_int objIntangibleTimer, 0
    obj_set_int objAnimState, -1
    callnative bhv_moving_yellow_coin_init
    begin_loop
        callnative bhv_moving_yellow_coin_loop
        obj_add_int objAnimState, 1
    end_loop

glabel bhvMovingBlueCoin # 3084
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    obj_set_int objIntangibleTimer, 0
    obj_set_int objAnimState, -1
    callnative bhv_moving_blue_coin_init
    begin_loop
        callnative bhv_moving_blue_coin_loop
        obj_add_int objAnimState, 1
    end_loop

glabel bhvBlueCoinSliding # 30B4
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    obj_set_int objIntangibleTimer, 0
    obj_set_int objAnimState, -1
    callnative bhv_blue_coin_sliding_jumping_init
    begin_loop
        callnative bhv_blue_coin_sliding_loop
        obj_add_int objAnimState, 1
    end_loop

glabel bhvBlueCoinJumping # 30E4
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    obj_set_int objIntangibleTimer, 0
    obj_set_int objAnimState, -1
    callnative bhv_blue_coin_sliding_jumping_init
    begin_loop
        callnative bhv_blue_coin_jumping_loop
        obj_add_int objAnimState, 1
    end_loop

glabel bhvSeaweed # 3114
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_int32 objAnimations, seaweed_seg6_anims_0600A4D4
    animate 0x00
    callnative bhv_seaweed_init
    begin_loop
    end_loop

glabel bhvSeaweedBundle # 3138
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    drop_floor
    callnative bhv_seaweed_bundle_init
    begin_loop
    end_loop

glabel bhvBobomb # 3154
    begin OBJ_LIST_DESTRUCTIVE
    obj_or_int objFlags, (OBJ_FLAG_PERSISTENT_RESPAWN | OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_HOLDABLE | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, bobomb_seg8_anims_0802396C
    drop_floor
    animate 0x00
    obj_set_int objIntangibleTimer, 0
    obj_set_pos
    callnative bhv_bobomb_init
    begin_loop
        callnative bhv_bobomb_loop
    end_loop

glabel bhvBobombFuseSmoke # 318C
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    obj_set_int objAnimState, -1
    callnative bhv_bobomb_fuse_smoke_init
    delay 1
    begin_loop
        callnative BehDustSmokeLoop
        obj_add_int objAnimState, 1
    end_loop

glabel bhvBobombBuddy # 31BC
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_HOLDABLE | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, bobomb_seg8_anims_0802396C
    interact_type INTERACT_TEXT
    drop_floor
    set_hitbox 0x0064, 0x003C
    animate 0x00
    obj_set_int objVarFC, 0x0000
    obj_set_pos
    callnative bhv_bobomb_buddy_init
    begin_loop
        obj_set_int objIntangibleTimer, 0
        callnative bhv_bobomb_buddy_loop
    end_loop

# The only difference between this and the previous behavior are what objFlags and objVarFC are set to, why didn't they just use a jump?
glabel bhvBobombBuddyOpensCannon # 3208
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_PERSISTENT_RESPAWN | OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_HOLDABLE | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, bobomb_seg8_anims_0802396C
    interact_type INTERACT_TEXT
    drop_floor
    set_hitbox 0x0064, 0x003C
    animate 0x00
    obj_set_int objVarFC, 0x0001
    obj_set_pos
    callnative bhv_bobomb_buddy_init
    begin_loop
        obj_set_int objIntangibleTimer, 0
        callnative bhv_bobomb_buddy_loop
    end_loop

glabel bhvCannonClosed # 3254
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_PERSISTENT_RESPAWN | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data cannon_lid_seg8_collision_08004950
    obj_set_pos
    callnative bhv_cannon_closed_init
    begin_loop
        callnative bhv_cannon_closed_loop
        callnative load_object_collision_model
    end_loop

glabel bhvWhirlpool # 3288
    begin OBJ_LIST_POLELIKE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    callnative bhv_whirlpool_init
    begin_loop
        callnative bhv_whirlpool_loop
    end_loop

glabel bhvJetStream # 32A8
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    begin_loop
        callnative bhv_jet_stream_loop
    end_loop

glabel bhvMessagePanel # 32C0
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data wooden_signpost_seg3_collision_0302DD80
    interact_type INTERACT_TEXT
    obj_set_int objInteractSubtype, 0x1000
    drop_floor
    set_hitbox 0x0096, 0x0050
    obj_set_int objVarF4, 0
    begin_loop
        obj_set_int objIntangibleTimer, 0
        callnative load_object_collision_model
        obj_set_int objInteractStatus, 0
    end_loop

glabel bhvSignOnWall # 3304
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    interact_type INTERACT_TEXT
    obj_set_int objInteractSubtype, 0x1000
    set_hitbox 0x0096, 0x0050
    obj_set_int objVarF4, 0
    begin_loop
        obj_set_int objIntangibleTimer, 0
        obj_set_int objInteractStatus, 0
    end_loop

glabel bhvHomingAmp # 3334
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, amp_seg8_anims_08004034
    animate 0x00
    obj_set_float objGraphYOffset, 0x0028
    obj_set_int objIntangibleTimer, 0
    callnative bhv_homing_amp_init
    begin_loop
        callnative bhv_homing_amp_loop
    end_loop

glabel bhvCirclingAmp # 3368
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, amp_seg8_anims_08004034
    animate 0x00
    obj_set_float objGraphYOffset, 0x0028
    obj_set_int objIntangibleTimer, 0
    callnative bhv_circling_amp_init
    begin_loop
        callnative bhv_circling_amp_loop
    end_loop

glabel bhvButterfly # 339C
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, butterfly_seg3_anims_030056B0
    drop_floor
    obj_set_float objGraphYOffset, 0x0005
    callnative bhv_butterfly_init
    begin_loop
        callnative bhv_butterfly_loop
    end_loop

glabel bhvHoot # 33CC
    begin OBJ_LIST_POLELIKE
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, hoot_seg5_anims_05005768
    obj_set_int objInteractType, 0x01
    set_hitbox 0x004B, 0x004B
    callnative bhv_hoot_init
    begin_loop
        callnative bhv_hoot_loop
    end_loop

glabel bhvBetaHoldableObject # 3400
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_HOLDABLE | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int objInteractType, 0x02 # INTERACT_GRABBABLE
    drop_floor
    set_hitbox 0x0028, 0x0032
    callnative bhv_beta_holdable_object_init
    begin_loop
        obj_set_int objIntangibleTimer, 0
        callnative bhv_beta_holdable_object_loop
    end_loop

glabel bhvCarrySomething1 # 3434
    begin OBJ_LIST_DEFAULT
    break
glabel bhvCarrySomething2 # 343C
    begin OBJ_LIST_DEFAULT
    break
glabel bhvCarrySomething3 # 3444
    begin OBJ_LIST_DEFAULT
    break
glabel bhvCarrySomething4 # 344C
    begin OBJ_LIST_DEFAULT
    break
glabel bhvCarrySomething5 # 3454
    begin OBJ_LIST_DEFAULT
    break
glabel bhvCarrySomething6 # 345C
    begin OBJ_LIST_DEFAULT
    break

glabel bhvObjectBubble # 3464
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, (OBJ_FLAG_MOVE_Y_WITH_TERMINAL_VEL | OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_int objAnimState, -1
    callnative bhv_object_bubble_init
    obj_set_float_rand objVelY, 0x0003, 0x0006
    obj_set_int_rand_rshift objMoveAngleYaw, 0x0000, 0x0000
    delay 1
    begin_loop
        callnative bhv_object_bubble_loop
    end_loop

glabel bhvObjectWaterWave # 34A4
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_float objFaceAnglePitch, 0
    obj_set_float objFaceAngleYaw, 0
    obj_set_float objFaceAngleRoll, 0
    obj_set_int objAnimState, -1
    callnative bhv_object_water_wave_init
    obj_add_int objAnimState, 1
    delay 6
    begin_loop
        callnative bhv_object_water_wave_loop
        obj_add_int objAnimState, 1
    begin_repeat 6
        callnative bhv_object_water_wave_loop
    end_repeat
    end_loop

glabel bhvExplosion # 34F0
    begin OBJ_LIST_DESTRUCTIVE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    interact_type INTERACT_DAMAGE
    obj_set_int objDamageOrCoinValue, 2
    obj_set_int objIntangibleTimer, 0
    collision_sphere 0x0096, 0x0096, 0x0096
    obj_set_int objAnimState, -1
    callnative bhv_explosion_init
    begin_loop
        callnative bhv_explosion_loop
        obj_add_int objAnimState, 1
    end_loop

glabel bhvBobombBullyDeathSmoke # 3538
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, (OBJ_FLAG_MOVE_Y_WITH_TERMINAL_VEL | OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    obj_set_int objAnimState, -1
    callnative bhv_bobomb_bully_death_smoke_init
    delay 1
    begin_loop
        callnative BehDustSmokeLoop
        obj_add_int objAnimState, 1
    end_loop

glabel bhvSmoke # 3568
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, (OBJ_FLAG_MOVE_Y_WITH_TERMINAL_VEL | OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    obj_set_int objAnimState, -1
    delay 1
    begin_loop
        callnative BehDustSmokeLoop
        obj_add_int objAnimState, 1
    end_loop

glabel bhvBobombExplosionBubble # 3590
    begin OBJ_LIST_DEFAULT
    billboard
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    callnative bhv_bobomb_explosion_bubble_init
    obj_add_float_rand objPosX, -50, 100
    obj_add_float_rand objPosY, -50, 100
    obj_add_float_rand objPosZ, -50, 100
    call bhvBobombExplosionBubble3600
    delay 1
    begin_loop
        call bhvBobombExplosionBubble3600
        callnative bhv_bobomb_explosion_bubble_loop
    end_loop

glabel bhvBobombExplosionBubble3600 # 35E0
    obj_add_float_rand objPosX, -2, 4
    obj_add_float_rand objPosZ, -2, 4
    return

glabel bhvRespawner # 35F4
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    begin_loop
        callnative bhv_respawner_loop
    end_loop

glabel bhvSmallBully # 360C
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, bully_seg5_anims_0500470C
    drop_floor
    obj_set_pos
    callnative bhv_small_bully_init
    begin_loop
        obj_set_int objIntangibleTimer, 0
        callnative bhv_bully_loop
    end_loop

glabel bhvBigBully # 3640
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, bully_seg5_anims_0500470C
    drop_floor
    obj_set_pos
    callnative bhv_big_bully_init
    begin_loop
        obj_set_int objIntangibleTimer, 0
        callnative bhv_bully_loop
    end_loop

glabel bhvBigBullyWithMinions # 3674
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, bully_seg5_anims_0500470C
    obj_set_pos
    callnative bhv_big_bully_init
    callnative bhv_big_bully_with_minions_init
    begin_loop
        callnative bhv_big_bully_with_minions_loop
    end_loop

glabel bhvSmallChillBully # 36A8
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, chilly_chief_seg6_anims_06003994
    drop_floor
    obj_set_pos
    obj_set_int objVarF4, 0x0010
    callnative bhv_small_bully_init
    begin_loop
        obj_set_int objIntangibleTimer, 0
        callnative bhv_bully_loop
    end_loop

glabel bhvBigChillBully # 36E0
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, chilly_chief_seg6_anims_06003994
    drop_floor
    obj_set_pos
    obj_set_int objVarF4, 0x0010
    callnative bhv_big_bully_init
    begin_loop
        obj_set_int objIntangibleTimer, 0
        callnative bhv_bully_loop
    end_loop

glabel bhvJetStreamRingSpawner # 3718
    begin OBJ_LIST_DEFAULT
    unhide
    begin_loop
        callnative bhv_jet_stream_ring_spawner_loop
    end_loop

glabel bhvJetStreamWaterRing # 3730
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_int32 objAnimations, water_ring_seg6_anims_06013F7C
    collision_sphere 0x004B, 0x0014, 0x0014
    interact_type INTERACT_WATER_RING
    obj_set_int objDamageOrCoinValue, 2
    obj_set_int objIntangibleTimer, 0
    callnative bhv_jet_stream_water_ring_init
    begin_loop
        obj_set_int objIntangibleTimer, 0
        callnative bhv_jet_stream_water_ring_loop
    end_loop

glabel bhvMantaRayWaterRing # 3778
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_int32 objAnimations, water_ring_seg6_anims_06013F7C
    collision_sphere 0x004B, 0x0014, 0x0014
    interact_type INTERACT_WATER_RING
    obj_set_int objDamageOrCoinValue, 2
    obj_set_int objIntangibleTimer, 0
    callnative bhv_manta_ray_water_ring_init
    begin_loop
        obj_set_int objIntangibleTimer, 0
        callnative bhv_manta_ray_water_ring_loop
    end_loop

glabel bhvMantaRayRingManager # 37C0
    begin OBJ_LIST_DEFAULT
    begin_loop
    end_loop

glabel bhvBowserBomb # 37CC
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_int objIntangibleTimer, 0
    collision_sphere 0x0028, 0x0028, 0x0028
    delay 1
    begin_loop
        obj_set_int objIntangibleTimer, 0
        callnative bhv_bowser_bomb_loop
    end_loop

glabel bhvBowserBombExplosion # 37FC
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    obj_set_float objGraphYOffset, 0xFEE0
    obj_set_int objAnimState, -1
    begin_loop
        callnative bhv_bowser_bomb_explosion_loop
    end_loop

glabel bhvBowserBombSmoke # 3820
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    obj_set_float objGraphYOffset, 0xFEE0
    obj_set_int objOpacity, 0x00FF
    obj_set_int objAnimState, -1
    begin_loop
        callnative bhv_bowser_bomb_smoke_loop
    end_loop

glabel bhvCelebrationStar # 3848
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    callnative bhv_celebration_star_init
    begin_loop
        callnative bhv_celebration_star_loop
    end_loop

glabel bhvCelebrationStarSparkle # 3868
    begin OBJ_LIST_UNIMPORTANT
    billboard
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_float objGraphYOffset, 25
    obj_set_int objAnimState, -1
    begin_loop
        obj_add_int objAnimState, 1
        callnative bhv_celebration_star_sparkle_loop
    end_loop

glabel bhvStarKeyCollectionPuffSpawner # 3890
    begin OBJ_LIST_DEFAULT
    billboard
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_int objAnimState, -1
    begin_loop
        callnative bhv_star_key_collection_puff_spawner_loop
    end_loop

glabel bhvLllDrawbridgeSpawner # 38B0
    begin OBJ_LIST_DEFAULT
    unhide
    begin_loop
        callnative bhv_lll_drawbridge_spawner_loop
    end_loop

glabel bhvLllDrawbridge # 38C8
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data lll_seg7_collision_drawbridge
    begin_loop
        callnative bhv_lll_drawbridge_loop
        callnative load_object_collision_model
    end_loop

glabel bhvSmallBomp # 38F0
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data wf_seg7_collision_small_bomp
    callnative bhv_small_bomp_init
    begin_loop
        callnative bhv_small_bomp_loop
        callnative load_object_collision_model
    end_loop

glabel bhvLargeBomp # 3920
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data wf_seg7_collision_large_bomp
    callnative bhv_large_bomp_init
    begin_loop
        callnative bhv_large_bomp_loop
        callnative load_object_collision_model
    end_loop

glabel bhvWfSlidingPlatform # 3950
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data wf_seg7_collision_sliding_brick_platform
    callnative bhv_wf_sliding_platform_init
    begin_loop
        callnative bhv_wf_sliding_platform_loop
        callnative load_object_collision_model
    end_loop

glabel bhvMoneybag # 3980
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, moneybag_seg6_anims_06005E5C
    drop_floor
    obj_set_pos
    obj_set_int objIntangibleTimer, -1
    callnative bhv_moneybag_init
    begin_loop
        callnative bhv_moneybag_loop
    end_loop

glabel bhvMoneybagHidden # 39B4
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_float objGraphYOffset, 0x001B
    billboard
    set_hitbox 0x006E, 0x0064
    obj_set_int objIntangibleTimer, 0
    obj_set_int objAnimState, -1
    begin_loop
        obj_add_int objAnimState, 1
        callnative bhv_moneybag_hidden_loop
    end_loop

glabel bhvPitBowlingBall # 39E8
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    obj_set_float objGraphYOffset, 130
    callnative bhv_bob_pit_bowling_ball_init
    begin_loop
        callnative bhv_bob_pit_bowling_ball_loop
    end_loop

glabel bhvFreeBowlingBall # 3A10
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    obj_set_float objGraphYOffset, 130
    callnative bhv_free_bowling_ball_init
    begin_loop
        callnative bhv_free_bowling_ball_loop
    end_loop

glabel bhvBowlingBall # 3A38
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    obj_set_float objGraphYOffset, 130
    callnative bhv_bowling_ball_init
    begin_loop
        callnative bhv_bowling_ball_loop
    end_loop

glabel bhvTtmBowlingBallSpawner # 3A60
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_int objVarFC, 0x003F
    callnative bhv_generic_bowling_ball_spawner_init
    begin_loop
        callnative bhv_generic_bowling_ball_spawner_loop
    end_loop

glabel bhvBobBowlingBallSpawner # 3A84
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_int objVarFC, 0x007F
    callnative bhv_generic_bowling_ball_spawner_init
    begin_loop
        callnative bhv_generic_bowling_ball_spawner_loop
    end_loop

glabel bhvThiBowlingBallSpawner # 3AA8
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    begin_loop
        callnative bhv_thi_bowling_ball_spawner_loop
    end_loop

glabel bhvRrCruiserWing # 3AC0
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    callnative bhv_rr_cruiser_wing_init
    begin_loop
        callnative bhv_rr_cruiser_wing_loop
    end_loop

glabel bhvSpindel # 3AE0
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_0010 | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data ssl_seg7_collision_spindel
    callnative bhv_spindel_init
    begin_loop
        callnative bhv_spindel_loop
        callnative load_object_collision_model
    end_loop

glabel bhvSslMovingPyramidWall # 3B10
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_0010 | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data ssl_seg7_collision_0702808C
    callnative bhv_ssl_moving_pyramid_wall_init
    begin_loop
        callnative bhv_ssl_moving_pyramid_wall_loop
        callnative load_object_collision_model
    end_loop

glabel bhvPyramidElevator # 3B40
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data ssl_seg7_collision_pyramid_elevator
    obj_set_pos
    obj_set_float objCollisionDistance, 0x4E20
    callnative bhv_pyramid_elevator_init
    begin_loop
        callnative bhv_pyramid_elevator_loop
        callnative load_object_collision_model
    end_loop

glabel bhvPyramidElevatorTrajectoryMarkerBall # 3B78
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    begin_loop
        callnative bhv_pyramid_elevator_trajectory_marker_ball_loop
    end_loop

glabel bhvPyramidTop # 3B94
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data ssl_seg7_collision_pyramid_top
    obj_set_pos
    obj_set_float objCollisionDistance, 0x4E20
    callnative bhv_pyramid_top_init
    begin_loop
        callnative bhv_pyramid_top_loop
        callnative load_object_collision_model
    end_loop

glabel bhvPyramidTopFragment # 3BCC
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    callnative bhv_pyramid_top_fragment_init
    begin_loop
        callnative bhv_pyramid_top_fragment_loop
    end_loop

glabel bhvPyramidPillarTouchDetector # 3BEC
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    set_hitbox 0x0032, 0x0032
    obj_set_int objIntangibleTimer, 0
    begin_loop
        callnative bhv_pyramid_pillar_touch_detector_loop
    end_loop

glabel bhvWaterfallSoundLoop # 3C10
    begin OBJ_LIST_DEFAULT
    begin_loop
        callnative bhv_waterfall_sound_loop
    end_loop

glabel bhvVolcanoSoundLoop # 3C24
    begin OBJ_LIST_DEFAULT
    begin_loop
        callnative bhv_volcano_sound_loop
    end_loop

glabel bhvCastleFlagWaving # 3C38
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_int32 objAnimations, castle_grounds_seg7_anim_flags
    animate 0x00
    callnative bhv_castle_flag_init
    begin_loop
    end_loop

glabel bhvBirdsSoundLoop # 3C5C
    begin OBJ_LIST_DEFAULT
    begin_loop
        callnative bhv_birds_sound_loop
    end_loop

glabel bhvAmbientSounds # 3C70
    begin OBJ_LIST_DEFAULT
    callnative bhv_ambient_sounds_init
    begin_loop
    end_loop

glabel bhvSandSoundLoop # 3C84
    begin OBJ_LIST_DEFAULT
    begin_loop
        callnative bhv_sand_sound_loop
    end_loop

glabel bhvHiddenAt120Stars # 3C98
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data castle_grounds_seg7_collision_cannon_grill
    obj_set_float objCollisionDistance, 0x0FA0
    callnative bhv_castle_cannon_grate_init
    begin_loop
        callnative load_object_collision_model
    end_loop

glabel bhvSnowmansBottom # 3CC4
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    drop_floor
    obj_set_int objIntangibleTimer, 0
    callnative bhv_snowmans_bottom_init
    begin_loop
        callnative bhv_snowmans_bottom_loop
    end_loop

glabel bhvSnowmansHead # 3CEC
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    drop_floor
    obj_set_float objGraphYOffset, 0x006E
    callnative bhv_snowmans_head_init
    begin_loop
        callnative bhv_snowmans_head_loop
    end_loop

glabel bhvSnowmansBodyCheckpoint # 3D14
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    begin_loop
        callnative bhv_snowmans_body_checkpoint_loop
    end_loop

glabel bhvBigSnowmanWhole # 3D2C
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_float objGraphYOffset, 0x00B4
    interact_type INTERACT_TEXT
    set_hitbox 0x00D2, 0x0226
    begin_loop
        obj_set_int objIntangibleTimer, 0
    end_loop

glabel bhvBigBoulder # 3D54
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_float objGraphYOffset, 0x00B4
    callnative bhv_big_boulder_init
    obj_set_float objCollisionDistance, 0x4E20
    begin_loop
        obj_set_int objIntangibleTimer, 0
        callnative bhv_big_boulder_loop
    end_loop

glabel bhvBigBoulderGenerator # 3D80
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    begin_loop
        callnative bhv_big_boulder_generator_loop
    end_loop

glabel bhvWingCap # 3D98
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    callnative bhv_wing_cap_init
    begin_loop
        callnative bhv_wing_vanish_cap_loop
    end_loop

glabel bhvMetalCap # 3DB8
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    callnative bhv_metal_cap_init
    begin_loop
        callnative bhv_metal_cap_loop
    end_loop

glabel bhvNormalCap # 3DD8
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    callnative bhv_normal_cap_init
    begin_loop
        obj_set_int objIntangibleTimer, 0
        callnative bhv_normal_cap_loop
    end_loop

glabel bhvVanishCap # 3DFC
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    callnative bhv_vanish_cap_init
    begin_loop
        callnative bhv_wing_vanish_cap_loop
    end_loop

glabel bhvStar # 3E1C
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    callnative bhv_init_room
    callnative bhv_collect_star_init
    begin_loop
        callnative bhv_collect_star_loop
    end_loop

glabel bhvStarSpawnCoordinates # 3E44
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    callnative bhv_collect_star_init
    callnative bhv_star_spawn_init
    begin_loop
        callnative bhv_star_spawn_loop
    end_loop

glabel bhvHiddenRedCoinStar # 3E6C
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, (OBJ_FLAG_PERSISTENT_RESPAWN | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    callnative bhv_hidden_red_coin_star_init
    begin_loop
        callnative bhv_hidden_red_coin_star_loop
    end_loop

glabel bhvRedCoin # 3E8C
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    obj_set_int objIntangibleTimer, 0
    obj_set_int objAnimState, -1
    callnative bhv_init_room
    callnative bhv_red_coin_init
    begin_loop
        callnative bhv_red_coin_loop
        obj_add_int objAnimState, 1
    end_loop

glabel bhvBowserCourseRedCoinStar # 3EC4
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, (OBJ_FLAG_PERSISTENT_RESPAWN | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    begin_loop
        callnative bhv_bowser_course_red_coin_star_loop
    end_loop

glabel bhvHiddenStar # 3EDC
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, (OBJ_FLAG_PERSISTENT_RESPAWN | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    callnative bhv_hidden_star_init
    begin_loop
        callnative bhv_hidden_star_loop
    end_loop

glabel bhvHiddenStarTrigger # 3EFC
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    set_hitbox 0x0064, 0x0064
    obj_set_int objIntangibleTimer, 0
    begin_loop
        callnative bhv_hidden_star_trigger_loop
    end_loop

glabel bhvTtmRollingLog # 3F20
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data ttm_seg7_collision_pitoune_2
    obj_set_pos
    obj_set_float objCollisionDistance, 0x07D0
    callnative bhv_ttm_rolling_log_init
    begin_loop
        callnative bhv_rolling_log_loop
        callnative load_object_collision_model
    end_loop

glabel bhvLllVolcanoFallingTrap # 3F58
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data lll_seg7_collision_falling_wall
    obj_set_pos
    begin_loop
        callnative bhvLllVolcanoFallingTrap_loop
        callnative load_object_collision_model
    end_loop

glabel bhvLllRollingLog # 3F84
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data lll_seg7_collision_pitoune
    obj_set_pos
    obj_set_float objCollisionDistance, 0x07D0
    callnative bhv_lll_rolling_log_init
    begin_loop
        callnative bhv_rolling_log_loop
        callnative load_object_collision_model
    end_loop

glabel bhv1upWalking # 3FBC
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    collision_sphere 0x001E, 0x001E, 0x0000
    obj_set_float objGraphYOffset, 30
    callnative bhv_1up_common_init
    begin_loop
        callnative bhv_1up_walking_loop
    end_loop

glabel bhv1upRunningAway # 3FF0
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    collision_sphere 0x001E, 0x001E, 0x0000
    obj_set_float objGraphYOffset, 30
    callnative bhv_1up_common_init
    begin_loop
        callnative bhv_1up_running_away_loop
    end_loop

glabel bhv1upSliding # 4024
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    collision_sphere 0x001E, 0x001E, 0x0000
    obj_set_float objGraphYOffset, 30
    callnative bhv_1up_common_init
    begin_loop
        obj_set_int objIntangibleTimer, 0
        callnative bhv_1up_sliding_loop
    end_loop

glabel bhv1Up # 405C
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    collision_sphere 0x001E, 0x001E, 0x0000
    obj_set_float objGraphYOffset, 30
    callnative bhv_1up_init
    begin_loop
        obj_set_int objIntangibleTimer, 0
        callnative bhv_1up_loop
    end_loop

glabel bhv1upJumpOnApproach # 4094
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    collision_sphere 0x001E, 0x001E, 0x0000
    obj_set_float objGraphYOffset, 30
    callnative bhv_1up_common_init
    begin_loop
        obj_set_int objIntangibleTimer, 0
        callnative bhv_1up_jump_on_approach_loop
    end_loop

glabel bhvHidden1up # 40CC
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    collision_sphere 0x001E, 0x001E, 0x0000
    obj_set_float objGraphYOffset, 30
    callnative bhv_1up_common_init
    begin_loop
        obj_set_int objIntangibleTimer, 0
        callnative bhv_1up_hidden_loop
    end_loop

glabel bhvHidden1upTrigger # 4104
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    set_hitbox 0x0064, 0x0064
    obj_set_int objIntangibleTimer, 0
    begin_loop
        callnative bhv_1up_hidden_trigger_loop
    end_loop

glabel bhvHidden1upInPole # 4128
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    collision_sphere 0x001E, 0x001E, 0x0000
    obj_set_float objGraphYOffset, 30
    callnative bhv_1up_common_init
    begin_loop
        obj_set_int objIntangibleTimer, 0
        callnative bhv_1up_hidden_in_pole_loop
    end_loop

glabel bhvHidden1upInPoleTrigger # 4160
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    set_hitbox 0x0064, 0x0064
    obj_set_int objIntangibleTimer, 0
    begin_loop
        callnative bhv_1up_hidden_in_pole_trigger_loop
    end_loop

glabel bhvHidden1upInPoleSpawner # 4184
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    begin_loop
        callnative bhv_1up_hidden_in_pole_spawner_loop
    end_loop

glabel bhvControllablePlatform # 419C
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_0800 | OBJ_FLAG_0020 | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data hmc_seg7_collision_controllable_platform
    obj_set_pos
    callnative bhv_controllable_platform_init
    begin_loop
        callnative bhv_controllable_platform_loop
        callnative load_object_collision_model
    end_loop

glabel bhvControllablePlatformSub # 41D0
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data hmc_seg7_collision_controllable_platform_sub
    begin_loop
        callnative bhv_controllable_platform_sub_loop
        callnative load_object_collision_model
    end_loop

glabel bhvBreakableBoxSmall # 41F8
    begin OBJ_LIST_DESTRUCTIVE
    obj_or_int objFlags, (OBJ_FLAG_HOLDABLE | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    drop_floor
    obj_set_pos
    callnative bhv_breakable_box_small_init
    begin_loop
        obj_set_int objIntangibleTimer, 0
        callnative bhv_breakable_box_small_loop
    end_loop

glabel bhvSlidingSnowMound # 4224
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data sl_seg7_collision_sliding_snow_mound
    obj_set_pos
    begin_loop
        callnative bhv_sliding_snow_mound_loop
        callnative load_object_collision_model
    end_loop

glabel bhvSnowMoundSpawn # 4250
    begin OBJ_LIST_DEFAULT
    begin_loop
        callnative bhv_snow_mound_spawn_loop
    end_loop

glabel bhvWdwSquareFloatingPlatform # 4264
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data wdw_seg7_collision_square_floating_platform
    obj_set_float objVarFC, 0x0040
    obj_set_pos
    begin_loop
        callnative bhv_floating_platform_loop
        callnative load_object_collision_model
    end_loop

glabel bhvWdwRectangularFloatingPlatform # 4294
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data wdw_seg7_collision_rect_floating_platform
    obj_set_float objVarFC, 0x0040
    obj_set_pos
    begin_loop
        callnative bhv_floating_platform_loop
        callnative load_object_collision_model
    end_loop

glabel bhvJrbFloatingPlatform # 42C4
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    collision_data jrb_seg7_collision_floating_platform
    obj_set_float objVarFC, 0x0040
    obj_set_pos
    begin_loop
        callnative bhv_floating_platform_loop
        callnative load_object_collision_model
    end_loop

glabel bhvArrowLift # 42F4
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data wdw_seg7_collision_arrow_lift
    obj_set_int_rand_rshift objVar100, 0x0001, 0x0020
    obj_set_pos
    begin_loop
        callnative bhv_arrow_lift_loop
        callnative load_object_collision_model
    end_loop

glabel bhvOrangeNumber # 4328
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    obj_set_pos
    callnative bhv_orange_number_init
    begin_loop
        callnative bhv_orange_number_loop
    end_loop

glabel bhvMantaRay # 4350
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_0010 | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, manta_seg5_anims_05008EB4
    animate 0x00
    callnative bhv_manta_ray_init
    begin_loop
        obj_set_int objIntangibleTimer, 0
        callnative bhv_manta_ray_loop
    end_loop

glabel bhvFallingPillar # 4380
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_pos
    callnative bhv_falling_pillar_init
    begin_loop
        callnative bhv_falling_pillar_loop
    end_loop

glabel bhvFallingPillarHitbox # 43A4
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_pos
    begin_loop
        callnative bhv_falling_pillar_hitbox_loop
    end_loop

glabel bhvPillarBase # 43C0
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data jrb_seg7_collision_pillar_base
    begin_loop
        callnative load_object_collision_model
    end_loop

glabel bhvJrbFloatingBox # 43E0
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    collision_data jrb_seg7_collision_floating_box
    obj_set_pos
    begin_loop
        callnative bhv_jrb_floating_box_loop
        callnative load_object_collision_model
    end_loop

glabel bhvDecorativePendulum # 440C
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    callnative bhv_decorative_pendulum_init
    begin_loop
        callnative bhv_decorative_pendulum_loop
    end_loop

glabel bhvTreasureChestsShip # 442C
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    drop_floor
    callnative bhv_treasure_chest_ship_init
    begin_loop
        callnative bhv_treasure_chest_ship_loop
    end_loop

glabel bhvTreasureChestsJrb # 4450
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    drop_floor
    callnative bhv_treasure_chest_jrb_init
    begin_loop
        callnative bhv_treasure_chest_jrb_loop
    end_loop

glabel bhvTreasureChests # 4474
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    drop_floor
    callnative bhv_treasure_chest_init
    begin_loop
        callnative bhv_treasure_chest_loop
    end_loop

glabel bhvTreasureChestBottom # 4498
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    drop_floor
    callnative bhv_treasure_chest_bottom_init
    obj_set_int objIntangibleTimer, -1
    begin_loop
        callnative bhv_treasure_chest_bottom_loop
    end_loop

glabel bhvTreasureChestTop # 44C0
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_pos
    begin_loop
        callnative bhv_treasure_chest_top_loop
    end_loop

glabel bhvMips # 44DC
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_HOLDABLE | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, mips_seg6_anims_06015634
    obj_set_int objInteractType, 0x02
    drop_floor
    set_hitbox 0x0032, 0x004B
    obj_set_int objIntangibleTimer, 0
    callnative bhv_mips_init
    begin_loop
        callnative bhv_mips_loop
    end_loop

glabel bhvYoshi # 4518
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, yoshi_seg5_anims_05024100
    interact_type INTERACT_TEXT
    drop_floor
    set_hitbox 0x00A0, 0x0096
    animate 0x00
    obj_set_pos
    callnative bhv_yoshi_init
    begin_loop
        obj_set_int objIntangibleTimer, 0
        callnative BehYoshiLoop
    end_loop

glabel bhvKoopa # 4560
    begin OBJ_LIST_PUSHABLE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    drop_floor
    obj_set_int32 objAnimations, koopa_seg6_anims_06011364
    animate 0x09
    obj_set_pos
    gravity 0x0032, 0xFE70, 0x0000, 0x0000, 0x03E8, 0x00C8, 0x0000, 0x0000
    scale 150
    obj_set_float objVarF4, 1
    callnative bhv_koopa_init
    begin_loop
        callnative bhv_koopa_update
    end_loop

glabel bhvKoopaRaceEndpoint # 45B0
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    drop_floor
    obj_child_param 0x0000, MODEL_KOOPA_FLAG, bhvKoopaFlag
    begin_loop
        callnative bhv_koopa_race_endpoint_update
    end_loop

glabel bhvKoopaFlag # 45D8
    begin OBJ_LIST_POLELIKE
    interact_type INTERACT_POLE
    set_hitbox 0x0050, 0x02BC
    obj_set_int objIntangibleTimer, 0
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    drop_floor
    obj_set_int32 objAnimations, koopa_flag_seg6_anims_06001028
    animate 0x00
    begin_loop
        callnative BehClimbDetectLoop
    end_loop

glabel bhvPokey # 4614
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    drop_floor
    obj_set_pos
    gravity 0x003C, 0xFE70, 0x0000, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    begin_loop
        callnative bhv_pokey_update
    end_loop

glabel bhvPokeyBodyPart # 4648
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    gravity 0x003C, 0xFE70, 0x0000, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    billboard
    begin_loop
        callnative bhv_pokey_body_part_update
    end_loop

glabel bhvSwoop # 4678
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, swoop_seg6_anims_060070D0
    obj_set_pos
    gravity 0x0032, 0x0000, 0xFFCE, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
    callnative bhv_init_room
    scale 0
    begin_loop
        callnative bhv_swoop_update
    end_loop

glabel bhvFlyGuy # 46BC
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, flyguy_seg8_anims_08011A64
    animate 0x00
    obj_set_pos
    gravity 0x0032, 0x0000, 0x0000, 0x0000, 0x03E8, 0x0258, 0x0000, 0x0000
    callnative bhv_init_room
    obj_set_int objInteractSubtype, 0x0080
    obj_set_float objGraphYOffset, 30
    scale 150
    begin_loop
        callnative bhv_fly_guy_update
    end_loop

glabel bhvGoomba # 470C
    begin OBJ_LIST_PUSHABLE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    drop_floor
    obj_set_int32 objAnimations, goomba_seg8_anims_0801DA4C
    obj_set_pos
    gravity 0x0028, 0xFE70, 0xFFCE, 0x03E8, 0x03E8, 0x0000, 0x0000, 0x0000
    callnative bhv_goomba_init
    begin_loop
        callnative bhv_goomba_update
    end_loop

glabel bhvGoombaTripletSpawner # 4750
    begin OBJ_LIST_PUSHABLE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    drop_floor
    begin_loop
        callnative bhv_goomba_triplet_spawner_update
    end_loop

glabel bhvChainChomp # 476C
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    drop_floor
    obj_set_int32 objAnimations, chain_chomp_seg6_anims_06025178
    animate 0x00
    gravity 0x0000, 0xFE70, 0xFFCE, 0x0000, 0x03E8, 0x00C8, 0x0000, 0x0000
    unhide
    obj_set_pos
    obj_set_float objGraphYOffset, 0x00F0
    scale 200
    obj_child_param 0x0000, MODEL_WOODEN_POST, bhvWoodenPost
    begin_loop
        callnative bhv_chain_chomp_update
    end_loop

glabel bhvChainChompChainPart # 47C4
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    gravity 0x0000, 0xFE70, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    obj_set_float objGraphYOffset, 0x0028
    scale 200
    begin_loop
        callnative bhv_chain_chomp_chain_part_update
    end_loop

glabel bhvWoodenPost # 47FC
    begin OBJ_LIST_SURFACE
    collision_data poundable_pole_collision_06002490
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    gravity 0x0000, 0xFE70, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    obj_set_int objNumLootCoins, 5
    drop_floor
    obj_set_pos
    scale 50
    begin_loop
        callnative bhv_wooden_post_update
        callnative load_object_collision_model
    end_loop

glabel bhvChainChompGate # 4848
    begin OBJ_LIST_SURFACE
    collision_data bob_seg7_collision_chain_chomp_gate
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    callnative bhv_chain_chomp_gate_init
    begin_loop
        callnative bhv_chain_chomp_gate_update
        callnative load_object_collision_model
    end_loop

glabel bhvWiggler # 4878
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    drop_floor
    obj_set_int32 objAnimations, wiggler_seg5_anims_0500EC8C
    obj_set_pos
    gravity 0x003C, 0xFE70, 0x0000, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    unhide
    scale 400
    obj_set_float objVarF4, 5000
    begin_loop
        callnative bhv_wiggler_update
    end_loop

glabel bhvWigglerBodyPart # 48C0
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_int32 objAnimations, wiggler_seg5_anims_0500C874
    gravity 0x0000, 0xFE70, 0x0000, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    scale 400
    begin_loop
        callnative bhv_wiggler_body_part_update
    end_loop

glabel bhvEnemyLakitu # 48F8
    begin OBJ_LIST_PUSHABLE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, lakitu_enemy_seg5_anims_050144D4
    animate 0x00
    obj_set_pos
    gravity 0x0028, 0x0000, 0xFFCE, 0x0000, 0x0000, 0x00C8, 0x0000, 0x0000
    begin_loop
        callnative bhv_enemy_lakitu_update
    end_loop

glabel bhvCameraLakitu # 4934
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, lakitu_seg6_anims_060058F8
    animate 0x00
    callnative bhv_init_room
    callnative bhv_camera_lakitu_init
    begin_loop
        callnative bhv_camera_lakitu_update
    end_loop

glabel bhvCloud # 4968
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    obj_set_pos
    obj_set_int objOpacity, 0x00F0
    begin_loop
        callnative bhv_cloud_update
    end_loop

glabel bhvCloudPart # 498C
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_int objOpacity, 0x00F0
    begin_loop
        callnative bhv_cloud_part_update
    end_loop

glabel bhvSpiny # 49A8
    begin OBJ_LIST_PUSHABLE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, spiny_seg5_anims_05016EAC
    animate 0x00
    gravity 0x0028, 0xFE70, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    begin_loop
        callnative bhv_spiny_update
    end_loop

glabel bhvMontyMole # 49E0
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    drop_floor
    obj_set_int32 objAnimations, monty_mole_seg5_anims_05007248
    animate 0x03
    gravity 0x001E, 0x0000, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    unhide
    obj_set_int objIntangibleTimer, -1
    obj_set_float objGraphYOffset, 0xFFC4
    scale 150
    delay 1
    callnative bhv_monty_mole_init
    begin_loop
        callnative bhv_monty_mole_update
    end_loop

glabel bhvMontyMoleHole # 4A38
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    drop_floor
    scale 150
    begin_loop
        callnative bhv_monty_mole_hole_update
    end_loop

glabel bhvMontyMoleRock # 4A58
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    gravity 0x001E, 0xFE70, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    obj_set_float objGraphYOffset, 0x000A
    scale 200
    begin_loop
        callnative bhv_monty_mole_rock_update
    end_loop

glabel bhvPlatformOnTrack # 4A90
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    gravity 0x0032, 0xFF9C, 0xFFCE, 0x0064, 0x03E8, 0x00C8, 0x0000, 0x0000
    callnative bhv_init_room
    callnative bhv_platform_on_track_init
    begin_loop
        callnative bhv_platform_on_track_update
        callnative load_object_collision_model
    end_loop

glabel bhvTrackBall # 4AD4
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    callnative bhv_init_room
    scale 15
    begin_loop
        callnative bhv_track_ball_update
    end_loop

glabel bhvSeesawPlatform # 4AFC
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    callnative bhv_seesaw_platform_init
    begin_loop
        callnative bhv_seesaw_platform_update
        callnative load_object_collision_model
    end_loop

glabel bhvFerrisWheelAxle # 4B24
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_add_int objMoveAngleYaw, 0x4000
    callnative bhv_ferris_wheel_axle_init
    begin_loop
        obj_add_int objFaceAngleRoll, 400
        callnative load_object_collision_model
    end_loop

glabel bhvFerrisWheelPlatform # 4B4C
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    begin_loop
        callnative bhv_ferris_wheel_platform_update
        callnative load_object_collision_model
    end_loop

glabel bhvWaterBombSpawner # 4B6C
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    drop_floor
    begin_loop
        callnative bhv_water_bomb_spawner_update
    end_loop

glabel bhvWaterBomb # 4B88
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    gravity 0x0078, 0xFE70, 0x0000, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    begin_loop
        callnative bhv_water_bomb_update
    end_loop

glabel bhvWaterBombShadow # 4BB4
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    scale 150
    begin_loop
        callnative bhv_water_bomb_shadow_update
    end_loop

glabel bhvTTCRotatingSolid # 4BD0
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_pos
    obj_set_float objCollisionDistance, 0x01C2
    callnative bhv_ttc_rotating_solid_init
    obj_set_int objVarF4, 1
    begin_loop
        callnative bhv_ttc_rotating_solid_update
        callnative load_object_collision_model
    end_loop

glabel bhvTTCPendulum # 4C04
    begin OBJ_LIST_SURFACE
    collision_data ttc_seg7_collision_clock_pendulum
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_float objCollisionDistance, 0x05DC
    callnative bhv_ttc_pendulum_init
    obj_set_float objVarF4, 1
    begin_loop
        callnative bhv_ttc_pendulum_update
        callnative load_object_collision_model
    end_loop

glabel bhvTTCTreadmill # 4C3C
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_float objCollisionDistance, 0x02EE
    callnative bhv_ttc_treadmill_init
    delay 1
    begin_loop
        callnative bhv_ttc_treadmill_update
        callnative obj_compute_vel_xz
        callnative load_object_collision_model
    end_loop

glabel bhvTTCMovingBar # 4C74
    begin OBJ_LIST_SURFACE
    collision_data ttc_seg7_collision_sliding_surface
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_pos
    obj_set_float objCollisionDistance, 0x0226
    callnative bhv_ttc_moving_bar_init
    begin_loop
        callnative bhv_ttc_moving_bar_update
        callnative load_object_collision_model
    end_loop

glabel bhvTTCCog # 4CAC
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_float objCollisionDistance, 0x0190
    callnative bhv_ttc_cog_init
    begin_loop
        callnative bhv_ttc_cog_update
        callnative load_object_collision_model
    end_loop

glabel bhvTTCPitBlock # 4CD8
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_pos
    obj_set_float objCollisionDistance, 0x015E
    callnative bhv_ttc_pit_block_init
    begin_loop
        callnative bhv_ttc_pit_block_update
        callnative load_object_collision_model
    end_loop

glabel bhvTTCElevator # 4D08
    begin OBJ_LIST_SURFACE
    collision_data ttc_seg7_collision_clock_platform
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_pos
    obj_set_float objCollisionDistance, 0x0190
    callnative bhv_ttc_elevator_init
    obj_set_float objVarF4, 1
    begin_loop
        callnative bhv_ttc_elevator_update
        callnative load_object_collision_model
    end_loop

glabel bhvTTC2DRotator # 4D44
    begin OBJ_LIST_SURFACE
    collision_data ttc_seg7_collision_clock_main_rotation
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_float objCollisionDistance, 0x0708
    callnative bhv_ttc_2d_rotator_init
    begin_loop
        callnative bhv_ttc_2d_rotator_update
    end_loop

glabel bhvTTCSpinner # 4D70
    begin OBJ_LIST_SURFACE
    collision_data ttc_seg7_collision_rotating_clock_platform2
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_float objCollisionDistance, 0x01C2
    begin_loop
        callnative bhv_ttc_spinner_update
        callnative load_object_collision_model
    end_loop

glabel bhvMrBlizzard # 4D9C
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    drop_floor
    obj_set_int32 objAnimations, snowman_seg5_anims_0500D118
    animate 0x00
    obj_set_pos
    gravity 0x001E, 0xFE70, 0x0000, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    callnative bhv_mr_blizzard_init
    obj_set_float objVarF4, 1
    begin_loop
        callnative bhv_mr_blizzard_update
    end_loop

glabel bhvMrBlizzardSnowball # 4DE8
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    gravity 0x001E, 0xFED4, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    scale 200
    obj_add_int objMoveAngleYaw, -0x5B58
    obj_set_float objForwardVel, 5
    obj_set_float objVelY, -1
    obj_set_float objGraphYOffset, 10
    begin_loop
        callnative bhv_mr_blizzard_snowball
    end_loop

glabel bhvSlidingPlatform2 # 4E2C
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_pos
    callnative bhv_sliding_plat_2_init
    begin_loop
        callnative bhv_sliding_plat_2_loop
        callnative load_object_collision_model
    end_loop

glabel bhvOctagonalPlatformRotating # 4E58
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    callnative bhv_rotating_octagonal_plat_init
    begin_loop
        callnative bhv_rotating_octagonal_plat_loop
        callnative load_object_collision_model
    end_loop

glabel bhvAnimatesOnFloorSwitchPress # 4E80
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_float objCollisionDistance, 0x1F40
    callnative bhv_animates_on_floor_switch_press_init
    begin_loop
        callnative bhv_animates_on_floor_switch_press_loop
        callnative load_object_collision_model
    end_loop

glabel bhvActivatedBackAndForthPlatform # 4EAC
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_pos
    callnative bhv_activated_back_and_forth_platform_init
    begin_loop
        callnative bhv_activated_back_and_forth_platform_update
        callnative load_object_collision_model
    end_loop

glabel bhvRecoveryHeart # 4ED8
    begin OBJ_LIST_LEVEL
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    begin_loop
        callnative bhv_recovery_heart_loop
    end_loop

glabel bhvWaterBombCannon # 4EF0
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    begin_loop
        callnative bhv_water_bomb_cannon_loop
    end_loop

glabel bhvCannonBarrelBubbles # 4F08
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    begin_loop
        callnative bhv_bubble_cannon_barrel_loop
    end_loop

glabel bhvUnagi # 4F20
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, unagi_seg5_anims_05012824
    animate 0x06
    obj_set_pos
    scale 300
    obj_set_float objDrawingDistance, 0x1770
    callnative bhv_unagi_init
    begin_loop
        callnative bhv_unagi_loop
    end_loop

glabel bhvUnagiSubobject # 4F58
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    begin_loop
        callnative bhv_unagi_subobject_loop
    end_loop

glabel bhvDorrie # 4F70
    begin OBJ_LIST_SURFACE
    collision_data dorrie_seg6_collision_0600F644
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, dorrie_seg6_anims_0600F638
    obj_set_pos
    obj_set_float objCollisionDistance, 0x7530
    obj_add_float objPosX, 2000
    callnative bhv_init_room
    begin_loop
        callnative bhv_dorrie_update
        callnative load_object_collision_model
    end_loop

glabel bhvHauntedChair # 4FB4
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    drop_floor
    obj_set_int32 objAnimations, chair_seg5_anims_05005784
    animate 0x00
    gravity 0x0028, 0x0000, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    obj_set_pos
    callnative bhv_init_room
    callnative bhv_haunted_chair_init
    begin_loop
        callnative bhv_haunted_chair_loop
    end_loop

glabel bhvMadPiano # 5004
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    drop_floor
    obj_set_int32 objAnimations, mad_piano_seg5_anims_05009B14
    gravity 0x0028, 0x0000, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    obj_set_pos
    obj_add_int objMoveAngleYaw, 0x4000
    callnative bhv_init_room
    begin_loop
        callnative bhv_mad_piano_update
    end_loop

glabel bhvFlyingBookend # 504C
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, bookend_seg5_anims_05002540
    animate 0x00
    gravity 0x003C, 0x0000, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    obj_set_int objMoveFlags, 0
    scale 70
    callnative bhv_init_room
    begin_loop
        callnative bhv_flying_bookend_loop
    end_loop

glabel bhvBookendSpawn # 5094
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    callnative bhv_init_room
    begin_loop
        callnative bhv_bookend_spawn_loop
    end_loop

glabel bhvHauntedBookshelfManager # 50B4
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    callnative bhv_init_room
    begin_loop
        callnative bhv_haunted_bookshelf_manager_loop
    end_loop

glabel bhvBookSwitch # 50D4
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_pos
    obj_set_float objGraphYOffset, 30
    obj_add_int objMoveAngleYaw, 0x4000
    callnative bhv_init_room
    begin_loop
        callnative bhv_book_switch_loop
    end_loop

glabel bhvFirePiranhaPlant # 5100
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    drop_floor
    obj_set_int32 objAnimations, piranha_plant_seg6_anims_0601C31C
    animate 0x00
    obj_set_pos
    unhide
    callnative bhv_fire_piranha_plant_init
    begin_loop
        callnative bhv_fire_piranha_plant_update
    end_loop

glabel bhvSmallPiranhaFlame # 5138
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    gravity 0x001E, 0x0000, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    begin_loop
        callnative bhv_small_piranha_flame_loop
        obj_add_int objAnimState, 1
    end_loop

glabel bhvFireSpitter # 516C
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    scale 40
    begin_loop
        callnative bhv_fire_spitter_update
    end_loop

glabel bhvFlyguyFlame # 518C
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    billboard
    gravity 0x0000, 0x00C8, 0x0000, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    begin_loop
        callnative bhv_fly_guy_flame_loop
        obj_add_int objAnimState, 1
    end_loop

glabel bhvSnufit # 51C0
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_pos
    gravity 0x001E, 0x0000, 0xFFCE, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
    callnative bhv_init_room
    begin_loop
        obj_set_int objVarF4, 0
        callnative bhv_snufit_loop
    end_loop

glabel bhvSnufitBalls # 51FC
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    billboard
    gravity 0x000A, 0x0000, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    callnative bhv_init_room
    obj_set_float objGraphYOffset, 0x000A
    scale 10
    begin_loop
        callnative bhv_snufit_balls_loop
    end_loop

glabel bhvHorizontalGrindel # 523C
    begin OBJ_LIST_SURFACE
    collision_data ssl_seg7_collision_grindel
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    drop_floor
    obj_set_pos
    gravity 0x0028, 0xFE70, 0x0000, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    scale 90
    callnative bhv_horizontal_grindel_init
    begin_loop
        callnative obj_update_floor_and_walls
        callnative bhv_horizontal_grindel_update
        callnative load_object_collision_model
    end_loop

glabel bhvEyerokBoss # 5294
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_pos
    begin_loop
        callnative bhv_eyerok_boss_loop
    end_loop

glabel bhvEyerokHand # 52B0
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, eyerok_seg5_anims_050116E4
    animate 0x06
    gravity 0x0096, 0x0000, 0x0000, 0x0000, 0x03E8, 0x00C8, 0x0000, 0x0000
    obj_set_pos
    obj_set_int objAnimState, 3
    begin_loop
        callnative bhv_eyerok_hand_loop
    end_loop

glabel bhvKlepto # 52F0
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, klepto_seg5_anims_05008CFC
    animate 0x00
    gravity 0x0064, 0x0000, 0xFFEC, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000
    obj_set_pos
    callnative bhv_klepto_init
    begin_loop
        callnative bhv_klepto_update
    end_loop

glabel bhvBird # 5334
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, birds_seg5_anims_050009E8
    animate 0x00
    unhide
    scale 70
    begin_loop
        callnative bhv_bird_update
    end_loop

glabel bhvRacingPenguin # 5360
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, penguin_seg5_anims_05008B74
    animate 0x03
    gravity 0x012C, 0xFCE0, 0xFFFB, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
    scale 400
    callnative bhv_racing_penguin_init
    begin_loop
        callnative bhv_racing_penguin_update
    end_loop

glabel bhvPenguinRaceFinishLine # 53A4
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    begin_loop
        callnative bhv_penguin_race_finish_line_update
    end_loop

glabel bhvPenguinRaceShortcutCheck # 53BC
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    begin_loop
        callnative bhv_penguin_race_shortcut_check_update
    end_loop

glabel bhvCoffinManager # 53D4
    begin OBJ_LIST_SURFACE
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    callnative bhv_init_room
    begin_loop
        callnative bhv_coffin_manager_loop
    end_loop

glabel bhvCoffin # 53F4
    begin OBJ_LIST_SURFACE
    collision_data bbh_seg7_collision_coffin
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_pos
    callnative bhv_init_room
    begin_loop
        callnative bhv_coffin_loop
    end_loop

glabel bhvClamShell # 5420
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    drop_floor
    obj_set_int32 objAnimations, clam_shell_seg5_anims_05001744
    obj_set_float objGraphYOffset, 0x000A
    begin_loop
        callnative bhv_clam_loop
    end_loop

glabel bhvSkeeter # 5448
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, skeeter_seg6_anims_06007DE0
    obj_set_pos
    gravity 0x00B4, 0xFE70, 0xFFCE, 0x03E8, 0x03E8, 0x04B0, 0x0000, 0x0000
    begin_loop
        callnative bhv_skeeter_update
    end_loop

glabel bhvSkeeterWave # 5480
    begin OBJ_LIST_UNIMPORTANT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    begin_loop
        callnative bhv_skeeter_wave_update
    end_loop

glabel bhvSwingPlatform # 5498
    begin OBJ_LIST_SURFACE
    collision_data rr_seg7_collision_pendulum
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_float objCollisionDistance, 0x07D0
    callnative bhv_swing_platform_init
    begin_loop
        callnative bhv_swing_platform_update
        callnative load_object_collision_model
    end_loop

glabel bhvDonutPlatformSpawner # 54CC
    begin OBJ_LIST_SPAWNER
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    begin_loop
        callnative bhv_donut_platform_spawner_update
    end_loop

glabel bhvDonutPlatform # 54E4
    begin OBJ_LIST_SURFACE
    collision_data rr_seg7_collision_donut_platform
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_pos
    begin_loop
        callnative bhv_donut_platform_update
    end_loop

glabel bhvDDDPole # 5508
    begin OBJ_LIST_POLELIKE
    interact_type INTERACT_POLE
    set_hitbox 0x0050, 0x0320
    obj_set_int objIntangibleTimer, 0
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_pos
    callnative bhv_ddd_pole_init
    obj_set_float objVarF4, 10
    begin_loop
        callnative bhv_ddd_pole_update
        callnative BehClimbDetectLoop
    end_loop

glabel bhvRedCoinStarMarker # 554C
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    drop_floor
    scale 150
    obj_set_int objFaceAnglePitch, 0x4000
    obj_add_float objPosY, 60
    callnative bhv_red_coin_star_marker_init
    begin_loop
        obj_add_int objFaceAngleYaw, 0x100
    end_loop

glabel bhvTripletButterfly # 5578
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, butterfly_seg3_anims_030056B0
    animate 0x00
    unhide
    obj_set_pos
    gravity 0x0000, 0x0000, 0x0000, 0x0000, 0x03E8, 0x00C8, 0x0000, 0x0000
    obj_set_float objVarF4, 1
    begin_loop
        callnative bhv_triplet_butterfly_update
    end_loop

glabel bhvBubba # 55BC
    begin OBJ_LIST_GENACTOR
    obj_or_int objFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_pos
    gravity 0x00C8, 0xFE70, 0xFFCE, 0x03E8, 0x03E8, 0x0000, 0x0000, 0x0000
    scale 50
    begin_loop
        callnative bhv_bubba_loop
    end_loop

glabel bhvBeginningLakitu # 55F0
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_int32 objAnimations, lakitu_seg6_anims_060058F8
    animate 0x00
    obj_set_float objOpacity, 0x0000
    begin_loop
        callnative bhv_intro_lakitu_loop
    end_loop

glabel bhvBeginningPeach # 5618
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj_set_int32 objAnimations, peach_seg5_anims_0501C41C
    animate 0x00
    begin_loop
        callnative bhv_intro_peach_loop
    end_loop

glabel bhvEndBirds1 # 563C
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_0010 | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, birds_seg5_anims_050009E8
    animate 0x00
    begin_loop
        callnative bhv_end_birds_1_loop
    end_loop

glabel bhvEndBirds2 # 5660
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, (OBJ_FLAG_0010 | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)
    obj_set_int32 objAnimations, birds_seg5_anims_050009E8
    animate 0x00
    begin_loop
        callnative bhv_end_birds_2_loop
    end_loop

glabel bhvIntroScene # 5684
    begin OBJ_LIST_DEFAULT
    obj_or_int objFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    begin_loop
        callnative bhv_intro_scene_loop
    end_loop

    .align 4
glabel behavior_data_end
