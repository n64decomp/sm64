#define OBJECT_FIELDS_INDEX_DIRECTLY

#include "sm64.h"

#include "object_constants.h"
#include "game/object_list_processor.h"
#include "game/interaction.h"
#include "game/behavior_actions.h"
#include "game/mario_actions_cutscene.h"
#include "game/mario_misc.h"
#include "game/object_helpers.h"
#include "game/object_helpers2.h"
#include "game/debug.h"
#include "menu/file_select.h"
#include "engine/surface_load.h"

#include "actors/common0.h"
#include "actors/common1.h"
#include "actors/group1.h"
#include "actors/group2.h"
#include "actors/group3.h"
#include "actors/group4.h"
#include "actors/group5.h"
#include "actors/group6.h"
#include "actors/group7.h"
#include "actors/group8.h"
#include "actors/group9.h"
#include "actors/group10.h"
#include "actors/group11.h"
#include "actors/group12.h"
#include "actors/group13.h"
#include "actors/group14.h"
#include "actors/group15.h"
#include "actors/group16.h"
#include "actors/group17.h"
#include "levels/bbh/header.h"
#include "levels/castle_inside/header.h"
#include "levels/hmc/header.h"
#include "levels/ssl/header.h"
#include "levels/bob/header.h"
#include "levels/sl/header.h"
#include "levels/wdw/header.h"
#include "levels/jrb/header.h"
#include "levels/thi/header.h"
#include "levels/ttc/header.h"
#include "levels/rr/header.h"
#include "levels/castle_grounds/header.h"
#include "levels/bitdw/header.h"
#include "levels/lll/header.h"
#include "levels/sa/header.h"
#include "levels/bitfs/header.h"
#include "levels/ddd/header.h"
#include "levels/wf/header.h"
#include "levels/bowser_2/header.h"
#include "levels/ttm/header.h"

#include "make_const_nonconst.h"
#include "behavior_data.h"

#define BC_B(a) _SHIFTL(a, 24, 8)
#define BC_BB(a, b) (_SHIFTL(a, 24, 8) | _SHIFTL(b, 16, 8))
#define BC_BBBB(a, b, c, d) (_SHIFTL(a, 24, 8) | _SHIFTL(b, 16, 8) | _SHIFTL(c, 8, 8) | _SHIFTL(d, 0, 8))
#define BC_BBH(a, b, c) (_SHIFTL(a, 24, 8) | _SHIFTL(b, 16, 8) | _SHIFTL(c, 0, 16))
#define BC_B0H(a, b) (_SHIFTL(a, 24, 8) | _SHIFTL(b, 0, 16))
#define BC_H(a) _SHIFTL(a, 16, 16)
#define BC_HH(a, b) (_SHIFTL(a, 16, 16) | _SHIFTL(b, 0, 16))
#define BC_W(a) ((uintptr_t)(u32)(a))
#define BC_PTR(a) ((uintptr_t)(a))

// TODO: Go through these and rename a bunch of them, some of these names are really bad.

#define BEGIN(arg1) \
    BC_BB(0x00, arg1)

#define DELAY(frames) \
    BC_B0H(0x01, frames)

#define CALL(addr) \
    BC_B(0x02), \
    BC_PTR(addr)

#define RETURN() \
    BC_B(0x03)

#define GOTO(addr) \
    BC_B(0x04), \
    BC_PTR(addr)

#define BEGIN_REPEAT(times) \
    BC_B0H(0x05, times)

#define END_REPEAT() \
    BC_B(0x06)

#define END_REPEAT_NOBREAK() \
    BC_B(0x07)

#define BEGIN_LOOP() \
    BC_B(0x08)

#define END_LOOP() \
    BC_B(0x09)

#define BREAK() \
    BC_B(0x0A)

#define CALLNATIVE(addr) \
    BC_B(0x0C), \
    BC_PTR(addr)

#define OBJ_ADD_FLOAT(field, value) \
    BC_BBH(0x0D, field, value)

#define OBJ_SET_FLOAT(field, value) \
    BC_BBH(0x0E, field, value)

#define OBJ_ADD_INT(field, value) \
    BC_BBH(0x0F, field, value)

#define OBJ_SET_INT(field, value) \
    BC_BBH(0x10, field, value)

#define OBJ_OR_INT(field, value) \
    BC_BBH(0x11, field, value)

#define OBJ_BIT_CLEAR_INT(field, value) \
    BC_BBH(0x12, field, value)

#define OBJ_SET_INT_RAND_RSHIFT(field, min, rshift) \
    BC_BBH(0x13, field, min), \
    BC_H(rshift)

#define OBJ_SET_FLOAT_RAND(field, min, max) \
    BC_BBH(0x14, field, min), \
    BC_H(max)

#define OBJ_SET_INT_RAND(field, min, max) \
    BC_BBH(0x15, field, min), \
    BC_H(max)

#define OBJ_ADD_FLOAT_RAND(field, min, max) \
    BC_BBH(0x16, field, min), \
    BC_H(max)

#define OBJ_ADD_INT_RAND_RSHIFT(field, min, rshift) \
    BC_BBH(0x17, field, min), \
    BC_H(rshift)

#define GEO_LAYOUT(model_id) \
    BC_B0H(0x1B, model_id)

#define OBJ_CHILD(model_id, beh) \
    BC_B(0x1C), \
    BC_W(model_id), \
    BC_PTR(beh)

#define DEACTIVATE() \
    BC_B(0x1D)

#define DROP_FLOOR() \
    BC_B(0x1E)

#define OBJ_SUM_FLOAT(fieldDest, fieldSrc1, fieldSrc2) \
    BC_BBBB(0x1F, fieldDest, fieldSrc1, fieldSrc2)

#define OBJ_SUM_INT(fieldDest, fieldSrc1, fieldSrc2) \
    BC_BBBB(0x20, fieldDest, fieldSrc1, fieldSrc2)

#define BILLBOARD() \
    BC_B(0x21)

#define UNHIDE() \
    BC_B(0x22)

#define SET_HITBOX(radius, height) \
    BC_B(0x23), \
    BC_HH(radius, height)

#define DELAY_VAR(field) \
    BC_BB(0x25, field)

#define OBJ_SET_ANIMS(field, value) \
    BC_BB(0x27, field), \
    BC_PTR(value)

#define ANIMATE(animIndex) \
    BC_BB(0x28, animIndex)

#define OBJ_CHILD_PARAM(behParam, model_id, beh) \
    BC_B0H(0x29, behParam), \
    BC_W(model_id), \
    BC_PTR(beh)

#define COLLISION_DATA(addr) \
    BC_B(0x2A), \
    BC_PTR(addr)

#define COLLISION_SPHERE(radius, height, arg3) \
    BC_B(0x2B), \
    BC_HH(radius, height), \
    BC_H(arg3)

#define OBJ_SPAWN(model_id, beh) \
    BC_B(0x2C), \
    BC_W(model_id), \
    BC_PTR(beh)

#define OBJ_SET_POS() \
    BC_B(0x2D)

#define OBJ_SET_FLOAT2(arg1, arg2) \
    BC_B(0x2E), \
    BC_HH(arg1, arg2)

#define INTERACT_TYPE(type) \
    BC_B(0x2F), \
    BC_PTR(type)

#define GRAVITY(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8) \
    BC_B(0x30), \
    BC_HH(arg1, arg2), \
    BC_HH(arg3, arg4), \
    BC_HH(arg5, arg6), \
    BC_HH(arg7, arg8)

#define SCALE(percent) \
    BC_B0H(0x32, percent)

#define OBJ_BIT_CLEAR_INT32(field, value) \
    BC_BB(0x33, field), \
    BC_W(value)

#define TEXT_ANIM_RATE(field, arg2) \
    BC_BBH(0x34, field, arg2)

#define GRAPH_CLEAR() \
    BC_B(0x35)

#define SPAWN_ADDR(arg1) \
    BC_B(0x37), \
    BC_PTR(arg1)

// 0000
const BehaviorScript bhvStarDoor[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_SET_INT(oInteractType, 4),
    COLLISION_DATA(inside_castle_seg7_collision_star_door),
    OBJ_SET_INT(oInteractionSubtype, 32),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    SET_HITBOX(80, 100),
    OBJ_SET_POS(),
    OBJ_SET_FLOAT(oDrawingDistance, 20000),
    CALLNATIVE(bhv_door_init),
    OBJ_SET_INT(oIntangibleTimer, 0),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_star_door_loop),
        CALLNATIVE(bhv_star_door_loop_2),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 0054
const BehaviorScript bhvMrI[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_POS(),
    OBJ_CHILD(MODEL_MR_I_IRIS, bhvMrIBody),
    GEO_LAYOUT(MODEL_MR_I),
    BILLBOARD(),
    CALLNATIVE(bhv_init_room),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_mr_i_loop),
    END_LOOP(),
};

// 008C
const BehaviorScript bhvMrIBody[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    CALLNATIVE(bhv_init_room),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_mr_i_body_loop),
    END_LOOP(),
};

// 00AC
const BehaviorScript bhvMrIParticle[] = {
    BEGIN(OBJ_LIST_LEVEL),
    BILLBOARD(),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_INT(oIntangibleTimer, 0),
    SET_HITBOX(50, 50),
    OBJ_SET_INT(oDamageOrCoinValue, 1),
    OBJ_SET_INT(oInteractType, 8),
    GRAVITY(0x001E, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000),
    CALLNATIVE(bhv_init_room),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_mr_i_particle_loop),
    END_LOOP(),
};

// 00F8
const BehaviorScript bhvPurpleParticle[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    BILLBOARD(),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BEGIN_REPEAT(10),
        CALLNATIVE(bhv_piranha_particle_loop),
    END_REPEAT(),
    DEACTIVATE(),
};

// 0118
const BehaviorScript bhvGiantPole[] = {
    BEGIN(OBJ_LIST_POLELIKE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_INT(oInteractType, 0x40),
    SET_HITBOX(0x0050, 0x0834),
    OBJ_SET_POS(),
    OBJ_SET_INT(oIntangibleTimer, 0),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_giant_pole_loop),
    END_LOOP(),
};

// 0144
const BehaviorScript bhvPoleGrabbing[] = {
    BEGIN(OBJ_LIST_POLELIKE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_INT(oInteractType, 0x40),
    SET_HITBOX(0x0050, 0x05DC),
    CALLNATIVE(bhv_pole_init),
    OBJ_SET_INT(oIntangibleTimer, 0),
    BEGIN_LOOP(),
        CALLNATIVE(BehClimbDetectLoop),
    END_LOOP(),
};

// 0174
const BehaviorScript bhvThiHugeIslandTop[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(thi_seg7_collision_top_trap),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_thi_huge_island_top_loop),
    END_LOOP(),
};

// 0194
const BehaviorScript bhvThiTinyIslandTop[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_thi_tiny_island_top_loop),
    END_LOOP(),
};

// 01AC
const BehaviorScript bhvCapSwitchBase[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(capswitch_collision_05003448),
    BEGIN_LOOP(),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 01CC
const BehaviorScript bhvCapSwitch[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(capswitch_collision_050033D0),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_cap_switch_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 01F4
const BehaviorScript bhvKingBobomb[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, king_bobomb_seg5_anims_0500FE30),
    OBJ_SET_INT(oInteractType, 0x02),
    SET_HITBOX(0x0064, 0x0064),
    GRAVITY(0x001E, 0xFE70, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    OBJ_SET_INT(oIntangibleTimer, 0),
    DROP_FLOOR(),
    OBJ_SET_POS(),
    OBJ_SPAWN(MODEL_NONE, bhvBobombAnchorMario),
    OBJ_SET_INT(oHealth, 0x0003),
    OBJ_SET_INT(oDamageOrCoinValue, 1),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_king_bobomb_loop),
    END_LOOP(),
};

// 0254
const BehaviorScript bhvBobombAnchorMario[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    OBJ_SET_FLOAT(oParentRelativePosX, 0x0064),
    OBJ_SET_FLOAT(oParentRelativePosZ, 0x0096),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_bobomb_anchor_mario_loop),
    END_LOOP(),
};

// 0278
const BehaviorScript bhvBetaChestBottom[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    DROP_FLOOR(),
    CALLNATIVE(bhv_beta_chest_bottom_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_beta_chest_bottom_loop),
    END_LOOP(),
};

// 029C
const BehaviorScript bhvBetaChestLid[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_beta_chest_lid_loop),
    END_LOOP(),
};

// 02B8
const BehaviorScript bhvBubbleMario[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    GRAPH_CLEAR(),
    OBJ_SET_INT_RAND(oWaterObjUnkF4, 0x0002, 0x0009),
    DELAY_VAR(oWaterObjUnkF4),
    OBJ_CHILD(MODEL_BUBBLE, bhvSmallWaterWave),
    OBJ_BIT_CLEAR_INT32(oActiveParticleFlags, 0x00000020),
    DEACTIVATE(),
};

// 02E4
const BehaviorScript bhvBubbleMaybe[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    CALLNATIVE(bhv_bubble_wave_init),
    OBJ_SET_FLOAT_RAND(oWaterObjUnkF4, 0xFFB5, 0x0096),
    OBJ_SET_FLOAT_RAND(oWaterObjUnkF8, 0xFFB5, 0x0096),
    OBJ_SET_FLOAT_RAND(oWaterObjUnkFC, 0xFFB5, 0x0096),
    OBJ_SUM_FLOAT(oPosX, oPosX, oWaterObjUnkF4),
    OBJ_SUM_FLOAT(oPosZ, oPosZ, oWaterObjUnkF8),
    OBJ_SUM_FLOAT(oPosY, oPosY, oWaterObjUnkFC),
    OBJ_SET_INT(oAnimState, -1),
    BEGIN_REPEAT(60),
        OBJ_ADD_INT(oAnimState, 1),
        CALLNATIVE(bhv_bubble_maybe_loop),
    END_REPEAT(),
    DEACTIVATE(),
};

// 0338
const BehaviorScript bhvSmallWaterWave[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    CALLNATIVE(bhv_bubble_wave_init),
    OBJ_SET_FLOAT_RAND(oWaterObjUnkF4, 0xFFCE, 0x0064),
    OBJ_SET_FLOAT_RAND(oWaterObjUnkF8, 0xFFCE, 0x0064),
    OBJ_SUM_FLOAT(oPosX, oPosX, oWaterObjUnkF4),
    OBJ_SUM_FLOAT(oPosZ, oPosZ, oWaterObjUnkF8),
    OBJ_SET_FLOAT_RAND(oWaterObjUnkFC, 0x0000, 0x0032),
    OBJ_SUM_FLOAT(oPosY, oPosY, oWaterObjUnkFC),
    OBJ_SET_INT(oAnimState, -1),
    CALL(bhvSmallWaterWave398),
    BEGIN_REPEAT(60),
        CALL(bhvSmallWaterWave398),
        CALLNATIVE(bhv_small_water_wave_loop),
    END_REPEAT(),
    DEACTIVATE(),
};

// 0398
const BehaviorScript bhvSmallWaterWave398[] = {
    OBJ_ADD_INT(oAnimState, 1),
    OBJ_ADD_FLOAT(oPosY, 7),
    OBJ_SET_FLOAT_RAND(oWaterObjUnkF4, -2, 5),
    OBJ_SET_FLOAT_RAND(oWaterObjUnkF8, -2, 5),
    OBJ_SUM_FLOAT(oPosX, oPosX, oWaterObjUnkF4),
    OBJ_SUM_FLOAT(oPosZ, oPosZ, oWaterObjUnkF8),
    RETURN(),
};

// 03BC
const BehaviorScript bhvWaterAirBubble[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    COLLISION_SPHERE(0x0190, 0x0096, 0xFF6A),
    OBJ_SET_INT(oIntangibleTimer, 0),
    INTERACT_TYPE(INTERACT_WATER_RING),
    OBJ_SET_INT(oDamageOrCoinValue, 5),
    CALLNATIVE(bhv_water_air_bubble_init),
    OBJ_SET_INT(oAnimState, -1),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_water_air_bubble_loop),
    END_LOOP(),
};

// 0400
const BehaviorScript bhvSmallParticle[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    BILLBOARD(),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    CALLNATIVE(bhv_particle_init),
    BEGIN_REPEAT(70),
        CALLNATIVE(bhv_particle_loop),
    END_REPEAT(),
    DEACTIVATE(),
};

// 0428
const BehaviorScript bhvWaterWaves[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_BIT_CLEAR_INT32(oActiveParticleFlags, 0x00000200),
    GRAPH_CLEAR(),
    CALLNATIVE(bhv_water_waves_init),
    DEACTIVATE(),
};

// 0444
const BehaviorScript bhvSmallParticleSnow[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    BILLBOARD(),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    CALLNATIVE(bhv_particle_init),
    BEGIN_REPEAT(30),
        CALLNATIVE(bhv_particle_loop),
    END_REPEAT(),
    DEACTIVATE(),
};

// 046C
const BehaviorScript bhvSmallParticleBubbles[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    BILLBOARD(),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    CALLNATIVE(bhv_particle_init),
    BEGIN_REPEAT(70),
        CALLNATIVE(bhv_small_bubbles_loop),
    END_REPEAT(),
    DEACTIVATE(),
};

// 0494
const BehaviorScript bhvFishGroup[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_fish_group_loop),
    END_LOOP(),
};

// 04A8
const BehaviorScript bhvCannon[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_CHILD(MODEL_CANNON_BARREL, bhvCannonBarrel),
    OBJ_SET_INT(oInteractType, 0x4000),
    OBJ_ADD_FLOAT(oPosY, -340),
    OBJ_SET_POS(),
    SET_HITBOX(0x0096, 0x0096),
    OBJ_SET_INT(oIntangibleTimer, 0),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_cannon_base_loop),
    END_LOOP(),
};

// 04E4
const BehaviorScript bhvCannonBarrel[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    DROP_FLOOR(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_cannon_barrel_loop),
    END_LOOP(),
};

// 0500
const BehaviorScript bhvCannonBaseUnused[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    OBJ_SET_INT(oAnimState, -1),
    BEGIN_REPEAT(8),
        CALLNATIVE(bhv_cannon_base_unused_loop),
        OBJ_ADD_INT(oAnimState, 1),
    END_REPEAT(),
    DEACTIVATE(),
};

// 0528
const BehaviorScript bhvChuckya[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_HOLDABLE | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, chuckya_seg8_anims_0800C070),
    ANIMATE(0x05),
    OBJ_SET_INT(oInteractType, 0x02),
    SET_HITBOX(0x0096, 0x0064),
    GRAVITY(0x001E, 0xFE70, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    OBJ_SPAWN(MODEL_NONE, bhvChuckyaAnchorMario),
    OBJ_SET_INT(oNumLootCoins, 5),
    OBJ_SET_INT(oIntangibleTimer, 0),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_chuckya_loop),
    END_LOOP(),
};

// 0584
const BehaviorScript bhvChuckyaAnchorMario[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    OBJ_SET_FLOAT(oParentRelativePosY, 0xFFC4),
    OBJ_SET_FLOAT(oParentRelativePosZ, 0x0096),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_chuckya_anchor_mario_loop),
    END_LOOP(),
};

// 05A8
const BehaviorScript bhvUnused05A8[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BREAK(),
};

