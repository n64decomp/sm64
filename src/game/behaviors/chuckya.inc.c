// chuckya.c.inc

void func_802A8D18(f32 sp28, f32 sp2C, s32 sp30) {
    switch (o->parentObj->oChuckyaUnk88) {
        case 0:
            break;
        case 1:
            func_802A2008(gMarioObject, o);
            break;
        case 2:
            gMarioObject->oInteractStatus |= (sp30 + INT_STATUS_MARIO_UNK2);
            gMarioStates->forwardVel = sp28;
            gMarioStates->vel[1] = sp2C;
            o->parentObj->oChuckyaUnk88 = 0;
            break;
        case 3:
            gMarioObject->oInteractStatus |=
                (INT_STATUS_MARIO_UNK2 + INT_STATUS_MARIO_UNK6); // loads 2 interactions at once?
            gMarioStates->forwardVel = 10.0f;
            gMarioStates->vel[1] = 10.0f;
            o->parentObj->oChuckyaUnk88 = 0;
            break;
    }
    o->oMoveAngleYaw = o->parentObj->oMoveAngleYaw;
    if (!o->parentObj->activeFlags)
        mark_object_for_deletion(o);
}

void bhv_chuckya_anchor_mario_loop(void) {
    func_802A8D18(40.0f, 40.0f, 64);
}

s32 Unknown802A8EC8(s32 sp20, f32 sp24, f32 sp28, s32 sp2C) {
    s32 sp1C = 0;
    if (o->oChuckyaUnkF8 != 4) {
        if (sp24 < obj_lateral_dist_from_mario_to_home()) {
            if (obj_lateral_dist_to_home() < 200.0f)
                sp1C = 0;
            else {
                sp1C = 1;
                o->oAngleToMario = obj_angle_to_home();
            }
        } else if (o->oDistanceToMario > sp28) {
            if (gGlobalTimer % (s16) sp2C == 0)
                o->oAngleToMario = angle_to_object(o, gMarioObject);
            sp1C = 2;
        } else
            sp1C = 3;
        if (sp20 && func_802C5A64(&o->oAngleToMario)) {
            sp1C = 4;
            o->oChuckyaUnkF8 = 4;
        }
    } else
        sp1C = 4;
    return sp1C;
}

s32 func_802A9050(f32 *arr, f32 spC, f32 sp10) {
    s32 sp4 = 0;
    if (arr[0] > spC) {
        arr[0] -= sp10;
        if (arr[0] < spC)
            arr[0] = spC;
    } else if (arr[0] < spC) {
        arr[0] += sp10;
        if (arr[0] > spC)
            arr[0] = spC;
    } else
        sp4 = 1;
    return sp4;
}

void ActionChuckya0(void) {
    s32 sp3C;
    UNUSED u8 pad[16];
    s32 sp28;
    if (o->oTimer == 0)
        o->oChuckyaUnkFC = 0;
    o->oAngleToMario = angle_to_object(o, gMarioObject);
    switch (sp28 = o->oSubAction) {
        case 0:
            o->oForwardVel = 0;
            if (obj_lateral_dist_from_mario_to_home() < 2000.0f) {
                obj_rotate_yaw_toward(o->oAngleToMario, 0x400);
                if (o->oChuckyaUnkFC > 40
                    || abs_angle_diff(o->oMoveAngleYaw, o->oAngleToMario) < 0x1000)
                    o->oSubAction = 1;
            } else
                o->oSubAction = 3;
            break;
        case 1:
            func_802A9050(&o->oForwardVel, 30.0f, 4.0f);
            if (abs_angle_diff(o->oMoveAngleYaw, o->oAngleToMario) > 0x4000)
                o->oSubAction = 2;
            if (obj_lateral_dist_from_mario_to_home() > 2000.0f)
                o->oSubAction = 3;
            break;
        case 2:
            func_802A9050(&o->oForwardVel, 0, 4.0f);
            if (o->oChuckyaUnkFC > 48)
                o->oSubAction = 0;
            break;
        case 3:
            if (obj_lateral_dist_to_home() < 500.0f)
                o->oForwardVel = 0;
            else {
                func_802A9050(&o->oForwardVel, 10.0f, 4.0f);
                o->oAngleToMario = obj_angle_to_home();
                obj_rotate_yaw_toward(o->oAngleToMario, 0x800);
            }
            if (obj_lateral_dist_from_mario_to_home() < 1900.0f)
                o->oSubAction = 0;
            break;
    }
    if (o->oSubAction != sp28)
        o->oChuckyaUnkFC = 0;
    else
        o->oChuckyaUnkFC++;
    set_obj_animation_and_sound_state(4);
    if (o->oForwardVel > 1.0f)
        PlaySound(SOUND_AIR_CHUCKYA_MOVE);
    print_debug_bottom_up("fg %d", sp3C);
    print_debug_bottom_up("sp %d", o->oForwardVel);
}

