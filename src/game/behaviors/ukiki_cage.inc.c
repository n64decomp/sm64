// ukiki_cage.c.inc

s16 D_8032F77C[] = { 0, 1011, 2306, -285,  0, 1151, 2304, -510,  0, 1723, 1861, -964,
                     0, 2082, 1775, -1128, 0, 2489, 1717, -1141, 0, 2662, 1694, -1140,
                     0, 2902, 1536, -947,  0, 2946, 1536, -467,  0, 2924, 1536, 72,
                     0, 2908, 1536, 536,   0, 2886, 1536, 783,   -1 };

struct SoundState D_8032F7D8[] = { { 1, 1, 10, SOUND_UKIKI_STEP_DEFAULT },
                                   { 0, 0, 0, NO_SOUND },
                                   { 0, 0, 0, NO_SOUND },
                                   { 0, 0, 0, NO_SOUND },
                                   { 1, 0, -1, SOUND_UKIKI_CHATTER_SHORT },
                                   { 1, 0, -1, SOUND_UKIKI_CHATTER_LONG },
                                   { 0, 0, 0, NO_SOUND },
                                   { 0, 0, 0, NO_SOUND },
                                   { 1, 0, -1, SOUND_UKIKI_CHATTER_LONG },
                                   { 1, 0, -1, SOUND_UKIKI_STEP_LEAVES },
                                   { 1, 0, -1, SOUND_UKIKI_CHATTER_IDLE },
                                   { 0, 0, 0, NO_SOUND },
                                   { 0, 0, 0, NO_SOUND } };

void func_802B9E88(void) {
    if (o->oBehParams2ndByte == 1) {
        if (obj_mario_far_away()) {
            obj_set_pos_to_home_and_stop();
            o->oAction = 0;
        } else if (o->oMoveFlags & (0x40 | 0x20 | 0x10 | 8))
            o->oAction = 5;
    }
}

s32 func_802B9F10(void) {
    if (o->oBehParams2ndByte == 1)
        if (func_8024C75C(gMarioState))
            return 1;
    return 0;
}

s32 Unknown802B9F6C(s32 a0, UNUSED s32 a1, Mat4 a2) {
    Mat4 sp20;
    struct Object *sp1C;
    if (a0 == 1) {
        sp1C = (struct Object *) gCurGraphNodeObject;
        if (sp1C->prevObj != NULL) {
            func_8029D704(sp20, a2, gCurGraphNodeCamera->matrixPtr);
            func_8029D558(sp20, sp1C->prevObj);
            func_8029EA0C(sp1C->prevObj);
        }
    }
    return 0;
}

void func_802BA000(void) {
    o->oForwardVel = 0.0f;
    if (o->oSubAction == 0) {
        o->oSubAction = (s32)(RandomFloat() * 4.0f + 1.0f);
        o->oUkikiOpenCageUnkF4 = 0;
        o->oUkikiOpenCageUnkF6 = (s16)(RandomFloat() * 4.0f + 2.0f);
    }
    switch (o->oSubAction) {
        case 1:
            set_obj_animation_and_sound_state(9);
            if (func_8029F788())
                o->oSubAction = 0;
            break;
        case 2:
            set_obj_animation_and_sound_state(4);
            if (func_8029F788())
                o->oUkikiOpenCageUnkF4++;
            if (o->oUkikiOpenCageUnkF4 >= o->oUkikiOpenCageUnkF6 * 2)
                o->oSubAction = 0;
            break;
        case 3:
            set_obj_animation_and_sound_state(5);
            if (func_8029F788())
                o->oUkikiOpenCageUnkF4++;
            if (o->oUkikiOpenCageUnkF4 >= o->oUkikiOpenCageUnkF6)
                o->oSubAction = 0;
            break;
        case 4:
            set_obj_animation_and_sound_state(10);
            if (func_8029F788())
                o->oSubAction = 0;
            break;
    }
}

