// cap.c.inc

static struct ObjectHitbox sCapHitbox = {
    /* interactType:      */ INTERACT_CAP,
    /* downOffset:        */ 0,
    /* damageOrCoinValue: */ 0,
    /* health:            */ 0,
    /* numLootCoins:      */ 0,
    /* radius:            */ 80,
    /* height:            */ 80,
    /* hurtboxRadius:     */ 90,
    /* hurtboxHeight:     */ 90,
};

s32 func_802F0904(void) {
    set_object_hitbox(o, &sCapHitbox);
    if (o->oInteractStatus & INT_STATUS_INTERACTED) {
        o->activeFlags = 0;
        o->oInteractStatus = 0;
        return 1;
    }

    return 0;
}

void func_802F0978(void) {
    if (o->oTimer > 300) {
        obj_flicker_and_disappear(o, 300);
    }
}

void func_802F09C0(void) {
    if (sObjFloor == NULL)
        return;

    switch (sObjFloor->type) {
        case SURFACE_DEATH_PLANE:
            o->activeFlags = 0;
            break;

        case SURFACE_SHALLOW_QUICKSAND:
        case SURFACE_DEEP_QUICKSAND:
        case SURFACE_QUICKSAND:
            o->oAction = 10;
            o->oForwardVel = 0.0f;
            break;

        case SURFACE_DEEP_MOVING_QUICKSAND:
        case SURFACE_SHALLOW_MOVING_QUICKSAND:
        case SURFACE_MOVING_QUICKSAND:
            o->oAction = 11;
            o->oMoveAngleYaw = (sObjFloor->force & 0xFF) << 8;
            o->oForwardVel = -((sObjFloor->force & 0xff00) >> 8) * 2 + 8;
            break;

        case SURFACE_INSTANT_QUICKSAND:
            o->oAction = 12;
            o->oForwardVel = 0;
            break;

        case SURFACE_INSTANT_MOVING_QUICKSAND:
            o->oAction = 13;
            o->oMoveAngleYaw = (sObjFloor->force & 0xFF) << 8;
            o->oForwardVel = -((sObjFloor->force & 0xff00) >> 8) * 2 + 8;
            break;
    }
}

void func_802F0B68(void) {
    switch (o->oAction) {
        case 10:
            if (o->oTimer < 10) {
                o->oGraphYOffset += -1.0f;
                o->oFaceAnglePitch = 0x2000;
            }
            break;

        case 11:
            if (o->oTimer < 10)
                o->oGraphYOffset += -3.0f;

            o->oFaceAnglePitch = 0x2000;
            break;

        case 12:
            o->oGraphYOffset += -1.0f;
            if (o->oTimer >= 21)
                o->activeFlags = 0;

            break;

        case 13:
            o->oGraphYOffset += -6.0f;
            if (o->oTimer >= 21)
                o->activeFlags = 0;

            o->oFaceAnglePitch = 0x2000;
            break;
    }

    func_802F09C0();
}

void bhv_wing_cap_init(void) {
    o->oGravity = 1.2f;
    o->oFriction = 0.999f;
    o->oBuoyancy = 0.9f;
    o->oOpacity = 255;
}

void func_802F0D70(void) {
    o->oCapUnkF8 += 0x2000;
    o->header.gfx.scale[1] = coss(o->oCapUnkF8) * 0.3 + 0.7;
    if (o->oCapUnkF8 == 0x10000) {
        o->oCapUnkF8 = 0;
        o->oCapUnkF4 = 2;
    }
}

void func_802F0E0C(void) {
    s16 sp1E;

    o->oFaceAngleYaw += o->oForwardVel * 128.0f;
    sp1E = object_step();
    if (sp1E & 0x01) {
        func_802F09C0();
        if (o->oVelY != 0.0f) {
            o->oCapUnkF4 = 1;
            o->oVelY = 0.0f;
        }
    }

    if (o->oCapUnkF4 == 1)
        func_802F0D70();
}

void bhv_wing_vanish_cap_loop(void) {
    switch (o->oAction) {
        case 0:
            func_802F0E0C();
            break;

        default:
            object_step();
            func_802F0B68();
            break;
    }

    if (o->oTimer > 20)
        obj_become_tangible();

    func_802F0978();
    func_802F0904();
}

void bhv_metal_cap_init(void) {
    o->oGravity = 2.4f;
    o->oFriction = 0.999f;
    o->oBuoyancy = 1.5f;
    o->oOpacity = 0xFF;
}

void func_802F0FE0(void) {
    s16 sp1E;

    o->oFaceAngleYaw += o->oForwardVel * 128.0f;
    sp1E = object_step();
    if (sp1E & 0x01)
        func_802F09C0();
}

void bhv_metal_cap_loop(void) {
    switch (o->oAction) {
        case 0:
            func_802F0FE0();
            break;

        default:
            object_step();
            func_802F0B68();
            break;
    }

    if (o->oTimer > 20)
        obj_become_tangible();

    func_802F0904();
    func_802F0978();
}

void bhv_normal_cap_init(void) {
    o->oGravity = 0.7f;
    o->oFriction = 0.89f;
    o->oBuoyancy = 0.9f;
    o->oOpacity = 0xFF;

    save_file_set_cap_pos(o->oPosX, o->oPosY, o->oPosZ);
}

void func_802F1190(void) {
    save_file_clear_flags(SAVE_FLAG_CAP_ON_GROUND);

    switch (gCurrCourseNum) {
        case COURSE_SSL:
            save_file_set_flags(SAVE_FLAG_CAP_ON_KLEPTO);
            break;

        case COURSE_SL:
            save_file_set_flags(SAVE_FLAG_CAP_ON_MR_BLIZZARD);
            break;

        case COURSE_TTM:
            save_file_set_flags(SAVE_FLAG_CAP_ON_UKIKI);
            break;

        default:
            save_file_set_flags(SAVE_FLAG_CAP_ON_KLEPTO);
            break;
    }
}

void func_802F1234(void) {
    s16 sp1E;

    o->oFaceAngleYaw += o->oForwardVel * 128.0f;
    o->oFaceAnglePitch += o->oForwardVel * 80.0f;
    sp1E = object_step();
    if (sp1E & 0x01) {
        func_802F09C0();

        if (o->oVelY != 0.0f) {
            o->oCapUnkF4 = 1;
            o->oVelY = 0.0f;
            o->oFaceAnglePitch = 0;
        }
    }

    if (o->oCapUnkF4 == 1)
        func_802F0D70();
}

void bhv_normal_cap_loop(void) {
    switch (o->oAction) {
        case 0:
            func_802F1234();
            break;

        default:
            object_step();
            func_802F0B68();
            break;
    }

    if ((s32) o->oForwardVel != 0)
        save_file_set_cap_pos(o->oPosX, o->oPosY, o->oPosZ);

    if (o->activeFlags == 0)
        func_802F1190();

    if (func_802F0904() == 1)
        save_file_clear_flags(SAVE_FLAG_CAP_ON_GROUND);
}

void bhv_vanish_cap_init(void) {
    o->oGravity = 1.2f;
    o->oFriction = 0.999f;
    o->oBuoyancy = 0.9f;
    o->oOpacity = 150;
}
