/**
 * Behavior for bhvSparkleSpawn.
 *
 * This spawns the sparkles used by various objects. After being given a
 * random local position and scale, each sparkle's behavior is thereafter
 * controlled by bhvSparkle. This spawner is deleted after 1 frame.
 */
void bhv_sparkle_spawn_loop(void) {
    struct Object *sparkle = try_to_spawn_object(0, 1.0f, o, MODEL_SPARKLES_ANIMATION, bhvSparkle);
    if (sparkle != NULL) {
        translate_object_xyz_random(sparkle, 90.0f);
        scale_object_random(sparkle, 1.0f, 0.0f);
    }
    if (o->oTimer > 1) {
        mark_object_for_deletion(o);
    }
}
