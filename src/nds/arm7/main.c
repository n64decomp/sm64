#include "../nds_include.h"

#include "nds_audio.h"

struct Note *gNotes;
static bool running;

static void send_input(void) {
    inputGetAndSend();
}

static void update_audio(void) {
    // Request an audio update from the ARM9
    IPC_SendSync(0);
    swiIntrWait(0, IRQ_IPC_SYNC);

    // Play the current notes
    play_notes(gNotes);
}

static void power_down(void) {
    running = false;
}

int main(void) {
    irqInit();
    fifoInit();
    touchInit();

    readUserSettings();
    installSystemFIFO();
    setPowerButtonCB(power_down);

    SetYtrigger(80);
    irqSet(IRQ_VCOUNT, send_input);
    irqEnable(IRQ_VCOUNT | IRQ_IPC_SYNC);

    // Get a pointer to the audio data from the ARM9
    while (!fifoCheckValue32(FIFO_USER_01));
    gNotes = (struct Note*)fifoGetValue32(FIFO_USER_01);

    // Prepare to update the audio at 240 Hz
    enableSound();
    timerStart(0, ClockDivider_64, TIMER_FREQ_64(240), update_audio);
    running = true;

    // Wait idly for interrupts
    while (running) {
        swiWaitForVBlank();
    }

    return 0;
}
