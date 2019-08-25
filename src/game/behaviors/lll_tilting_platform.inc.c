// lll_tilting_platform.c.inc

void func_802BC544(Mat4 a0, f32 a1, f32 a2, f32 a3) {
    Vec3f sp24;
    Vec3f sp18;
    sp18[0] = o->oPosX;
    sp18[1] = o->oPosY;
    sp18[2] = o->oPosZ;
    sp24[0] = a1;
    sp24[1] = a2;
    sp24[2] = a3;
    mtxf_align_terrain_normal(a0, sp24, sp18, 0);
}

void bhv_tilting_platform_init(void) {
    Mat4 *sp1C = &o->transform;
    o->oTiltingPlatformUnkF4 = 0.0f;
    o->oTiltingPlatformUnkF8 = 1.0f;
    o->oTiltingPlatformUnkFC = 0.0f;
    func_802BC544(*sp1C, 0.0f, 1.0f, 0.0f);
}

f32 func_802BC66C(f32 a0, f32 a1, f32 a2) {
    f32 sp4;
    if (a1 <= a0) {
        if (a0 - a1 < a2)
            sp4 = a0;
        else
            sp4 = a1 + a2;
    } else if (a0 - a1 > -a2)
        sp4 = a0;
    else
        sp4 = a1 - a2;
    return sp4;
}

void bhv_tilting_platform_loop(void) {
    f32 dx;
    f32 dy;
    f32 dz;
    f32 d;
    Vec3f dist;
    Vec3f sp58;
    Vec3f sp4C;
    f32 mx;
    f32 my;
    f32 mz;
    s32 sp3C = 0;
    UNUSED s32 unused;
    Mat4 *sp34 = &o->transform;
    UNUSED s32 unused2[7];
    if (gMarioObject->platform == o) {
        get_mario_pos(&mx, &my, &mz);
        dist[0] = gMarioObject->oPosX - o->oPosX;
        dist[1] = gMarioObject->oPosY - o->oPosY;
        dist[2] = gMarioObject->oPosZ - o->oPosZ;
        linear_mtxf_mul_vec3f(*sp34, sp58, dist);
        dx = gMarioObject->oPosX - o->oPosX;
        dy = 500.0f;
        dz = gMarioObject->oPosZ - o->oPosZ;
        d = sqrtf(dx * dx + dy * dy + dz * dz);
        if (d != 0.0f) // Normalizing
        {
            d = 1.0 / d;
            dx *= d;
            dy *= d;
            dz *= d;
        } else {
            dx = 0.0f;
            dy = 1.0f;
            dz = 0.0f;
        }
        if (o->oTiltingPlatformUnk10C == 1)
            sp3C++;
        o->oTiltingPlatformUnk10C = 1;
    } else {
        dx = 0.0f;
        dy = 1.0f;
        dz = 0.0f;
        o->oTiltingPlatformUnk10C = 0;
    }
    o->oTiltingPlatformUnkF4 = func_802BC66C(dx, o->oTiltingPlatformUnkF4, 0.01f);
    o->oTiltingPlatformUnkF8 = func_802BC66C(dy, o->oTiltingPlatformUnkF8, 0.01f);
    o->oTiltingPlatformUnkFC = func_802BC66C(dz, o->oTiltingPlatformUnkFC, 0.01f);
    func_802BC544(*sp34, o->oTiltingPlatformUnkF4, o->oTiltingPlatformUnkF8, o->oTiltingPlatformUnkFC);
    if (sp3C != 0) {
        linear_mtxf_mul_vec3f(*sp34, sp4C, dist);
        mx += sp4C[0] - sp58[0];
        my += sp4C[1] - sp58[1];
        mz += sp4C[2] - sp58[2];
        set_mario_pos(mx, my, mz);
    }
    o->header.gfx.throwMatrix = sp34;
}