void ActionUkikiOpenCage0(void) {
    func_802BA000();
    if (func_802B9F10()) {
        if (o->oDistanceToMario > 700.0f && o->oDistanceToMario < 1000.0f)
            o->oAction = 1;
        else if (o->oDistanceToMario <= 700.0f && 200.0f < o->oDistanceToMario)
            if (abs_angle_diff(o->oAngleToMario, o->oMoveAngleYaw) > 0x1000)
                o->oAction = 2;
    } else if (o->oDistanceToMario < 300.0f)
        o->oAction = 1;
    if (o->oUnk1AC_S16 == 2)
        o->oAction = 4;
    if (o->oUnk1AC_S16 == 3) {
        o->oMoveAngleYaw = gMarioObject->oMoveAngleYaw + 0x8000;
        if (func_802B0C54(50.0f, 150.0f))
            o->oAction = 3;
        else {
            o->oMoveAngleYaw = gMarioObject->oMoveAngleYaw + 0x4000;
            if (func_802B0C54(50.0f, 150.0f))
                o->oAction = 3;
            else {
                o->oMoveAngleYaw = gMarioObject->oMoveAngleYaw - 0x4000;
                if (func_802B0C54(50.0f, 150.0f))
                    o->oAction = 3;
            }
        }
        o->oUnk1AC_S16 = 4;
    }
    if (o->oBehParams2ndByte == 1)
        if (o->oPosY < -1550.0f)
            o->oAction = 7;
}

void ActionUkikiOpenCage7(void) {
    UNUSED s32 unused;
    set_obj_animation_and_sound_state(0);
    o->oMoveAngleYaw = obj_angle_to_home();
    o->oForwardVel = 10.0f;
    if (o->oPosY > -1550.0f)
        o->oAction = 0;
}

void ActionUkikiOpenCage5(void) {
    func_802BA000();
    if (obj_mario_far_away()) {
        obj_set_pos_to_home_and_stop();
        o->oAction = 0;
    }
}

void ActionUkikiOpenCage6(void) {
    func_802BA000();
    if (o->oSubAction == 3)
        obj_rotate_yaw_toward(o->oAngleToMario, 0x400);
}

void ActionUkikiOpenCage2(void) {
    s32 sp1C;
    if (o->oTimer == 0)
        o->oForwardVel = RandomFloat() * 3.0f + 2.0f;
    set_obj_animation_and_sound_state(11);
    sp1C = obj_rotate_yaw_toward(o->oAngleToMario, 0x800);
    if (sp1C)
        o->oAction = 0;
    if (func_802B9F10()) {
        if (o->oDistanceToMario > 500.0f)
            o->oAction = 1;
    } else if (o->oDistanceToMario < 300.0f)
        o->oAction = 1;
}

void ActionUkikiOpenCage1(void) {
    s32 sp1C = 1;
    s16 sp1A = o->oAngleToMario + 0x8000;
    if (func_802B9F10()) {
        sp1C = 0;
        sp1A = o->oAngleToMario;
    }
    if (o->oTimer == 0)
        o->oUkikiOpenCageUnk110 = RandomFloat() * 100.0f + 350.0f;
    set_obj_animation_and_sound_state(0);
    obj_rotate_yaw_toward(sp1A, 0x800);
    func_8029F684(20.0f, 0.9f);
    if (sp1C) {
        if (o->oDistanceToMario > o->oUkikiOpenCageUnk110)
            o->oAction = 2;
    } else if (o->oDistanceToMario < o->oUkikiOpenCageUnk110)
        o->oAction = 2;
    if (sp1C) {
        if (o->oDistanceToMario < 200.0f) {
            if ((o->oMoveFlags & 0x200) && obj_is_mario_moving_fast_or_in_air(10)) {
                o->oAction = 3;
                o->oMoveAngleYaw = o->oWallAngle;
            } else if ((o->oMoveFlags & 0x400))
                if (obj_is_mario_moving_fast_or_in_air(10)) {
                    o->oAction = 3;
                    o->oMoveAngleYaw += 0x8000;
                }
        }
    }
}

