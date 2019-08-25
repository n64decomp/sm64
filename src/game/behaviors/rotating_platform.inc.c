// rotating_platform.c.inc

extern u8 wf_seg7_collision_rotating_platform[];
extern u8 wdw_seg7_collision_070186B4[];
struct Struct8032F24A D_8032F24A[] = { { 0, 100, wf_seg7_collision_rotating_platform, 2000 },
                                       { 0, 150, wdw_seg7_collision_070186B4, 1000 } };

void bhv_wf_rotating_wooden_platform_loop(void) {
    if (o->oAction == 0) {
        o->oAngleVelYaw = 0;
        if (o->oTimer > 60) {
            o->oAction++;
            ; // needed to match
        }
    } else {
        o->oAngleVelYaw = 0x100;
        if (o->oTimer > 126)
            o->oAction = 0;
        PlaySound(SOUND_ENVIRONMENT_ELEVATOR2);
    }
    obj_rotate_face_angle_using_vel();
}

void bhv_rotating_platform_loop(void) {
    s8 sp1F = o->oBehParams >> 24;
    if (o->oTimer == 0) {
        set_object_collision_data(o, D_8032F24A[o->oBehParams2ndByte].unk1);
        o->oCollisionDistance = D_8032F24A[o->oBehParams2ndByte].unk2;
        obj_scale(D_8032F24A[o->oBehParams2ndByte].unk0 * 0.01f);
    }
    o->oAngleVelYaw = sp1F << 4;
    o->oFaceAngleYaw += o->oAngleVelYaw;
}