// 05B4
const BehaviorScript bhvRotatingPlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_rotating_platform_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 05D8
const BehaviorScript bhvTower[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(wf_seg7_collision_tower),
    OBJ_SET_FLOAT(oCollisionDistance, 0x0BB8),
    OBJ_SET_FLOAT(oDrawingDistance, 0x4E20),
    BEGIN_LOOP(),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 0600
const BehaviorScript bhvBulletBillCannon[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(wf_seg7_collision_bullet_bill_cannon),
    OBJ_SET_FLOAT(oCollisionDistance, 0x012C),
    BEGIN_LOOP(),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 0624
const BehaviorScript bhvWfBreakableWallRight[] = {
    BEGIN(OBJ_LIST_SURFACE),
    COLLISION_DATA(wf_seg7_collision_breakable_wall),
    GOTO(bhvWfBreakableWallLeft + 1 + 2),
};

// 0638
const BehaviorScript bhvWfBreakableWallLeft[] = {
    BEGIN(OBJ_LIST_SURFACE),
    COLLISION_DATA(wf_seg7_collision_breakable_wall_2),
    // .L13000644:
    OBJ_OR_INT(oFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    SET_HITBOX(0x012C, 0x0190),
    OBJ_SET_INT(oIntangibleTimer, 0),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_wf_breakable_wall_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 066C
const BehaviorScript bhvKickableBoard[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(wf_seg7_collision_kickable_board),
    SET_HITBOX(0x0064, 0x04B0),
    OBJ_SET_FLOAT2(0x0001, 0x0001),
    OBJ_SET_FLOAT(oCollisionDistance, 0x05DC),
    OBJ_SET_INT(oIntangibleTimer, 0),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_kickable_board_loop),
    END_LOOP(),
};

// 06A4
const BehaviorScript bhvTowerDoor[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(wf_seg7_collision_tower_door),
    SET_HITBOX(0x0064, 0x0064),
    OBJ_SET_INT(oIntangibleTimer, 0),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_tower_door_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 06D8
const BehaviorScript bhvRotatingCounterClockwise[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    BREAK(),
};

// 06E0
const BehaviorScript bhvWfRotatingWoodenPlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(wf_seg7_collision_clocklike_rotation),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_wf_rotating_wooden_platform_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 0708
const BehaviorScript bhvKoopaShellUnderwater[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_HOLDABLE | OBJ_FLAG_COMPUTE_DIST_TO_MARIO  | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_koopa_shell_underwater_loop),
    END_LOOP(),
};

// 0720
const BehaviorScript bhvExitPodiumWarp[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_INT(oInteractType, 0x2000),
    DROP_FLOOR(),
    OBJ_SET_FLOAT(oCollisionDistance, 0x1F40),
    COLLISION_DATA(ttm_seg7_collision_podium_warp),
    OBJ_SET_INT(oIntangibleTimer, 0),
    SET_HITBOX(0x0032, 0x0032),
    BEGIN_LOOP(),
        CALLNATIVE(load_object_collision_model),
        OBJ_SET_INT(oInteractStatus, 0),
    END_LOOP(),
};

// 075C
const BehaviorScript bhvFadingWarp[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_SET_INT(oInteractionSubtype, 0x0001),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_INT(oInteractType, 0x2000),
    OBJ_SET_INT(oIntangibleTimer, 0),
    BEGIN_LOOP(),
        CALLNATIVE(BehFadingWarpLoop),
    END_LOOP(),
};

// 0780
const BehaviorScript bhvWarp[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_INT(oInteractType, 0x2000),
    OBJ_SET_INT(oIntangibleTimer, 0),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_warp_loop),
    END_LOOP(),
};

// 07A0
const BehaviorScript bhvWarpPipe[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_INT(oInteractType, 0x2000),
    COLLISION_DATA(warp_pipe_seg3_collision_03009AC8),
    OBJ_SET_FLOAT(oDrawingDistance, 0x3E80),
    OBJ_SET_INT(oIntangibleTimer, 0),
    SET_HITBOX(0x0046, 0x0032),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_warp_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 07DC
const BehaviorScript bhvWhitePuffExplosion[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_white_puff_exploding_loop),
    END_LOOP(),
};

// 07F8
const BehaviorScript bhvSpawnedStar[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_INT(oBehParams2ndByte, 1),
    GOTO(bhvUnused080C + 1 + 1),
};

// 080C
const BehaviorScript bhvUnused080C[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    // .L13000814:
    OBJ_SET_POS(),
    CALLNATIVE(bhv_unused_080c_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_unused_080c_loop),
    END_LOOP(),
};

// 0830
const BehaviorScript bhvMrIBlueCoin[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_SET_INT(oInteractType, 0x10),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    OBJ_SET_INT(oIntangibleTimer, 0),
    OBJ_SET_FLOAT(oMrIUnk110, 0x0014),
    OBJ_SET_INT(oAnimState, -1),
    GRAVITY(0x001E, 0xFE70, 0xFFBA, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    CALLNATIVE(bhv_coin_init),
    OBJ_SET_INT(oDamageOrCoinValue, 0x0005),
    SET_HITBOX(0x0078, 0x0040),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_coin_loop),
        OBJ_ADD_INT(oAnimState, 1),
    END_LOOP(),
};

// 0888
const BehaviorScript bhvCoinInsideBoo[] = {
    BEGIN(OBJ_LIST_LEVEL),
    SET_HITBOX(0x0064, 0x0040),
    OBJ_SET_INT(oInteractType, 0x10),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    GRAVITY(0x001E, 0xFE70, 0xFFBA, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    BILLBOARD(),
    CALLNATIVE(bhv_init_room),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_coin_inside_boo_loop),
        OBJ_ADD_INT(oAnimState, 1),
    END_LOOP(),
};

// 08D0
const BehaviorScript bhvCoinFormationSpawn[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_coin_formation_spawn_loop),
    END_LOOP(),
};

// 08EC
const BehaviorScript bhvCoinFormation[] = {
    BEGIN(OBJ_LIST_SPAWNER),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    CALLNATIVE(bhv_coin_formation_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_coin_formation_loop),
    END_LOOP(),
};

// 090C
const BehaviorScript bhvOneCoin[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_SET_INT(oBehParams2ndByte, 1),
    GOTO(bhvYellowCoin + 1),
};

// 091C
const BehaviorScript bhvYellowCoin[] = {
    BEGIN(OBJ_LIST_LEVEL),
    // .L13000920:
    BILLBOARD(),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    CALLNATIVE(bhv_yellow_coin_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_yellow_coin_loop),
    END_LOOP(),
};

// 0940
const BehaviorScript bhvTemporaryYellowCoin[] = {
    BEGIN(OBJ_LIST_LEVEL),
    BILLBOARD(),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    CALLNATIVE(bhv_yellow_coin_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_temp_coin_loop),
    END_LOOP(),
};

// 0964
const BehaviorScript bhvThreeCoinsSpawn[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BEGIN_REPEAT(3),
        OBJ_CHILD(MODEL_YELLOW_COIN, bhvSingleCoinGetsSpawned),
    END_REPEAT(),
    DEACTIVATE(),
};

// 0984
const BehaviorScript bhvTenCoinsSpawn[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BEGIN_REPEAT(10),
        OBJ_CHILD(MODEL_YELLOW_COIN, bhvSingleCoinGetsSpawned),
    END_REPEAT(),
    DEACTIVATE(),
};

// 09A4
const BehaviorScript bhvSingleCoinGetsSpawned[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    CALLNATIVE(bhv_coin_init),
    GRAVITY(0x001E, 0xFE70, 0xFFBA, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_coin_loop),
        OBJ_ADD_INT(oAnimState, 1),
    END_LOOP(),
};

// 09E0
const BehaviorScript bhvCoinSparkles[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    OBJ_SET_FLOAT(oGraphYOffset, 25),
    OBJ_SET_INT(oAnimState, -1),
    BEGIN_REPEAT(8),
        OBJ_ADD_INT(oAnimState, 1),
    END_REPEAT(),
    BEGIN_REPEAT(2),
        CALLNATIVE(bhv_coin_sparkles_loop),
    END_REPEAT(),
    DEACTIVATE(),
};

// 0A14
const BehaviorScript bhvGoldenCoinSparkles[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    GRAPH_CLEAR(),
    BEGIN_REPEAT(3),
        CALLNATIVE(bhv_golden_coin_sparkles_loop),
    END_REPEAT(),
    DEACTIVATE(),
};

// 0A34
const BehaviorScript bhvWallTinyStarParticle[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    BEGIN_REPEAT(10),
        CALLNATIVE(bhv_wall_tiny_star_particle_loop),
    END_REPEAT(),
    DEACTIVATE(),
};

// 0A54
const BehaviorScript bhvWallTinyStarParticleSpawn[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    GRAPH_CLEAR(),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_BIT_CLEAR_INT32(oActiveParticleFlags, 0x00040000),
    CALLNATIVE(bhv_tiny_star_particles_init),
    DELAY(1),
    DEACTIVATE(),
};

// 0A78
const BehaviorScript bhvPoundTinyStarParticle[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    BEGIN_REPEAT(10),
        CALLNATIVE(bhv_pound_tiny_star_particle_loop),
    END_REPEAT(),
    DEACTIVATE(),
};

// 0A98
const BehaviorScript bhvPoundTinyStarParticleSpawn[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    GRAPH_CLEAR(),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_BIT_CLEAR_INT32(oActiveParticleFlags, 0x00000010),
    CALLNATIVE(bhv_pound_tiny_star_particle_init),
    DELAY(1),
    DEACTIVATE(),
};

// 0ABC
const BehaviorScript bhvPunchTinyTriangle[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_punch_tiny_triangle_loop),
    END_LOOP(),
};

// 0AD8
const BehaviorScript bhvPunchTinyTriangleSpawn[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    GRAPH_CLEAR(),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_BIT_CLEAR_INT32(oActiveParticleFlags, 0x00080000),
    CALLNATIVE(bhv_punch_tiny_triangle_init),
    DELAY(1),
    DEACTIVATE(),
};

// 0AFC
const BehaviorScript bhvDoorWarp[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_SET_INT(oInteractType, 0x800),
    GOTO(bhvDoor + 1 + 1),
};

// 0B0C
const BehaviorScript bhvDoor[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_SET_INT(oInteractType, 0x04),
    // .L13000B14:
    OBJ_OR_INT(oFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, door_seg3_anims_030156C0),
    ANIMATE(0x00),
    COLLISION_DATA(door_seg3_collision_0301CE78),
    SET_HITBOX(0x0050, 0x0064),
    OBJ_SET_INT(oIntangibleTimer, 0),
    OBJ_SET_FLOAT(oCollisionDistance, 0x03E8),
    OBJ_SET_POS(),
    CALLNATIVE(bhv_door_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_door_loop),
    END_LOOP(),
};

// 0B58
const BehaviorScript bhvGrindel[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(ssl_seg7_collision_grindel),
    DROP_FLOOR(),
    OBJ_ADD_FLOAT(oPosY, 1),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_grindel_thwomp_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 0B8C
const BehaviorScript bhvThwomp2[] = {
    BEGIN(OBJ_LIST_SURFACE),
    COLLISION_DATA(thwomp_seg5_collision_0500B92C),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    DROP_FLOOR(),
    OBJ_ADD_FLOAT(oPosY, 1),
    OBJ_SET_POS(),
    SCALE(140),
    OBJ_SET_FLOAT(oDrawingDistance, 0x0FA0),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_grindel_thwomp_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 0BC8
const BehaviorScript bhvThwomp[] = {
    BEGIN(OBJ_LIST_SURFACE),
    COLLISION_DATA(thwomp_seg5_collision_0500B7D0),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    DROP_FLOOR(),
    OBJ_ADD_FLOAT(oPosY, 1),
    SCALE(140),
    OBJ_SET_POS(),
    OBJ_SET_FLOAT(oDrawingDistance, 0x0FA0),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_grindel_thwomp_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 0C04
const BehaviorScript bhvTumblingBridgePlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_FLOAT(oCollisionDistance, 0x012C),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_tumbling_bridge_platform_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 0C28
const BehaviorScript bhvWfTumblingBridge[] = {
    BEGIN(OBJ_LIST_SPAWNER),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_tumbling_bridge_loop),
    END_LOOP(),
};

// 0C44
const BehaviorScript bhvBbhTumblingBridge[] = {
    BEGIN(OBJ_LIST_SPAWNER),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_POS(),
    OBJ_SET_INT(oBehParams2ndByte, 1),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_tumbling_bridge_loop),
    END_LOOP(),
};

// 0C64
const BehaviorScript bhvLllTumblingBridge[] = {
    BEGIN(OBJ_LIST_SPAWNER),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_POS(),
    OBJ_SET_INT(oBehParams2ndByte, 2),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_tumbling_bridge_loop),
    END_LOOP(),
};

// 0C84
const BehaviorScript bhvFlame[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    OBJ_SET_POS(),
    SCALE(700),
    INTERACT_TYPE(INTERACT_FLAME),
    COLLISION_SPHERE(0x0032, 0x0019, 0x0019),
    OBJ_SET_INT(oIntangibleTimer, 0),
    CALLNATIVE(bhv_init_room),
    BEGIN_LOOP(),
        OBJ_SET_INT(oInteractStatus, 0),
        TEXT_ANIM_RATE(oAnimState, 0x0002),
    END_LOOP(),
};

// 0CC8
const BehaviorScript bhvAnotherElavator[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(hmc_seg7_collision_elevator),
    OBJ_SET_POS(),
    CALLNATIVE(bhv_elevator_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_elevator_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 0CFC
const BehaviorScript bhvRrElevatorPlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(rr_seg7_collision_elevator_platform),
    OBJ_SET_POS(),
    CALLNATIVE(bhv_elevator_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_elevator_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 0D30
const BehaviorScript bhvHmcElevatorPlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(hmc_seg7_collision_elevator),
    OBJ_SET_POS(),
    CALLNATIVE(bhv_elevator_init),
    CALLNATIVE(bhv_init_room),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_elevator_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 0D6C
const BehaviorScript bhvWaterMist[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    OBJ_SET_INT(oOpacity, 0xFE),
    OBJ_SET_FLOAT(oForwardVel, 0x0014),
    OBJ_SET_FLOAT(oVelY, 0xFFF8),
    OBJ_ADD_FLOAT(oPosY, 62),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_water_mist_loop),
    END_LOOP(),
};

// 0D98
const BehaviorScript bhvWaterMistSpawn[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BEGIN_REPEAT(8),
        CALLNATIVE(bhv_water_mist_spawn_loop),
    END_REPEAT(),
    DEACTIVATE(),
};

// 0DB4
const BehaviorScript bhvBreakBoxTriangle[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BEGIN_REPEAT(18),
        CALLNATIVE(obj_rotate_face_angle_using_vel),
        CALLNATIVE(obj_move_using_fvel_and_gravity),
    END_REPEAT(),
    DEACTIVATE(),
};

// 0DD8
const BehaviorScript bhvWaterMist2[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_POS(),
    OBJ_SET_INT(oFaceAnglePitch, 0xC000),
    SCALE(2100),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_water_mist_2_loop),
    END_LOOP(),
};

// 0DFC
const BehaviorScript bhvUnused0DFC[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_INT(oAnimState, -1),
    OBJ_SET_FLOAT(oFaceAnglePitch, 0),
    OBJ_SET_FLOAT(oFaceAngleYaw, 0),
    OBJ_SET_FLOAT(oFaceAngleRoll, 0),
    BEGIN_REPEAT(6),
        OBJ_ADD_INT(oAnimState, 1),
    END_REPEAT(),
    DEACTIVATE(),
};

// 0E24
const BehaviorScript bhvPoundWhitePuffs[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    CALLNATIVE(bhv_pound_white_puffs_init),
    DELAY(1),
    DEACTIVATE(),
};

// 0E3C
const BehaviorScript bhvGroundSand[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    CALLNATIVE(bhv_unused_0e40_init),
    DELAY(1),
    DEACTIVATE(),
};

// 0E58
const BehaviorScript bhvGroundSnow[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    CALLNATIVE(bhv_ground_snow_init),
    DELAY(1),
    DEACTIVATE(),
};

// 0E70
const BehaviorScript bhvWind[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_wind_loop),
    END_LOOP(),
};

// 0E88
const BehaviorScript bhvEndToad[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_ANIMS(oAnimations, toad_seg6_anims_0600FB58),
    ANIMATE(0x00),
    BEGIN_LOOP(),
        CALLNATIVE(BehEndToadLoop),
    END_LOOP(),
};

// 0EAC
const BehaviorScript bhvEndPeach[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_ANIMS(oAnimations, peach_seg5_anims_0501C41C),
    ANIMATE(0x00),
    BEGIN_LOOP(),
        CALLNATIVE(BehEndPeachLoop),
    END_LOOP(),
};

// 0ED0
const BehaviorScript bhvUnusedParticleSpawn[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    GRAVITY(0x001E, 0xFE70, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    OBJ_SET_INT(oIntangibleTimer, 0),
    SET_HITBOX(0x0028, 0x0028),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_unused_particle_spawn_loop),
    END_LOOP(),
};

// 0F08
const BehaviorScript bhvUkiki[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    GOTO(bhvMacroUkiki + 1),
};

// 0F14
const BehaviorScript bhvUkikiCageChild[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_FLOAT(oPosX, 0x0A00),
    OBJ_SET_FLOAT(oPosY, 0x05B1),
    OBJ_SET_FLOAT(oPosZ, 0x076A),
    BREAK(),
};

// 0F2C
const BehaviorScript bhvUkikiCageStar[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_ukiki_cage_star_loop),
    END_LOOP(),
};

// 0F48
const BehaviorScript bhvUkikiCage[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_POS(),
    COLLISION_DATA(ttm_seg7_collision_ukiki_cage),
    OBJ_CHILD(MODEL_STAR, bhvUkikiCageStar),
    OBJ_CHILD(MODEL_NONE, bhvUkikiCageChild),
    OBJ_SET_FLOAT(oCollisionDistance, 0x4E20),
    GRAVITY(0x001E, 0xFE70, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_ukiki_cage_loop),
    END_LOOP(),
};

// 0F9C
const BehaviorScript bhvBitfsSinkingPlatforms[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(bitfs_seg7_collision_sinking_platform),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_bitfs_sinking_platform_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 0FC8
const BehaviorScript bhvBitfsSinkingCagePlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(bitfs_seg7_collision_sinking_cage_platform),
    OBJ_SET_POS(),
    OBJ_CHILD(MODEL_BITFS_BLUE_POLE, bhvDddMovingPole),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_bitfs_sinking_cage_platform_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 1000
const BehaviorScript bhvDddMovingPole[] = {
    BEGIN(OBJ_LIST_POLELIKE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_INT(oInteractType, 0x40),
    SET_HITBOX(0x0050, 0x02C6),
    OBJ_SET_INT(oIntangibleTimer, 0),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_ddd_moving_pole_loop),
        CALLNATIVE(BehClimbDetectLoop),
    END_LOOP(),
};

// 1030
const BehaviorScript bhvBitfsTiltingSquarePlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(bitfs_seg7_collision_inverted_pyramid),
    OBJ_SET_POS(),
    CALLNATIVE(bhv_tilting_platform_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_tilting_platform_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 1064
const BehaviorScript bhvSquishablePlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(bitfs_seg7_collision_squishable_platform),
    OBJ_SET_FLOAT(oCollisionDistance, 0x2710),
    CALLNATIVE(bhv_tilting_platform_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_squishable_platform_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 1098
const BehaviorScript bhvCutOutObject[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    GRAPH_CLEAR(),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BREAK(),
};

// 10A8
const BehaviorScript bhvBetaMovingFlamesSpawn[] = {
    BEGIN_LOOP(),
        CALLNATIVE(bhv_beta_moving_flames_spawn_loop),
    END_LOOP(),
};

// 10B8
const BehaviorScript bhvBetaMovingFlames[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_beta_moving_flames_loop),
        OBJ_ADD_INT(oAnimState, 1),
    END_LOOP(),
};

// 10D8
const BehaviorScript bhvRrRotatingBridgePlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(rr_seg7_collision_rotating_platform_with_fire),
    OBJ_SET_FLOAT(oCollisionDistance, 0x05DC),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_rr_rotating_bridge_platform_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 1108
const BehaviorScript bhvFlamethrower[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_flamethrower_loop),
    END_LOOP(),
};

// 1124
const BehaviorScript bhvFlamethrowerFlame[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    INTERACT_TYPE(INTERACT_FLAME),
    COLLISION_SPHERE(0x0032, 0x0019, 0x0019),
    BILLBOARD(),
    OBJ_SET_POS(),
    OBJ_SET_INT(oIntangibleTimer, 0),
    CALLNATIVE(bhv_init_room),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_flamethrower_flame_loop),
        OBJ_ADD_INT(oAnimState, 1),
    END_LOOP(),
};

// 1168
const BehaviorScript bhvBouncingFireball[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    GRAPH_CLEAR(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_bouncing_fireball_loop),
    END_LOOP(),
};

// 1184
const BehaviorScript bhvBouncingFireballFlame[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    INTERACT_TYPE(INTERACT_FLAME),
    OBJ_SET_FLOAT(oGraphYOffset, 30),
    COLLISION_SPHERE(0x0032, 0x0019, 0x0019),
    GRAVITY(0x001E, 0xFE70, 0xFFBA, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    BILLBOARD(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_bouncing_fireball_flame_loop),
        OBJ_ADD_INT(oAnimState, 1),
    END_LOOP(),
};

// 11D0
const BehaviorScript bhvBowserShockWave[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_INT(oOpacity, 0x00FF),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_bowser_shock_wave_loop),
    END_LOOP(),
};

