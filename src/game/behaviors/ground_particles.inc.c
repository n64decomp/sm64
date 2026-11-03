// ground_particles.c.inc

static struct SpawnParticlesInfo sGlobalMistParticles = { 3, 20, MODEL_MIST, 20, 10, 5, 0, 0, 0, 30, 30.0f, 1.5f };

static struct SpawnParticlesInfo sSandParticles = { 0, 5, MODEL_SAND_DUST, 0, 0, 20, 20, 0, 252, 30, 5.0f, 2.0f };

static s16 sSmokeMovementParams[] = { 2, -8, 1, 4 };

static struct SpawnParticlesInfo sSnowParticles = { 0,    5,   MODEL_WHITE_PARTICLE_DL, 0, 0, 20, 20, 0, 252, 30,
                                         2.0f, 2.0f };

void bhv_pound_white_puffs_init(void) {
    clear_particle_flags(0x8000);
    spawn_mist_from_global();
}

void spawn_mist_from_global(void) {
    cur_obj_spawn_particles(&sGlobalMistParticles);
}

void bhv_ground_sand_init(void) {
    clear_particle_flags(0x4000);
    cur_obj_spawn_particles(&sSandParticles);
}

void spawn_smoke_with_velocity(void) {
    struct Object *smoke = spawn_object_with_scale(o, MODEL_SMOKE, bhvWhitePuffSmoke2, 1.0f);
    smoke->oForwardVel = sSmokeMovementParams[0];
    smoke->oVelY = sSmokeMovementParams[1];
    smoke->oGravity = sSmokeMovementParams[2];
    obj_translate_xyz_random(smoke, sSmokeMovementParams[3]);
}

// TODO Fix name
void clear_particle_flags(u32 flags) {
    o->parentObj->oActiveParticleFlags &= flags ^ -1; // Clear the flags given (could just be ~flags)
}

void bhv_ground_snow_init(void) {
    clear_particle_flags(1 << 16);
    cur_obj_spawn_particles(&sSnowParticles);
}
