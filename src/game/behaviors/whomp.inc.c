// whomp.c.inc

void func_802C61CC(void) {
    UNUSED s32 sp2C = o->header.gfx.unk38.animFrame;
    s32 sp28 = 0;
    if (o->oForwardVel < 5.0f) {
        sp28 = obj_check_anim_frame(0);
        sp28 |= obj_check_anim_frame(23);
    } else {
        sp28 = obj_check_anim_frame_in_range(0, 3);
        sp28 |= obj_check_anim_frame_in_range(23, 3);
    }
    if (sp28)
        PlaySound2(SOUND_OBJ_POUNDING1);
}

void ActionWhomp0(void) {
    func_8029ED98(0, 1.0f);
    obj_set_pos_to_home();
    if (o->oBehParams2ndByte != 0) {
        gSecondCameraFocus = o;
        obj_scale(2.0f);
        if (o->oSubAction == 0) {
            if (o->oDistanceToMario < 600.0f) {
                o->oSubAction++;
                func_8031FFB4(0, 60, 40);
            } else {
                obj_set_pos_to_home();
                o->oHealth = 3;
            }
        } else if (obj_update_dialog_with_cutscene(2, 1, CUTSCENE_DIALOG, DIALOG_114))
            o->oAction = 2;
    } else if (o->oDistanceToMario < 500.0f)
        o->oAction = 1;
    func_802C61CC();
}

void ActionWhomp7(void) {
    if (o->oSubAction == 0) {
        o->oForwardVel = 0.0f;
        func_8029ED98(0, 1.0f);
        if (o->oTimer > 31)
            o->oSubAction++;
        else
            o->oMoveAngleYaw += 0x400;
    } else {
        o->oForwardVel = 3.0f;
        if (o->oTimer > 42)
            o->oAction = 1;
    }
    func_802C61CC();
}

void ActionWhomp1(void) {
    s16 sp26;
    f32 sp20;
    f32 sp1C;
    sp26 = abs_angle_diff(o->oAngleToMario, o->oMoveAngleYaw);
    sp20 = obj_lateral_dist_to_home();
    if (gCurrLevelNum == LEVEL_BITS)
        sp1C = 200.0f;
    else
        sp1C = 700.0f;
    func_8029ED98(0, 1.0f);
    o->oForwardVel = 3.0f;
    if (sp20 > sp1C)
        o->oAction = 7;
    else if (sp26 < 0x2000) {
        if (o->oDistanceToMario < 1500.0f) {
            o->oForwardVel = 9.0f;
            func_8029ED98(0, 3.0f);
        }
        if (o->oDistanceToMario < 300.0f)
            o->oAction = 3;
    }
    func_802C61CC();
}

void ActionWhomp2(void) {
    s16 sp1E;
    func_8029ED98(0, 1.0f);
    o->oForwardVel = 3.0f;
    obj_rotate_yaw_toward(o->oAngleToMario, 0x200);
    if (o->oTimer > 30) {
        sp1E = abs_angle_diff(o->oAngleToMario, o->oMoveAngleYaw);
        if (sp1E < 0x2000) {
            if (o->oDistanceToMario < 1500.0f) {
                o->oForwardVel = 9.0f;
                func_8029ED98(0, 3.0f);
            }
            if (o->oDistanceToMario < 300.0f)
                o->oAction = 3;
        }
    }
    func_802C61CC();
    if (func_802A6AF8(1000.0f)) {
        o->oAction = 0;
        stop_background_music(SEQUENCE_ARGS(4, SEQ_EVENT_BOSS));
    }
}

void ActionWhomp3(void) {
    o->oForwardVel = 0.0f;
    func_8029ED98(1, 1.0f);
    if (func_8029F788())
        o->oAction = 4;
}

void ActionWhomp4(void) {
    if (o->oTimer == 0)
        o->oVelY = 40.0f;
    if (o->oTimer < 8) {
    } else {
        o->oAngleVelPitch += 0x100;
        o->oFaceAnglePitch += o->oAngleVelPitch;
        if (o->oFaceAnglePitch > 0x4000) {
            o->oAngleVelPitch = 0;
            o->oFaceAnglePitch = 0x4000;
            o->oAction = 5;
        }
    }
}

void ActionWhomp5(void) {
    if (o->oSubAction == 0 && o->oMoveFlags & 1) {
        PlaySound2(SOUND_OBJ_WHOMP_LOWPRIO);
        ShakeScreen(SHAKE_POS_SMALL);
        o->oVelY = 0.0f;
        o->oSubAction++;
    }
    if (o->oMoveFlags & 2)
        o->oAction = 6;
}

