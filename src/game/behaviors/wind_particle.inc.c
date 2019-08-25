// wind_particle.c.inc

struct ObjectHitbox sWindParticleHitbox = {
    /* interactType: */ INTERACT_WIND,
    /* downOffset: */ 0,
    /* damageOrCoinValue: */ 0,
    /* health: */ 0,
    /* numLootCoins: */ 0,
    /* radius: */ 20,
    /* height: */ 70,
    /* hurtboxRadius: */ 20,
    /* hurtboxHeight: */ 70,
};

void bhv_white_wind_particle_loop(void) {
    struct Object *sp34;
    f32 sp30;
    f32 sp2C;
    f32 sp28;
    set_object_hitbox(o, &sWindParticleHitbox);
    if (o->oTimer == 0) {
        o->oWhiteWindParticleUnkF4 = obj_nearest_object_with_behavior(bhvWalkingPenguin);
        translate_object_xyz_random(o, 100.0f);
        o->oForwardVel = coss(o->oMoveAnglePitch) * 100.0f;
        o->oVelY = sins(o->oMoveAnglePitch) * -100.0f;
        o->oMoveAngleYaw += random_f32_around_zero(o->oBehParams2ndByte * 500);
        o->oOpacity = 100;
    }
    obj_move_using_fvel_and_gravity();
    if (o->oTimer > 15)
        mark_object_for_deletion(o);
    sp34 = o->oWhiteWindParticleUnkF4;
    if (sp34 != 0) {
        sp2C = sp34->oWalkingPenguinUnk100 - o->oPosX;
        sp28 = sp34->oWalkingPenguinUnk104 - o->oPosZ;
        sp30 = sqrtf(sp2C * sp2C + sp28 * sp28);
        if (sp30 < 300.0f) {
            mark_object_for_deletion(o);
            obj_become_intangible();
        }
    }
}

void func_802C76E0(s32 a0, f32 a1, f32 a2, f32 a3, f32 a4) {
    if ((gGlobalTimer & 1) != 0) {
        spawn_object_relative_with_scale(a0, a2, a3, a4, 0.5f, o, MODEL_WHITE_PARTICLE_DL,
                                         bhvTinyWhiteWindParticle);
        spawn_object_relative_with_scale(a0, a2, a3, a4, a1, o, MODEL_NONE, bhvWindParticle);
    } else
        spawn_object_relative_with_scale(a0, a2, a3, a4, a1, o, MODEL_MIST, bhvWindParticle);
    spawn_object_relative_with_scale(a0, a2, a3, a4, a1, o, MODEL_NONE, bhvWindParticle);
}
