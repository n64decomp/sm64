// rotating_octagonal_plat.inc.c

static const Collision *sOctagonalPlatformCollision[] = {
    bits_seg7_collision_0701AA84,
    rr_seg7_collision_07029508,
};

static s16 sOctagonalPlatformAngularVelocities[] = { 300, -300, 600, -600 };

void bhv_rotating_octagonal_plat_init(void) {
    o->collisionData = segmented_to_virtual(sOctagonalPlatformCollision[(u8)(o->oBehParams >> 16)]);
    o->oAngleVelYaw = sOctagonalPlatformAngularVelocities[(u8)(o->oBehParams >> 24)];
}

void bhv_rotating_octagonal_plat_loop(void) {
    o->oFaceAngleYaw += o->oAngleVelYaw;
}