void ActionChuckya1(void) {
    if (o->oSubAction == 0) {
        if (func_802A4AB0(0))
            o->oSubAction++;
        o->oChuckyaUnkFC = RandomFloat() * 30.0f + 10.0f;
        o->oChuckyaUnk100 = 0;
        o->oForwardVel = 0.0f;
    } else {
        if (o->oSubAction == 1) {
            o->oChuckyaUnk100 += player_performed_grab_escape_action();
            print_debug_bottom_up("%d", o->oChuckyaUnk100);
            if (o->oChuckyaUnk100 > 10) {
                o->oChuckyaUnk88 = 3;
                o->oAction = 3;
                o->oInteractStatus &= ~(INT_STATUS_GRABBED_MARIO);
            } else {
                set_obj_animation_and_sound_state(1);
                o->oMoveAngleYaw += INT_STATUS_GRABBED_MARIO;
                if (o->oChuckyaUnkFC-- < 0)
                    if (func_802B0C54(50.0f, 150.0f) || o->oChuckyaUnkFC < -16) {
                        o->oSubAction++;
                        ;
                    }
            }
        } else {
            set_obj_animation_and_sound_state(3);
            if (obj_check_anim_frame(18)) {
                PlaySound2(SOUND_OBJ_UNKNOWN4);
                o->oChuckyaUnk88 = 2;
                o->oAction = 3;
                o->oInteractStatus &= ~(INT_STATUS_GRABBED_MARIO);
            }
        }
    }
}

void ActionChuckya3(void) {
    o->oForwardVel = 0;
    o->oVelY = 0;
    set_obj_animation_and_sound_state(4);
    if (o->oTimer > 100)
        o->oAction = 0;
}

void ActionChuckya2(void) {
    if (o->oMoveFlags & (0x200 | 0x40 | 0x20 | 0x10 | 0x8 | 0x1)) {
        mark_object_for_deletion(o);
        spawn_object_loot_yellow_coins(o, 5, 20.0f);
        func_802A3034(SOUND_OBJ_CHUCKYA_DEATH);
    }
}

void (*sChuckyaActions[])(void) = { ActionChuckya0, ActionChuckya1, ActionChuckya2, ActionChuckya3 };

void func_802A97B8(void) {
    obj_update_floor_and_walls();
    obj_call_action_function(sChuckyaActions);
    obj_move_standard(-30);
    if (o->oInteractStatus & INT_STATUS_GRABBED_MARIO) {
        o->oAction = 1;
        o->oChuckyaUnk88 = 1;
        PlaySound2(SOUND_OBJ_UNKNOWN3);
    }
}

void bhv_chuckya_loop(void) {
    f32 sp2C = 20.0f;
    f32 sp28 = 50.0f;
    obj_scale(2.0f);
    o->oInteractionSubtype |= INT_SUBTYPE_GRABS_MARIO;
    switch (o->oHeldState) {
        case HELD_FREE:
            func_802A97B8();
            break;
        case HELD_HELD:
            func_8029FA5C(2, 0);
            break;
        case HELD_THROWN:
        case HELD_DROPPED:
            obj_get_thrown_or_placed(sp2C, sp28, 2);
            break;
    }
    o->oInteractStatus = 0;
    print_debug_bottom_up("md %d", o->oAction);
}
