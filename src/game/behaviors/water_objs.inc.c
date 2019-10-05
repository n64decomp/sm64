// water_objs.c.inc
// TODO: Better name, please

void bhv_water_air_bubble_init(void) {
    obj_scale(4.0f);
}

// Fields 0xF4 & 0xF8 seem to be angles for bubble and cannon

void bhv_water_air_bubble_loop(void) {
    s32 i;
    o->header.gfx.scale[0] = sins(o->oWaterObjUnkF4) * 0.5 + 4.0;
    o->header.gfx.scale[1] = -sins(o->oWaterObjUnkF4) * 0.5 + 4.0;
    o->oWaterObjUnkF4 += 0x400;
    if (o->oTimer < 30) {
        obj_become_intangible();
        o->oPosY += 3.0f;
    } else {
        obj_become_tangible();
        obj_forward_vel_approach_upward(2.0f, 10.0f);
        o->oMoveAngleYaw = angle_to_object(o, gMarioObject);
        obj_move_using_fvel_and_gravity();
    }
    o->oPosX += RandomFloat() * 4.0f - 2.0f;
    o->oPosZ += RandomFloat() * 4.0f - 2.0f;
    if (o->oInteractStatus & INT_STATUS_INTERACTED || o->oTimer > 200) {
        PlaySound2(SOUND_GENERAL_QUIET_BUBBLE);
        mark_object_for_deletion(o);
        for (i = 0; i < 30; i++)
            spawn_object(o, MODEL_BUBBLE, bhvBubbleMaybe);
    }
    if (find_water_level(o->oPosX, o->oPosZ) < o->oPosY)
        mark_object_for_deletion(o);
    o->oInteractStatus = 0;
}

void bhv_bubble_wave_init(void) {
    o->oWaterObjUnkFC  = 0x800 + (s32)(RandomFloat() * 2048.0f);
    o->oWaterObjUnk100 = 0x800 + (s32)(RandomFloat() * 2048.0f);
    PlaySound2(SOUND_GENERAL_QUIET_BUBBLE);
}

void Unknown802A7E48(void) {
    obj_scale(RandomFloat() + 1.0);
}

void bhv_bubble_maybe_loop(void) {
    o->oPosY += RandomFloat() * 3.0f + 6.0f;
    o->oPosX += RandomFloat() * 10.0f - 5.0f;
    o->oPosZ += RandomFloat() * 10.0f - 5.0f;
    o->header.gfx.scale[0] = sins(o->oWaterObjUnkF4) * 0.2 + 1.0;
    o->oWaterObjUnkF4 += o->oWaterObjUnkFC;
    o->header.gfx.scale[1] = sins(o->oWaterObjUnkF8) * 0.2 + 1.0;
    o->oWaterObjUnkF8 += o->oWaterObjUnk100;
}

void bhv_small_water_wave_loop(void) {
    f32 sp1C = find_water_level(o->oPosX, o->oPosZ);
    o->header.gfx.scale[0] = sins(o->oWaterObjUnkF4) * 0.2 + 1.0;
    o->oWaterObjUnkF4 += o->oWaterObjUnkFC;
    o->header.gfx.scale[1] = sins(o->oWaterObjUnkF8) * 0.2 + 1.0;
    o->oWaterObjUnkF8 += o->oWaterObjUnk100;
    if (o->oPosY > sp1C) {
        o->activeFlags = 0;
        o->oPosY += 5.0f;
        if (gFreeObjectList.next != NULL)
            spawn_object(o, MODEL_SPOT_ON_GROUND, bhvWaterSurfaceWhiteWave2);
    }
    if (o->oInteractStatus & INT_STATUS_INTERACTED)
        mark_object_for_deletion(o);
}

void func_802A81C4(void) {
    o->header.gfx.scale[0] = sins(o->oWaterObjUnkF4) * 0.5 + 2.0;
    o->oWaterObjUnkF4 += o->oWaterObjUnkFC;
    o->header.gfx.scale[1] = sins(o->oWaterObjUnkF8) * 0.5 + 2.0;
    o->oWaterObjUnkF8 += o->oWaterObjUnk100;
}

void bhv_particle_init(void) {
    scale_object_xyz(o, 2.0f, 2.0f, 1.0f);
    o->oWaterObjUnkFC = 0x800 + (s32)(RandomFloat() * 2048.0f);
    o->oWaterObjUnk100 = 0x800 + (s32)(RandomFloat() * 2048.0f);
    translate_object_xyz_random(o, 100.0f);
}

void bhv_particle_loop() {
    f32 sp24 = find_water_level(o->oPosX, o->oPosZ);
    o->oPosY += 5.0f;
    translate_object_xz_random(o, 4.0f);
    func_802A81C4();
    if (o->oPosY > sp24 && o->oTimer) {
        mark_object_for_deletion(o);
        try_to_spawn_object(5, 0, o, MODEL_SPOT_ON_GROUND, bhvWaterSurfaceWhiteWave2);
    }
}

void bhv_small_bubbles_loop(void) {
    o->oPosY += 5.0f;
    translate_object_xz_random(o, 4.0f);
    func_802A81C4();
}

void bhv_fish_group_loop(void) {
    if (gMarioCurrentRoom == 15 || gMarioCurrentRoom == 7)
        if (gGlobalTimer & 1)
            spawn_object(o, MODEL_WHITE_PARTICLE_SMALL, bhvSmallParticleBubbles);
}

void bhv_water_waves_init(void) {
    s32 sp1C;
    for (sp1C = 0; sp1C < 3; sp1C++)
        spawn_object(o, MODEL_WHITE_PARTICLE_SMALL, bhvSmallParticle);
}
