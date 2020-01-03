// king_bobomb.c.inc

void bhv_bobomb_anchor_mario_loop(void) {
    func_802A8D18(50.0f, 50.0f, 64);
}

void ActionKingBobomb0(void) {
#ifndef VERSION_JP
    o->oForwardVel = 0;
    o->oVelY = 0;
#endif
    if (o->oSubAction == 0) {
        obj_become_intangible();
        gSecondCameraFocus = o;
        set_obj_animation_and_sound_state(5);
        obj_set_pos_to_home();
        o->oHealth = 3;
        if (obj_is_mario_in_range_and_ready_to_speak(500.0f, 100.0f)) {
            o->oSubAction++;
            func_8031FFB4(0, 60, 40);
        }
    } else if (obj_update_dialog_with_cutscene(2, 1, CUTSCENE_DIALOG, DIALOG_017)) {
        o->oAction = 2;
        o->oFlags |= OBJ_FLAG_HOLDABLE;
    }
}

int func_802A6AF8(f32 arg0) {
    if (arg0 < o->oPosY - gMarioObject->oPosY)
        return 1;
    else
        return 0;
}

void ActionKingBobomb2(void) {
    obj_become_tangible();
    if (o->oPosY - o->oHomeY < -100.0f) { // Thrown off hill
        o->oAction = 5;
        obj_become_intangible();
    }
    if (o->oKingBobombUnk100 == 0) {
        if (obj_check_anim_frame(15))
            ShakeScreen(SHAKE_POS_SMALL);
        if (func_802A4AB0(4))
            o->oKingBobombUnk100++;
    } else {
        if (o->oKingBobombUnk100 == 1) {
            func_802A4A70(11, 7);
            o->oKingBobombUnk100 = 2;
        } else
            set_obj_animation_and_sound_state(11);
        if (o->oKingBobombUnk108 == 0) {
            o->oForwardVel = 3.0f;
            obj_rotate_yaw_toward(o->oAngleToMario, 0x100);
        } else {
            o->oForwardVel = 0.0f;
            o->oKingBobombUnk108--;
        }
    }
    if (obj_check_grabbed_mario())
        o->oAction = 3;
    if (func_802A6AF8(1200.0f)) {
        o->oAction = 0;
        stop_background_music(SEQUENCE_ARGS(4, SEQ_EVENT_BOSS));
    }
}

void ActionKingBobomb3(void) {
    if (o->oSubAction == 0) {
        o->oForwardVel = 0;
        o->oKingBobombUnk104 = 0;
        o->oKingBobombUnkFC = 0;
        if (o->oTimer == 0)
            PlaySound2(SOUND_OBJ_UNKNOWN3);
        if (func_802A4AB0(0)) {
            o->oSubAction++;
            func_802A4A70(1, 0);
        }
    } else {
        if (o->oSubAction == 1) {
            set_obj_animation_and_sound_state(1);
            o->oKingBobombUnkFC += player_performed_grab_escape_action();
            print_debug_bottom_up("%d", o->oKingBobombUnkFC);
            if (o->oKingBobombUnkFC > 10) {
                o->oKingBobombUnk88 = 3;
                o->oAction = 2;
                o->oKingBobombUnk108 = 35;
                o->oInteractStatus &= ~(INT_STATUS_GRABBED_MARIO);
            } else {
                o->oForwardVel = 3.0f;
                if (o->oKingBobombUnk104 > 20 && obj_rotate_yaw_toward(0, 0x400)) {
                    o->oSubAction++;
                    func_802A4A70(9, 22);
                }
            }
            o->oKingBobombUnk104++;
        } else {
            set_obj_animation_and_sound_state(9);
            if (obj_check_anim_frame(31)) {
                o->oKingBobombUnk88 = 2;
                PlaySound2(SOUND_OBJ_UNKNOWN4);
            } else if (func_8029F788()) {
                o->oAction = 1;
                o->oInteractStatus &= ~(INT_STATUS_GRABBED_MARIO);
            }
        }
    }
}

