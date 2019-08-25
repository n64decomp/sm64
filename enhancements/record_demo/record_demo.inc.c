/*
 * This enhancement allows you to record gameplay demos for the mario head screen.
 *
 * Note:
 * This enhancement does require the lastest versions of PJ64 from the nightly builds,
 * because it uses the javascript API to automatically dump the demo files from RAM
 * once the demo is completed. See RecordDemo.js for more info
 *
 * SETUP:
 *
 * First add the following above the 'thread5_game_loop' function in src/game/game.c
    #include "../enhancements/record_demo/record_demo.inc.c"
 *
 * Then, inside thread5_game_loop(), add the recordingDemo function call RIGHT AFTER
 * read_controller_inputs like so:
    func_802494A8();
    func_80247FAC();
    read_controller_inputs();
    recordingDemo();
    addr = level_script_execute(addr);
    display_and_vsync();
*/

#include "../src/game/mario.h"

#define DEMOREC_STATUS_NOT_RECORDING 0
#define DEMOREC_STATUS_PREPARING 1
#define DEMOREC_STATUS_RECORDING 2
#define DEMOREC_STATUS_STOPPING 3
#define DEMOREC_STATUS_DONE 4

#define DEMOREC_PRINT_X 10
#define DEMOREC_PRINT_Y 10

#define DEMOREC_DONE_DELAY 60 // Show "DONE" message for 2 seconds.

#define DEMOREC_MAX_INPUTS 1025 // Max number of recorded inputs.

/*
    DO NOT REMOVE, MODIFY, OR MAKE A COPY OF THIS EXACT STRING!
    This is here so that the js dump script can find the control variables easily.
*/
char gDemoRecTag[] = "DEMORECVARS";

// Control variables. It is easier if they are each 4 byte aligned, which is why they are u32.
u32 gRecordingStatus = DEMOREC_STATUS_NOT_RECORDING;
u32 gDoneDelay = 0;
u32 gNumOfRecordedInputs = 0;
struct DemoInput gRecordedInputs[DEMOREC_MAX_INPUTS];
struct DemoInput* gRecordedInputsPtr = (struct DemoInput*)gRecordedInputs;
struct DemoInput gRecordedDemoInputCopy;

void record_new_demo_input(void) {
    if(gRecordedDemoInput.timer == 1 && gRecordedDemoInputCopy.timer > 0) {
        gRecordedInputs[gNumOfRecordedInputs].timer = gRecordedDemoInputCopy.timer;
        gRecordedInputs[gNumOfRecordedInputs + 1].timer = 0;
        gRecordedInputs[gNumOfRecordedInputs].rawStickX = gRecordedDemoInputCopy.rawStickX;
        gRecordedInputs[gNumOfRecordedInputs + 1].rawStickX = gRecordedDemoInputCopy.rawStickX;
        gRecordedInputs[gNumOfRecordedInputs].rawStickY = gRecordedDemoInputCopy.rawStickY;
        gRecordedInputs[gNumOfRecordedInputs + 1].rawStickY = gRecordedDemoInputCopy.rawStickY;
        gRecordedInputs[gNumOfRecordedInputs].button = gRecordedDemoInputCopy.button;
        gRecordedInputs[gNumOfRecordedInputs + 1].button = gRecordedDemoInputCopy.button;
        gNumOfRecordedInputs++;
    }
}

// Self explanitory
void copy_gRecordedDemoInput(void) {
    gRecordedDemoInputCopy.timer = gRecordedDemoInput.timer;
    gRecordedDemoInputCopy.rawStickX = gRecordedDemoInput.rawStickX;
    gRecordedDemoInputCopy.rawStickY = gRecordedDemoInput.rawStickY;
    gRecordedDemoInputCopy.button = gRecordedDemoInput.button;
}

// Runs when the demo is recording.
void recording(void) {

    // Force-stop when someone makes too many inputs.
    if(gNumOfRecordedInputs + 1 > DEMOREC_MAX_INPUTS) {
        gRecordingStatus = DEMOREC_STATUS_STOPPING;
        return;
    }

    copy_gRecordedDemoInput();
    record_demo(); // Defined in game.c
    record_new_demo_input();
}

// Makes sure the last demo input is zeroed out, to make it look more clean.
void record_cleanup(void) {
    gRecordedInputs[gNumOfRecordedInputs].timer = 0;
    gRecordedInputs[gNumOfRecordedInputs].rawStickX = 0;
    gRecordedInputs[gNumOfRecordedInputs].rawStickY = 0;
    gRecordedInputs[gNumOfRecordedInputs].button = 0;

    // Make sure the done delay is reset before moving to DONE status.
    gDoneDelay = 0;
}

void record_run(void) {
    switch(gRecordingStatus) {
        case DEMOREC_STATUS_NOT_RECORDING:
            break;
        case DEMOREC_STATUS_PREPARING:
            if(gMarioObject != NULL && gCurrLevelNum >= 5) { // If the game is in an active level
                gRecordingStatus = DEMOREC_STATUS_RECORDING;

                // A bit of a hack, but it works.
                gNumOfRecordedInputs = 1;
                gRecordedInputs[0].timer = gCurrLevelNum;
                gRecordedInputs[0].rawStickX = 0;
                gRecordedInputs[0].rawStickY = 0;
                gRecordedInputs[0].button = 0;
            }
            break;
        case DEMOREC_STATUS_RECORDING:
            recording();
            break;
        case DEMOREC_STATUS_DONE:
            if(gDoneDelay > DEMOREC_DONE_DELAY)
                gRecordingStatus = DEMOREC_STATUS_NOT_RECORDING;
            else
                gDoneDelay++;
            break;
    }
}

// Prints the status on the bottom-left side of the screen in colorful text.
void print_status(void) {
    switch(gRecordingStatus) {
        case DEMOREC_STATUS_PREPARING:
            print_text(DEMOREC_PRINT_X, DEMOREC_PRINT_Y, "READY");
            break;
        case DEMOREC_STATUS_RECORDING:
            print_text(DEMOREC_PRINT_X, DEMOREC_PRINT_Y, "REC");
            break;
        case DEMOREC_STATUS_STOPPING:
            print_text(DEMOREC_PRINT_X, DEMOREC_PRINT_Y, "WAIT");
            break;
        case DEMOREC_STATUS_DONE:
            print_text(DEMOREC_PRINT_X, DEMOREC_PRINT_Y, "DONE");
            break;
    }
}

// Main function that should be called from thread5_game_loop()
void recordingDemo(void) {
    // Mario needs to enter directly into a level and not from a warp,
    // so the debug level select is used for that.
    gDebugLevelSelect = TRUE;

    if(gPlayer1Controller->buttonPressed & L_TRIG) {
        if(gRecordingStatus == DEMOREC_STATUS_NOT_RECORDING) {
            gRecordingStatus = DEMOREC_STATUS_PREPARING;
        } else if (gRecordingStatus == DEMOREC_STATUS_RECORDING) {
            gRecordingStatus = DEMOREC_STATUS_STOPPING;
            record_cleanup();
        }
    }

    record_run();
    print_status();
}
