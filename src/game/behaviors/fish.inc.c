/**
 * @file fish.inc.c
 * Implements behaviour and spawning for fish located in the Secret Aquarium and other levels.
 *
 */

/**
 * Spawns fish with settings chosen by the field o->oBehParams2ndByte.
 * These settings are animations, colour, and spawn quanitity.
 * Fish spawning restricted to a set distance from Mario.
 */
void fish_act_spawn(void) {
    s32 i;
    s32 schoolQuantity;
    s16 model;
    f32 minDistToMario;
    struct Animation **fishAnimation;
    struct Object *fishObject;
    switch (o->oBehParams2ndByte) {
        
        // Blue fish with a quanitiy of twenty.
        case 0:
            model = MODEL_FISH;
            schoolQuantity = 20;
            minDistToMario = 1500.0f;
            fishAnimation = blue_fish_seg3_anims_0301C2B0;
            break;
            
        // Blue fish with a quanitiy of five.
        case 1:
            model = MODEL_FISH;
            schoolQuantity = 5;
            minDistToMario = 1500.0f;
            fishAnimation = blue_fish_seg3_anims_0301C2B0;
            break;
            
        // Cyan fish with a quanitiy of twenty.
        case 2:
            model = MODEL_CYAN_FISH;
            schoolQuantity = 20;
            minDistToMario = 1500.0f;
            fishAnimation = cyan_fish_seg6_anims_0600E264;
            break;
            
        // Cyan fish with a quanitiy of five.
        case 3:
            model = MODEL_CYAN_FISH;
            schoolQuantity = 5;
            minDistToMario = 1500.0f;
            fishAnimation = cyan_fish_seg6_anims_0600E264;
            break;
    }
    /**
     * If Distance to Mario is lower than 1500 or the current level is Secret Aquarium,
     * then spawn and animate the schoolQuantity of fish.
     * Fish moves at random with a range of 700.0f.
     */
    if (o->oDistanceToMario < minDistToMario || gCurrLevelNum == LEVEL_SA) {
        for (i = 0; i < schoolQuantity; i++) {
            fishObject = spawn_object(o, model, bhvFishGroup2);
            fishObject->oBehParams2ndByte = o->oBehParams2ndByte;
            func_8029EE20(fishObject, fishAnimation, 0);
            translate_object_xyz_random(fishObject, 700.0f);
        }
        o->oAction = 1;
    }
}

/**
 * If the current level is not Secret Aquarium and the distance from
 * mario minus o->oPosY is greater than 2000.0f then set action to two.
 */
void fish_action_chkDistance(void) {
    if (gCurrLevelNum != LEVEL_SA) {
        if (gMarioObject->oPosY - o->oPosY > 2000.0f) {
            o->oAction = 2;
        }
    }
}

/*
 * Sets fish->action to zero.
 */
void fish_action_set(void) {
    o->oAction = 0;
}

/*
 * An array of action methods
 */
void (*sFishActions[])(void) = { fish_act_spawn, fish_action_chkDistance, fish_action_set };

/*
 * Calls an array of actions based on the value of o->oAction
 */
void bhv_fish_loop(void) {
    obj_call_action_function(sFishActions);
}

/* 
 * Move object up or down towards a fish group by the speed variable
 * In Secret Aquarium, the speed variable is always ten.
 */
void fish_regroup(s32 speed) {
    // Set pPosY to the parentY.
    f32 pPosY = o->parentObj->oPosY;
    
    // If level is SA and fish group height is below 500 then speed = 10. 
    if (gCurrLevelNum == LEVEL_SA) {
        if (500.0f < absf(o->oPosY - o->oFishGroupUnkF8)) {
            speed = 10;
        }
            //Move fish group heighth if level is SA at incremented speed.
            o->oPosY = approach_f32_symmetric(o->oPosY, o->oFishGroupUnkF8, speed);
     /*
     * For other levels, if the fish group heighth is lower than o->oPosY - 100 and
     * o->PosY is lower than the pPosY + 1000f + fish group Y then
     * have the fish symmetrically approach the target fish group.
     */
    } else if (pPosY - 100.0f - o->oFishGroupUnk10C < o->oPosY
               && o->oPosY < pPosY + 1000.0f + o->oFishGroupUnk10C) {
        o->oPosY = approach_f32_symmetric(o->oPosY, o->oFishGroupUnkF8, speed);
    }
}
/*
 * Moves fish forward at a random velocity.
 * In SA move fish group UnkFC at a slower speed.
 */