// 11EC
const BehaviorScript bhvFlameMario[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    OBJ_SET_FLOAT(oGraphYOffset, 0x0046),
    OBJ_SET_INT(oAnimState, -1),
    BEGIN_LOOP(),
        OBJ_ADD_INT(oAnimState, 1),
        CALLNATIVE(bhv_flame_mario_loop),
    END_LOOP(),
};

// 1214
const BehaviorScript bhvBlackSmokeMario[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    OBJ_SET_INT(oAnimState, 0x0004),
    OBJ_SET_FLOAT(oGraphYOffset, 0x0032),
    BEGIN_REPEAT(8),
        CALLNATIVE(bhv_black_smoke_mario_loop),
        DELAY(1),
        CALLNATIVE(bhv_black_smoke_mario_loop),
        DELAY(1),
        CALLNATIVE(bhv_black_smoke_mario_loop),
    END_REPEAT(),
    DEACTIVATE(),
};

// 1254
const BehaviorScript bhvBlackSmokeBowser[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    OBJ_SET_FLOAT(oGraphYOffset, 0x0000),
    BEGIN_REPEAT(8),
        CALLNATIVE(bhv_black_smoke_bowser_loop),
        TEXT_ANIM_RATE(oAnimState, 0x0004),
    END_REPEAT(),
    DEACTIVATE(),
};

// 127C
const BehaviorScript bhvBlackSmokeUpward[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BEGIN_REPEAT(4),
        CALLNATIVE(bhv_black_smoke_upward_loop),
    END_REPEAT(),
    DEACTIVATE(),
};

// 1298
const BehaviorScript bhvBetaFishSplashSpawner[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    GRAPH_CLEAR(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_beta_fish_splash_spawner_loop),
    END_LOOP(),
};

// 12B4
const BehaviorScript bhvSpindrift[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, spindrift_seg5_anims_05002D68),
    ANIMATE(0x00),
    GRAVITY(0x001E, 0xFE70, 0x0000, 0x0000, 0x0000, 0x00C8, 0x0000, 0x0000),
    OBJ_SET_POS(),
    OBJ_SET_INT(oInteractionSubtype, 0x0080),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_spindrift_loop),
    END_LOOP(),
};

// 12F4
const BehaviorScript bhvTowerPlatformGroup[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    GRAPH_CLEAR(),
    OBJ_ADD_FLOAT(oPosY, 300),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_tower_platform_group_loop),
    END_LOOP(),
};

// 1318
const BehaviorScript bhvWfSlidingTowerPlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(wf_seg7_collision_platform),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_wf_sliding_tower_platform_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 1340
const BehaviorScript bhvWfElevatorTowerPlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(wf_seg7_collision_platform),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_wf_elevator_tower_platform_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 1368
const BehaviorScript bhvWfSolidTowerPlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(wf_seg7_collision_platform),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_wf_solid_tower_platform_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 1390
const BehaviorScript bhvSnowLeafParticleSpawn[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    CALLNATIVE(bhv_snow_leaf_particle_spawn_init),
    DELAY(1),
    DEACTIVATE(),
};

// 13A8
const BehaviorScript bhvTreeSnow[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_tree_snow_or_leaf_loop),
    END_LOOP(),
};

// 13C4
const BehaviorScript bhvTreeLeaf[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_tree_snow_or_leaf_loop),
    END_LOOP(),
};

// 13DC
const BehaviorScript bhvAnotherTiltingPlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_POS(),
    CALLNATIVE(bhv_tilting_platform_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_tilting_platform_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 1408
const BehaviorScript bhvSquarishPathMoving[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(bitdw_seg7_collision_moving_pyramid),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_squarish_path_moving_loop),
    END_LOOP(),
};

// 142C
const BehaviorScript bhvPiranhaPlantBubble[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_piranha_plant_bubble_loop),
    END_LOOP(),
};

// 1448
const BehaviorScript bhvPiranhaPlantWakingBubbles[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    BILLBOARD(),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BEGIN_REPEAT(10),
        CALLNATIVE(bhv_piranha_plant_waking_bubbles_loop),
    END_REPEAT(),
    DEACTIVATE(),
};

// 1468
const BehaviorScript bhvFloorSwitchAnimatesObject[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_SET_INT(oBehParams2ndByte, 1),
    GOTO(bhvFloorSwitchHardcodedModel + 1),
};

// 1478
const BehaviorScript bhvFloorSwitchGrills[] = {
    BEGIN(OBJ_LIST_SURFACE),
    GOTO(bhvFloorSwitchHardcodedModel + 1),
};

// 1484
const BehaviorScript bhvFloorSwitchHardcodedModel[] = {
    BEGIN(OBJ_LIST_SURFACE),
    // .Lbeh_floor_switch_1488: # 1488
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(purple_switch_seg8_collision_0800C7A8),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_purple_switch_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 14AC
const BehaviorScript bhvFloorSwitchHiddenObjects[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_SET_INT(oBehParams2ndByte, 2),
    GOTO(bhvFloorSwitchHardcodedModel + 1),
};

// 14BC
const BehaviorScript bhvHiddenObject[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(breakable_box_seg8_collision_08012D70),
    OBJ_SET_FLOAT(oCollisionDistance, 0x012C),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_hidden_object_loop),
    END_LOOP(),
};

// 14E0
const BehaviorScript bhvBreakableBox[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(breakable_box_seg8_collision_08012D70),
    OBJ_SET_FLOAT(oCollisionDistance, 0x01F4),
    CALLNATIVE(bhv_init_room),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_breakable_box_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
    BREAK(),
};

// 1518
const BehaviorScript bhvPushableMetalBox[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(metal_box_seg8_collision_08024C28),
    OBJ_SET_FLOAT(oCollisionDistance, 0x01F4),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_pushable_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 1548
const BehaviorScript bhvHeaveHo[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_HOLDABLE | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, heave_ho_seg5_anims_0501534C),
    ANIMATE(0x00),
    GRAVITY(0x00C8, 0xFE70, 0xFFCE, 0x03E8, 0x03E8, 0x0258, 0x0000, 0x0000),
    OBJ_SPAWN(MODEL_NONE, bhvHeaveHoThrowMario),
    OBJ_SET_INT(oInteractType, 0x02),
    OBJ_SET_INT(oInteractionSubtype, 0x0204),
    SET_HITBOX(0x0078, 0x0064),
    OBJ_SET_POS(),
    OBJ_SET_INT(oIntangibleTimer, 0),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_heave_ho_loop),
    END_LOOP(),
};

// 15A4
const BehaviorScript bhvHeaveHoThrowMario[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_heave_ho_throw_mario_loop),
    END_LOOP(),
};

// 15C0
const BehaviorScript bhvCcmTouchedStarSpawn[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_PERSISTENT_RESPAWN | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    SET_HITBOX(0x01F4, 0x01F4),
    OBJ_SET_INT(oIntangibleTimer, 0),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_ccm_touched_star_spawn_loop),
    END_LOOP(),
};

// 15E4
const BehaviorScript bhvUnusedPoundablePlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(sl_seg7_collision_pound_explodes),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_unused_poundable_platform),
    END_LOOP(),
};

// 1608
const BehaviorScript bhvBetaTrampolineTop[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(springboard_collision_05001A28),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_beta_trampoline_top_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 1634
const BehaviorScript bhvBetaTrampolineSpring[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_beta_trampoline_spring_loop),
    END_LOOP(),
};

// 1650
const BehaviorScript bhvJumpingBox[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_HOLDABLE | OBJ_FLAG_COMPUTE_DIST_TO_MARIO  | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    GRAVITY(0x001E, 0xFE70, 0xFFCE, 0x03E8, 0x03E8, 0x0258, 0x0000, 0x0000),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_jumping_box_loop),
    END_LOOP(),
};

// 167C
const BehaviorScript bhvBooCage[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_FLOAT(oGraphYOffset, 0x000A),
    GRAVITY(0x001E, 0xFE70, 0xFFCE, 0x0000, 0x0000, 0x00C8, 0x0000, 0x0000),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_boo_cage_loop),
    END_LOOP(),
};

// 16AC
const BehaviorScript bhvStub[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    GRAPH_CLEAR(),
    BREAK(),
};

// 16B8
const BehaviorScript bhvIgloo[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    INTERACT_TYPE(INTERACT_IGLOO_BARRIER),
    SET_HITBOX(0x0064, 0x00C8),
    OBJ_SET_INT(oIntangibleTimer, 0),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        OBJ_SET_INT(oInteractStatus, 0),
    END_LOOP(),
};

// 16E4
const BehaviorScript bhvBowserKey[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_POS(),
    GRAVITY(0x001E, 0xFE70, 0xFFBA, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_bowser_key_loop),
    END_LOOP(),
};

// 1714
const BehaviorScript bhvGrandStar[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    INTERACT_TYPE(INTERACT_STAR_OR_KEY),
    OBJ_SET_INT(oInteractionSubtype, 0x0800),
    SET_HITBOX(0x00A0, 0x0064),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_grand_star_loop),
    END_LOOP(),
};

// 1744
const BehaviorScript bhvBetaBooKey[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    SET_HITBOX(0x0020, 0x0040),
    GRAVITY(0x001E, 0xFE70, 0xFFBA, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_beta_boo_key_loop),
    END_LOOP(),
};

// 1778
const BehaviorScript bhvAlphaBooKey[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    SET_HITBOX(0x0020, 0x0040),
    OBJ_SET_INT(oIntangibleTimer, 0),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_alpha_boo_key_loop),
    END_LOOP(),
};

// 179C
const BehaviorScript bhvBulletBill[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_POS(),
    COLLISION_SPHERE(0x0032, 0x0032, 0x0032),
    INTERACT_TYPE(INTERACT_DAMAGE),
    OBJ_SET_INT(oDamageOrCoinValue, 3),
    SCALE(40),
    OBJ_SET_INT(oIntangibleTimer, 0),
    GRAVITY(0x001E, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000),
    CALLNATIVE(bhv_bullet_bill_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_bullet_bill_loop),
    END_LOOP(),
};

// 17F4
const BehaviorScript bhvWhitePuffSmoke[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    OBJ_ADD_FLOAT(oPosY, -100),
    CALLNATIVE(bhv_white_puff_smoke_init),
    OBJ_SET_INT(oAnimState, -1),
    BEGIN_REPEAT(10),
        OBJ_ADD_INT(oAnimState, 1),
    END_REPEAT(),
    DEACTIVATE(),
};

// 1820
const BehaviorScript bhvUnused1820[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    BREAK(),
};

// 1828
const BehaviorScript bhvBowserTailAnchor[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    COLLISION_SPHERE(0x0064, 0x0032, 0xFFCE),
    OBJ_SET_INT(oIntangibleTimer, 0),
    GRAPH_CLEAR(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_bowser_tail_anchor_loop),
    END_LOOP(),
};

// 1850
const BehaviorScript bhvBowser[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_HOLDABLE | OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_INT(oInteractType, 0x02),
    SET_HITBOX(0x0190, 0x0190),
    DROP_FLOOR(),
    OBJ_SET_POS(),
    OBJ_SET_ANIMS(oAnimations, bowser_seg6_anims_06057690),
    OBJ_CHILD(MODEL_NONE, bhvBowserBodyAnchor),
    OBJ_CHILD(MODEL_BOWSER_BOMB_CHILD_OBJ, bhvBowserFlameSpawn),
    OBJ_SPAWN(MODEL_NONE, bhvBowserTailAnchor),
    OBJ_SET_INT(oNumLootCoins, 0x0032),
    GRAVITY(0x0000, 0xFE70, 0xFFBA, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    OBJ_SET_POS(),
    CALLNATIVE(bhv_bowser_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_bowser_loop),
    END_LOOP(),
};

// 18CC
const BehaviorScript bhvBowserBodyAnchor[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    SET_HITBOX(0x0064, 0x012C),
    INTERACT_TYPE(INTERACT_DAMAGE),
    OBJ_SET_INT(oInteractionSubtype, 0x0008),
    GRAPH_CLEAR(),
    OBJ_SET_INT(oDamageOrCoinValue, 2),
    OBJ_SET_INT(oIntangibleTimer, 0),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_bowser_body_anchor_loop),
    END_LOOP(),
};

// 1904
const BehaviorScript bhvBowserFlameSpawn[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    GEO_LAYOUT(MODEL_NONE),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_bowser_flame_spawn_loop),
    END_LOOP(),
};

// 1920
const BehaviorScript bhvTiltingBowserLavaPlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(bowser_2_seg7_collision_tilting_platform),
    OBJ_SET_FLOAT(oDrawingDistance, 0x4E20),
    OBJ_SET_FLOAT(oCollisionDistance, 0x4E20),
    OBJ_SET_INT(oFaceAngleYaw, 0x0000),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(obj_rotate_face_angle_using_vel),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 1958
const BehaviorScript bhvFallingBowserPlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_FLOAT(oDrawingDistance, 0x4E20),
    OBJ_SET_FLOAT(oCollisionDistance, 0x4E20),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_falling_bowser_platform_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 1984
const BehaviorScript bhvBlueBowserFlame[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    INTERACT_TYPE(INTERACT_FLAME),
    BILLBOARD(),
    GRAVITY(0x0000, 0xFE70, 0xFFBA, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    CALLNATIVE(bhv_blue_bowser_flame_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_blue_bowser_flame_loop),
        TEXT_ANIM_RATE(oAnimState, 0x0002),
    END_LOOP(),
};

// 19C8
const BehaviorScript bhvFlameFloatingLanding[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    INTERACT_TYPE(INTERACT_FLAME),
    BILLBOARD(),
    GRAVITY(0x0000, 0xFE70, 0xFFBA, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    CALLNATIVE(bhv_flame_floating_landing_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_flame_floating_landing_loop),
        TEXT_ANIM_RATE(oAnimState, 0x0002),
    END_LOOP(),
};

// 1A0C
const BehaviorScript bhvBlueFlamesGroup[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    INTERACT_TYPE(INTERACT_FLAME),
    BILLBOARD(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_blue_flames_group_loop),
    END_LOOP(),
};

// 1A30
const BehaviorScript bhvFlameBouncing[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    INTERACT_TYPE(INTERACT_FLAME),
    BILLBOARD(),
    CALLNATIVE(bhv_flame_bouncing_init),
    GRAVITY(0x0000, 0xFE70, 0xFFBA, 0x0000, 0x0000, 0x00C8, 0x0000, 0x0000),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_flame_bouncing_loop),
        TEXT_ANIM_RATE(oAnimState, 0x0002),
    END_LOOP(),
};

// 1A74
const BehaviorScript bhvFlameMovingForwardGrowing[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    INTERACT_TYPE(INTERACT_FLAME),
    BILLBOARD(),
    CALLNATIVE(bhv_flame_moving_forward_growing_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_flame_moving_forward_growing_loop),
        TEXT_ANIM_RATE(oAnimState, 0x0002),
    END_LOOP(),
};

// 1AA4
const BehaviorScript bhvFlameBowser[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    INTERACT_TYPE(INTERACT_FLAME),
    BILLBOARD(),
    CALLNATIVE(bhv_flame_bowser_init),
    GRAVITY(0x0000, 0xFE70, 0xFFBA, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_flame_bowser_loop),
        TEXT_ANIM_RATE(oAnimState, 0x0002),
    END_LOOP(),
};

// 1AE8
const BehaviorScript bhvFlameLargeBurningOut[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    INTERACT_TYPE(INTERACT_FLAME),
    BILLBOARD(),
    CALLNATIVE(bhv_flame_large_burning_out_init),
    GRAVITY(0x0000, 0xFE70, 0xFFBA, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_flame_bowser_loop),
        TEXT_ANIM_RATE(oAnimState, 0x0002),
    END_LOOP(),
};

// 1B2C
const BehaviorScript bhvBlueFish[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_POS(),
    OBJ_SET_ANIMS(oAnimations, blue_fish_seg3_anims_0301C2B0),
    ANIMATE(0x00),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_blue_fish_loop),
    END_LOOP(),
};

// 1B54
const BehaviorScript bhvTankFishGroup[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_tank_fish_group_loop),
    END_LOOP(),
};

// 1B70
const BehaviorScript bhvCheckerboardElevatorGroup[] = {
    BEGIN(OBJ_LIST_SPAWNER),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    CALLNATIVE(bhv_checkerboard_elevator_group_init),
    DELAY(1),
    DEACTIVATE(),
};

// 1B88
const BehaviorScript bhvCheckerboardPlatformSub[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(checkerboard_platform_seg8_collision_0800D710),
    CALLNATIVE(bhv_checkerboard_platform_init),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_checkerboard_platform_loop),
    END_LOOP(),
};

// 1BB4
const BehaviorScript bhvBowserKeyUnlockDoor[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_SET_ANIMS(oAnimations, bowser_key_seg3_anims_list),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_bowser_key_unlock_door_loop),
    END_LOOP(),
};

// 1BD4
const BehaviorScript bhvBowserKeyCourseExit[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_SET_ANIMS(oAnimations, bowser_key_seg3_anims_list),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_bowser_key_course_exit_loop),
    END_LOOP(),
};

// 1BF4
const BehaviorScript bhvInvisibleObjectsUnderBridge[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    CALLNATIVE(bhv_invisible_objects_under_bridge_init),
    BREAK(),
};

