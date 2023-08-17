// grill_door.inc.c

struct OpenableGrill {
    s16 halfWidth;
    s16 modelID;
    const Collision *collision;
};

struct OpenableGrill gOpenableGrills[] = {
    { 320, MODEL_BOB_BARS_GRILLS, bob_seg7_collision_gate },
    { 410, MODEL_HMC_RED_GRILLS,  hmc_seg7_collision_0702B65C },
};

void bhv_openable_cage_door_loop(void) {
    if (o->oAction == 0) {
        if (o->parentObj->oOpenableGrillUnk88 != 0) {
            o->oAction++;
        }
    } else if (o->oAction == 1) {
        if (o->oTimer < 64) {
            o->oMoveAngleYaw -= o->oBhvParams2ndByte * 0x100;
        } else {
            o->oAction++;
        }
    }
}

void bhv_openable_grill_loop(void) {
    struct Object *obj;
    s32 grillIdx;

    switch (o->oAction) {
        case 0:
            grillIdx = o->oBhvParams2ndByte;

            obj = spawn_object_relative(-1, gOpenableGrills[grillIdx].halfWidth, 0, 0, o,
                                        gOpenableGrills[grillIdx].modelID, bhvOpenableCageDoor);
            obj->oMoveAngleYaw += 0x8000;
            obj_set_collision_data(obj, gOpenableGrills[grillIdx].collision);

            obj = spawn_object_relative(1, -gOpenableGrills[grillIdx].halfWidth, 0, 0, o,
                                        gOpenableGrills[grillIdx].modelID, bhvOpenableCageDoor);
            obj_set_collision_data(obj, gOpenableGrills[grillIdx].collision);

            o->oAction++;
            break;

        case 1:
            if ((o->oOpenableGrillPurpleSwitch =
                 cur_obj_nearest_object_with_behavior(bhvFloorSwitchGrills)) != NULL) {
                o->oAction++;
            }
            break;

        case 2:
            obj = o->oOpenableGrillPurpleSwitch;

            if (obj->oAction == PURPLE_SWITCH_ACT_TICKING) {
                o->oOpenableGrillUnk88 = 2;
                cur_obj_play_sound_2(SOUND_GENERAL_CAGE_OPEN);
                o->oAction++;

                if (o->oBhvParams2ndByte != OPENABLE_GRILL_BP_BOB) {
                    play_puzzle_jingle();
                }
            }
            break;

        case 3:
            break;
    }
}