void func_802C6954(void) {
    Vec3f pos;
    if (o->oSubAction == 0) {
        if (obj_is_mario_ground_pounding_platform()) {
            o->oHealth--;
            PlaySound2(SOUND_OBJ2_WHOMP_SOUND_SHORT);
            PlaySound2(SOUND_OBJ_KING_WHOMP_DEATH);
            if (o->oHealth == 0)
                o->oAction = 8;
            else {
                func_802B8F7C(pos, &o->oPosX);
                func_802B8F7C(&o->oPosX, &gMarioObject->oPosX);
                func_802AA618(0, 0, 100.0f);
                spawn_triangle_break_particles(20, 138, 3.0f, 4);
                ShakeScreen(SHAKE_POS_SMALL);
                func_802B8F7C(&o->oPosX, pos);
            }
            o->oSubAction++;
        }
        o->oWhompUnkF8 = 0;
    } else {
        if (o->oWhompUnkF8 < 10) {
            if (o->oWhompUnkF8 % 2)
                o->oPosY += 8.0f;
            else
                o->oPosY -= 8.0f;
        } else
            o->oSubAction = 10;
        o->oWhompUnkF8++;
    }
}

void func_802C6B28(void) {
    if (o->oSubAction == 0) {
        if (gMarioObject->platform == o) {
            if (obj_is_mario_ground_pounding_platform()) {
                o->oNumLootCoins = 5;
                spawn_object_loot_yellow_coins(o, 5, 20.0f);
                o->oAction = 8;
            } else {
                obj_spawn_loot_coin_at_mario_pos();
                o->oSubAction++;
            }
        }
    } else if (!obj_is_mario_on_platform())
        o->oSubAction = 0;
}

void ActionWhomp6(void) {
    if (o->oSubAction != 10) {
        o->oForwardVel = 0.0f;
        o->oAngleVelPitch = 0;
        o->oAngleVelYaw = 0;
        o->oAngleVelRoll = 0;
        if (o->oBehParams2ndByte != 0)
            func_802C6954();
        else
            func_802C6B28();
        if (o->oTimer > 100 || (gMarioState->action == ACT_SQUISHED && o->oTimer > 30))
            o->oSubAction = 10;
    } else {
        if (o->oFaceAnglePitch > 0) {
            o->oAngleVelPitch = -0x200;
            o->oFaceAnglePitch += o->oAngleVelPitch;
        } else {
            o->oAngleVelPitch = 0;
            o->oFaceAnglePitch = 0;
            if (o->oBehParams2ndByte != 0)
                o->oAction = 2;
            else
                o->oAction = 1;
        }
    }
}

void ActionWhomp8(void) {
    if (o->oBehParams2ndByte != 0) {
        if (obj_update_dialog_with_cutscene(2, 2, CUTSCENE_DIALOG, DIALOG_115)) {
            set_object_angle(o, 0, 0, 0);
            obj_hide();
            obj_become_intangible();
            func_802AA618(0, 0, 200.0f);
            spawn_triangle_break_particles(20, 138, 3.0f, 4);
            ShakeScreen(SHAKE_POS_SMALL);
            o->oPosY += 100.0f;
            create_star(180.0f, 3880.0f, 340.0f);
            PlaySound2(SOUND_OBJ_KING_WHOMP_DEATH);
            o->oAction = 9;
        }
    } else {
        func_802AA618(0, 0, 100.0f);
        spawn_triangle_break_particles(20, 138, 3.0f, 4);
        ShakeScreen(SHAKE_POS_SMALL);
        create_sound_spawner(SOUND_OBJ_THWOMP);
        mark_object_for_deletion(o);
    }
}

void ActionWhomp9(void) {
    if (o->oTimer == 60)
        stop_background_music(SEQUENCE_ARGS(4, SEQ_EVENT_BOSS));
}

void (*sWhompActions[])(void) = {
    ActionWhomp0, ActionWhomp1, ActionWhomp2, ActionWhomp3, ActionWhomp4,
    ActionWhomp5, ActionWhomp6, ActionWhomp7, ActionWhomp8, ActionWhomp9
};

// MM
void bhv_whomp_loop(void) {
    obj_update_floor_and_walls();
    obj_call_action_function(sWhompActions);
    obj_move_standard(-20);
    if (o->oAction != 9) {
        if (o->oBehParams2ndByte != 0)
            obj_hide_if_mario_far_away_y(2000.0f);
        else
            obj_hide_if_mario_far_away_y(1000.0f);
        load_object_collision_model();
    }
}