// 1C04
const BehaviorScript bhvWaterLevelPillar[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(inside_castle_seg7_collision_water_level_pillar),
    CALLNATIVE(bhv_water_level_pillar_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_water_level_pillar_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 1C34
const BehaviorScript bhvDddWarp[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_FLOAT(oCollisionDistance, 0x7530),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_ddd_warp_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 1C58
const BehaviorScript bhvMoatGrills[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(castle_grounds_seg7_collision_moat_grills),
    OBJ_SET_FLOAT(oCollisionDistance, 0x7530),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_moat_grills_loop),
    END_LOOP(),
};

// 1C7C
const BehaviorScript bhvClockMinuteHand[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_SET_INT(oAngleVelRoll, 0xFE80),
    GOTO(bhvClockHourHand + 1 + 1),
};

// 1C8C
const BehaviorScript bhvClockHourHand[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_SET_INT(oAngleVelRoll, 0xFFE0),
    //.L13001C94:
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    CALLNATIVE(bhv_init_room),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_rotating_clock_arm_loop),
    END_LOOP(),
};

// 1CB0
const BehaviorScript bhvMacroUkiki[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    // ukikiData:
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_HOLDABLE | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_INT(oInteractType, 0x02),
    OBJ_SET_INT(oInteractionSubtype, 0x0010),
    SET_HITBOX(0x0028, 0x0028),
    OBJ_SET_INT(oIntangibleTimer, 0),
    DROP_FLOOR(),
    OBJ_SET_ANIMS(oAnimations, ukiki_seg5_anims_05015784),
    ANIMATE(0x00),
    GRAVITY(0x001E, 0xFE70, 0xFFCE, 0x0000, 0x0000, 0x00C8, 0x0000, 0x0000),
    OBJ_SET_POS(),
    CALLNATIVE(bhv_ukiki_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_ukiki_loop),
    END_LOOP(),
};

// 1D0C
const BehaviorScript bhvStub1D0C[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    DEACTIVATE(),
};

// 1D14
const BehaviorScript bhvLllRotatingHexagonalPlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(lll_seg7_collision_hexagonal_platform),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        OBJ_SET_INT(oAngleVelYaw,  0x100),
        OBJ_ADD_INT(oMoveAngleYaw, 0x100),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 1D40
const BehaviorScript bhvLllSinkingRockBlock[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(lll_seg7_collision_floating_block),
    OBJ_ADD_FLOAT(oPosY, -50),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_lll_sinking_rock_block_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 1D70
const BehaviorScript bhvStub1D70[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    BREAK(),
};

// 1D78
const BehaviorScript bhvLllMovingOctagonalMeshPlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_ADD_FLOAT(oPosY, -50),
    COLLISION_DATA(lll_seg7_collision_octagonal_moving_platform),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_lll_moving_octagonal_mesh_platform_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 1DA4
const BehaviorScript bhvSnowBall[] = {
    BREAK(),
};

// 1DA8
const BehaviorScript bhvLllRotatingBlockWithFireBars[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(lll_seg7_collision_rotating_fire_bars),
    OBJ_SET_FLOAT(oCollisionDistance, 0x0FA0),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_lll_rotating_block_fire_bars_loop),
    END_LOOP(),
};

// 1DCC
const BehaviorScript bhvLllRotatingHexFlame[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    INTERACT_TYPE(INTERACT_FLAME),
    COLLISION_SPHERE(0x0032, 0x0064, 0x0032),
    OBJ_SET_INT(oIntangibleTimer, 0),
    BILLBOARD(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_lll_rotating_hex_flame_loop),
        OBJ_ADD_INT(oAnimState, 1),
    END_LOOP(),
};

// 1E04
const BehaviorScript bhvLllWoodPiece[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(lll_seg7_collision_wood_piece),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_lll_wood_piece_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 1E30
const BehaviorScript bhvLllFloatingWoodBridge[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    GEO_LAYOUT(MODEL_NONE),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_lll_floating_wood_bridge_loop),
    END_LOOP(),
};

// 1E4C
const BehaviorScript bhvVolcanoFlames[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    BEGIN_LOOP(),
        OBJ_ADD_INT(oAnimState, 1),
        CALLNATIVE(bhv_volcano_flames_loop),
    END_LOOP(),
};

// 1E6C
const BehaviorScript bhvLllRotatingHexagonalRing[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(lll_seg7_collision_rotating_platform),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_lll_rotating_hexagonal_ring_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 1E94
const BehaviorScript bhvLllSinkingRectangularPlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(lll_seg7_collision_slow_tilting_platform),
    OBJ_SET_FLOAT(oCollisionDistance, 0x07D0),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_lll_sinking_rectangular_platform_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 1EC4
const BehaviorScript bhvLllSinkingSquarePlatforms[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(lll_seg7_collision_sinking_pyramids),
    OBJ_ADD_FLOAT(oPosY, 5),
    OBJ_SET_FLOAT(oCollisionDistance, 0x07D0),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_lll_sinking_square_platforms_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 1EF8
const BehaviorScript bhvLllTiltingSquarePlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(lll_seg7_collision_inverted_pyramid),
    OBJ_ADD_FLOAT(oPosY, 5),
    OBJ_SET_POS(),
    CALLNATIVE(bhv_tilting_platform_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_tilting_platform_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 1F30
const BehaviorScript bhvUnused1F30[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BREAK(),
};

// 1F3C
const BehaviorScript bhvKoopaShell[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    GRAVITY(0x001E, 0xFE70, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_koopa_shell_loop),
    END_LOOP(),
};

// 1F68
const BehaviorScript bhvKoopaShellFlame[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    INTERACT_TYPE(INTERACT_FLAME),
    BILLBOARD(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_koopa_shell_flame_loop),
        TEXT_ANIM_RATE(oAnimState, 0x0002),
    END_LOOP(),
};

// 1F90
const BehaviorScript bhvToxBox[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(ssl_seg7_collision_tox_box),
    OBJ_ADD_FLOAT(oPosY, 256),
    OBJ_SET_FLOAT(oDrawingDistance, 0x1F40),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_tox_box_loop),
    END_LOOP(),
};

// 1FBC
const BehaviorScript bhvPiranhaPlant[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, piranha_plant_seg6_anims_0601C31C),
    ANIMATE(0x00),
    INTERACT_TYPE(INTERACT_DAMAGE),
    SET_HITBOX(0x0064, 0x00C8),
    OBJ_SET_FLOAT2(0x0032, 0x00C8),
    OBJ_SET_INT(oIntangibleTimer, 0),
    OBJ_SET_INT(oDamageOrCoinValue, 3),
    OBJ_SET_INT(oNumLootCoins, 5),
    OBJ_CHILD(MODEL_BUBBLE, bhvPiranhaPlantBubble),
    OBJ_SET_FLOAT(oDrawingDistance, 0x07D0),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_piranha_plant_loop),
    END_LOOP(),
};

// 2018
const BehaviorScript bhvLllHexagonalMesh[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(lll_hexagonal_mesh_seg3_collision_0301CECC),
    BEGIN_LOOP(),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 2038
const BehaviorScript bhvLllBowserPuzzlePiece[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(lll_seg7_collision_puzzle_piece),
    OBJ_SET_POS(),
    OBJ_SET_FLOAT(oCollisionDistance, 0x0BB8),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_lll_bowser_puzzle_piece_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 2068
const BehaviorScript bhvLllBowserPuzzle[] = {
    BEGIN(OBJ_LIST_SPAWNER),
    GRAPH_CLEAR(),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_ADD_FLOAT(oPosZ, -50),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_lll_bowser_puzzle_loop),
    END_LOOP(),
};

// 2088
const BehaviorScript bhvTuxiesMother[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, penguin_seg5_anims_05008B74),
    ANIMATE(0x03),
    GRAVITY(0x001E, 0xFE70, 0xFFCE, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000),
    OBJ_SET_POS(),
    INTERACT_TYPE(INTERACT_TEXT),
    SET_HITBOX(0x00C8, 0x012C),
    OBJ_SET_INT(oIntangibleTimer, 0),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_tuxies_mother_loop),
    END_LOOP(),
};

// 20D8
const BehaviorScript bhvPenguinBaby[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    BREAK(),
};

// 20E0
const BehaviorScript bhvUnused20E0[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    BREAK(),
};

// 20E8
const BehaviorScript bhvSmallPenguin[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_HOLDABLE | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    DROP_FLOOR(),
    OBJ_SET_ANIMS(oAnimations, penguin_seg5_anims_05008B74),
    ANIMATE(0x00),
    GRAVITY(0x001E, 0xFE70, 0xFFCE, 0x0000, 0x0000, 0x00C8, 0x0000, 0x0000),
    OBJ_SET_INT(oInteractType, 0x02),
    OBJ_SET_INT(oInteractionSubtype, 0x0010),
    OBJ_SET_INT(oIntangibleTimer, 0),
    SET_HITBOX(0x0028, 0x0028),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_small_penguin_loop),
    END_LOOP(),
};

// 213C
const BehaviorScript bhvFish2[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_SET_INT(oBehParams2ndByte, 0x0000),
    GOTO(bhvLargeFishGroup + 1),
};

// 214C
const BehaviorScript bhvFish3[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_SET_INT(oBehParams2ndByte, 1),
    GOTO(bhvLargeFishGroup + 1),
};

// 215C
const BehaviorScript bhvLargeFishGroup[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    // bhvFishCommon:
    GRAPH_CLEAR(),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_fish_loop),
    END_LOOP(),
};

// 2178
const BehaviorScript bhvFishGroup2[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_fish_group_2_loop),
    END_LOOP(),
};

// 2194
const BehaviorScript bhvWdwExpressElevator[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(wdw_seg7_collision_express_elevator_platform),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_wdw_express_elevator_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 21C0
const BehaviorScript bhvWdwExpressElevatorPlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(wdw_seg7_collision_express_elevator_platform),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 21E4
const BehaviorScript bhvChirpChirp[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_SET_INT(oBirdChirpChirpUnkF4, 1),
    GOTO(bhvChirpChirpUnused),
};

// 21F4
const BehaviorScript bhvChirpChirpUnused[] = {
    GRAPH_CLEAR(),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_bird_chirp_chirp_loop),
    END_LOOP(),
};

// 220C
const BehaviorScript bhvBub[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, bub_seg6_anims_06012354),
    ANIMATE(0x00),
    COLLISION_SPHERE(0x0014, 0x000A, 0x000A),
    INTERACT_TYPE(INTERACT_DAMAGE),
    OBJ_SET_INT(oDamageOrCoinValue, 1),
    OBJ_SET_POS(),
    OBJ_SET_INT(oIntangibleTimer, 0),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_cheep_cheep_loop),
    END_LOOP(),
};

// 2250
const BehaviorScript bhvExclamationBox[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(exclamation_box_outline_seg8_collision_08025F78),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_FLOAT(oCollisionDistance, 0x012C),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_exclamation_box_loop),
    END_LOOP(),
};

// 227C
const BehaviorScript bhvRotatingExclamationMark[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    SCALE(200),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_rotatin_exclamation_box_loop),
        OBJ_ADD_INT(oMoveAngleYaw, 0x800),
    END_LOOP(),
};

// 229C
const BehaviorScript bhvSoundSpawner[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    DELAY(3),
    CALLNATIVE(bhv_sound_spawner_init),
    DELAY(30),
    DEACTIVATE(),
};

// 22B8
const BehaviorScript bhvRockSolid[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(jrb_seg7_collision_rock_solid),
    BEGIN_LOOP(),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 22D8
const BehaviorScript bhvBowserSubDoor[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(ddd_seg7_collision_bowser_sub_door),
    OBJ_SET_FLOAT(oDrawingDistance, 0x4E20),
    OBJ_SET_FLOAT(oCollisionDistance, 0x4E20),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_bowsers_sub_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 2308
const BehaviorScript bhvBowsersSub[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_FLOAT(oDrawingDistance, 0x4E20),
    OBJ_SET_FLOAT(oCollisionDistance, 0x4E20),
    COLLISION_DATA(ddd_seg7_collision_submarine),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_bowsers_sub_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 2338
const BehaviorScript bhvSushiShark[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, sushi_seg5_anims_0500AE54),
    OBJ_SPAWN(MODEL_NONE, bhvSushiSharkCollisionChild),
    COLLISION_SPHERE(0x0064, 0x0032, 0x0032),
    INTERACT_TYPE(INTERACT_DAMAGE),
    OBJ_SET_INT(oDamageOrCoinValue, 3),
    OBJ_SET_POS(),
    ANIMATE(0x00),
    OBJ_SET_INT(oIntangibleTimer, 0),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_sushi_shark_loop),
    END_LOOP(),
};

// 2388
const BehaviorScript bhvSushiSharkCollisionChild[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    GRAPH_CLEAR(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_sushi_shark_collision_loop),
    END_LOOP(),
};

// 23A4
const BehaviorScript bhvJrbSlidingBox[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(jrb_seg7_collision_floating_box),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_jrb_sliding_box_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 23D0
const BehaviorScript bhvShipPart3[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_ship_part_3_loop),
    END_LOOP(),
};

// 23EC
const BehaviorScript bhvInSunkenShip3[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(jrb_seg7_collision_in_sunken_ship_3),
    OBJ_SET_POS(),
    OBJ_SET_FLOAT(oCollisionDistance, 0x0FA0),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_ship_part_3_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 241C
const BehaviorScript bhvSunkenShipPart[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    SCALE(50),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_sunken_ship_part_loop),
    END_LOOP(),
};

// 243C
const BehaviorScript bhvUnused243C[] = {
    OBJ_SET_INT(oFaceAnglePitch, 0xE958),
    OBJ_SET_INT(oFaceAngleYaw, 0xEE6C),
    OBJ_SET_INT(oFaceAngleRoll, 0x0C80),
    RETURN(),
};

// 244C
const BehaviorScript bhvSunkenShipPart2[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    SCALE(100),
    OBJ_SET_FLOAT(oDrawingDistance, 0x1770),
    OBJ_SET_POS(),
    CALL(bhvUnused243C),
    BREAK(),
};

// 246C
const BehaviorScript bhvInSunkenShip[] = {
    BEGIN(OBJ_LIST_SURFACE),
    COLLISION_DATA(jrb_seg7_collision_in_sunken_ship),
    GOTO(bhvInSunkenShip2 + 1 + 2),
};

// 2480
const BehaviorScript bhvInSunkenShip2[] = {
    BEGIN(OBJ_LIST_SURFACE),
    COLLISION_DATA(jrb_seg7_collision_in_sunken_ship_2),
    // .LbhvInSunkenShip248C:
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_FLOAT(oCollisionDistance, 0x0FA0),
    CALL(bhvUnused243C),
    BEGIN_LOOP(),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 24AC
const BehaviorScript bhvMarioDustGenerator[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_BIT_CLEAR_INT32(oActiveParticleFlags, 0x00000001),
    GRAPH_CLEAR(),
    OBJ_CHILD(MODEL_MIST, bhvWhitePuff1),
    OBJ_CHILD(MODEL_SMOKE, bhvWhitePuff2),
    DELAY(1),
    DEACTIVATE(),
};

// 24DC
const BehaviorScript bhvWhitePuff1[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_BIT_CLEAR_INT32(oActiveParticleFlags, 0x00000001),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_white_puff_1_loop),
    END_LOOP(),
};

// 2500
const BehaviorScript bhvWhitePuff2[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    OBJ_SET_INT(oAnimState, -1),
    BEGIN_REPEAT(7),
        CALLNATIVE(bhv_white_puff_2_loop),
        OBJ_ADD_INT(oAnimState, 1),
    END_REPEAT(),
    DEACTIVATE(),
};

// 2528
const BehaviorScript bhvWhitePuffSmoke2[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    OBJ_SET_INT(oAnimState, -1),
    BEGIN_REPEAT(7),
        CALLNATIVE(bhv_white_puff_2_loop),
        CALLNATIVE(obj_move_using_fvel_and_gravity),
        OBJ_ADD_INT(oAnimState, 1),
    END_REPEAT(),
    DEACTIVATE(),
};

// 2558
const BehaviorScript bhvPurpleSwitchHiddenBoxes[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_SET_INT(oBehParams2ndByte, 2),
    GOTO(bhvFloorSwitchHardcodedModel + 1),
};

// 2568
const BehaviorScript bhvBlueCoinSwitch[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(blue_coin_switch_seg8_collision_08000E98),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_blue_coin_switch_loop),
    END_LOOP(),
};

// 2588
const BehaviorScript bhvHiddenBlueCoin[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_SET_INT(oInteractType, 0x10),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    SET_HITBOX(0x0064, 0x0040),
    OBJ_SET_INT(oDamageOrCoinValue, 0x0005),
    OBJ_SET_INT(oIntangibleTimer, 0),
    OBJ_SET_INT(oAnimState, -1),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_hidden_blue_coin_loop),
        OBJ_ADD_INT(oAnimState, 1),
    END_LOOP(),
};

// 25C0
const BehaviorScript bhvOpenableCageDoor[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_openable_cage_door_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 25E0
const BehaviorScript bhvOpenableGrill[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_openable_grill_loop),
    END_LOOP(),
};

// 25F8
const BehaviorScript bhvWaterLevelDiamond[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    SET_HITBOX(0x0046, 0x001E),
    OBJ_SET_FLOAT(oCollisionDistance, 0x00C8),
    OBJ_SET_INT(oIntangibleTimer, 0),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_water_level_diamond_loop),
    END_LOOP(),
};

// 2620
const BehaviorScript bhvInitializeChangingWaterLevel[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_init_changing_water_level_loop),
    END_LOOP(),
};

// 2634
const BehaviorScript bhvTornadoSandParticle[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_tweester_sand_particle_loop),
    END_LOOP(),
};

// 2650
const BehaviorScript bhvTornado[] = {
    BEGIN(OBJ_LIST_POLELIKE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    GRAVITY(0x001E, 0xFE70, 0x0000, 0x0000, 0x0000, 0x00C8, 0x0000, 0x0000),
    DROP_FLOOR(),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_tweester_loop),
    END_LOOP(),
};

// 2684
const BehaviorScript bhvMerryGoRoundBooManager[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_merry_go_round_boo_manager_loop),
    END_LOOP(),
};