void fish_group_act_rotation(void) {
    f32 fishY = o->oPosY - gMarioObject->oPosY;
    
    // Animation accel altered by timer.
    if (o->oTimer < 10) {
        func_8029ED98(0, 2.0f);
    } else {
        func_8029ED98(0, 1.0f);
    }
    
    /*
     * Sets fish groups forward velocity to a random float.
     * Assigns random floats to fish groups UnkFC and Unk104, value dependant on level.
     */
    if (o->oTimer == 0) {
        o->oForwardVel = RandomFloat() * 2 + 3.0f;
        if (gCurrLevelNum == LEVEL_SA) {
            o->oFishGroupUnkFC = RandomFloat() * 700.0f;
        } else {
            o->oFishGroupUnkFC = RandomFloat() * 100.0f;
        }
        o->oFishGroupUnk104 = RandomFloat() * 500 + 200.0f;
    }
    
    // Rotate fish towards mario at a rate of 5.625 degrees (0x400)
    o->oFishGroupUnkF8 = gMarioObject->oPosY + o->oFishGroupUnkFC;
    obj_rotate_yaw_toward(o->oAngleToMario, 0x400);
    
    // If fish groups are too close regroup
    if (o->oPosY < o->oFishGroupUnkF4 - 50.0f) {
        if (fishY < 0.0f) {
            fishY = 0.0f - fishY;
        }
        if (fishY < 500.0f) {
            fish_regroup(2);
        } else {
            fish_regroup(4);
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

/*
 * Moves fish in relation to distance from each other and Mario.
 */
void fish_group_act_move(void) {
    f32 fishY = o->oPosY - gMarioObject->oPosY;
    // Marked unused, but has arithmetic performed on it in a useless manner.
    UNUSED s32 distance;
    o->oFishGroupUnkF8 = gMarioObject->oPosY + o->oFishGroupUnkFC;
    // Set fish groups to random floats when timer reaches zero and plays sound effect.
    if (o->oTimer == 0) {
        o->oFishGroupUnk110 = RandomFloat() * 300.0f;
        o->oFishGroupUnk100 = RandomFloat() * 1024.0f + 1024.0f;
        o->oFishGroupUnk108 = RandomFloat() * 4.0f + 8.0f + 5.0f;
        // variable distance, is unused.
        if (o->oDistanceToMario < 600.0f) {
            distance = 1;
        } else {
            distance = (s32)(1.0 / (o->oDistanceToMario / 600.0));
        }
        distance *= 127;
        PlaySound2(SOUND_GENERAL_MOVING_WATER);
    }
    // Enable fish animation. Parameters differ if oTimer < SA.
    if (o->oTimer < LEVEL_SA) {
        func_8029ED98(0, 4.0f);
    } else {
        func_8029ED98(0, 1.0f);
    }
    // Set forward velocity
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
            fish_regroup(2);
        } else {
            fish_regroup(4);
        }
    } else {
        o->oPosY = o->oFishGroupUnkF4 - 50.0f;
        if (fishY > 300.0f) {
            o->oPosY -= 1.0f;
        }
    }
    // If distance to mario is too great, then set o->oAction to one.
    if (o->oDistanceToMario > o->oFishGroupUnk110 + 500.0f) {
        o->oAction = 1;
    }
}
/*
 * Animate fish and alter scaling at random
 */
void fish_group_act_animate(void) {
    func_8029ED98(0, 1.0f);
    o->header.gfx.unk38.animFrame = (s16)(RandomFloat() * 28.0f);
    o->oFishGroupUnk10C = RandomFloat() * 300.0f;
    obj_scale(RandomFloat() * 0.4 + 0.8);
    o->oAction = 1;
}

// Array of methods
void (*sFishGroupActions[])(void) = { fish_group_act_animate, fish_group_act_rotation, fish_group_act_move };

/*
 * Main loop for fish
 * Sets fish group UnkF4 to the water level unless the map is SA
 * Resolve wall collisions.
 */
void bhv_fish_group_2_loop(void)
{
    UNUSED s32 unused[4];
    obj_scale(1.0f);
    o->oFishGroupUnkF4 = find_water_level(o->oPosX, o->oPosZ);
    if (gCurrLevelNum == LEVEL_SA) {
        o->oFishGroupUnkF4 = 0.0f;
    }
    o->oWallHitboxRadius = 30.0f;
    obj_resolve_wall_collisions();
    
    // Delete all fish below the water depth bounds of -10000.0f.
    if (gCurrLevelNum != LEVEL_UNKNOWN_32) {
        if (o->oFishGroupUnkF4 < -10000.0f) {
            mark_object_for_deletion(o);
            return;
        }
        
    // Unreachable code, perhaps for debugging or testing.
    } else {
        o->oFishGroupUnkF4 = 1000.0f;
    }
    
    // Call fish action methods and apply physics engine.
    obj_call_action_function(sFishGroupActions);
    obj_move_using_fvel_and_gravity();
    
    // If the parent object an action set to two, then delete the fish object.
    if (o->parentObj->oAction == 2) {
        mark_object_for_deletion(o);
    }
}
