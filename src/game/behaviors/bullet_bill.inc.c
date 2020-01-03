// bullet_bill.c.inc

// bullet bill smoke
void bhv_white_puff_smoke_init(void) {
    obj_scale(RandomFloat() * 2 + 2.0);
}

void bhv_bullet_bill_init(void) {
    o->oBulletBillUnkF8 = o->oMoveAngleYaw;
}

void ActionBulletBill0(void) {
    obj_become_tangible();
    o->oForwardVel = 0.0f;
    o->oMoveAngleYaw = o->oBulletBillUnkF8;
    o->oFaceAnglePitch = 0;
    o->oFaceAngleRoll = 0;
    o->oMoveFlags = 0;
    obj_set_pos_to_home();
    o->oAction = 1;
}

void ActionBulletBill1(void) {
    s16 sp1E = abs_angle_diff(o->oAngleToMario, o->oMoveAngleYaw);
    if (sp1E < 0x2000 && 400.0f < o->oDistanceToMario && o->oDistanceToMario < 1500.0f)
        o->oAction = 2;
}

void ActionBulletBill2(void) {
    if (o->oTimer < 40)
        o->oForwardVel = 3.0f;
    else if (o->oTimer < 50) {
        if (o->oTimer % 2)
            o->oForwardVel = 3.0f;
        else
            o->oForwardVel = -3.0f;
    } else {
        if (o->oTimer > 70)
            obj_update_floor_and_walls();
        spawn_object(o, MODEL_SMOKE, bhvWhitePuffSmoke);
        o->oForwardVel = 30.0f;
        if (o->oDistanceToMario > 300.0f)
            obj_rotate_yaw_toward(o->oAngleToMario, 0x100);
        if (o->oTimer == 50) {
            PlaySound2(SOUND_OBJ_POUNDING_CANNON);
            ShakeScreen(SHAKE_POS_SMALL);
        }
        if (o->oTimer > 150 || o->oMoveFlags & 0x200) {
            o->oAction = 3;
            func_802A3004();
        }
    }
}

void ActionBulletBill3(void) {
    o->oAction = 0;
}

void ActionBulletBill4(void) {
    if (o->oTimer == 0) {
        o->oForwardVel = -30.0f;
        obj_become_intangible();
    }
    o->oFaceAnglePitch += 0x1000;
    o->oFaceAngleRoll += 0x1000;
    o->oPosY += 20.0f;
    if (o->oTimer > 90)
        o->oAction = 0;
}

void (*sBulletBillActions[])(void) = { ActionBulletBill0, ActionBulletBill1, ActionBulletBill2,
                                       ActionBulletBill3, ActionBulletBill4 };

void bhv_bullet_bill_loop(void) {
    obj_call_action_function(sBulletBillActions);
    if (obj_check_interacted())
        o->oAction = 4;
}