// 269C
const BehaviorScript bhvAnimatedTexture[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    GRAVITY(0x001E, 0xFE70, 0xFFBA, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    BILLBOARD(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_animated_texture_loop),
        OBJ_ADD_INT(oAnimState, 1),
        TEXT_ANIM_RATE(oAnimState, 0x0002),
    END_LOOP(),
};

// 26D4
const BehaviorScript bhvBooInCastle[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_POS(),
    OBJ_SET_FLOAT(oGraphYOffset, 0x003C),
    GRAVITY(0x001E, 0x0000, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    CALLNATIVE(bhv_init_room),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_boo_in_castle_loop),
    END_LOOP(),
};

// 2710
const BehaviorScript bhvBooWithCage[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_POS(),
    OBJ_SET_INT(oDamageOrCoinValue, 3),
    OBJ_SET_FLOAT2(0x0050, 0x0078),
    SET_HITBOX(0x00B4, 0x008C),
    OBJ_SET_FLOAT(oGraphYOffset, 0x003C),
    GRAVITY(0x001E, 0x0000, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    CALLNATIVE(bhv_boo_with_cage_init),
    CALLNATIVE(bhv_init_room),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_boo_with_cage_loop),
    END_LOOP(),
};

// 2768
const BehaviorScript bhvBalconyBigBoo[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_SET_INT(oBehParams2ndByte, 2),
    OBJ_SET_INT(oBigBooNumMinionBoosKilled, 10),
    GOTO(bhvGhostHuntBigBoo + 1),
};

// 277C
const BehaviorScript bhvMerryGoRoundBigBoo[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_SET_INT(oBehParams2ndByte, 1),
    // Set number of minion boos killed to 10, which is greater than 5 so that the boo always loads without needing to kill any boos.
    OBJ_SET_INT(oBigBooNumMinionBoosKilled, 10),
    GOTO(bhvGhostHuntBigBoo + 1),
};

// 2790
const BehaviorScript bhvGhostHuntBigBoo[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    // common_big_boo_bhv:
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_POS(),
    GRAVITY(0x001E, 0x0000, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    CALLNATIVE(bhv_init_room),
    CALLNATIVE(bhv_boo_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_big_boo_loop),
    END_LOOP(),
};

// 27D0
const BehaviorScript bhvCourtyardBooTriplet[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    GRAPH_CLEAR(),
    CALLNATIVE(bhv_courtyard_boo_triplet_init),
    DEACTIVATE(),
};

// 27E4
const BehaviorScript bhvBoo[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_SET_INT(oBehParams2ndByte, 1),
    GOTO(bhvGhostHuntBoo + 1),
};

// 27F4
const BehaviorScript bhvMerryGoRoundBoo[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_SET_INT(oBehParams2ndByte, 2),
    GOTO(bhvGhostHuntBoo + 1),
};

// 2804
const BehaviorScript bhvGhostHuntBoo[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    // common_boo_bhv: # 2808
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_INT(oIntangibleTimer, 0),
    OBJ_SET_POS(),
    OBJ_SET_INT(oDamageOrCoinValue, 2),
    SET_HITBOX(0x008C, 0x0050),
    OBJ_SET_FLOAT2(0x0028, 0x003C),
    OBJ_SET_FLOAT(oGraphYOffset, 30),
    CALLNATIVE(bhv_init_room),
    OBJ_CHILD(MODEL_YELLOW_COIN, bhvCoinInsideBoo),
    GRAVITY(0x001E, 0x0000, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    CALLNATIVE(bhv_boo_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_boo_loop),
    END_LOOP(),
};

// 286C
const BehaviorScript bhvHiddenStaircaseStep[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(bbh_seg7_collision_staircase_step),
    OBJ_SET_INT(oRoom, 0x0001),
    OBJ_SET_FLOAT(oCollisionDistance, 0x03E8),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 2898
const BehaviorScript bhvBooBossSpawnedBridge[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(bbh_seg7_collision_staircase_step),
    OBJ_SET_INT(oRoom, 0x0001),
    OBJ_SET_FLOAT(oCollisionDistance, 0x03E8),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_boo_boss_spawned_bridge_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 28CC
const BehaviorScript bhvBbhTiltingTrapPlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(bbh_seg7_collision_tilt_floor_platform),
    OBJ_SET_POS(),
    OBJ_SET_INT(oRoom, 0x0002),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_bbh_tilting_trap_platform_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 28FC
const BehaviorScript bhvHauntedBookshelf[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(bbh_seg7_collision_haunted_bookshelf),
    OBJ_SET_POS(),
    OBJ_SET_INT(oRoom, 0x0006),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_haunted_bookshelf_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 292C
const BehaviorScript bhvMeshElevator[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(bbh_seg7_collision_mesh_elevator),
    OBJ_SET_POS(),
    OBJ_SET_INT(oRoom, 0x000C),
    OBJ_SET_INT(oBehParams2ndByte, 0x0004),
    CALLNATIVE(bhv_elevator_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_elevator_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 2968
const BehaviorScript bhvMerryGoRound[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(bbh_seg7_collision_merry_go_round),
    OBJ_SET_FLOAT(oCollisionDistance, 0x07D0),
    OBJ_SET_INT(oRoom, 0x000A),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_merry_go_round_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

#ifndef VERSION_JP
// 2998
const BehaviorScript bhvPlaysMusicTrackWhenTouched[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_play_music_track_when_touched_loop),
    END_LOOP(),
};
#endif

// 2998
const BehaviorScript bhvInsideCannon[] = {
    BREAK(),
};

// 299C
const BehaviorScript bhvBetaBowserAnchor[] = {
    BEGIN(OBJ_LIST_DESTRUCTIVE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    OBJ_SET_POS(),
    SET_HITBOX(0x0064, 0x012C),
    OBJ_SET_INT(oIntangibleTimer, 0),
    BEGIN_LOOP(),
        OBJ_ADD_INT(oAnimState, 1),
        CALLNATIVE(bhv_beta_bowser_anchor_loop),
    END_LOOP(),
};

// 29CC
const BehaviorScript bhvStaticCheckeredPlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(checkerboard_platform_seg8_collision_0800D710),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_static_checkered_platform_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 29F8
const BehaviorScript bhvUnused2A10[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    BILLBOARD(),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BREAK(),
};

// 2A08
const BehaviorScript bhvUnusedFakeStar[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BEGIN_LOOP(),
        OBJ_ADD_INT(oFaceAnglePitch, 256),
        OBJ_ADD_INT(oFaceAngleYaw, 256),
    END_LOOP(),
};

// What is this?
static const BehaviorScript unused_1[] = {
    BREAK(),
    BREAK(),
    BREAK(),
    BREAK(),
};

// 2A30
const BehaviorScript bhvStaticObject[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BREAK(),
};

// 2A3C
const BehaviorScript bhvUnused2A54[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    BREAK(),
};

// 2A44
const BehaviorScript bhvCastleFloorTrap[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    GRAPH_CLEAR(),
    CALLNATIVE(bhv_castle_floor_trap_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_castle_floor_trap_loop),
    END_LOOP(),
};

// 2A64
const BehaviorScript bhvFloorTrapInCastle[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(inside_castle_seg7_collision_floor_trap),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_floor_trap_in_castle_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 2A8C
const BehaviorScript bhvTree[] = {
    BEGIN(OBJ_LIST_POLELIKE),
    BILLBOARD(),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_INT(oInteractType, 0x40),
    SET_HITBOX(0x0050, 0x01F4),
    OBJ_SET_INT(oIntangibleTimer, 0),
    BEGIN_LOOP(),
        CALLNATIVE(BehClimbDetectLoop),
    END_LOOP(),
};

// 2AB8
const BehaviorScript bhvSparkle[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    BILLBOARD(),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_INT(oAnimState, -1),
    BEGIN_REPEAT(9),
        OBJ_ADD_INT(oAnimState, 1),
    END_REPEAT(),
    DEACTIVATE(),
};

// 2AD8
const BehaviorScript bhvSparkleSpawn[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_sparkle_spawn_loop),
    END_LOOP(),
};

// 2AF0
const BehaviorScript bhvSpecialTripleJumpSparkles[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_BIT_CLEAR_INT32(oActiveParticleFlags, 0x00000008),
    BEGIN(OBJ_LIST_UNIMPORTANT),
    BILLBOARD(),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_FLOAT(oGraphYOffset, 25),
    OBJ_SET_FLOAT_RAND(oMarioParticleFlags, 0xFFCE, 0x0064),
    OBJ_SUM_FLOAT(oPosX, oPosX, oMarioParticleFlags),
    OBJ_SET_FLOAT_RAND(oMarioParticleFlags, 0xFFCE, 0x0064),
    OBJ_SUM_FLOAT(oPosZ, oPosZ, oMarioParticleFlags),
    OBJ_SET_FLOAT_RAND(oMarioParticleFlags, 0xFFCE, 0x0064),
    OBJ_SUM_FLOAT(oPosY, oPosY, oMarioParticleFlags),
    OBJ_SET_INT(oAnimState, -1),
    BEGIN_REPEAT(12),
        OBJ_ADD_INT(oAnimState, 1),
    END_REPEAT(),
    DEACTIVATE(),
};

// 2B44
const BehaviorScript bhvScuttlebug[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, scuttlebug_seg6_anims_06015064),
    ANIMATE(0x00),
    GRAVITY(0x0050, 0xFE70, 0xFFCE, 0x0000, 0x0000, 0x00C8, 0x0000, 0x0000),
    OBJ_SET_POS(),
    CALLNATIVE(bhv_init_room),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_scuttlebug_loop),
    END_LOOP(),
};

// 2B88
const BehaviorScript bhvScuttlebugSpawn[] = {
    BEGIN(OBJ_LIST_SPAWNER),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_scuttlebug_spawn_loop),
    END_LOOP(),
};

// 2BA0
const BehaviorScript bhvWhompKingBoss[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_SET_INT(oBehParams2ndByte, 1),
    OBJ_SET_INT(oHealth, 0x0003),
    GOTO(bhvSmallWhomp + 1 + 1),
};

// 2BB4
const BehaviorScript bhvSmallWhomp[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_SET_INT(oNumLootCoins, 5),
    // .Lbeh_whomp_2BD4:
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, whomp_seg6_anims_06020A04),
    COLLISION_DATA(whomp_seg6_collision_06020A0C),
    ANIMATE(0x00),
    GRAVITY(0x0000, 0xFE70, 0xFFCE, 0x0000, 0x0000, 0x00C8, 0x0000, 0x0000),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_whomp_loop),
    END_LOOP(),
};

// 2BFC
const BehaviorScript bhvWaterSplash[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    OBJ_SET_INT(oAnimState, -1),
    BEGIN_REPEAT(3),
        OBJ_ADD_INT(oAnimState, 1),
        CALLNATIVE(bhv_water_splash_loop),
        DELAY(1),
        CALLNATIVE(bhv_water_splash_loop),
    END_REPEAT(),
    BEGIN_REPEAT(5),
        OBJ_ADD_INT(oAnimState, 1),
        DELAY(1),
    END_REPEAT(),
    OBJ_BIT_CLEAR_INT32(oActiveParticleFlags, 0x00000040),
    DEACTIVATE(),
};

// 2C48
const BehaviorScript bhvWaterDrops[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_water_drops_loop),
    END_LOOP(),
};

// 2C64
const BehaviorScript bhvWaterSurfaceWhiteWave[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
#ifndef VERSION_JP
    OBJ_SET_INT(oFaceAnglePitch, 0),
    OBJ_SET_INT(oFaceAngleYaw, 0),
    OBJ_SET_INT(oFaceAngleRoll, 0),
#endif
    CALLNATIVE(bhv_water_surface_white_wave_init),
    OBJ_ADD_FLOAT(oPosY, 5),
    OBJ_SET_INT(oAnimState, -1),
    BEGIN_REPEAT(6),
        OBJ_ADD_INT(oAnimState, 1),
    END_REPEAT(),
    DEACTIVATE(),
};

// 2C8C
const BehaviorScript bhvObjectBubbleRipples[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
#ifdef VERSION_JP
    OBJ_SET_FLOAT(oFaceAnglePitch, 0),
    OBJ_SET_FLOAT(oFaceAngleYaw, 0),
    OBJ_SET_FLOAT(oFaceAngleRoll, 0),
#endif
#ifndef VERSION_JP
    OBJ_SET_INT(oFaceAnglePitch, 0),
    OBJ_SET_INT(oFaceAngleYaw, 0),
    OBJ_SET_INT(oFaceAngleRoll, 0),
#endif
    OBJ_SET_INT(oAnimState, -1),
    CALLNATIVE(bhv_object_bubble_ripples_init),
    BEGIN_REPEAT(6),
        OBJ_ADD_INT(oAnimState, 1),
    END_REPEAT(),
    DEACTIVATE(),
};

// 2CBC
const BehaviorScript bhvSurfaceWaves[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
#ifdef VERSION_JP
    OBJ_SET_FLOAT(oFaceAnglePitch, 0),
    OBJ_SET_FLOAT(oFaceAngleYaw, 0),
    OBJ_SET_FLOAT(oFaceAngleRoll, 0),
#endif
#ifndef VERSION_JP
    OBJ_SET_INT(oFaceAnglePitch, 0),
    OBJ_SET_INT(oFaceAngleYaw, 0),
    OBJ_SET_INT(oFaceAngleRoll, 0),
#endif
    OBJ_SET_INT(oAnimState, -1),
    OBJ_ADD_INT(oAnimState, 1),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_surface_waves_loop),
        OBJ_ADD_INT(oAnimState, 1),
        BEGIN_REPEAT(6),
            CALLNATIVE(bhv_surface_waves_loop),
        END_REPEAT(),
        CALLNATIVE(bhv_surface_waves_loop),
    END_LOOP(),
};

// 2D04
const BehaviorScript bhvWaterSurfaceWhiteWave2[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
#ifdef VERSION_JP
    OBJ_SET_FLOAT(oFaceAnglePitch, 0),
    OBJ_SET_FLOAT(oFaceAngleYaw, 0),
    OBJ_SET_FLOAT(oFaceAngleRoll, 0),
#endif
#ifndef VERSION_JP
    OBJ_SET_INT(oFaceAnglePitch, 0),
    OBJ_SET_INT(oFaceAngleYaw, 0),
    OBJ_SET_INT(oFaceAngleRoll, 0),
#endif
    OBJ_SET_INT(oAnimState, -1),
    BEGIN_REPEAT(6),
        OBJ_ADD_INT(oAnimState, 1),
    END_REPEAT(),
    DEACTIVATE(),
};

// 2D2C
const BehaviorScript bhvWavesGenerator[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    GRAPH_CLEAR(),
    BEGIN_REPEAT(5),
        SPAWN_ADDR(&D_8032FE18),
    END_REPEAT_NOBREAK(),
    DELAY(1),
    OBJ_BIT_CLEAR_INT32(oActiveParticleFlags, 0x00000100),
    DEACTIVATE(),
};

// 2D58
const BehaviorScript bhvSurfaceWaveShrinking[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    GRAPH_CLEAR(),
    BEGIN_REPEAT(18),
        SPAWN_ADDR(&D_8032FDD0),
    END_REPEAT_NOBREAK(),
    CALLNATIVE(bhv_surface_wave_shrinking_init),
    DELAY(1),
    OBJ_BIT_CLEAR_INT32(oActiveParticleFlags, 0x00001000),
    DEACTIVATE(),
};

// 2D8C
const BehaviorScript bhvWaterType[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    GOTO(bhvWaveTrailOnSurface + 1 + 1 + 2),
};

// 2D9C
const BehaviorScript bhvWaveTrailOnSurface[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_BIT_CLEAR_INT32(oActiveParticleFlags, 0x00000400),
    // .Lbeh_wave_trail_2DD0: # 2DAC
    OBJ_SET_FLOAT(oFaceAnglePitch, 0),
    OBJ_SET_FLOAT(oFaceAngleYaw, 0),
    OBJ_SET_FLOAT(oFaceAngleRoll, 0),
    OBJ_SET_INT(oAnimState, -1),
    BEGIN_REPEAT(8),
        OBJ_ADD_INT(oAnimState, 1),
        CALLNATIVE(bhv_wave_trail_loop),
        DELAY(1),
        CALLNATIVE(bhv_wave_trail_loop),
    END_REPEAT(),
    DEACTIVATE(),
};

// 2DE0
const BehaviorScript bhvTinyWhiteWindParticle[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_white_wind_particle_loop),
    END_LOOP(),
};

// 2DFC
const BehaviorScript bhvWindParticle[] = {
    BEGIN(OBJ_LIST_POLELIKE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_white_wind_particle_loop),
    END_LOOP(),
};

// 2E18
const BehaviorScript bhvSnowmanWindBlowing[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_snowman_wind_blowing_loop),
    END_LOOP(),
};

// 2E34
const BehaviorScript bhvWalkingPenguin[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(penguin_seg5_collision_05008B88),
    OBJ_SET_ANIMS(oAnimations, penguin_seg5_anims_05008B74),
    ANIMATE(0x00),
    GRAVITY(0x0000, 0xFE70, 0xFFCE, 0x0000, 0x0000, 0x00C8, 0x0000, 0x0000),
    SCALE(600),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_walking_penguin_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 2E84
const BehaviorScript bhvYellowBall[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    BREAK(),
};

UNUSED static const u64 behavior_data_unused_0 = 0;
// 2EA0
const BehaviorScript bhvMario[] = {
    BEGIN(OBJ_LIST_PLAYER),
    OBJ_SET_INT(oIntangibleTimer, 0),
    OBJ_OR_INT(oFlags, OBJ_FLAG_0100),
    OBJ_OR_INT(oUnk94, 0x0001),
    SET_HITBOX(0x0025, 0x00A0),
    BEGIN_LOOP(),
        CALLNATIVE(try_print_debug_mario_level_info),
        CALLNATIVE(bhv_mario_update),
        CALLNATIVE(try_do_mario_debug_object_spawn),
    END_LOOP(),
};

// 2ED8
const BehaviorScript bhvToadMessage[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_PERSISTENT_RESPAWN | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, toad_seg6_anims_0600FB58),
    ANIMATE(0x06),
    INTERACT_TYPE(INTERACT_TEXT),
    SET_HITBOX(0x0050, 0x0064),
    OBJ_SET_INT(oIntangibleTimer, 0),
    CALLNATIVE(bhv_init_room),
    CALLNATIVE(bhvToadMessage_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhvToadMessage_loop),
    END_LOOP(),
};

// 2F20
const BehaviorScript bhvUnlockDoorStar[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    CALLNATIVE(bhvUnlockDoorStar_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhvUnlockDoorStar_loop),
    END_LOOP(),
};

// 2F40
const BehaviorScript bhvWarps60[] = {
    BREAK(),
};

// 2F44
const BehaviorScript bhvWarps64[] = {
    BREAK(),
};

// 2F48
const BehaviorScript bhvWarps68[] = {
    BREAK(),
};

// 2F4C
const BehaviorScript bhvWarps6C[] = {
    BREAK(),
};

// 2F50
const BehaviorScript bhvWarps70[] = {
    BREAK(),
};

// 2F54
const BehaviorScript bhvWarps74[] = {
    BREAK(),
};

// 2F58
const BehaviorScript bhvWarps78[] = {
    BREAK(),
};

// 2F5C
const BehaviorScript bhvWarps7C[] = {
    BREAK(),
};

// 2F60
const BehaviorScript bhvWarps80[] = {
    BREAK(),
};

// 2F64
const BehaviorScript bhvWarps84[] = {
    BREAK(),
};

// 2F68
const BehaviorScript bhvWarps88[] = {
    BREAK(),
};

// 2F6C
const BehaviorScript bhvWarps8C[] = {
    BREAK(),
};

// 2F70
const BehaviorScript bhvWarps90[] = {
    BREAK(),
};

// 2F74
const BehaviorScript bhvWarps94[] = {
    BREAK(),
};

UNUSED static const u64 behavior_data_unused_1 = 0;
// 2F80
const BehaviorScript bhvRandomAnimatedTexture[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_FLOAT(oGraphYOffset, 0xFFF0),
    BILLBOARD(),
    OBJ_SET_INT(oAnimState, -1),
    BEGIN_LOOP(),
        OBJ_ADD_INT(oAnimState, 1),
    END_LOOP(),
};

// 2FA0
const BehaviorScript bhvYellowBackgroundInMenu[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    CALLNATIVE(beh_yellow_background_menu_init),
    BEGIN_LOOP(),
        OBJ_SET_INT(oIntangibleTimer, 0),
        CALLNATIVE(beh_yellow_background_menu_loop),
    END_LOOP(),
};

// 2FC4
const BehaviorScript bhvMenuButton[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    CALLNATIVE(bhv_menu_button_init),
    BEGIN_LOOP(),
        OBJ_SET_INT(oIntangibleTimer, 0),
        CALLNATIVE(bhv_menu_button_loop),
    END_LOOP(),
};

// 2FE8
const BehaviorScript bhvMenuButtonManager[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_0800 | OBJ_FLAG_0020 | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    CALLNATIVE(bhv_menu_button_manager_init),
    BEGIN_LOOP(),
        OBJ_SET_INT(oIntangibleTimer, 0),
        CALLNATIVE(bhv_menu_button_manager_loop),
    END_LOOP(),
};

// 300C
const BehaviorScript bhvActSelectorStarType[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_act_selector_star_type_loop),
    END_LOOP(),
};

// 3028
const BehaviorScript bhvActSelector[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    CALLNATIVE(bhv_act_selector_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_act_selector_loop),
    END_LOOP(),
};

// 3048
const BehaviorScript bhvMovingYellowCoin[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    SET_HITBOX(0x0064, 0x0040),
    OBJ_SET_INT(oInteractType, 0x10),
    OBJ_SET_INT(oIntangibleTimer, 0),
    OBJ_SET_INT(oAnimState, -1),
    CALLNATIVE(bhv_moving_yellow_coin_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_moving_yellow_coin_loop),
        OBJ_ADD_INT(oAnimState, 1),
    END_LOOP(),
};

// 3084
const BehaviorScript bhvMovingBlueCoin[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    OBJ_SET_INT(oIntangibleTimer, 0),
    OBJ_SET_INT(oAnimState, -1),
    CALLNATIVE(bhv_moving_blue_coin_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_moving_blue_coin_loop),
        OBJ_ADD_INT(oAnimState, 1),
    END_LOOP(),
};

// 30B4
const BehaviorScript bhvBlueCoinSliding[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    OBJ_SET_INT(oIntangibleTimer, 0),
    OBJ_SET_INT(oAnimState, -1),
    CALLNATIVE(bhv_blue_coin_sliding_jumping_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_blue_coin_sliding_loop),
        OBJ_ADD_INT(oAnimState, 1),
    END_LOOP(),
};

// 30E4
const BehaviorScript bhvBlueCoinJumping[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    OBJ_SET_INT(oIntangibleTimer, 0),
    OBJ_SET_INT(oAnimState, -1),
    CALLNATIVE(bhv_blue_coin_sliding_jumping_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_blue_coin_jumping_loop),
        OBJ_ADD_INT(oAnimState, 1),
    END_LOOP(),
};

// 3114
const BehaviorScript bhvSeaweed[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_ANIMS(oAnimations, seaweed_seg6_anims_0600A4D4),
    ANIMATE(0x00),
    CALLNATIVE(bhv_seaweed_init),
    BEGIN_LOOP(),
    END_LOOP(),
};

// 3138
const BehaviorScript bhvSeaweedBundle[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    DROP_FLOOR(),
    CALLNATIVE(bhv_seaweed_bundle_init),
    BEGIN_LOOP(),
    END_LOOP(),
};

// 3154
const BehaviorScript bhvBobomb[] = {
    BEGIN(OBJ_LIST_DESTRUCTIVE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_PERSISTENT_RESPAWN | OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_HOLDABLE | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, bobomb_seg8_anims_0802396C),
    DROP_FLOOR(),
    ANIMATE(0x00),
    OBJ_SET_INT(oIntangibleTimer, 0),
    OBJ_SET_POS(),
    CALLNATIVE(bhv_bobomb_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_bobomb_loop),
    END_LOOP(),
};

// 318C
const BehaviorScript bhvBobombFuseSmoke[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    OBJ_SET_INT(oAnimState, -1),
    CALLNATIVE(bhv_bobomb_fuse_smoke_init),
    DELAY(1),
    BEGIN_LOOP(),
        CALLNATIVE(BehDustSmokeLoop),
        OBJ_ADD_INT(oAnimState, 1),
    END_LOOP(),
};

// 31BC
const BehaviorScript bhvBobombBuddy[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_HOLDABLE | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, bobomb_seg8_anims_0802396C),
    INTERACT_TYPE(INTERACT_TEXT),
    DROP_FLOOR(),
    SET_HITBOX(0x0064, 0x003C),
    ANIMATE(0x00),
    OBJ_SET_INT(oBobombBuddyRole, 0x0000),
    OBJ_SET_POS(),
    CALLNATIVE(bhv_bobomb_buddy_init),
    BEGIN_LOOP(),
        OBJ_SET_INT(oIntangibleTimer, 0),
        CALLNATIVE(bhv_bobomb_buddy_loop),
    END_LOOP(),
};

// The only difference between this and the previous behavior are what objFlags and objVarFC are set to, why didn't they just use a jump?
// 3208
const BehaviorScript bhvBobombBuddyOpensCannon[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_PERSISTENT_RESPAWN | OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_HOLDABLE | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, bobomb_seg8_anims_0802396C),
    INTERACT_TYPE(INTERACT_TEXT),
    DROP_FLOOR(),
    SET_HITBOX(0x0064, 0x003C),
    ANIMATE(0x00),
    OBJ_SET_INT(oBobombBuddyRole, 0x0001),
    OBJ_SET_POS(),
    CALLNATIVE(bhv_bobomb_buddy_init),
    BEGIN_LOOP(),
        OBJ_SET_INT(oIntangibleTimer, 0),
        CALLNATIVE(bhv_bobomb_buddy_loop),
    END_LOOP(),
};

