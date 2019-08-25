// kickable_board.c.inc

s32 func_802A9A0C(UNUSED s32 sp18) {
    if (are_objects_collided(o, gMarioObject)) {
        if (abs_angle_diff(o->oMoveAngleYaw, gMarioObject->oMoveAngleYaw) > 0x6000) {
            if (gMarioStates->action == ACT_SLIDE_KICK)
                return 1;
            if (gMarioStates->action == ACT_PUNCHING)
                return 1;
            if (gMarioStates->action == ACT_MOVE_PUNCHING)
                return 1;
            if (gMarioStates->action == ACT_SLIDE_KICK_SLIDE)
                return 1;
            if (gMarioStates->action == ACT_JUMP_KICK)
                return 2;
            if (gMarioStates->action == ACT_WALL_KICK_AIR)
                return 2;
        }
    }
    return 0;
}

void func_802A9B54(void) {
    o->OBJECT_FIELD_S32(0x1C) = 1600;
    o->OBJECT_FIELD_S32(0x1B) = 0;
}

void bhv_kickable_board_loop(void) {
    s32 sp24;
    switch (o->oAction) {
        case 0:
            o->oFaceAnglePitch = 0;
            if (func_802A9A0C(0)) {
                func_802A9B54();
                o->oAction++;
            }
            load_object_collision_model();
            break;
        case 1:
            o->oFaceAnglePitch = 0;
            load_object_collision_model();
            o->oFaceAnglePitch = -sins(o->OBJECT_FIELD_S32(0x1B)) * o->OBJECT_FIELD_S32(0x1C);
            if (o->oTimer > 30 && (sp24 = func_802A9A0C(0))) {
                if (gMarioObject->oPosY > o->oPosY + 160.0f && sp24 == 2) {
                    o->oAction++;
                    PlaySound2(SOUND_GENERAL_BUTTONPRESS_2);
                } else
                    o->oTimer = 0;
            }
            if (o->oTimer != 0) {
                o->OBJECT_FIELD_S32(0x1C) -= 8;
                if (o->OBJECT_FIELD_S32(0x1C) < 0)
                    o->oAction = 0;
            } else
                func_802A9B54();
            if (!(o->OBJECT_FIELD_S32(0x1B) & 0x7FFF))
                PlaySound2(SOUND_GENERAL_BUTTONPRESS_2);
            o->OBJECT_FIELD_S32(0x1B) += 0x400;
            break;
        case 2:
            obj_become_intangible();
            obj_set_model(MODEL_WF_KICKABLE_BOARD_FELLED);
            o->oAngleVelPitch -= 0x80;
            o->oFaceAnglePitch += o->oAngleVelPitch;
            if (o->oFaceAnglePitch < -0x4000) {
                o->oFaceAnglePitch = -0x4000;
                o->oAngleVelPitch = 0;
                o->oAction++;
                ShakeScreen(1);
                PlaySound2(SOUND_GENERAL_UNKNOWN4);
            }
            load_object_collision_model();
            break;
        case 3:
            load_object_collision_model();
            break;
    }
    o->header.gfx.throwMatrix = NULL;
}