void ActionUkikiOpenCage3(void) {
    o->oForwardVel = 10.0f;
    obj_become_intangible();
    if (o->oSubAction == 0) {
        if (o->oTimer == 0)
            func_8029FA1C(RandomFloat() * 10.0f + 45.0f, 8);
        else if (o->oMoveFlags & (0x40 | 0x10 | 2 | 1)) {
            o->oSubAction++;
            o->oVelY = 0.0f;
        }
    } else {
        o->oForwardVel = 0.0f;
        set_obj_animation_and_sound_state(7);
        obj_become_tangible();
        if (func_8029F788())
            o->oAction = 1;
    }
}

void ActionUkikiOpenCage4(void) {
    struct Object *sp24;
    f32 sp20 = 0.0f;
    s16 sp1E = 0;
    sp24 = obj_nearest_object_with_behavior(bhvUnused0F14);
    if (sp24 != NULL) {
        sp20 = lateral_dist_between_objects(o, sp24->parentObj);
        sp1E = angle_to_object(o, sp24->parentObj);
    }
    obj_become_intangible();
    o->oFlags |= 0x80;
    switch (o->oSubAction) {
        case 0:
            set_obj_animation_and_sound_state(0);
            o->oUkikiOpenCageUnkFC = D_8032F77C;
            if (obj_follow_path(0) != -1) {
                o->oForwardVel = 10.0f;
                obj_rotate_yaw_toward(o->oUkikiOpenCageUnk10C, 0x400);
                o->oPosY = o->oFloorHeight;
            } else {
                o->oForwardVel = 0.0f;
                o->oSubAction++;
            }
            break;
        case 1:
            set_obj_animation_and_sound_state(5);
            obj_rotate_yaw_toward(o->oAngleToMario, 0x400);
            if (func_802A3FF8(200.0f, 30.0f, 0x7FFF))
                o->oSubAction++;
            else // weird?
                break;
        case 2:
            set_obj_animation_and_sound_state(10);
            if (obj_update_dialog_unk2(3, 1, 162, 80))
                o->oSubAction++;
            break;
        case 3:
            set_obj_animation_and_sound_state(0);
            if (obj_rotate_yaw_toward(sp1E, 0x400)) {
                o->oForwardVel = 10.0f;
                o->oSubAction++;
            }
            break;
        case 4:
            func_8029FA1C(55.0f, 8);
            o->oForwardVel = 36.0f;
            o->oSubAction++;
            break;
        case 5:
            if (sp20 < 50.0f)
                o->oForwardVel = 0.0f;
            if (o->oMoveFlags & 1) {
                play_puzzle_jingle();
                set_obj_animation_and_sound_state(5);
                o->oSubAction++;
                o->oUnk1B0_S16 = 32;
                sp24->parentObj->oUnknownUnk88 = 1;
                o->oForwardVel = 0.0f;
            }
            break;
        case 6:
            o->oMoveAngleYaw += 0x800;
            o->oUnk1B0_S16--;
            if (o->oUnk1B0_S16 < 0) {
                o->oSubAction++;
                sp24->parentObj->oUnknownUnk88 = 2;
            }
            break;
        case 7:
            if (o->oPosY < -1300.0f)
                mark_object_for_deletion(o);
            break;
    }
}

void (*sUkikiOpenCageActions[])(void) = { ActionUkikiOpenCage0, ActionUkikiOpenCage1,
                                          ActionUkikiOpenCage2, ActionUkikiOpenCage3,
                                          ActionUkikiOpenCage4, ActionUkikiOpenCage5,
                                          ActionUkikiOpenCage6, ActionUkikiOpenCage7 };
s16 D_8032F860[] = { 2,  30,      0x4000, 0, 1,   220, 900, 30, 1,  30, 0,   -30, 2,
                     30, -0x4000, 0,      1, 220, 900, 30,  1,  30, 0,  -30, 3,   0 };