void ActionKingBobomb1(void) {
    o->oForwardVel = 0;
    o->oVelY = 0;
    set_obj_animation_and_sound_state(11);
    o->oMoveAngleYaw = approach_s16_symmetric(o->oMoveAngleYaw, o->oAngleToMario, 512);
    if (o->oDistanceToMario < 2500.0f)
        o->oAction = 2;
    if (func_802A6AF8(1200.0f)) {
        o->oAction = 0;
        stop_background_music(SEQUENCE_ARGS(4, SEQ_EVENT_BOSS));
    }
}

void ActionKingBobomb6(void) {
    if (o->oSubAction == 0) {
        if (o->oTimer == 0) {
            o->oKingBobombUnk104 = 0;
            PlaySound2(SOUND_OBJ_KING_BOBOMB);
            PlaySound2(SOUND_OBJ2_KING_BOBOMB_DAMAGE);
            ShakeScreen(SHAKE_POS_SMALL);
            func_802AA618(0, 0, 100.0f);
            o->oInteractType = 8;
            obj_become_tangible();
        }
        if (func_802A4AB0(2))
            o->oKingBobombUnk104++;
        if (o->oKingBobombUnk104 > 3) {
            o->oSubAction++;
            ; // Needed to match
        }
    } else {
        if (o->oSubAction == 1) {
            if (func_802A4AB0(10)) {
                o->oSubAction++;
                o->oInteractType = 2;
                obj_become_intangible();
            }
        } else {
            set_obj_animation_and_sound_state(11);
            if (obj_rotate_yaw_toward(o->oAngleToMario, 0x800) == 1)
                o->oAction = 2;
        }
    }
}

void ActionKingBobomb7(void) {
    set_obj_animation_and_sound_state(2);
    if (obj_update_dialog_with_cutscene(2, 2, CUTSCENE_DIALOG, DIALOG_116)) {
        create_sound_spawner(SOUND_OBJ_KING_WHOMP_DEATH);
        obj_hide();
        obj_become_intangible();
        func_802AA618(0, 0, 200.0f);
        spawn_triangle_break_particles(20, 138, 3.0f, 4);
        ShakeScreen(SHAKE_POS_SMALL);
#ifndef VERSION_JP
        obj_spawn_star_at_y_offset(2000.0f, 4500.0f, -4500.0f, 200.0f);
#else
        o->oPosY += 100.0f;
        create_star(2000.0f, 4500.0f, -4500.0f);
#endif
        o->oAction = 8;
    }
}

void ActionKingBobomb8(void) {
    if (o->oTimer == 60)
        stop_background_music(SEQUENCE_ARGS(4, SEQ_EVENT_BOSS));
}

void ActionKingBobomb4() { // bobomb been thrown
    if (o->oPosY - o->oHomeY > -100.0f) { // not thrown off hill
        if (o->oMoveFlags & 1) {
            o->oHealth--;
            o->oForwardVel = 0;
            o->oVelY = 0;
            PlaySound2(SOUND_OBJ_KING_BOBOMB);
            if (o->oHealth)
                o->oAction = 6;
            else
                o->oAction = 7;
        }
    } else {
        if (o->oSubAction == 0) {
            if (o->oMoveFlags & 2) {
                o->oForwardVel = 0;
                o->oVelY = 0;
                o->oSubAction++;
            } else if (o->oMoveFlags & 1)
                PlaySound2(SOUND_OBJ_KING_BOBOMB);
        } else {
            if (func_802A4AB0(10))
                o->oAction = 5; // Go back to top of hill
            o->oSubAction++;
        }
    }
}

