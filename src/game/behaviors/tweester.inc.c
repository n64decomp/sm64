// tweester.c.inc

struct ObjectHitbox sTweesterHitbox = {
    /* interactType: */ INTERACT_TORNADO,
    /* downOffset: */ 0,
    /* damageOrCoinValue: */ 0,
    /* health: */ 0,
    /* numLootCoins: */ 0,
    /* radius: */ 1500,
    /* height: */ 4000,
    /* hurtboxRadius: */ 0,
    /* hurtboxHeight: */ 0,
};

void func_802C231C(f32 a0) {
    s16 sp6 = 0x2C00;
    f32 sp0 = a0 * 0.4;
    o->header.gfx.scale[0] = (((coss(o->oTweesterUnkF4) + 1.0) * 0.5 * 0.3) + 1.0) * sp0;
    o->header.gfx.scale[1] = (((-coss(o->oTweesterUnkF4) + 1.0) * 0.5 * 0.5) + 0.5) * sp0;
    o->header.gfx.scale[2] = (((coss(o->oTweesterUnkF4) + 1.0) * 0.5 * 0.3) + 1.0) * sp0;
    o->oTweesterUnkF4 += 0x200;
    o->oForwardVel = 14.0f;
    o->oFaceAngleYaw += sp6;
}

void ActionTweester0(void) {
    if (o->oSubAction == 0) {
        obj_become_tangible();
        obj_set_pos_to_home();
        obj_scale(0);
        o->oTweesterUnkF8 = 0;
        if (o->oDistanceToMario < 1500.0f)
            o->oSubAction++;
        o->oTimer = 0;
    } else {
        PlaySound(SOUND_ENV_WIND1);
        func_802C231C(o->oTimer / 60.0f);
        if (o->oTimer > 59)
            o->oAction = 1;
    }
}

void ActionTweester1(void) {
    f32 sp1C = o->oBehParams2ndByte * 0x64;
    o->oUnk1BC = obj_angle_to_home();
    PlaySound(SOUND_ENV_WIND1);
    if (obj_lateral_dist_from_mario_to_home() < sp1C && o->oSubAction == 0) {
        o->oForwardVel = 20.0f;
        obj_rotate_yaw_toward(o->oAngleToMario, 0x200);
        print_debug_top_down_objectinfo("off ", 0);
        if (gMarioStates->action == ACT_TWIRLING)
            o->oSubAction++;
    } else {
        o->oForwardVel = 20.0f;
        obj_rotate_yaw_toward(o->oUnk1BC, 0x200);
        if (obj_lateral_dist_to_home() < 200.0f)
            o->oAction = 2;
    }
    if (o->oDistanceToMario > 3000.0f)
        o->oAction = 2;
    obj_update_floor_and_walls();
    if (o->oMoveFlags & 0x200)
        o->oMoveAngleYaw = o->oWallAngle;
    obj_move_standard(60);
    func_802C231C(1.0f);
    spawn_object(o, MODEL_SAND_DUST, bhvTornadoSandParticle);
}

void ActionTweester2(void) {
    f32 sp1C = 60.0f - o->oTimer;
    if (sp1C >= 0.0f)
        func_802C231C(sp1C / 60.0f);
    else {
        obj_become_intangible();
        if (obj_lateral_dist_from_mario_to_home() > 2500.0f)
            o->oAction = 0;
        if (o->oTimer > 360)
            o->oAction = 0;
    }
}

void (*sTweesterActions[])(void) = { ActionTweester0, ActionTweester1, ActionTweester2 };

void bhv_tweester_loop(void) {
    set_object_hitbox(o, &sTweesterHitbox);
    obj_call_action_function(sTweesterActions);
    o->oInteractStatus = 0;
}

void bhv_tweester_sand_particle_loop(void) {
    o->oMoveAngleYaw += 0x3700;
    o->oForwardVel += 15.0f;
    o->oPosY += 22.0f;
    obj_scale(RandomFloat() + 1.0);
    if (o->oTimer == 0) {
        translate_object_xz_random(o, 100.0f);
        o->oFaceAnglePitch = RandomU16();
        o->oFaceAngleYaw = RandomU16();
    }
    if (o->oTimer > 15)
        mark_object_for_deletion(o);
}