s16 D_8032F894[] = { 4,  0,      0, 0, 1,   475, 900, 30, 1,  30, 0,   -30, 2,
                     30, 0x8000, 0, 1, 475, 900, 30,  1,  30, 0,  -30, 3,   0 };
s16 *D_8032F8C8[] = { D_8032F860, D_8032F894 };

void func_802BAE40(void) {
    s32 sp1C;
    obj_update_floor_and_walls();
    obj_call_action_function(sUkikiOpenCageActions);
    if (o->oAction == 4 || o->oAction == 7)
        sp1C = -88;
    else
        sp1C = -20;
    obj_move_standard(sp1C);
    func_802B9E88();
    if (!(o->oMoveFlags & (0x40 | 0x20 | 0x10 | 8)))
        exec_anim_sound_state(D_8032F7D8);
}

// Unused function for timing ukiki's blinking. Image still present in Ukiki's actor graphics.
static void ukiki_blink_timer(void) {
    if (gGlobalTimer % 50 < 7)
        o->oAnimState = 1;
    else
        o->oAnimState = 0;
}

void func_802BAF30(void) {
    if (o->oPosY - o->oHomeY > -100.0f)
        switch (o->oUnk1AC_S16) {
            case 0:
                if (set_mario_npc_dialog(2) == 2) {
                    func_802D8050(79);
                    o->oUnk1AC_S16 = 1;
                }
                break;
            case 1:
                if (gDialogResponse != 0) {
                    set_mario_npc_dialog(0);
                    if (gDialogResponse == 1) {
                        o->oUnk190 |= 0x40;
                        o->oUnk1AC_S16 = 2;
                    } else {
                        o->oUnk1AC_S16 = 6;
                        o->oUnk1AE = 60;
                    }
                }
                break;
            case 2:
                break;
            case 6:
                if (o->oUnk1AE-- < 0)
                    o->oUnk1AC_S16 = 0;
                break;
        }
    else {
        o->oUnk1AC_S16 = 0;
        o->oTimer = 0;
        o->oAction = 5;
    }
}

void func_802BB0E4(void) {
    switch (o->oUnk1AC_S16) {
        case 0:
            if (mario_lose_cap_to_enemy(2)) {
                o->oUnk1AC_S16 = 7;
                o->oUnk1B2 |= 1;
            } else {
            }
            break;
        case 7:
            if (obj_update_dialog_unk1(2, 2, 100, 0)) {
                o->oUnk190 |= 0x40;
                o->oUnk1AC_S16 = 3;
            }
            break;
        case 3:
            break;
        case 4:
            if (obj_update_dialog_unk1(2, 18, 101, 0)) {
                mario_retrieve_cap();
                set_mario_npc_dialog(0);
                o->oUnk1B2 &= ~1;
                o->oUnk1AC_S16 = 5;
            }
            break;
        case 5:
            o->oUnk1AC_S16 = 0;
            o->oAction = 0;
            break;
    }
}

void bhv_ukiki_open_cage_init(void) {
    if (o->oBehParams2ndByte == 1)
        if (save_file_get_flags() & SAVE_FLAG_CAP_ON_UKIKI) {
            o->oUnk1AC_S16 = 4;
            o->oUnk1B2 |= 1;
        }
}

void bhv_ukiki_open_cage_loop(void) {
    switch (o->oHeldState) {
        case HELD_FREE:
            o->oUnk1AE = 0;
            func_802BAE40();
            break;
        case HELD_HELD:
            func_8029FA5C(12, 0);
            copy_object_pos(o, gMarioObject);
            if (o->oBehParams2ndByte == 1)
                func_802BB0E4();
            else
                func_802BAF30();
            break;
        case HELD_THROWN:
        case HELD_DROPPED:
            obj_get_dropped();
            break;
    }
    if (o->oUnk1B2 & 1)
        o->oAnimState = 2;
    else
        o->oAnimState = 0;
    o->oInteractStatus = 0;
    print_debug_bottom_up("mode   %d\n", o->oAction);
    print_debug_bottom_up("action %d\n", o->oHeldState);
}
