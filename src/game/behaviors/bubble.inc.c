// bubble.c.inc

void bhv_object_bubble_init(void) {
    o->oPosX += RandomFloat() * 30.0f;
    o->oPosY += RandomFloat() * 30.0f;
    o->oPosZ += RandomFloat() * 30.0f;
}

void bhv_object_bubble_loop(void) {
    struct Object *bubbleRipples;
    f32 waterY = find_water_level(o->oPosX, o->oPosZ);
    f32 bubbleY = o->oPosY;

    if (bubbleY > waterY) {
        if (gFreeObjectList.next) {
            bubbleRipples = spawn_object_at_origin(o, 0, MODEL_SPOT_ON_GROUND, bhvObjectBubbleRipples);
            bubbleRipples->oPosX = o->oPosX;
            bubbleRipples->oPosY = bubbleY + 5.0f;
            bubbleRipples->oPosZ = o->oPosZ;
        }

        o->activeFlags = 0;
    }
}