// 3254
const BehaviorScript bhvCannonClosed[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_PERSISTENT_RESPAWN | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(cannon_lid_seg8_collision_08004950),
    OBJ_SET_POS(),
    CALLNATIVE(bhv_cannon_closed_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_cannon_closed_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 3288
const BehaviorScript bhvWhirlpool[] = {
    BEGIN(OBJ_LIST_POLELIKE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    CALLNATIVE(bhv_whirlpool_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_whirlpool_loop),
    END_LOOP(),
};

// 32A8
const BehaviorScript bhvJetStream[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_jet_stream_loop),
    END_LOOP(),
};

// 32C0
const BehaviorScript bhvMessagePanel[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(wooden_signpost_seg3_collision_0302DD80),
    INTERACT_TYPE(INTERACT_TEXT),
    OBJ_SET_INT(oInteractionSubtype, 0x1000),
    DROP_FLOOR(),
    SET_HITBOX(0x0096, 0x0050),
    OBJ_SET_INT(oWoodenPostTotalMarioAngle, 0),
    BEGIN_LOOP(),
        OBJ_SET_INT(oIntangibleTimer, 0),
        CALLNATIVE(load_object_collision_model),
        OBJ_SET_INT(oInteractStatus, 0),
    END_LOOP(),
};

// 3304
const BehaviorScript bhvSignOnWall[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    INTERACT_TYPE(INTERACT_TEXT),
    OBJ_SET_INT(oInteractionSubtype, 0x1000),
    SET_HITBOX(0x0096, 0x0050),
    OBJ_SET_INT(oWoodenPostTotalMarioAngle, 0),
    BEGIN_LOOP(),
        OBJ_SET_INT(oIntangibleTimer, 0),
        OBJ_SET_INT(oInteractStatus, 0),
    END_LOOP(),
};

// 3334
const BehaviorScript bhvHomingAmp[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, amp_seg8_anims_08004034),
    ANIMATE(0x00),
    OBJ_SET_FLOAT(oGraphYOffset, 0x0028),
    OBJ_SET_INT(oIntangibleTimer, 0),
    CALLNATIVE(bhv_homing_amp_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_homing_amp_loop),
    END_LOOP(),
};

// 3368
const BehaviorScript bhvCirclingAmp[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, amp_seg8_anims_08004034),
    ANIMATE(0x00),
    OBJ_SET_FLOAT(oGraphYOffset, 0x0028),
    OBJ_SET_INT(oIntangibleTimer, 0),
    CALLNATIVE(bhv_circling_amp_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_circling_amp_loop),
    END_LOOP(),
};

// 339C
const BehaviorScript bhvButterfly[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, butterfly_seg3_anims_030056B0),
    DROP_FLOOR(),
    OBJ_SET_FLOAT(oGraphYOffset, 0x0005),
    CALLNATIVE(bhv_butterfly_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_butterfly_loop),
    END_LOOP(),
};

// 33CC
const BehaviorScript bhvHoot[] = {
    BEGIN(OBJ_LIST_POLELIKE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, hoot_seg5_anims_05005768),
    OBJ_SET_INT(oInteractType, 0x01),
    SET_HITBOX(0x004B, 0x004B),
    CALLNATIVE(bhv_hoot_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_hoot_loop),
    END_LOOP(),
};

// 3400
const BehaviorScript bhvBetaHoldableObject[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_HOLDABLE | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_INT(oInteractType, 0x02), // INTERACT_GRABBABLE
    DROP_FLOOR(),
    SET_HITBOX(0x0028, 0x0032),
    CALLNATIVE(bhv_beta_holdable_object_init),
    BEGIN_LOOP(),
        OBJ_SET_INT(oIntangibleTimer, 0),
        CALLNATIVE(bhv_beta_holdable_object_loop),
    END_LOOP(),
};

// 3434
const BehaviorScript bhvCarrySomething1[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    BREAK(),
};

// 343C
const BehaviorScript bhvCarrySomething2[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    BREAK(),
};

// 3444
const BehaviorScript bhvCarrySomething3[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    BREAK(),
};

// 344C
const BehaviorScript bhvCarrySomething4[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    BREAK(),
};

// 3454
const BehaviorScript bhvCarrySomething5[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    BREAK(),
};

// 345C
const BehaviorScript bhvCarrySomething6[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    BREAK(),
};

// 3464
const BehaviorScript bhvObjectBubble[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_MOVE_Y_WITH_TERMINAL_VEL | OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_INT(oAnimState, -1),
    CALLNATIVE(bhv_object_bubble_init),
    OBJ_SET_FLOAT_RAND(oVelY, 0x0003, 0x0006),
    OBJ_SET_INT_RAND_RSHIFT(oMoveAngleYaw, 0x0000, 0x0000),
    DELAY(1),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_object_bubble_loop),
    END_LOOP(),
};

// 34A4
const BehaviorScript bhvObjectWaterWave[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_FLOAT(oFaceAnglePitch, 0),
    OBJ_SET_FLOAT(oFaceAngleYaw, 0),
    OBJ_SET_FLOAT(oFaceAngleRoll, 0),
    OBJ_SET_INT(oAnimState, -1),
    CALLNATIVE(bhv_object_water_wave_init),
    OBJ_ADD_INT(oAnimState, 1),
    DELAY(6),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_object_water_wave_loop),
        OBJ_ADD_INT(oAnimState, 1),
    BEGIN_REPEAT(6),
        CALLNATIVE(bhv_object_water_wave_loop),
    END_REPEAT(),
    END_LOOP(),
};

// 34F0
const BehaviorScript bhvExplosion[] = {
    BEGIN(OBJ_LIST_DESTRUCTIVE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    INTERACT_TYPE(INTERACT_DAMAGE),
    OBJ_SET_INT(oDamageOrCoinValue, 2),
    OBJ_SET_INT(oIntangibleTimer, 0),
    COLLISION_SPHERE(0x0096, 0x0096, 0x0096),
    OBJ_SET_INT(oAnimState, -1),
    CALLNATIVE(bhv_explosion_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_explosion_loop),
        OBJ_ADD_INT(oAnimState, 1),
    END_LOOP(),
};

// 3538
const BehaviorScript bhvBobombBullyDeathSmoke[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_MOVE_Y_WITH_TERMINAL_VEL | OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    OBJ_SET_INT(oAnimState, -1),
    CALLNATIVE(bhv_bobomb_bully_death_smoke_init),
    DELAY(1),
    BEGIN_LOOP(),
        CALLNATIVE(BehDustSmokeLoop),
        OBJ_ADD_INT(oAnimState, 1),
    END_LOOP(),
};

// 3568
const BehaviorScript bhvSmoke[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_MOVE_Y_WITH_TERMINAL_VEL | OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    OBJ_SET_INT(oAnimState, -1),
    DELAY(1),
    BEGIN_LOOP(),
        CALLNATIVE(BehDustSmokeLoop),
        OBJ_ADD_INT(oAnimState, 1),
    END_LOOP(),
};

// 3590
const BehaviorScript bhvBobombExplosionBubble[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    BILLBOARD(),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    CALLNATIVE(bhv_bobomb_explosion_bubble_init),
    OBJ_ADD_FLOAT_RAND(oPosX, -50, 100),
    OBJ_ADD_FLOAT_RAND(oPosY, -50, 100),
    OBJ_ADD_FLOAT_RAND(oPosZ, -50, 100),
    CALL(bhvBobombExplosionBubble3600),
    DELAY(1),
    BEGIN_LOOP(),
        CALL(bhvBobombExplosionBubble3600),
        CALLNATIVE(bhv_bobomb_explosion_bubble_loop),
    END_LOOP(),
};

// 35E0
const BehaviorScript bhvBobombExplosionBubble3600[] = {
    OBJ_ADD_FLOAT_RAND(oPosX, -2, 4),
    OBJ_ADD_FLOAT_RAND(oPosZ, -2, 4),
    RETURN(),
};

// 35F4
const BehaviorScript bhvRespawner[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_respawner_loop),
    END_LOOP(),
};

// 360C
const BehaviorScript bhvSmallBully[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, bully_seg5_anims_0500470C),
    DROP_FLOOR(),
    OBJ_SET_POS(),
    CALLNATIVE(bhv_small_bully_init),
    BEGIN_LOOP(),
        OBJ_SET_INT(oIntangibleTimer, 0),
        CALLNATIVE(bhv_bully_loop),
    END_LOOP(),
};

// 3640
const BehaviorScript bhvBigBully[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, bully_seg5_anims_0500470C),
    DROP_FLOOR(),
    OBJ_SET_POS(),
    CALLNATIVE(bhv_big_bully_init),
    BEGIN_LOOP(),
        OBJ_SET_INT(oIntangibleTimer, 0),
        CALLNATIVE(bhv_bully_loop),
    END_LOOP(),
};

// 3674
const BehaviorScript bhvBigBullyWithMinions[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, bully_seg5_anims_0500470C),
    OBJ_SET_POS(),
    CALLNATIVE(bhv_big_bully_init),
    CALLNATIVE(bhv_big_bully_with_minions_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_big_bully_with_minions_loop),
    END_LOOP(),
};

// 36A8
const BehaviorScript bhvSmallChillBully[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, chilly_chief_seg6_anims_06003994),
    DROP_FLOOR(),
    OBJ_SET_POS(),
    OBJ_SET_INT(oBullySubtype, 0x0010),
    CALLNATIVE(bhv_small_bully_init),
    BEGIN_LOOP(),
        OBJ_SET_INT(oIntangibleTimer, 0),
        CALLNATIVE(bhv_bully_loop),
    END_LOOP(),
};

// 36E0
const BehaviorScript bhvBigChillBully[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, chilly_chief_seg6_anims_06003994),
    DROP_FLOOR(),
    OBJ_SET_POS(),
    OBJ_SET_INT(oBullySubtype, 0x0010),
    CALLNATIVE(bhv_big_bully_init),
    BEGIN_LOOP(),
        OBJ_SET_INT(oIntangibleTimer, 0),
        CALLNATIVE(bhv_bully_loop),
    END_LOOP(),
};

// 3718
const BehaviorScript bhvJetStreamRingSpawner[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    UNHIDE(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_jet_stream_ring_spawner_loop),
    END_LOOP(),
};

// 3730
const BehaviorScript bhvJetStreamWaterRing[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_ANIMS(oAnimations, water_ring_seg6_anims_06013F7C),
    COLLISION_SPHERE(0x004B, 0x0014, 0x0014),
    INTERACT_TYPE(INTERACT_WATER_RING),
    OBJ_SET_INT(oDamageOrCoinValue, 2),
    OBJ_SET_INT(oIntangibleTimer, 0),
    CALLNATIVE(bhv_jet_stream_water_ring_init),
    BEGIN_LOOP(),
        OBJ_SET_INT(oIntangibleTimer, 0),
        CALLNATIVE(bhv_jet_stream_water_ring_loop),
    END_LOOP(),
};

// 3778
const BehaviorScript bhvMantaRayWaterRing[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_ANIMS(oAnimations, water_ring_seg6_anims_06013F7C),
    COLLISION_SPHERE(0x004B, 0x0014, 0x0014),
    INTERACT_TYPE(INTERACT_WATER_RING),
    OBJ_SET_INT(oDamageOrCoinValue, 2),
    OBJ_SET_INT(oIntangibleTimer, 0),
    CALLNATIVE(bhv_manta_ray_water_ring_init),
    BEGIN_LOOP(),
        OBJ_SET_INT(oIntangibleTimer, 0),
        CALLNATIVE(bhv_manta_ray_water_ring_loop),
    END_LOOP(),
};

// 37C0
const BehaviorScript bhvMantaRayRingManager[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    BEGIN_LOOP(),
    END_LOOP(),
};

// 37CC
const BehaviorScript bhvBowserBomb[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_INT(oIntangibleTimer, 0),
    COLLISION_SPHERE(0x0028, 0x0028, 0x0028),
    DELAY(1),
    BEGIN_LOOP(),
        OBJ_SET_INT(oIntangibleTimer, 0),
        CALLNATIVE(bhv_bowser_bomb_loop),
    END_LOOP(),
};

// 37FC
const BehaviorScript bhvBowserBombExplosion[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    OBJ_SET_FLOAT(oGraphYOffset, 0xFEE0),
    OBJ_SET_INT(oAnimState, -1),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_bowser_bomb_explosion_loop),
    END_LOOP(),
};

// 3820
const BehaviorScript bhvBowserBombSmoke[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    OBJ_SET_FLOAT(oGraphYOffset, 0xFEE0),
    OBJ_SET_INT(oOpacity, 0x00FF),
    OBJ_SET_INT(oAnimState, -1),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_bowser_bomb_smoke_loop),
    END_LOOP(),
};

// 3848
const BehaviorScript bhvCelebrationStar[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    CALLNATIVE(bhv_celebration_star_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_celebration_star_loop),
    END_LOOP(),
};

// 3868
const BehaviorScript bhvCelebrationStarSparkle[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    BILLBOARD(),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_FLOAT(oGraphYOffset, 25),
    OBJ_SET_INT(oAnimState, -1),
    BEGIN_LOOP(),
        OBJ_ADD_INT(oAnimState, 1),
        CALLNATIVE(bhv_celebration_star_sparkle_loop),
    END_LOOP(),
};

// 3890
const BehaviorScript bhvStarKeyCollectionPuffSpawner[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    BILLBOARD(),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_INT(oAnimState, -1),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_star_key_collection_puff_spawner_loop),
    END_LOOP(),
};

// 38B0
const BehaviorScript bhvLllDrawbridgeSpawner[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    UNHIDE(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_lll_drawbridge_spawner_loop),
    END_LOOP(),
};