void ActionKingBobomb5() { // bobomb returns home
    switch (o->oSubAction) {
        case 0:
            if (o->oTimer == 0)
                PlaySound2(SOUND_OBJ_KING_BOBOMB_JUMP);
            o->oKingBobombUnkF8 = 1;
            func_802A4AEC(8);
            o->oMoveAngleYaw = obj_angle_to_home();
            if (o->oPosY < o->oHomeY)
                o->oVelY = 100.0f;
            else {
                func_802B2894(&o->oHomeX, &o->oPosX, 100.0f, -4.0f);
                o->oSubAction++;
            }
            break;
        case 1:
            func_802A4AEC(8);
            if (o->oVelY < 0 && o->oPosY < o->oHomeY) {
                o->oPosY = o->oHomeY;
                o->oVelY = 0;
                o->oForwardVel = 0;
                o->oGravity = -4.0f;
                o->oKingBobombUnkF8 = 0;
                set_obj_animation_and_sound_state(7);
                PlaySound2(SOUND_OBJ_KING_BOBOMB);
                ShakeScreen(SHAKE_POS_SMALL);
                o->oSubAction++;
            }
            break;
        case 2:
            if (func_802A4AB0(7))
                o->oSubAction++;
            break;
        case 3:
            if (func_802A6AF8(1200.0f)) {
                o->oAction = 0;
                stop_background_music(SEQUENCE_ARGS(4, SEQ_EVENT_BOSS));
            }
            if (obj_is_mario_in_range_and_ready_to_speak(500.0f, 100.0f))
                o->oSubAction++;
            break;
        case 4:
            if (obj_update_dialog_with_cutscene(2, 1, CUTSCENE_DIALOG, DIALOG_128))
                o->oAction = 2;
            break;
    }
}

void (*sKingBobombActions[])(void) = {
    ActionKingBobomb0, ActionKingBobomb1, ActionKingBobomb2, ActionKingBobomb3, ActionKingBobomb4,
    ActionKingBobomb5, ActionKingBobomb6, ActionKingBobomb7, ActionKingBobomb8,
};
struct SoundState sKingBobombSoundStates[] = {
    { 0, 0, 0, NO_SOUND },
    { 1, 1, 20, SOUND_OBJ_POUNDING1_HIGHPRIO },
    { 0, 0, 0, NO_SOUND },
    { 0, 0, 0, NO_SOUND },
    { 1, 15, -1, SOUND_OBJ_POUNDING1_HIGHPRIO },
    { 0, 0, 0, NO_SOUND },
    { 0, 0, 0, NO_SOUND },
    { 0, 0, 0, NO_SOUND },
    { 0, 0, 0, NO_SOUND },
    { 1, 33, -1, SOUND_OBJ_POUNDING1_HIGHPRIO },
    { 0, 0, 0, NO_SOUND },
    { 1, 1, 15, SOUND_OBJ_POUNDING1_HIGHPRIO },
};

void func_802A7748(void) {
    obj_update_floor_and_walls();
    if (o->oKingBobombUnkF8 == 0)
        obj_move_standard(-78);
    else
        obj_move_using_fvel_and_gravity();
    obj_call_action_function(sKingBobombActions);
    exec_anim_sound_state(sKingBobombSoundStates);
    if (o->oDistanceToMario < 5000.0f)
        obj_enable_rendering();
    else
        obj_disable_rendering();
}

void bhv_king_bobomb_loop(void) {
    f32 sp34 = 20.0f;
    f32 sp30 = 50.0f;
    UNUSED u8 pad[8];
    o->oInteractionSubtype |= INT_SUBTYPE_GRABS_MARIO;
    switch (o->oHeldState) {
        case HELD_FREE:
            func_802A7748();
            break;
        case HELD_HELD:
            func_8029FA5C(6, 1);
            break;
        case HELD_THROWN:
        case HELD_DROPPED:
            obj_get_thrown_or_placed(sp34, sp30, 4);
            obj_become_intangible();
            o->oPosY += 20.0f;
            break;
    }
    o->oInteractStatus = 0;
}
