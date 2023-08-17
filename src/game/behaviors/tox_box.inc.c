// tox_box.inc.c

#define FORWARD  TOX_BOX_ACT_ROLL_FORWARD,  TOX_BOX_ACT_ROLL_LAND
#define BACKWARD TOX_BOX_ACT_ROLL_BACKWARD, TOX_BOX_ACT_ROLL_LAND
#define RIGHT    TOX_BOX_ACT_ROLL_RIGHT,    TOX_BOX_ACT_ROLL_LAND
#define LEFT     TOX_BOX_ACT_ROLL_LEFT,     TOX_BOX_ACT_ROLL_LAND
#define IDLE     TOX_BOX_ACT_IDLE
#define END      TOX_BOX_ACT_TABLE_END

s8 sToxBoxActionTable1[] = {
    FORWARD, FORWARD, RIGHT, RIGHT, BACKWARD, BACKWARD, RIGHT, RIGHT, BACKWARD, IDLE,

    FORWARD, FORWARD, FORWARD, IDLE,

    BACKWARD, BACKWARD, LEFT, LEFT, FORWARD, FORWARD, LEFT, LEFT, BACKWARD, BACKWARD, BACKWARD, IDLE,

    FORWARD, END,
};

s8 sToxBoxActionTable2[] = {
    FORWARD, FORWARD, LEFT, LEFT, LEFT, IDLE,

    RIGHT, RIGHT, RIGHT, BACKWARD, BACKWARD, RIGHT, BACKWARD, BACKWARD, IDLE,

    FORWARD, FORWARD, LEFT, END,
};

s8 sToxBoxActionTable3[] = {
    FORWARD, FORWARD, FORWARD, FORWARD, FORWARD, IDLE,

    BACKWARD, BACKWARD, BACKWARD, BACKWARD, BACKWARD, LEFT, IDLE,

    RIGHT, RIGHT, BACKWARD, IDLE,

    FORWARD, LEFT, END,
};

#undef FORWARD
#undef BACKWARD
#undef RIGHT
#undef LEFT
#undef IDLE
#undef END

/*
 * (number = table, v = direction, * = idle)
 *
 *     +---+           +---+
 *     |1 *|           |1 *|
 *     +---+---+---+   +---+           +---+               +---+
 *     | 1 | 1 | 1 |   |1 v|           |2 *|               |   |
 *     +---+---+---+   +---+---+---+---+---+       +---+---+---+
 *     | 1 |   | 1 |   | 1 |   |   |   | 2 |       |   |   |   |
 * +---+---+   +---+---+---+---+---+---+---+---+---+---+---+---+
 * |   |1 *|   | 1 | 1 | 1 |           | 2 |2 v|   |   |   |   |
 * +---+---+   +---+---+---+           +---+---+---+---+   +---+
 *                                         | 2 |
 *                                         +---+---+---+---+---+---+---+   +---+
 *                                         | 2 | 2 | 2 |2 *|   |   |3 *|   |   |
 *                                         +---+---+---+---+---+---+---+---+---+
 *                                                                 | 3 |3 v|3 *|
 *                                                                 +---+---+---+
 *                                                                     | 3 |
 *                                                                     +---+
 *                                                                     | 3 |
 *                                                                     +---+
 *                                                                     | 3 |
 *                                                                     +---+
 *                                                                     | 3 |
 *                                                                     +---+
 *                                                                     |3 *|
 *                                                                     +---+
 */
s8 *sToxBoxActionTables[] = {
    /* TOX_BOX_BP_MOVEMENT_PATTERN_1 */ sToxBoxActionTable1,
    /* TOX_BOX_BP_MOVEMENT_PATTERN_2 */ sToxBoxActionTable2,
    /* TOX_BOX_BP_MOVEMENT_PATTERN_3 */ sToxBoxActionTable3,
};

void tox_box_shake_screen(void) {
    if (o->oDistanceToMario < 3000.0f) {
        cur_obj_shake_screen(SHAKE_POS_SMALL);
    }
}

void tox_box_move(f32 forwardVel, f32 upVel, s16 deltaPitch, s16 deltaRoll) {
    o->oPosY = 99.41124 * sins((f32)(o->oTimer + 1) / 8 * 0x8000) + o->oHomeY + 3.0f;
    o->oForwardVel = forwardVel;
    o->oUpVel = upVel;
    o->oFaceAnglePitch += deltaPitch;

    if ((s16) o->oFaceAnglePitch < 0) {
        deltaRoll = -deltaRoll;
    }

    o->oFaceAngleRoll += deltaRoll;
    cur_obj_set_pos_via_transform();

    if (o->oTimer == 7) {
        o->oAction = cur_obj_progress_action_table();
        cur_obj_play_sound_2(SOUND_GENERAL_UNK46);
    }
}

void tox_box_act_roll_forward(void) {
    tox_box_move(64.0f, 0.0f, 0x800, 0);
}

void tox_box_act_roll_backward(void) {
    tox_box_move(-64.0f, 0.0f, -0x800, 0);
}

void tox_box_act_roll_right(void) {
    tox_box_move(0.0f, -64.0f, 0, 0x800);
}

void tox_box_act_roll_left(void) {
    tox_box_move(0.0f, 64.0f, 0, -0x800);
}

void tox_box_act_roll_land(void) {
    o->oForwardVel = 0.0f;

    if (o->oTimer == 0) {
        tox_box_shake_screen();
    }

    o->oPosY = o->oHomeY + 3.0f;

    if (o->oTimer == 20) {
        o->oAction = cur_obj_progress_action_table();
    }
}

void tox_box_act_idle(void) {
    if (o->oTimer == 20) {
        o->oAction = cur_obj_progress_action_table();
    }
}

void tox_box_act_unused_idle(void) {
    if (o->oTimer == 20) {
        o->oAction = cur_obj_progress_action_table();
    }
}

void tox_box_act_init(void) {
    s8 *actionTable = sToxBoxActionTables[o->oBhvParams2ndByte];
    o->oAction = cur_obj_set_action_table(actionTable);
}

void (*sToxBoxActions[])(void) = {
    tox_box_act_init,
    tox_box_act_roll_land,
    tox_box_act_idle,
    tox_box_act_unused_idle,
    tox_box_act_roll_forward,
    tox_box_act_roll_backward,
    tox_box_act_roll_right,
    tox_box_act_roll_left,
};

void bhv_tox_box_loop(void) {
    cur_obj_call_action_function(sToxBoxActions);
    load_object_collision_model();
}
