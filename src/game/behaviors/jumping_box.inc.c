// jumping_box.c.inc

struct ObjectHitbox sJumpingBoxHitbox = {
    /* interactType: */ INTERACT_GRABBABLE,
    /* downOffset: */ 20,
    /* damageOrCoinValue: */ 0,
    /* health: */ 1,
    /* numLootCoins: */ 5,
    /* radius: */ 150,
    /* height: */ 250,
    /* hurtboxRadius: */ 150,
    /* hurtboxHeight: */ 250,
};

void ActionJumpingBox0(void) {
    if (o->oSubAction == 0) {
        if (o->oJumpingBoxUnkF8-- < 0)
            o->oSubAction++;
        if (o->oTimer > o->oJumpingBoxUnkF4) {
            o->oVelY = RandomFloat() * 5.0f + 15.0f;
            o->oSubAction++;
        }
    } else if (o->oMoveFlags & 2) {
        o->oSubAction = 0;
        o->oJumpingBoxUnkF8 = RandomFloat() * 60.0f + 30.0f;
    }
}

void ActionJumpingBox1(void) {
    if (o->oMoveFlags & (0x200 | 0x40 | 0x20 | 0x10 | 0x8 | 0x1)) {
        mark_object_for_deletion(o);
        func_802A3004();
    }
}

void (*sJumpingBoxActions[])(void) = { ActionJumpingBox0, ActionJumpingBox1 };

void func_802B1F84(void) {
    obj_set_model(MODEL_BREAKABLE_BOX);
    obj_scale(0.5f);
    set_object_hitbox(o, &sJumpingBoxHitbox);
    obj_update_floor_and_walls();
    obj_move_standard(78);
    obj_call_action_function(sJumpingBoxActions);
}

void bhv_jumping_box_loop(void) {
    switch (o->oHeldState) {
        case HELD_FREE:
            func_802B1F84();
            break;
        case HELD_HELD:
            copy_object_pos(o, gMarioObject);
            obj_set_model(MODEL_BREAKABLE_BOX_SMALL);
            func_8029FA5C(-1, 0);
            break;
        case HELD_THROWN:
            obj_get_thrown_or_placed(40.0f, 20.0f, 1);
            break;
        case HELD_DROPPED:
            obj_get_dropped();
            o->oAction = 1;
            break;
    }
    if (o->oInteractStatus & INTERACT_HIT_FROM_BELOW) {
        create_sound_spawner(SOUND_GENERAL_BREAK_BOX);
        func_802A3C98(46.0f, 1);
    }
    o->oInteractStatus = 0;
}