// 38C8
const BehaviorScript bhvLllDrawbridge[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(lll_seg7_collision_drawbridge),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_lll_drawbridge_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 38F0
const BehaviorScript bhvSmallBomp[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(wf_seg7_collision_small_bomp),
    CALLNATIVE(bhv_small_bomp_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_small_bomp_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 3920
const BehaviorScript bhvLargeBomp[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(wf_seg7_collision_large_bomp),
    CALLNATIVE(bhv_large_bomp_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_large_bomp_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 3950
const BehaviorScript bhvWfSlidingPlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(wf_seg7_collision_sliding_brick_platform),
    CALLNATIVE(bhv_wf_sliding_platform_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_wf_sliding_platform_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 3980
const BehaviorScript bhvMoneybag[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, moneybag_seg6_anims_06005E5C),
    DROP_FLOOR(),
    OBJ_SET_POS(),
    OBJ_SET_INT(oIntangibleTimer, -1),
    CALLNATIVE(bhv_moneybag_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_moneybag_loop),
    END_LOOP(),
};

// 39B4
const BehaviorScript bhvMoneybagHidden[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_FLOAT(oGraphYOffset, 0x001B),
    BILLBOARD(),
    SET_HITBOX(0x006E, 0x0064),
    OBJ_SET_INT(oIntangibleTimer, 0),
    OBJ_SET_INT(oAnimState, -1),
    BEGIN_LOOP(),
        OBJ_ADD_INT(oAnimState, 1),
        CALLNATIVE(bhv_moneybag_hidden_loop),
    END_LOOP(),
};

// 39E8
const BehaviorScript bhvPitBowlingBall[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    OBJ_SET_FLOAT(oGraphYOffset, 130),
    CALLNATIVE(bhv_bob_pit_bowling_ball_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_bob_pit_bowling_ball_loop),
    END_LOOP(),
};

// 3A10
const BehaviorScript bhvFreeBowlingBall[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    OBJ_SET_FLOAT(oGraphYOffset, 130),
    CALLNATIVE(bhv_free_bowling_ball_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_free_bowling_ball_loop),
    END_LOOP(),
};

// 3A38
const BehaviorScript bhvBowlingBall[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    OBJ_SET_FLOAT(oGraphYOffset, 130),
    CALLNATIVE(bhv_bowling_ball_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_bowling_ball_loop),
    END_LOOP(),
};

// 3A60
const BehaviorScript bhvTtmBowlingBallSpawner[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_INT(oBBallSpawnerPeriodMinus1, 0x003F),
    CALLNATIVE(bhv_generic_bowling_ball_spawner_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_generic_bowling_ball_spawner_loop),
    END_LOOP(),
};

// 3A84
const BehaviorScript bhvBobBowlingBallSpawner[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_INT(oBBallSpawnerPeriodMinus1, 0x007F),
    CALLNATIVE(bhv_generic_bowling_ball_spawner_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_generic_bowling_ball_spawner_loop),
    END_LOOP(),
};

// 3AA8
const BehaviorScript bhvThiBowlingBallSpawner[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_thi_bowling_ball_spawner_loop),
    END_LOOP(),
};

// 3AC0
const BehaviorScript bhvRrCruiserWing[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    CALLNATIVE(bhv_rr_cruiser_wing_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_rr_cruiser_wing_loop),
    END_LOOP(),
};

// 3AE0
const BehaviorScript bhvSpindel[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_0010 | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(ssl_seg7_collision_spindel),
    CALLNATIVE(bhv_spindel_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_spindel_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 3B10
const BehaviorScript bhvSslMovingPyramidWall[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_0010 | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(ssl_seg7_collision_0702808C),
    CALLNATIVE(bhv_ssl_moving_pyramid_wall_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_ssl_moving_pyramid_wall_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 3B40
const BehaviorScript bhvPyramidElevator[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(ssl_seg7_collision_pyramid_elevator),
    OBJ_SET_POS(),
    OBJ_SET_FLOAT(oCollisionDistance, 0x4E20),
    CALLNATIVE(bhv_pyramid_elevator_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_pyramid_elevator_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 3B78
const BehaviorScript bhvPyramidElevatorTrajectoryMarkerBall[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_pyramid_elevator_trajectory_marker_ball_loop),
    END_LOOP(),
};

// 3B94
const BehaviorScript bhvPyramidTop[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(ssl_seg7_collision_pyramid_top),
    OBJ_SET_POS(),
    OBJ_SET_FLOAT(oCollisionDistance, 0x4E20),
    CALLNATIVE(bhv_pyramid_top_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_pyramid_top_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 3BCC
const BehaviorScript bhvPyramidTopFragment[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    CALLNATIVE(bhv_pyramid_top_fragment_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_pyramid_top_fragment_loop),
    END_LOOP(),
};

// 3BEC
const BehaviorScript bhvPyramidPillarTouchDetector[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    SET_HITBOX(0x0032, 0x0032),
    OBJ_SET_INT(oIntangibleTimer, 0),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_pyramid_pillar_touch_detector_loop),
    END_LOOP(),
};

// 3C10
const BehaviorScript bhvWaterfallSoundLoop[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_waterfall_sound_loop),
    END_LOOP(),
};

// 3C24
const BehaviorScript bhvVolcanoSoundLoop[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_volcano_sound_loop),
    END_LOOP(),
};

// 3C38
const BehaviorScript bhvCastleFlagWaving[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_ANIMS(oAnimations, castle_grounds_seg7_anims_flags),
    ANIMATE(0x00),
    CALLNATIVE(bhv_castle_flag_init),
    BEGIN_LOOP(),
    END_LOOP(),
};

// 3C5C
const BehaviorScript bhvBirdsSoundLoop[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_birds_sound_loop),
    END_LOOP(),
};

// 3C70
const BehaviorScript bhvAmbientSounds[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    CALLNATIVE(bhv_ambient_sounds_init),
    BEGIN_LOOP(),
    END_LOOP(),
};

// 3C84
const BehaviorScript bhvSandSoundLoop[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_sand_sound_loop),
    END_LOOP(),
};

// 3C98
const BehaviorScript bhvHiddenAt120Stars[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(castle_grounds_seg7_collision_cannon_grill),
    OBJ_SET_FLOAT(oCollisionDistance, 0x0FA0),
    CALLNATIVE(bhv_castle_cannon_grate_init),
    BEGIN_LOOP(),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 3CC4
const BehaviorScript bhvSnowmansBottom[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    DROP_FLOOR(),
    OBJ_SET_INT(oIntangibleTimer, 0),
    CALLNATIVE(bhv_snowmans_bottom_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_snowmans_bottom_loop),
    END_LOOP(),
};

// 3CEC
const BehaviorScript bhvSnowmansHead[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    DROP_FLOOR(),
    OBJ_SET_FLOAT(oGraphYOffset, 0x006E),
    CALLNATIVE(bhv_snowmans_head_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_snowmans_head_loop),
    END_LOOP(),
};

// 3D14
const BehaviorScript bhvSnowmansBodyCheckpoint[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_snowmans_body_checkpoint_loop),
    END_LOOP(),
};

// 3D2C
const BehaviorScript bhvBigSnowmanWhole[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_FLOAT(oGraphYOffset, 0x00B4),
    INTERACT_TYPE(INTERACT_TEXT),
    SET_HITBOX(0x00D2, 0x0226),
    BEGIN_LOOP(),
        OBJ_SET_INT(oIntangibleTimer, 0),
    END_LOOP(),
};

// 3D54
const BehaviorScript bhvBigBoulder[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_FLOAT(oGraphYOffset, 0x00B4),
    CALLNATIVE(bhv_big_boulder_init),
    OBJ_SET_FLOAT(oCollisionDistance, 0x4E20),
    BEGIN_LOOP(),
        OBJ_SET_INT(oIntangibleTimer, 0),
        CALLNATIVE(bhv_big_boulder_loop),
    END_LOOP(),
};

// 3D80
const BehaviorScript bhvBigBoulderGenerator[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_big_boulder_generator_loop),
    END_LOOP(),
};

// 3D98
const BehaviorScript bhvWingCap[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    CALLNATIVE(bhv_wing_cap_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_wing_vanish_cap_loop),
    END_LOOP(),
};

// 3DB8
const BehaviorScript bhvMetalCap[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    CALLNATIVE(bhv_metal_cap_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_metal_cap_loop),
    END_LOOP(),
};

// 3DD8
const BehaviorScript bhvNormalCap[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    CALLNATIVE(bhv_normal_cap_init),
    BEGIN_LOOP(),
        OBJ_SET_INT(oIntangibleTimer, 0),
        CALLNATIVE(bhv_normal_cap_loop),
    END_LOOP(),
};

// 3DFC
const BehaviorScript bhvVanishCap[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    CALLNATIVE(bhv_vanish_cap_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_wing_vanish_cap_loop),
    END_LOOP(),
};

// 3E1C
const BehaviorScript bhvStar[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    CALLNATIVE(bhv_init_room),
    CALLNATIVE(bhv_collect_star_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_collect_star_loop),
    END_LOOP(),
};

// 3E44
const BehaviorScript bhvStarSpawnCoordinates[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    CALLNATIVE(bhv_collect_star_init),
    CALLNATIVE(bhv_star_spawn_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_star_spawn_loop),
    END_LOOP(),
};

// 3E6C
const BehaviorScript bhvHiddenRedCoinStar[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_PERSISTENT_RESPAWN | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    CALLNATIVE(bhv_hidden_red_coin_star_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_hidden_red_coin_star_loop),
    END_LOOP(),
};

// 3E8C
const BehaviorScript bhvRedCoin[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    OBJ_SET_INT(oIntangibleTimer, 0),
    OBJ_SET_INT(oAnimState, -1),
    CALLNATIVE(bhv_init_room),
    CALLNATIVE(bhv_red_coin_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_red_coin_loop),
        OBJ_ADD_INT(oAnimState, 1),
    END_LOOP(),
};

// 3EC4
const BehaviorScript bhvBowserCourseRedCoinStar[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_PERSISTENT_RESPAWN | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_bowser_course_red_coin_star_loop),
    END_LOOP(),
};

// 3EDC
const BehaviorScript bhvHiddenStar[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_PERSISTENT_RESPAWN | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    CALLNATIVE(bhv_hidden_star_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_hidden_star_loop),
    END_LOOP(),
};

// 3EFC
const BehaviorScript bhvHiddenStarTrigger[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    SET_HITBOX(0x0064, 0x0064),
    OBJ_SET_INT(oIntangibleTimer, 0),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_hidden_star_trigger_loop),
    END_LOOP(),
};

// 3F20
const BehaviorScript bhvTtmRollingLog[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(ttm_seg7_collision_pitoune_2),
    OBJ_SET_POS(),
    OBJ_SET_FLOAT(oCollisionDistance, 0x07D0),
    CALLNATIVE(bhv_ttm_rolling_log_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_rolling_log_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 3F58
const BehaviorScript bhvLllVolcanoFallingTrap[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(lll_seg7_collision_falling_wall),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhvLllVolcanoFallingTrap_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 3F84
const BehaviorScript bhvLllRollingLog[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(lll_seg7_collision_pitoune),
    OBJ_SET_POS(),
    OBJ_SET_FLOAT(oCollisionDistance, 0x07D0),
    CALLNATIVE(bhv_lll_rolling_log_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_rolling_log_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 3FBC
const BehaviorScript bhv1upWalking[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    COLLISION_SPHERE(0x001E, 0x001E, 0x0000),
    OBJ_SET_FLOAT(oGraphYOffset, 30),
    CALLNATIVE(bhv_1up_common_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_1up_walking_loop),
    END_LOOP(),
};

// 3FF0
const BehaviorScript bhv1upRunningAway[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    COLLISION_SPHERE(0x001E, 0x001E, 0x0000),
    OBJ_SET_FLOAT(oGraphYOffset, 30),
    CALLNATIVE(bhv_1up_common_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_1up_running_away_loop),
    END_LOOP(),
};

// 4024
const BehaviorScript bhv1upSliding[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    COLLISION_SPHERE(0x001E, 0x001E, 0x0000),
    OBJ_SET_FLOAT(oGraphYOffset, 30),
    CALLNATIVE(bhv_1up_common_init),
    BEGIN_LOOP(),
        OBJ_SET_INT(oIntangibleTimer, 0),
        CALLNATIVE(bhv_1up_sliding_loop),
    END_LOOP(),
};

// 405C
const BehaviorScript bhv1Up[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    COLLISION_SPHERE(0x001E, 0x001E, 0x0000),
    OBJ_SET_FLOAT(oGraphYOffset, 30),
    CALLNATIVE(bhv_1up_init),
    BEGIN_LOOP(),
        OBJ_SET_INT(oIntangibleTimer, 0),
        CALLNATIVE(bhv_1up_loop),
    END_LOOP(),
};

// 4094
const BehaviorScript bhv1upJumpOnApproach[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    COLLISION_SPHERE(0x001E, 0x001E, 0x0000),
    OBJ_SET_FLOAT(oGraphYOffset, 30),
    CALLNATIVE(bhv_1up_common_init),
    BEGIN_LOOP(),
        OBJ_SET_INT(oIntangibleTimer, 0),
        CALLNATIVE(bhv_1up_jump_on_approach_loop),
    END_LOOP(),
};

// 40CC
const BehaviorScript bhvHidden1up[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    COLLISION_SPHERE(0x001E, 0x001E, 0x0000),
    OBJ_SET_FLOAT(oGraphYOffset, 30),
    CALLNATIVE(bhv_1up_common_init),
    BEGIN_LOOP(),
        OBJ_SET_INT(oIntangibleTimer, 0),
        CALLNATIVE(bhv_1up_hidden_loop),
    END_LOOP(),
};

// 4104
const BehaviorScript bhvHidden1upTrigger[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    SET_HITBOX(0x0064, 0x0064),
    OBJ_SET_INT(oIntangibleTimer, 0),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_1up_hidden_trigger_loop),
    END_LOOP(),
};

// 4128
const BehaviorScript bhvHidden1upInPole[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    COLLISION_SPHERE(0x001E, 0x001E, 0x0000),
    OBJ_SET_FLOAT(oGraphYOffset, 30),
    CALLNATIVE(bhv_1up_common_init),
    BEGIN_LOOP(),
        OBJ_SET_INT(oIntangibleTimer, 0),
        CALLNATIVE(bhv_1up_hidden_in_pole_loop),
    END_LOOP(),
};

// 4160
const BehaviorScript bhvHidden1upInPoleTrigger[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    SET_HITBOX(0x0064, 0x0064),
    OBJ_SET_INT(oIntangibleTimer, 0),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_1up_hidden_in_pole_trigger_loop),
    END_LOOP(),
};

// 4184
const BehaviorScript bhvHidden1upInPoleSpawner[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_1up_hidden_in_pole_spawner_loop),
    END_LOOP(),
};

// 419C
const BehaviorScript bhvControllablePlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_0800 | OBJ_FLAG_0020 | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(hmc_seg7_collision_controllable_platform),
    OBJ_SET_POS(),
    CALLNATIVE(bhv_controllable_platform_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_controllable_platform_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 41D0
const BehaviorScript bhvControllablePlatformSub[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(hmc_seg7_collision_controllable_platform_sub),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_controllable_platform_sub_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 41F8
const BehaviorScript bhvBreakableBoxSmall[] = {
    BEGIN(OBJ_LIST_DESTRUCTIVE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_HOLDABLE | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    DROP_FLOOR(),
    OBJ_SET_POS(),
    CALLNATIVE(bhv_breakable_box_small_init),
    BEGIN_LOOP(),
        OBJ_SET_INT(oIntangibleTimer, 0),
        CALLNATIVE(bhv_breakable_box_small_loop),
    END_LOOP(),
};

// 4224
const BehaviorScript bhvSlidingSnowMound[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(sl_seg7_collision_sliding_snow_mound),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_sliding_snow_mound_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 4250
const BehaviorScript bhvSnowMoundSpawn[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_snow_mound_spawn_loop),
    END_LOOP(),
};

// 4264
const BehaviorScript bhvWdwSquareFloatingPlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(wdw_seg7_collision_square_floating_platform),
    OBJ_SET_FLOAT(oFloatingPlatformUnkFC, 0x0040),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_floating_platform_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 4294
const BehaviorScript bhvWdwRectangularFloatingPlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(wdw_seg7_collision_rect_floating_platform),
    OBJ_SET_FLOAT(oFloatingPlatformUnkFC, 0x0040),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_floating_platform_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 42C4
const BehaviorScript bhvJrbFloatingPlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    COLLISION_DATA(jrb_seg7_collision_floating_platform),
    OBJ_SET_FLOAT(oFloatingPlatformUnkFC, 0x0040),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_floating_platform_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 42F4
const BehaviorScript bhvArrowLift[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(wdw_seg7_collision_arrow_lift),
    OBJ_SET_INT_RAND_RSHIFT(oArrowLiftUnk100, 0x0001, 0x0020),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_arrow_lift_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 4328
const BehaviorScript bhvOrangeNumber[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    OBJ_SET_POS(),
    CALLNATIVE(bhv_orange_number_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_orange_number_loop),
    END_LOOP(),
};

// 4350
const BehaviorScript bhvMantaRay[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_0010 | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, manta_seg5_anims_05008EB4),
    ANIMATE(0x00),
    CALLNATIVE(bhv_manta_ray_init),
    BEGIN_LOOP(),
        OBJ_SET_INT(oIntangibleTimer, 0),
        CALLNATIVE(bhv_manta_ray_loop),
    END_LOOP(),
};

// 4380
const BehaviorScript bhvFallingPillar[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_POS(),
    CALLNATIVE(bhv_falling_pillar_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_falling_pillar_loop),
    END_LOOP(),
};

// 43A4
const BehaviorScript bhvFallingPillarHitbox[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_falling_pillar_hitbox_loop),
    END_LOOP(),
};

// 43C0
const BehaviorScript bhvPillarBase[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(jrb_seg7_collision_pillar_base),
    BEGIN_LOOP(),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 43E0
const BehaviorScript bhvJrbFloatingBox[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    COLLISION_DATA(jrb_seg7_collision_floating_box),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_jrb_floating_box_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 440C
const BehaviorScript bhvDecorativePendulum[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    CALLNATIVE(bhv_decorative_pendulum_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_decorative_pendulum_loop),
    END_LOOP(),
};

// 442C
const BehaviorScript bhvTreasureChestsShip[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    DROP_FLOOR(),
    CALLNATIVE(bhv_treasure_chest_ship_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_treasure_chest_ship_loop),
    END_LOOP(),
};

// 4450
const BehaviorScript bhvTreasureChestsJrb[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    DROP_FLOOR(),
    CALLNATIVE(bhv_treasure_chest_jrb_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_treasure_chest_jrb_loop),
    END_LOOP(),
};

// 4474
const BehaviorScript bhvTreasureChests[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    DROP_FLOOR(),
    CALLNATIVE(bhv_treasure_chest_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_treasure_chest_loop),
    END_LOOP(),
};

// 4498
const BehaviorScript bhvTreasureChestBottom[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    DROP_FLOOR(),
    CALLNATIVE(bhv_treasure_chest_bottom_init),
    OBJ_SET_INT(oIntangibleTimer, -1),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_treasure_chest_bottom_loop),
    END_LOOP(),
};

// 44C0
const BehaviorScript bhvTreasureChestTop[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_treasure_chest_top_loop),
    END_LOOP(),
};

// 44DC
const BehaviorScript bhvMips[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_HOLDABLE | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, mips_seg6_anims_06015634),
    OBJ_SET_INT(oInteractType, 0x02),
    DROP_FLOOR(),
    SET_HITBOX(0x0032, 0x004B),
    OBJ_SET_INT(oIntangibleTimer, 0),
    CALLNATIVE(bhv_mips_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_mips_loop),
    END_LOOP(),
};

// 4518
const BehaviorScript bhvYoshi[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, yoshi_seg5_anims_05024100),
    INTERACT_TYPE(INTERACT_TEXT),
    DROP_FLOOR(),
    SET_HITBOX(0x00A0, 0x0096),
    ANIMATE(0x00),
    OBJ_SET_POS(),
    CALLNATIVE(bhv_yoshi_init),
    BEGIN_LOOP(),
        OBJ_SET_INT(oIntangibleTimer, 0),
        CALLNATIVE(BehYoshiLoop),
    END_LOOP(),
};

// 4560
const BehaviorScript bhvKoopa[] = {
    BEGIN(OBJ_LIST_PUSHABLE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    DROP_FLOOR(),
    OBJ_SET_ANIMS(oAnimations, koopa_seg6_anims_06011364),
    ANIMATE(0x09),
    OBJ_SET_POS(),
    GRAVITY(0x0032, 0xFE70, 0x0000, 0x0000, 0x03E8, 0x00C8, 0x0000, 0x0000),
    SCALE(150),
    OBJ_SET_FLOAT(oKoopaAgility, 1),
    CALLNATIVE(bhv_koopa_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_koopa_update),
    END_LOOP(),
};

// 45B0
const BehaviorScript bhvKoopaRaceEndpoint[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    DROP_FLOOR(),
    OBJ_CHILD_PARAM(0x0000, MODEL_KOOPA_FLAG, bhvKoopaFlag),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_koopa_race_endpoint_update),
    END_LOOP(),
};

// 45D8
const BehaviorScript bhvKoopaFlag[] = {
    BEGIN(OBJ_LIST_POLELIKE),
    INTERACT_TYPE(INTERACT_POLE),
    SET_HITBOX(0x0050, 0x02BC),
    OBJ_SET_INT(oIntangibleTimer, 0),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    DROP_FLOOR(),
    OBJ_SET_ANIMS(oAnimations, koopa_flag_seg6_anims_06001028),
    ANIMATE(0x00),
    BEGIN_LOOP(),
        CALLNATIVE(BehClimbDetectLoop),
    END_LOOP(),
};

// 4614
const BehaviorScript bhvPokey[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    DROP_FLOOR(),
    OBJ_SET_POS(),
    GRAVITY(0x003C, 0xFE70, 0x0000, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_pokey_update),
    END_LOOP(),
};

// 4648
const BehaviorScript bhvPokeyBodyPart[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    GRAVITY(0x003C, 0xFE70, 0x0000, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    BILLBOARD(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_pokey_body_part_update),
    END_LOOP(),
};

// 4678
const BehaviorScript bhvSwoop[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, swoop_seg6_anims_060070D0),
    OBJ_SET_POS(),
    GRAVITY(0x0032, 0x0000, 0xFFCE, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000),
    CALLNATIVE(bhv_init_room),
    SCALE(0),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_swoop_update),
    END_LOOP(),
};

// 46BC
const BehaviorScript bhvFlyGuy[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, flyguy_seg8_anims_08011A64),
    ANIMATE(0x00),
    OBJ_SET_POS(),
    GRAVITY(0x0032, 0x0000, 0x0000, 0x0000, 0x03E8, 0x0258, 0x0000, 0x0000),
    CALLNATIVE(bhv_init_room),
    OBJ_SET_INT(oInteractionSubtype, 0x0080),
    OBJ_SET_FLOAT(oGraphYOffset, 30),
    SCALE(150),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_fly_guy_update),
    END_LOOP(),
};

// 470C
const BehaviorScript bhvGoomba[] = {
    BEGIN(OBJ_LIST_PUSHABLE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    DROP_FLOOR(),
    OBJ_SET_ANIMS(oAnimations, goomba_seg8_anims_0801DA4C),
    OBJ_SET_POS(),
    GRAVITY(0x0028, 0xFE70, 0xFFCE, 0x03E8, 0x03E8, 0x0000, 0x0000, 0x0000),
    CALLNATIVE(bhv_goomba_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_goomba_update),
    END_LOOP(),
};

// 4750
const BehaviorScript bhvGoombaTripletSpawner[] = {
    BEGIN(OBJ_LIST_PUSHABLE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    DROP_FLOOR(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_goomba_triplet_spawner_update),
    END_LOOP(),
};

// 476C
const BehaviorScript bhvChainChomp[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    DROP_FLOOR(),
    OBJ_SET_ANIMS(oAnimations, chain_chomp_seg6_anims_06025178),
    ANIMATE(0x00),
    GRAVITY(0x0000, 0xFE70, 0xFFCE, 0x0000, 0x03E8, 0x00C8, 0x0000, 0x0000),
    UNHIDE(),
    OBJ_SET_POS(),
    OBJ_SET_FLOAT(oGraphYOffset, 0x00F0),
    SCALE(200),
    OBJ_CHILD_PARAM(0x0000, MODEL_WOODEN_POST, bhvWoodenPost),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_chain_chomp_update),
    END_LOOP(),
};

// 47C4
const BehaviorScript bhvChainChompChainPart[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    GRAVITY(0x0000, 0xFE70, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    OBJ_SET_FLOAT(oGraphYOffset, 0x0028),
    SCALE(200),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_chain_chomp_chain_part_update),
    END_LOOP(),
};

// 47FC
const BehaviorScript bhvWoodenPost[] = {
    BEGIN(OBJ_LIST_SURFACE),
    COLLISION_DATA(poundable_pole_collision_06002490),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    GRAVITY(0x0000, 0xFE70, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    OBJ_SET_INT(oNumLootCoins, 5),
    DROP_FLOOR(),
    OBJ_SET_POS(),
    SCALE(50),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_wooden_post_update),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 4848
const BehaviorScript bhvChainChompGate[] = {
    BEGIN(OBJ_LIST_SURFACE),
    COLLISION_DATA(bob_seg7_collision_chain_chomp_gate),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    CALLNATIVE(bhv_chain_chomp_gate_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_chain_chomp_gate_update),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 4878
const BehaviorScript bhvWigglerHead[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    DROP_FLOOR(),
    OBJ_SET_ANIMS(oAnimations, wiggler_seg5_anims_0500EC8C),
    OBJ_SET_POS(),
    GRAVITY(0x003C, 0xFE70, 0x0000, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    UNHIDE(),
    SCALE(400),
    OBJ_SET_FLOAT(oWigglerFallThroughFloorsHeight, 5000),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_wiggler_update),
    END_LOOP(),
};

// 48C0
const BehaviorScript bhvWigglerBody[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_ANIMS(oAnimations, wiggler_seg5_anims_0500C874),
    GRAVITY(0x0000, 0xFE70, 0x0000, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    SCALE(400),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_wiggler_body_part_update),
    END_LOOP(),
};

// 48F8
const BehaviorScript bhvEnemyLakitu[] = {
    BEGIN(OBJ_LIST_PUSHABLE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, lakitu_enemy_seg5_anims_050144D4),
    ANIMATE(0x00),
    OBJ_SET_POS(),
    GRAVITY(0x0028, 0x0000, 0xFFCE, 0x0000, 0x0000, 0x00C8, 0x0000, 0x0000),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_enemy_lakitu_update),
    END_LOOP(),
};

// 4934
const BehaviorScript bhvCameraLakitu[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, lakitu_seg6_anims_060058F8),
    ANIMATE(0x00),
    CALLNATIVE(bhv_init_room),
    CALLNATIVE(bhv_camera_lakitu_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_camera_lakitu_update),
    END_LOOP(),
};

// 4968
const BehaviorScript bhvCloud[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    OBJ_SET_POS(),
    OBJ_SET_INT(oOpacity, 0x00F0),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_cloud_update),
    END_LOOP(),
};

// 498C
const BehaviorScript bhvCloudPart[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_INT(oOpacity, 0x00F0),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_cloud_part_update),
    END_LOOP(),
};

// 49A8
const BehaviorScript bhvSpiny[] = {
    BEGIN(OBJ_LIST_PUSHABLE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, spiny_seg5_anims_05016EAC),
    ANIMATE(0x00),
    GRAVITY(0x0028, 0xFE70, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_spiny_update),
    END_LOOP(),
};

// 49E0
const BehaviorScript bhvMontyMole[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    DROP_FLOOR(),
    OBJ_SET_ANIMS(oAnimations, monty_mole_seg5_anims_05007248),
    ANIMATE(0x03),
    GRAVITY(0x001E, 0x0000, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    UNHIDE(),
    OBJ_SET_INT(oIntangibleTimer, -1),
    OBJ_SET_FLOAT(oGraphYOffset, 0xFFC4),
    SCALE(150),
    DELAY(1),
    CALLNATIVE(bhv_monty_mole_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_monty_mole_update),
    END_LOOP(),
};

// 4A38
const BehaviorScript bhvMontyMoleHole[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    DROP_FLOOR(),
    SCALE(150),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_monty_mole_hole_update),
    END_LOOP(),
};

// 4A58
const BehaviorScript bhvMontyMoleRock[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    GRAVITY(0x001E, 0xFE70, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    OBJ_SET_FLOAT(oGraphYOffset, 0x000A),
    SCALE(200),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_monty_mole_rock_update),
    END_LOOP(),
};

// 4A90
const BehaviorScript bhvPlatformOnTrack[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    GRAVITY(0x0032, 0xFF9C, 0xFFCE, 0x0064, 0x03E8, 0x00C8, 0x0000, 0x0000),
    CALLNATIVE(bhv_init_room),
    CALLNATIVE(bhv_platform_on_track_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_platform_on_track_update),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 4AD4
const BehaviorScript bhvTrackBall[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    CALLNATIVE(bhv_init_room),
    SCALE(15),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_track_ball_update),
    END_LOOP(),
};

// 4AFC
const BehaviorScript bhvSeesawPlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    CALLNATIVE(bhv_seesaw_platform_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_seesaw_platform_update),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 4B24
const BehaviorScript bhvFerrisWheelAxle[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_ADD_INT(oMoveAngleYaw, 0x4000),
    CALLNATIVE(bhv_ferris_wheel_axle_init),
    BEGIN_LOOP(),
        OBJ_ADD_INT(oFaceAngleRoll, 400),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 4B4C
const BehaviorScript bhvFerrisWheelPlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_ferris_wheel_platform_update),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 4B6C
const BehaviorScript bhvWaterBombSpawner[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    DROP_FLOOR(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_water_bomb_spawner_update),
    END_LOOP(),
};

// 4B88
const BehaviorScript bhvWaterBomb[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    GRAVITY(0x0078, 0xFE70, 0x0000, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_water_bomb_update),
    END_LOOP(),
};

// 4BB4
const BehaviorScript bhvWaterBombShadow[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    SCALE(150),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_water_bomb_shadow_update),
    END_LOOP(),
};

