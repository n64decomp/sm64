// switch_hidden_objects.c.inc

struct ObjectHitbox sBreakableBoxHitbox = {
    /* interactType: */ INTERACT_BREAKABLE,
    /* downOffset: */ 20,
    /* damageOrCoinValue: */ 0,
    /* health: */ 1,
    /* numLootCoins: */ 0,
    /* radius: */ 150,
    /* height: */ 200,
    /* hurtboxRadius: */ 150,
    /* hurtboxHeight: */ 200,
};

void func_802B0E74(void) {
    o->oHiddenObjectUnkF4 = NULL;
    o->oAnimState = 1;
    switch (o->oBehParams2ndByte) {
        case 0:
            o->oNumLootCoins = 0;
            break;
        case 1:
            o->oNumLootCoins = 3;
            break;
        case 2:
            o->oNumLootCoins = 5;
            break;
        case 3:
            obj_scale(1.5f);
            break;
    }
}

void func_802B0F54(void) {
    struct Object *sp1C;
    set_object_hitbox(o, &sBreakableBoxHitbox);
    obj_set_model(MODEL_BREAKABLE_BOX_SMALL);
    if (o->oAction == 0) {
        obj_disable_rendering();
        obj_become_intangible();
        if (o->oTimer == 0)
            func_802B0E74();
        if (o->oHiddenObjectUnkF4 == NULL)
            o->oHiddenObjectUnkF4 = obj_nearest_object_with_behavior(bhvFloorSwitchHiddenObjects);
        if ((sp1C = o->oHiddenObjectUnkF4) != NULL)
            if (sp1C->oAction == 2) {
                o->oAction++;
                obj_enable_rendering();
                obj_unhide();
            }
    } else if (o->oAction == 1) {
        obj_become_tangible();
        if (obj_wait_then_blink(360, 20))
            o->oAction = 0;
        if (obj_was_attacked_or_ground_pounded()) {
            func_802A3004();
            spawn_triangle_break_particles(30, 138, 3.0f, 4);
            o->oAction++;
            PlaySound2(SOUND_GENERAL_BREAK_BOX);
        }
        load_object_collision_model();
    } else {
        obj_become_intangible();
        obj_disable_rendering();
        o->oInteractStatus = 0;
        if ((sp1C = o->oHiddenObjectUnkF4) != NULL)
            if (sp1C->oAction == 0)
                o->oAction = 0;
    }
}

void func_802B1138(void) {
    struct Object *sp1C;
    set_object_collision_data(o, wdw_seg7_collision_07018528);
    if (o->oAction == 0) {
        obj_disable_rendering();
        obj_become_intangible();
        if (o->oHiddenObjectUnkF4 == NULL)
            o->oHiddenObjectUnkF4 = obj_nearest_object_with_behavior(bhvFloorSwitchHiddenObjects);
        if ((sp1C = o->oHiddenObjectUnkF4) != NULL)
            if (sp1C->oAction == 2) {
                o->oAction++;
                obj_enable_rendering();
                obj_unhide();
            }
    } else {
        obj_become_tangible();
        if (obj_wait_then_blink(360, 20))
            o->oAction = 0;
        load_object_collision_model();
    }
}

void bhv_hidden_object_loop(void) {
    if (o->oBehParams2ndByte == 0)
        func_802B0F54(); // Confused, that function has code depending on the action
    else
        func_802B1138();
}
