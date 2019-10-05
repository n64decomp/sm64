// fish.c.inc

void ActionFish0(void) {
    s32 i;
    s32 sp38;
    s16 model;
    f32 sp30;
    struct Animation **sp2C;
    struct Object *sp28;
    switch (o->oBehParams2ndByte) {
        case 0:
            model = MODEL_FISH;
            sp38 = 20;
            sp30 = 1500.0f;
            sp2C = blue_fish_seg3_anims_0301C2B0;
            break;
        case 1:
            model = MODEL_FISH;
            sp38 = 5;
            sp30 = 1500.0f;
            sp2C = blue_fish_seg3_anims_0301C2B0;
            break;
        case 2:
            model = MODEL_CYAN_FISH;
            sp38 = 20;
            sp30 = 1500.0f;
            sp2C = cyan_fish_seg6_anims_0600E264;
            break;
        case 3:
            model = MODEL_CYAN_FISH;
            sp38 = 5;
            sp30 = 1500.0f;
            sp2C = cyan_fish_seg6_anims_0600E264;
            break;
    }
    if (o->oDistanceToMario < sp30 || gCurrLevelNum == LEVEL_SA) {
        for (i = 0; i < sp38; i++) {
            sp28 = spawn_object(o, model, bhvFishGroup2);
            sp28->oBehParams2ndByte = o->oBehParams2ndByte;
            func_8029EE20(sp28, sp2C, 0);
            translate_object_xyz_random(sp28, 700.0f);
        }
        o->oAction = 1;
    }
}

void ActionFish1(void) {
    if (gCurrLevelNum != LEVEL_SA)
        if (gMarioObject->oPosY - o->oPosY > 2000.0f)
            o->oAction = 2;
}

void ActionFish2(void) {
    o->oAction = 0;
}

void (*sFishActions[])(void) = { ActionFish0, ActionFish1, ActionFish2 };

void bhv_fish_loop(void) {
    obj_call_action_function(sFishActions);
}

void func_802BF59C(s32 a0) {
    f32 sp1C = o->parentObj->oPosY;
    if (gCurrLevelNum == LEVEL_SA) {
        if (500.0f < absf(o->oPosY - o->oFishGroupUnkF8))
            a0 = 10;
        o->oPosY = approach_f32_symmetric(o->oPosY, o->oFishGroupUnkF8, a0);
    } else if (sp1C - 100.0f - o->oFishGroupUnk10C < o->oPosY
               && o->oPosY < sp1C + 1000.0f + o->oFishGroupUnk10C)
        o->oPosY = approach_f32_symmetric(o->oPosY, o->oFishGroupUnkF8, a0);
}

void ActionFishGroup1(void) {
    f32 sp1C = o->oPosY - gMarioObject->oPosY;
    if (o->oTimer < 10)
        func_8029ED98(0, 2.0f);
    else
        func_8029ED98(0, 1.0f);
    if (o->oTimer == 0) {
        o->oForwardVel = RandomFloat() * 2 + 3.0f;
        if (gCurrLevelNum == LEVEL_SA)
            o->oFishGroupUnkFC = RandomFloat() * 700.0f;
        else
            o->oFishGroupUnkFC = RandomFloat() * 100.0f;
        o->oFishGroupUnk104 = RandomFloat() * 500 + 200.0f;
    }
    o->oFishGroupUnkF8 = gMarioObject->oPosY + o->oFishGroupUnkFC;
    obj_rotate_yaw_toward(o->oAngleToMario, 0x400);
    if (o->oPosY < o->oFishGroupUnkF4 - 50.0f) {
        if (sp1C < 0.0f)
            sp1C = 0.0f - sp1C;
        if (sp1C < 500.0f)
            func_802BF59C(2);
        else
            func_802BF59C(4);
    } else {
        o->oPosY = o->oFishGroupUnkF4 - 50.0f;
        if (sp1C > 300.0f)
            o->oPosY = o->oPosY - 1.0f;
    }
    if (o->oDistanceToMario < o->oFishGroupUnk104 + 150.0f)
        o->oAction = 2;
}

void ActionFishGroup2(void) {
    f32 sp1C = o->oPosY - gMarioObject->oPosY;
    s32 sp18;
    o->oFishGroupUnkF8 = gMarioObject->oPosY + o->oFishGroupUnkFC;
    if (o->oTimer == 0) {
        o->oFishGroupUnk110 = RandomFloat() * 300.0f;
        o->oFishGroupUnk100 = RandomFloat() * 1024.0f + 1024.0f;
        o->oFishGroupUnk108 = RandomFloat() * 4.0f + 8.0f + 5.0f;
        if (o->oDistanceToMario < 600.0f)
            sp18 = 1;
        else
            sp18 = (s32)(1.0 / (o->oDistanceToMario / 600.0));
        sp18 *= 127;
        PlaySound2(SOUND_GENERAL_MOVING_WATER);
    }
    if (o->oTimer < LEVEL_SA)
        func_8029ED98(0, 4.0f);
    else
        func_8029ED98(0, 1.0f);
    if (o->oForwardVel < o->oFishGroupUnk108)
        o->oForwardVel = o->oForwardVel + 0.5;
    o->oFishGroupUnkF8 = gMarioObject->oPosY + o->oFishGroupUnkFC;
    obj_rotate_yaw_toward(o->oAngleToMario + 0x8000, o->oFishGroupUnk100);
    if (o->oPosY < o->oFishGroupUnkF4 - 50.0f) {
        if (sp1C < 0.0f)
            sp1C = 0.0f - sp1C;
        if (sp1C < 500.0f)
            func_802BF59C(2);
        else
            func_802BF59C(4);
    } else {
        o->oPosY = o->oFishGroupUnkF4 - 50.0f;
        if (sp1C > 300.0f)
            o->oPosY -= 1.0f;
    }
    if (o->oDistanceToMario > o->oFishGroupUnk110 + 500.0f)
        o->oAction = 1;
}

void ActionFishGroup0(void) {
    func_8029ED98(0, 1.0f);
    o->header.gfx.unk38.animFrame = (s16)(RandomFloat() * 28.0f);
    o->oFishGroupUnk10C = RandomFloat() * 300.0f;
    obj_scale(RandomFloat() * 0.4 + 0.8);
    o->oAction = 1;
}

void (*sFishGroupActions[])(void) = { ActionFishGroup0, ActionFishGroup1, ActionFishGroup2 };

void bhv_fish_group_2_loop(void) // TODO rename
{
    UNUSED s32 unused[4];
    obj_scale(1.0f);
    o->oFishGroupUnkF4 = find_water_level(o->oPosX, o->oPosZ);
    if (gCurrLevelNum == LEVEL_SA)
        o->oFishGroupUnkF4 = 0.0f;
    o->oWallHitboxRadius = 30.0f;
    obj_resolve_wall_collisions();
    if (gCurrLevelNum != LEVEL_UNKNOWN_32) {
        if (o->oFishGroupUnkF4 < -10000.0f) {
            mark_object_for_deletion(o);
            return;
        }
    } else
        o->oFishGroupUnkF4 = 1000.0f;
    obj_call_action_function(sFishGroupActions);
    obj_move_using_fvel_and_gravity();
    if (o->parentObj->oAction == 2)
        mark_object_for_deletion(o);
}
