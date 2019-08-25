/*
 * Framerate counter
 *
 * Calculates the game's current framerate by using osGetTime() and
 * prints it out on the lower left side of the screen.
 *
 * HOW TO USE:
 *
 * Add this include statement to the top of game.c
 *
 * #include "../../enhancements/fps.inc.c"
 *
 * Then, at the end of the while(1) loop in the function thread5_game_loop()
 * add the function call render_fps()
 *
 * That's it! Build the rom file and press L when the game boots up
 * to toggle the FPS counter.
 */

// SDK states that 1 cycle takes about 21.33 nanoseconds
#define SECONDS_PER_CYCLE 0.00000002133f

#define FPS_COUNTER_X_POS 24
#define FPS_COUNTER_Y_POS 190

OSTime gLastOSTime = 0;
float gFrameTime = 0.0f;
u16 gFrames = 0;
u16 gFPS = 0;
u8 gRenderFPS = FALSE;

void calculate_frameTime_from_OSTime(OSTime diff) {
    gFrameTime += diff * SECONDS_PER_CYCLE;
    gFrames++;
}

void render_fps(void) {
    // Toggle rendering framerate with the L button.
    if (gPlayer1Controller->buttonPressed & L_TRIG) {
        gRenderFPS ^= 1;
    }

    if (gRenderFPS) {
        OSTime newTime = osGetTime();

        calculate_frameTime_from_OSTime(newTime - gLastOSTime);

        // If frame time is longer or equal to a second, update FPS counter.
        if (gFrameTime >= 1.0f) {
            gFPS = gFrames;
            gFrames = 0;
            gFrameTime -= 1.0f;
        }

        print_text_fmt_int(FPS_COUNTER_X_POS, FPS_COUNTER_Y_POS, "FPS %d", gFPS);

        gLastOSTime = newTime;
    }
}