// 4BD0
const BehaviorScript bhvTTCRotatingSolid[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_POS(),
    OBJ_SET_FLOAT(oCollisionDistance, 0x01C2),
    CALLNATIVE(bhv_ttc_rotating_solid_init),
    OBJ_SET_INT(oTTCRotatingSolidNumTurns, 1),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_ttc_rotating_solid_update),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 4C04
const BehaviorScript bhvTTCPendulum[] = {
    BEGIN(OBJ_LIST_SURFACE),
    COLLISION_DATA(ttc_seg7_collision_clock_pendulum),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_FLOAT(oCollisionDistance, 0x05DC),
    CALLNATIVE(bhv_ttc_pendulum_init),
    OBJ_SET_FLOAT(oTTCPendulumAccelDir, 1),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_ttc_pendulum_update),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 4C3C
const BehaviorScript bhvTTCTreadmill[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_FLOAT(oCollisionDistance, 0x02EE),
    CALLNATIVE(bhv_ttc_treadmill_init),
    DELAY(1),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_ttc_treadmill_update),
        CALLNATIVE(obj_compute_vel_xz),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 4C74
const BehaviorScript bhvTTCMovingBar[] = {
    BEGIN(OBJ_LIST_SURFACE),
    COLLISION_DATA(ttc_seg7_collision_sliding_surface),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_POS(),
    OBJ_SET_FLOAT(oCollisionDistance, 0x0226),
    CALLNATIVE(bhv_ttc_moving_bar_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_ttc_moving_bar_update),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 4CAC
const BehaviorScript bhvTTCCog[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_FLOAT(oCollisionDistance, 0x0190),
    CALLNATIVE(bhv_ttc_cog_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_ttc_cog_update),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 4CD8
const BehaviorScript bhvTTCPitBlock[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_POS(),
    OBJ_SET_FLOAT(oCollisionDistance, 0x015E),
    CALLNATIVE(bhv_ttc_pit_block_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_ttc_pit_block_update),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 4D08
const BehaviorScript bhvTTCElevator[] = {
    BEGIN(OBJ_LIST_SURFACE),
    COLLISION_DATA(ttc_seg7_collision_clock_platform),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_POS(),
    OBJ_SET_FLOAT(oCollisionDistance, 0x0190),
    CALLNATIVE(bhv_ttc_elevator_init),
    OBJ_SET_FLOAT(oTTCElevatorDir, 1),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_ttc_elevator_update),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 4D44
const BehaviorScript bhvTTC2DRotator[] = {
    BEGIN(OBJ_LIST_SURFACE),
    COLLISION_DATA(ttc_seg7_collision_clock_main_rotation),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_FLOAT(oCollisionDistance, 0x0708),
    CALLNATIVE(bhv_ttc_2d_rotator_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_ttc_2d_rotator_update),
    END_LOOP(),
};

// 4D70
const BehaviorScript bhvTTCSpinner[] = {
    BEGIN(OBJ_LIST_SURFACE),
    COLLISION_DATA(ttc_seg7_collision_rotating_clock_platform2),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_FLOAT(oCollisionDistance, 0x01C2),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_ttc_spinner_update),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 4D9C
const BehaviorScript bhvMrBlizzard[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    DROP_FLOOR(),
    OBJ_SET_ANIMS(oAnimations, snowman_seg5_anims_0500D118),
    ANIMATE(0x00),
    OBJ_SET_POS(),
    GRAVITY(0x001E, 0xFE70, 0x0000, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    CALLNATIVE(bhv_mr_blizzard_init),
    OBJ_SET_FLOAT(oMrBlizzardUnkF4, 1),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_mr_blizzard_update),
    END_LOOP(),
};

// 4DE8
const BehaviorScript bhvMrBlizzardSnowball[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    GRAVITY(0x001E, 0xFED4, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    SCALE(200),
    OBJ_ADD_INT(oMoveAngleYaw, -0x5B58),
    OBJ_SET_FLOAT(oForwardVel, 5),
    OBJ_SET_FLOAT(oVelY, -1),
    OBJ_SET_FLOAT(oGraphYOffset, 10),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_mr_blizzard_snowball),
    END_LOOP(),
};

// 4E2C
const BehaviorScript bhvSlidingPlatform2[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_POS(),
    CALLNATIVE(bhv_sliding_plat_2_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_sliding_plat_2_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 4E58
const BehaviorScript bhvOctagonalPlatformRotating[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    CALLNATIVE(bhv_rotating_octagonal_plat_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_rotating_octagonal_plat_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 4E80
const BehaviorScript bhvAnimatesOnFloorSwitchPress[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_FLOAT(oCollisionDistance, 0x1F40),
    CALLNATIVE(bhv_animates_on_floor_switch_press_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_animates_on_floor_switch_press_loop),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 4EAC
const BehaviorScript bhvActivatedBackAndForthPlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_POS(),
    CALLNATIVE(bhv_activated_back_and_forth_platform_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_activated_back_and_forth_platform_update),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 4ED8
const BehaviorScript bhvRecoveryHeart[] = {
    BEGIN(OBJ_LIST_LEVEL),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_recovery_heart_loop),
    END_LOOP(),
};

// 4EF0
const BehaviorScript bhvWaterBombCannon[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_water_bomb_cannon_loop),
    END_LOOP(),
};

// 4F08
const BehaviorScript bhvCannonBarrelBubbles[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_bubble_cannon_barrel_loop),
    END_LOOP(),
};

// 4F20
const BehaviorScript bhvUnagi[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, unagi_seg5_anims_05012824),
    ANIMATE(0x06),
    OBJ_SET_POS(),
    SCALE(300),
    OBJ_SET_FLOAT(oDrawingDistance, 0x1770),
    CALLNATIVE(bhv_unagi_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_unagi_loop),
    END_LOOP(),
};

// 4F58
const BehaviorScript bhvUnagiSubobject[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_unagi_subobject_loop),
    END_LOOP(),
};

// 4F70
const BehaviorScript bhvDorrie[] = {
    BEGIN(OBJ_LIST_SURFACE),
    COLLISION_DATA(dorrie_seg6_collision_0600F644),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, dorrie_seg6_anims_0600F638),
    OBJ_SET_POS(),
    OBJ_SET_FLOAT(oCollisionDistance, 0x7530),
    OBJ_ADD_FLOAT(oPosX, 2000),
    CALLNATIVE(bhv_init_room),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_dorrie_update),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 4FB4
const BehaviorScript bhvHauntedChair[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    DROP_FLOOR(),
    OBJ_SET_ANIMS(oAnimations, chair_seg5_anims_05005784),
    ANIMATE(0x00),
    GRAVITY(0x0028, 0x0000, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    OBJ_SET_POS(),
    CALLNATIVE(bhv_init_room),
    CALLNATIVE(bhv_haunted_chair_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_haunted_chair_loop),
    END_LOOP(),
};

// 5004
const BehaviorScript bhvMadPiano[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    DROP_FLOOR(),
    OBJ_SET_ANIMS(oAnimations, mad_piano_seg5_anims_05009B14),
    GRAVITY(0x0028, 0x0000, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    OBJ_SET_POS(),
    OBJ_ADD_INT(oMoveAngleYaw, 0x4000),
    CALLNATIVE(bhv_init_room),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_mad_piano_update),
    END_LOOP(),
};

// 504C
const BehaviorScript bhvFlyingBookend[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, bookend_seg5_anims_05002540),
    ANIMATE(0x00),
    GRAVITY(0x003C, 0x0000, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    OBJ_SET_INT(oMoveFlags, 0),
    SCALE(70),
    CALLNATIVE(bhv_init_room),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_flying_bookend_loop),
    END_LOOP(),
};

// 5094
const BehaviorScript bhvBookendSpawn[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    CALLNATIVE(bhv_init_room),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_bookend_spawn_loop),
    END_LOOP(),
};

// 50B4
const BehaviorScript bhvHauntedBookshelfManager[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    CALLNATIVE(bhv_init_room),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_haunted_bookshelf_manager_loop),
    END_LOOP(),
};

// 50D4
const BehaviorScript bhvBookSwitch[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_POS(),
    OBJ_SET_FLOAT(oGraphYOffset, 30),
    OBJ_ADD_INT(oMoveAngleYaw, 0x4000),
    CALLNATIVE(bhv_init_room),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_book_switch_loop),
    END_LOOP(),
};

// 5100
const BehaviorScript bhvFirePiranhaPlant[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    DROP_FLOOR(),
    OBJ_SET_ANIMS(oAnimations, piranha_plant_seg6_anims_0601C31C),
    ANIMATE(0x00),
    OBJ_SET_POS(),
    UNHIDE(),
    CALLNATIVE(bhv_fire_piranha_plant_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_fire_piranha_plant_update),
    END_LOOP(),
};

// 5138
const BehaviorScript bhvSmallPiranhaFlame[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    GRAVITY(0x001E, 0x0000, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_small_piranha_flame_loop),
        OBJ_ADD_INT(oAnimState, 1),
    END_LOOP(),
};

// 516C
const BehaviorScript bhvFireSpitter[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    SCALE(40),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_fire_spitter_update),
    END_LOOP(),
};

// 518C
const BehaviorScript bhvFlyguyFlame[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BILLBOARD(),
    GRAVITY(0x0000, 0x00C8, 0x0000, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_fly_guy_flame_loop),
        OBJ_ADD_INT(oAnimState, 1),
    END_LOOP(),
};

// 51C0
const BehaviorScript bhvSnufit[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_POS(),
    GRAVITY(0x001E, 0x0000, 0xFFCE, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000),
    CALLNATIVE(bhv_init_room),
    BEGIN_LOOP(),
        OBJ_SET_INT(oSnufitUnkF4, 0),
        CALLNATIVE(bhv_snufit_loop),
    END_LOOP(),
};

// 51FC
const BehaviorScript bhvSnufitBalls[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BILLBOARD(),
    GRAVITY(0x000A, 0x0000, 0xFFCE, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    CALLNATIVE(bhv_init_room),
    OBJ_SET_FLOAT(oGraphYOffset, 0x000A),
    SCALE(10),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_snufit_balls_loop),
    END_LOOP(),
};

// 523C
const BehaviorScript bhvHorizontalGrindel[] = {
    BEGIN(OBJ_LIST_SURFACE),
    COLLISION_DATA(ssl_seg7_collision_grindel),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    DROP_FLOOR(),
    OBJ_SET_POS(),
    GRAVITY(0x0028, 0xFE70, 0x0000, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    SCALE(90),
    CALLNATIVE(bhv_horizontal_grindel_init),
    BEGIN_LOOP(),
        CALLNATIVE(obj_update_floor_and_walls),
        CALLNATIVE(bhv_horizontal_grindel_update),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 5294
const BehaviorScript bhvEyerokBoss[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_eyerok_boss_loop),
    END_LOOP(),
};

// 52B0
const BehaviorScript bhvEyerokHand[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, eyerok_seg5_anims_050116E4),
    ANIMATE(0x06),
    GRAVITY(0x0096, 0x0000, 0x0000, 0x0000, 0x03E8, 0x00C8, 0x0000, 0x0000),
    OBJ_SET_POS(),
    OBJ_SET_INT(oAnimState, 3),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_eyerok_hand_loop),
    END_LOOP(),
};

// 52F0
const BehaviorScript bhvKlepto[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, klepto_seg5_anims_05008CFC),
    ANIMATE(0x00),
    GRAVITY(0x0064, 0x0000, 0xFFEC, 0x03E8, 0x03E8, 0x00C8, 0x0000, 0x0000),
    OBJ_SET_POS(),
    CALLNATIVE(bhv_klepto_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_klepto_update),
    END_LOOP(),
};

// 5334
const BehaviorScript bhvBird[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, birds_seg5_anims_050009E8),
    ANIMATE(0x00),
    UNHIDE(),
    SCALE(70),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_bird_update),
    END_LOOP(),
};

// 5360
const BehaviorScript bhvRacingPenguin[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, penguin_seg5_anims_05008B74),
    ANIMATE(0x03),
    GRAVITY(0x012C, 0xFCE0, 0xFFFB, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000),
    SCALE(400),
    CALLNATIVE(bhv_racing_penguin_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_racing_penguin_update),
    END_LOOP(),
};

// 53A4
const BehaviorScript bhvPenguinRaceFinishLine[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_penguin_race_finish_line_update),
    END_LOOP(),
};

// 53BC
const BehaviorScript bhvPenguinRaceShortcutCheck[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_penguin_race_shortcut_check_update),
    END_LOOP(),
};

// 53D4
const BehaviorScript bhvCoffinManager[] = {
    BEGIN(OBJ_LIST_SURFACE),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    CALLNATIVE(bhv_init_room),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_coffin_manager_loop),
    END_LOOP(),
};

// 53F4
const BehaviorScript bhvCoffin[] = {
    BEGIN(OBJ_LIST_SURFACE),
    COLLISION_DATA(bbh_seg7_collision_coffin),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_POS(),
    CALLNATIVE(bhv_init_room),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_coffin_loop),
    END_LOOP(),
};

// 5420
const BehaviorScript bhvClamShell[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    DROP_FLOOR(),
    OBJ_SET_ANIMS(oAnimations, clam_shell_seg5_anims_05001744),
    OBJ_SET_FLOAT(oGraphYOffset, 0x000A),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_clam_loop),
    END_LOOP(),
};

// 5448
const BehaviorScript bhvSkeeter[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, skeeter_seg6_anims_06007DE0),
    OBJ_SET_POS(),
    GRAVITY(0x00B4, 0xFE70, 0xFFCE, 0x03E8, 0x03E8, 0x04B0, 0x0000, 0x0000),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_skeeter_update),
    END_LOOP(),
};

// 5480
const BehaviorScript bhvSkeeterWave[] = {
    BEGIN(OBJ_LIST_UNIMPORTANT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_skeeter_wave_update),
    END_LOOP(),
};

// 5498
const BehaviorScript bhvSwingPlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    COLLISION_DATA(rr_seg7_collision_pendulum),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_FLOAT(oCollisionDistance, 0x07D0),
    CALLNATIVE(bhv_swing_platform_init),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_swing_platform_update),
        CALLNATIVE(load_object_collision_model),
    END_LOOP(),
};

// 54CC
const BehaviorScript bhvDonutPlatformSpawner[] = {
    BEGIN(OBJ_LIST_SPAWNER),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_donut_platform_spawner_update),
    END_LOOP(),
};

// 54E4
const BehaviorScript bhvDonutPlatform[] = {
    BEGIN(OBJ_LIST_SURFACE),
    COLLISION_DATA(rr_seg7_collision_donut_platform),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_POS(),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_donut_platform_update),
    END_LOOP(),
};

// 5508
const BehaviorScript bhvDDDPole[] = {
    BEGIN(OBJ_LIST_POLELIKE),
    INTERACT_TYPE(INTERACT_POLE),
    SET_HITBOX(0x0050, 0x0320),
    OBJ_SET_INT(oIntangibleTimer, 0),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_POS(),
    CALLNATIVE(bhv_ddd_pole_init),
    OBJ_SET_FLOAT(oDDDPoleVel, 10),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_ddd_pole_update),
        CALLNATIVE(BehClimbDetectLoop),
    END_LOOP(),
};

// 554C
const BehaviorScript bhvRedCoinStarMarker[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    DROP_FLOOR(),
    SCALE(150),
    OBJ_SET_INT(oFaceAnglePitch, 0x4000),
    OBJ_ADD_FLOAT(oPosY, 60),
    CALLNATIVE(bhv_red_coin_star_marker_init),
    BEGIN_LOOP(),
        OBJ_ADD_INT(oFaceAngleYaw, 0x100),
    END_LOOP(),
};

// 5578
const BehaviorScript bhvTripletButterfly[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, butterfly_seg3_anims_030056B0),
    ANIMATE(0x00),
    UNHIDE(),
    OBJ_SET_POS(),
    GRAVITY(0x0000, 0x0000, 0x0000, 0x0000, 0x03E8, 0x00C8, 0x0000, 0x0000),
    OBJ_SET_FLOAT(oTripletButterflyScale, 1),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_triplet_butterfly_update),
    END_LOOP(),
};

// 55BC
const BehaviorScript bhvBubba[] = {
    BEGIN(OBJ_LIST_GENACTOR),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_POS(),
    GRAVITY(0x00C8, 0xFE70, 0xFFCE, 0x03E8, 0x03E8, 0x0000, 0x0000, 0x0000),
    SCALE(50),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_bubba_loop),
    END_LOOP(),
};

// 55F0
const BehaviorScript bhvBeginningLakitu[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_ANIMS(oAnimations, lakitu_seg6_anims_060058F8),
    ANIMATE(0x00),
    OBJ_SET_FLOAT(oOpacity, 0x0000),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_intro_lakitu_loop),
    END_LOOP(),
};

// 5618
const BehaviorScript bhvBeginningPeach[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    OBJ_SET_ANIMS(oAnimations, peach_seg5_anims_0501C41C),
    ANIMATE(0x00),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_intro_peach_loop),
    END_LOOP(),
};

// 563C
const BehaviorScript bhvEndBirds1[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_0010 | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, birds_seg5_anims_050009E8),
    ANIMATE(0x00),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_end_birds_1_loop),
    END_LOOP(),
};

// 5660
const BehaviorScript bhvEndBirds2[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, (OBJ_FLAG_0010 | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
    OBJ_SET_ANIMS(oAnimations, birds_seg5_anims_050009E8),
    ANIMATE(0x00),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_end_birds_2_loop),
    END_LOOP(),
};

// 5684
const BehaviorScript bhvIntroScene[] = {
    BEGIN(OBJ_LIST_DEFAULT),
    OBJ_OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
    BEGIN_LOOP(),
        CALLNATIVE(bhv_intro_scene_loop),
    END_LOOP(),
};


