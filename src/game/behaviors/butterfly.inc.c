// butterfly.c.inc

void bhv_butterfly_init(void) {
    SetObjAnimation(1);

    o->oButterflyYPhase = RandomFloat() * 100.0f;
    o->header.gfx.unk38.animFrame = RandomFloat() * 7.0f;
    o->oHomeX = o->oPosX;
    o->oHomeY = o->oPosY;
    o->oHomeZ = o->oPosZ;
}

// sp28 = speed

void ButterflyStep(s32 speed) {
    struct FloorGeometry *sp24;
    s16 yaw = o->oMoveAngleYaw;
    s16 pitch = o->oMoveAnglePitch;
    s16 yPhase = o->oButterflyYPhase;
    f32 floorY;

    o->oVelX = sins(yaw) * (f32) speed;
    o->oVelY = sins(pitch) * (f32) speed;
    o->oVelZ = coss(yaw) * (f32) speed;

    o->oPosX += o->oVelX;
    o->oPosZ += o->oVelZ;

    if (o->oAction == BUTTERFLY_ACT_FOLLOW_MARIO)
        o->oPosY -= o->oVelY + coss((s32)(yPhase * 655.36)) * 20.0f / 4.0f;
    else
        o->oPosY -= o->oVelY;

    floorY = find_floor_height_and_data(o->oPosX, o->oPosY, o->oPosZ, &sp24);

    if (o->oPosY < floorY + 2.0f)
        o->oPosY = floorY + 2.0f;

    o->oButterflyYPhase++;
    if (o->oButterflyYPhase >= 101)
        o->oButterflyYPhase = 0;
}

void CalculateButterflyAngle(void) {
    gMarioObject->oPosX += 5 * o->oButterflyYPhase / 4;
    gMarioObject->oPosZ += 5 * o->oButterflyYPhase / 4;
    obj_turn_toward_object(o, gMarioObject, 16, 0x300);
    gMarioObject->oPosX -= 5 * o->oButterflyYPhase / 4;
    gMarioObject->oPosZ -= 5 * o->oButterflyYPhase / 4;

    gMarioObject->oPosY += (5 * o->oButterflyYPhase + 0x100) / 4;
    obj_turn_toward_object(o, gMarioObject, 15, 0x500);
    gMarioObject->oPosY -= (5 * o->oButterflyYPhase + 0x100) / 4;
}

void ButterflyRestingLoop(void) {
    if (is_point_within_radius_of_mario(o->oPosX, o->oPosY, o->oPosZ, 1000)) {
        SetObjAnimation(0);

        o->oAction = BUTTERFLY_ACT_FOLLOW_MARIO;
        o->oMoveAngleYaw = gMarioObject->header.gfx.angle[1];
    }
}

void ButterflyFollowMarioLoop(void) {
    CalculateButterflyAngle();

    ButterflyStep(7);

    if (!is_point_within_radius_of_mario(o->oHomeX, o->oHomeY, o->oHomeZ, 1200))
        o->oAction = BUTTERFLY_ACT_RETURN_HOME;
}

void ButterflyReturnHomeLoop(void) {
    f32 homeDistX = o->oHomeX - o->oPosX;
    f32 homeDistY = o->oHomeY - o->oPosY;
    f32 homeDistZ = o->oHomeZ - o->oPosZ;
    s16 hAngleToHome = atan2s(homeDistZ, homeDistX);
    s16 vAngleToHome = atan2s(sqrtf(homeDistX * homeDistX + homeDistZ * homeDistZ), -homeDistY);

    o->oMoveAngleYaw = approach_s16_symmetric(o->oMoveAngleYaw, hAngleToHome, 0x800);
    o->oMoveAnglePitch = approach_s16_symmetric(o->oMoveAnglePitch, vAngleToHome, 0x50);

    ButterflyStep(7);

    if (homeDistX * homeDistX + homeDistY * homeDistY + homeDistZ * homeDistZ < 144.0f) {
        SetObjAnimation(1);

        o->oAction = BUTTERFLY_ACT_RESTING;
        o->oPosX = o->oHomeX;
        o->oPosY = o->oHomeY;
        o->oPosZ = o->oHomeZ;
    }
}

void bhv_butterfly_loop(void) {
    switch (o->oAction) {
        case BUTTERFLY_ACT_RESTING:
            ButterflyRestingLoop();
            break;

        case BUTTERFLY_ACT_FOLLOW_MARIO:
            ButterflyFollowMarioLoop();
            break;

        case BUTTERFLY_ACT_RETURN_HOME:
            ButterflyReturnHomeLoop();
            break;
    }

    set_object_visibility(o, 3000);
}
