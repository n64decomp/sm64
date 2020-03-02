// tree_particles.c.inc

void bhv_tree_snow_or_leaf_loop(void) {
    cur_obj_update_floor_height();
    if (o->oTimer == 0) {
        o->oAngleVelPitch = (RandomFloat() - 0.5) * 0x1000;
        o->oAngleVelRoll = (RandomFloat() - 0.5) * 0x1000;
        o->oTreeSnowOrLeafUnkF8 = 4;
        o->oTreeSnowOrLeafUnkFC = RandomFloat() * 0x400 + 0x600;
    }
    if (o->oPosY < o->oFloorHeight)
        obj_mark_for_deletion(o);
    if (o->oFloorHeight < -11000.0f)
        obj_mark_for_deletion(o);
    if (o->oTimer > 100)
        obj_mark_for_deletion(o);
    if (gPrevFrameObjectCount > 212)
        obj_mark_for_deletion(o);
    o->oFaceAnglePitch += o->oAngleVelPitch;
    o->oFaceAngleRoll += o->oAngleVelRoll;
    o->oVelY += -3.0f;
    if (o->oVelY < -8.0f)
        o->oVelY = -8.0f;
    if (o->oForwardVel > 0)
        o->oForwardVel -= 0.3;
    else
        o->oForwardVel = 0;
    o->oPosX += sins(o->oMoveAngleYaw) * sins(o->oTreeSnowOrLeafUnkF4) * o->oTreeSnowOrLeafUnkF8;
    o->oPosZ += coss(o->oMoveAngleYaw) * sins(o->oTreeSnowOrLeafUnkF4) * o->oTreeSnowOrLeafUnkF8;
    o->oTreeSnowOrLeafUnkF4 += o->oTreeSnowOrLeafUnkFC;
    o->oPosY += o->oVelY;
}

void bhv_snow_leaf_particle_spawn_init(void) {
    struct Object *obj; // Either snow or leaf
    UNUSED s32 unused;
    s32 isSnow;
    f32 scale;
    UNUSED s32 unused2;
    gMarioObject->oActiveParticleFlags &= ~0x2000;
    if (gCurrLevelNum == LEVEL_CCM || gCurrLevelNum == LEVEL_SL)
        isSnow = 1;
    else
        isSnow = 0;
    if (isSnow) {
        if (RandomFloat() < 0.5) {
            obj = spawn_object(o, MODEL_WHITE_PARTICLE_DL, bhvTreeSnow);
            scale = RandomFloat();
            obj_scale_xyz(obj, scale, scale, scale);
            obj->oMoveAngleYaw = RandomU16();
            obj->oForwardVel = RandomFloat() * 5.0f;
            obj->oVelY = RandomFloat() * 15.0f;
        }
    } else {
        if (RandomFloat() < 0.3) {
            obj = spawn_object(o, MODEL_LEAVES, bhvTreeLeaf);
            scale = RandomFloat() * 3.0f;
            obj_scale_xyz(obj, scale, scale, scale);
            obj->oMoveAngleYaw = RandomU16();
            obj->oForwardVel = RandomFloat() * 5.0f + 5.0f;
            obj->oVelY = RandomFloat() * 15.0f;
            obj->oFaceAnglePitch = RandomU16();
            obj->oFaceAngleRoll = RandomU16();
            obj->oFaceAngleYaw = RandomU16();
        }
    }
}
