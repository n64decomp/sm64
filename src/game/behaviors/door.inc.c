// door.c.inc

s32 D_8032F300[][2] = { { 0x40000, 3 }, { 0x80000, 4 }, { 0x10000, 1 }, { 0x20000, 2 }, { -1, 0 }, };

s32 D_8032F328[] = { SOUND_GENERAL_OPEN_WOOD_DOOR, SOUND_GENERAL_OPEN_IRON_DOOR };

s32 D_8032F330[] = { SOUND_GENERAL_CLOSE_WOOD_DOOR, SOUND_GENERAL_CLOSE_IRON_DOOR };

void func_802AC070(s32 sp18) {
    set_obj_animation_and_sound_state(sp18);
    if (func_8029F788())
        o->oAction = 0;
}

void func_802AC0B8(void) {
    if (segmented_to_virtual(bhvDoor) == o->behavior)
        gPlayerCameraState->cameraEvent = CAM_EVENT_DOOR;
    else
        gPlayerCameraState->cameraEvent = CAM_EVENT_DOOR_WARP;
    gPlayerCameraState->usedObj = o;
}

void func_802AC130(void) {
    s32 sp1C = obj_has_model(MODEL_HMC_METAL_DOOR);
    if (o->oTimer == 0) {
        PlaySound2(D_8032F328[sp1C]);
        gTimeStopState |= TIME_STOP_MARIO_OPENED_DOOR;
    }
    if (o->oTimer == 70) {
        PlaySound2(D_8032F330[sp1C]);
    }
}

void func_802AC1CC(void) {
    s32 sp1C = obj_has_model(MODEL_HMC_METAL_DOOR);
    if (o->oTimer == 30)
        PlaySound2(D_8032F330[sp1C]);
}

void bhv_door_loop(void) {
    s32 sp1C = 0;
    while (D_8032F300[sp1C][0] != -1) {
        if (obj_clear_interact_status_flag(D_8032F300[sp1C][0])) {
            func_802AC0B8();
            obj_change_action(D_8032F300[sp1C][1]);
        }
        sp1C++;
    }
    switch (o->oAction) {
        case 0:
            set_obj_animation_and_sound_state(0);
            break;
        case 1:
            func_802AC070(1);
            func_802AC130();
            break;
        case 2:
            func_802AC070(2);
            func_802AC130();
            break;
        case 3:
            func_802AC070(3);
            func_802AC1CC();
            break;
        case 4:
            func_802AC070(4);
            func_802AC1CC();
            break;
    }
    if (o->oAction == 0)
        load_object_collision_model();
    bhv_star_door_loop_2();
}

void bhv_door_init(void) {
    f32 x = o->oPosX;
    f32 z = o->oPosZ;
    struct Surface *floor;
    find_floor(x, o->oPosY, z, &floor);
    if (floor != NULL) {
        o->oDoorUnkF8 = floor->room;
    }

    x = o->oPosX + sins(o->oMoveAngleYaw) * 200.0f;
    z = o->oPosZ + coss(o->oMoveAngleYaw) * 200.0f;
    find_floor(x, o->oPosY, z, &floor);
    if (floor != NULL) {
        o->oDoorUnkFC = floor->room;
    }

    x = o->oPosX + sins(o->oMoveAngleYaw) * -200.0f;
    z = o->oPosZ + coss(o->oMoveAngleYaw) * -200.0f;
    find_floor(x, o->oPosY, z, &floor);
    if (floor != NULL) {
        o->oDoorUnk100 = floor->room;
    }

    if (o->oDoorUnkF8 > 0 && o->oDoorUnkF8 < 60) {
        gDoorAdjacentRooms[o->oDoorUnkF8][0] = o->oDoorUnkFC;
        gDoorAdjacentRooms[o->oDoorUnkF8][1] = o->oDoorUnk100;
    }
}

void bhv_star_door_loop_2(void) {
    s32 sp4 = 0;
    if (gMarioCurrentRoom != 0) {
        if (o->oDoorUnkF8 == gMarioCurrentRoom)
            sp4 = 1;
        else if (gMarioCurrentRoom == o->oDoorUnkFC)
            sp4 = 1;
        else if (gMarioCurrentRoom == o->oDoorUnk100)
            sp4 = 1;
        else if (gDoorAdjacentRooms[gMarioCurrentRoom][0] == o->oDoorUnkFC)
            sp4 = 1;
        else if (gDoorAdjacentRooms[gMarioCurrentRoom][0] == o->oDoorUnk100)
            sp4 = 1;
        else if (gDoorAdjacentRooms[gMarioCurrentRoom][1] == o->oDoorUnkFC)
            sp4 = 1;
        else if (gDoorAdjacentRooms[gMarioCurrentRoom][1] == o->oDoorUnk100)
            sp4 = 1;
    } else
        sp4 = 1;
    if (sp4 == 1) {
        o->header.gfx.node.flags |= 1;
        D_8035FEE4++;
    }
    if (sp4 == 0) {
        o->header.gfx.node.flags &= ~1;
    }
    o->oDoorUnk88 = sp4;
}
