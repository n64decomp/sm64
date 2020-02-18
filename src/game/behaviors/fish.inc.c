/**
 * Behaviour and spawner for Fish located in the Secret Aquarium and other levels.
 *
 */

/**
 * Set certain settings such as animations, colour, and spawn quanitity.
 * Chosen settings dependant on parameter o->oBehParams2ndByte
 */
void fish_group_act_spawn(void) {
    s32 schoolQuantity;
    s16 model;
    f32 minDistToMario;
    struct Animation **fishAnimation;
    struct Object *fishObject;
    switch (o->oBehParams2ndByte) {
        case 0:
            model = MODEL_FISH;            schoolQuantity = 20;            minDistToMario = 1500.0f;            fishAnimation = blue_fish_seg3_anims_0301C2B0;
            break;
        case 1:
            model = MODEL_FISH;            schoolQuantity = 5;            minDistToMario = 1500.0f;            fishAnimation = blue_fish_seg3_anims_0301C2B0;
            break;
        case 2:
            model = MODEL_CYAN_FISH;            schoolQuantity = 20;            minDistToMario = 1500.0f;            fishAnimation = cyan_fish_seg6_anims_0600E264;
            break;
        case 3:
            model = MODEL_CYAN_FISH;            schoolQuantity = 5;            minDistToMario = 1500.0f;            fishAnimation = cyan_fish_seg6_anims_0600E264;
            break;
    }
    // If Distance to Mario is lower than 1500 or the current level is Secret Aquarium,
    // then spawn the schoolQuantity of fish. Fish moves at random.
    if (o->oDistanceToMario < minDistToMario || gCurrLevelNum == LEVEL_SA) {
        s32 i;
        for (i = 0; i < schoolQuantity; i++) {
            fishObject = spawn_object(o, model, bhvFishGroup2);
            fishObject->oBehParams2ndByte = o->oBehParams2ndByte;
            func_8029EE20(fishObject, fishAnimation, 0);
            translate_object_xyz_random(fishObject, 700.0f);
        }
        o->oAction = 1;
    }
}

// If the current level is not Secret Aquarium and the distance from
// mario minus o->oPosY is greater than 2000.0f then remove fish.
void bhv_fish_action_1(void) {
    if (gCurrLevelNum != LEVEL_SA) {
        if (gMarioObject->oPosY - o->oPosY > 2000.0f) {
            o->oAction = 2;
        }
    }
}

// Sets action to zero.
void bhv_fish_action_2(void) {
    o->oAction = 0;
}

// An array of actions
void (*sFishActions[])(void) = { fish_group_act_spawn, bhv_fish_action_1, bhv_fish_action_2 };

// Calls an array of actions
void bhv_fish_loop(void) {
    obj_call_action_function(sFishActions);
}

// Move object up or down towards a fish group by speed
// In Secret Aquarium increment amount is always ten.
void regroup_fish(s32 speed) {
    f32 parentY = o->parentObj->oPosY;
    if (gCurrLevelNum == LEVEL_SA) {
        if (500.0f < absf(o->oPosY - o->oFishGroupUnkF8)) {
            speed = 10;
        }
            o->oPosY = approach_f32_symmetric(o->oPosY, o->oFishGroupUnkF8, speed);
    } else if (parentY - 100.0f - o->oFishGroupUnk10C < o->oPosY
               && o->oPosY < parentY + 1000.0f + o->oFishGroupUnk10C) {
        o->oPosY = approach_f32_symmetric(o->oPosY, o->oFishGroupUnkF8, speed);
    }
}

// Moves fish forward at a random velocity.
// In SA move fish group UnkFC at a slower speed.
void bhv_fish_group_1(void) {
    f32 fishY = o->oPosY - gMarioObject->oPosY;
    if (o->oTimer < 10) {
        func_8029ED98(0, 2.0f);
    }
    else {
        func_8029ED98(0, 1.0f);
    }
    if (o->oTimer == 0) {
        o->oForwardVel = RandomFloat() * 2 + 3.0f;
        if (gCurrLevelNum == LEVEL_SA) {
            o->oFishGroupUnkFC = RandomFloat() * 700.0f;
        }
        else {
            o->oFishGroupUnkFC = RandomFloat() * 100.0f;
        }
        o->oFishGroupUnk104 = RandomFloat() * 500 + 200.0f;
    }
    // Rotate fish towards mario
    o->oFishGroupUnkF8 = gMarioObject->oPosY + o->oFishGroupUnkFC;
    obj_rotate_yaw_toward(o->oAngleToMario, 0x400);
    // If fish groups are too close regroup
    if (o->oPosY < o->oFishGroupUnkF4 - 50.0f) {
        if (fishY < 0.0f) {
            fishY = 0.0f - fishY;
        }
        if (fishY < 500.0f) {
            regroup_fish(2);
        }
        else {
            regroup_fish(4);
        }
    } else {
        o->oPosY = o->oFishGroupUnkF4 - 50.0f;
        if (fishY > 300.0f) {
            o->oPosY = o->oPosY - 1.0f;
        }
    }
    // Remove fish if its distance to mario is smaller than his distance to Unk104 + 150.0f
    if (o->oDistanceToMario < o->oFishGroupUnk104 + 150.0f) {
        o->oAction = 2;
    }
}

