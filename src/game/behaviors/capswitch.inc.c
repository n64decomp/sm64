// capswitch.c.inc

void ActionActivateCapSwitch0(void) {
    o->oAnimState = o->oBehParams2ndByte;
    obj_scale(0.5f);
    o->oPosY += 71.0f;
    spawn_object_relative_with_scale(0, 0, -71, 0, 0.5f, o, MODEL_CAP_SWITCH_BASE, bhvCapSwitchBase);
    if (gCurrLevelNum != LEVEL_UNKNOWN_32) {
        if (save_file_get_flags() & D_8032F0C0[o->oBehParams2ndByte]) {
            o->oAction = 3;
            o->header.gfx.scale[1] = 0.1f;
        } else
            o->oAction = 1;
    } else
        o->oAction = 1;
}

void ActionActivateCapSwitch1(void) {
    if (obj_is_mario_on_platform()) {
        save_file_set_flags(D_8032F0C0[o->oBehParams2ndByte]);
        o->oAction = 2;
        PlaySound2(SOUND_GENERAL_ACTIVATE_CAP_SWITCH);
    }
}

void ActionActivateCapSwitch2(void) {
    s32 sp1C;
    if (o->oTimer < 5) {
        func_802A3398(2, 4, 0.5f, 0.1f);
        if (o->oTimer == 4) {
            ShakeScreen(SHAKE_POS_SMALL);
            func_802A3004();
            spawn_triangle_break_particles(60, 139, 0.3f, o->oBehParams2ndByte);
        }
    } else {
        sp1C = obj_update_dialog_with_cutscene(1, 0x0C, CUTSCENE_CAP_SWITCH_PRESS, 0);
        if (sp1C)
            o->oAction = 3;
    }
}

void ActionActivateCapSwitch3() {
} // dead function

void (*sCapSwitchActions[])(void) = { ActionActivateCapSwitch0, ActionActivateCapSwitch1,
                                      ActionActivateCapSwitch2, ActionActivateCapSwitch3 };

void bhv_cap_switch_loop(void) {
    obj_call_action_function(sCapSwitchActions);
}

Gfx *Geo18_802A719C(s32 run, UNUSED struct GraphNode *node, Mat4 mtx) {
    Mat4 sp20;
    struct Object *sp1C;

    if (run == TRUE) {
        sp1C = (struct Object *) gCurGraphNodeObject;
        if (sp1C->prevObj != NULL) {
            func_8029D704(sp20, mtx, gCurGraphNodeCamera->matrixPtr);
            func_8029D558(sp20, sp1C->prevObj);
            func_8029EA0C(sp1C->prevObj);
        }
    }
    return NULL;
}