void bhv_fish_group_2(void) {
    f32 fishY = o->oPosY - gMarioObject->oPosY;
    s32 distance;
    o->oFishGroupUnkF8 = gMarioObject->oPosY + o->oFishGroupUnkFC;
    if (o->oTimer == 0) {
        o->oFishGroupUnk110 = RandomFloat() * 300.0f;
        o->oFishGroupUnk100 = RandomFloat() * 1024.0f + 1024.0f;
        o->oFishGroupUnk108 = RandomFloat() * 4.0f + 8.0f + 5.0f;
        if (o->oDistanceToMario < 600.0f) {
            distance = 1;
        }
        else {
            distance = (s32)(1.0 / (o->oDistanceToMario / 600.0));
        }
            distance *= 127;
            PlaySound2(SOUND_GENERAL_MOVING_WATER);
    }
    if (o->oTimer < LEVEL_SA) {
        func_8029ED98(0, 4.0f);
    }
    else {
        func_8029ED98(0, 1.0f);
    }
    if (o->oForwardVel < o->oFishGroupUnk108) {
        o->oForwardVel = o->oForwardVel + 0.5;
    }
    o->oFishGroupUnkF8 = gMarioObject->oPosY + o->oFishGroupUnkFC;
    // Rotate fish towards mario
    obj_rotate_yaw_toward(o->oAngleToMario + 0x8000, o->oFishGroupUnk100);
    // If fish groups are too close regroup
    if (o->oPosY < o->oFishGroupUnkF4 - 50.0f) {
        if (fishY < 0.0f) {
            fishY = 0.0f - fishY;
        }
        if (fishY < 500.0f) {
            regroup_fish(2);
        }
        else {
            regroup_fish(4);
        }
    } else {
        o->oPosY = o->oFishGroupUnkF4 - 50.0f;
        if (fishY > 300.0f) {
            o->oPosY -= 1.0f;
        }
    }
    if (o->oDistanceToMario > o->oFishGroupUnk110 + 500.0f) {
        o->oAction = 1;
    }
}
// Randomly move/animate/scale fish
void bhv_fish_group_0(void) {
    func_8029ED98(0, 1.0f);
    o->header.gfx.unk38.animFrame = (s16)(RandomFloat() * 28.0f);
    o->oFishGroupUnk10C = RandomFloat() * 300.0f;
    obj_scale(RandomFloat() * 0.4 + 0.8);
    o->oAction = 1;
}

// Array of methods
void (*sFishGroupActions[])(void) = { bhv_fish_group_0, bhv_fish_group_1, bhv_fish_group_2 };

// In SA alter fish pathing if they hit a wall.
void bhv_fish_group_2_loop(void) // TODO rename
{
    UNUSED s32 unused[4];
    obj_scale(1.0f);
    o->oFishGroupUnkF4 = find_water_level(o->oPosX, o->oPosZ);
    if (gCurrLevelNum == LEVEL_SA) {
        o->oFishGroupUnkF4 = 0.0f;
    }
    o->oWallHitboxRadius = 30.0f;
    obj_resolve_wall_collisions();
    // Cleanup fish if they are nil
    if (gCurrLevelNum != LEVEL_UNKNOWN_32) {
        if (o->oFishGroupUnkF4 < -10000.0f) {
            mark_object_for_deletion(o);
            return;
        }
    } else {
        // Call above methods and apply movement engine to fish.
        o->oFishGroupUnkF4 = 1000.0f;
    }
        obj_call_action_function(sFishGroupActions);
        obj_move_using_fvel_and_gravity();
        // if a fish has action set to two, then delete it.
    if (o->parentObj->oAction == 2) {
        mark_object_for_deletion(o);
    }
}

/**
-opening comment should generally explain at a high level what the object is, where it occurs in the game, etc, not how it behaves unless its behavior does something really weird
- opening comment is wrong because there are multiple behaviors in the file
-bhv_fish_spawner should probably be renamed fish_group_act_spawn; the bhv prefix is reserved for init/loop functions 
- don't ever capitalize variable names!
- the action functions should be renamed to explain what they do, ex. fish_group_act_respawn
- bhvFish should probably be renamed to bhvFishGroup or bhvFishSpawner and bhvFishGroup2 should be renamed to bhvFish, if I understand this right; your sparse comments don't clarify what the objects even are
- don't name the action functions bhv_fish_group_0 through 2 esp when the behavior is named bhvFishGroup2 it's very confusing
- bhv_regroup_fish shouldn't have the bhv prefix, use the fish_ prefix instead since it's for the fishobject
- your file doesn't even compile because you didn't rename ActionFishGroup1 but you did rename it in the action array
- you didn't name all the variables in the functions, nor did you rename object fields
- nitpick but you need to be more liberal with newlines before your comments/in the code
- // if a fish has action set to two, then slap someone with it then throw it out. please no
- need more comments everywhere, ideally after reading the file once you should be able to easily understand how the object works, I still barely understand it after reading the code multiple times for this review
*/
