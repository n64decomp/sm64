#include <stdio.h>

#include "nds_include.h"
#include <fat.h>

#include "audio/data.h"
#include "audio/external.h"
#include "audio/load.h"
#include "audio/seqplayer.h"
#include "game/game_init.h"
#include "nds_renderer.h"

OSMesg D_80339BEC;
OSMesgQueue gSIEventMesgQueue;

s8 gResetTimer;
s8 D_8032C648;
s8 gDebugLevelSelect;
s8 gShowProfiler;
s8 gShowDebugText;

u8 audio_state;
static u8 audio_step;

void set_vblank_handler(UNUSED s32 index, UNUSED struct VblankHandler *handler, UNUSED OSMesgQueue *queue, UNUSED OSMesg *msg) {
}

void dispatch_audio_sptask(UNUSED struct SPTask *spTask) {
}

void send_display_list(struct SPTask *spTask) {
    draw_frame((Gfx*)spTask->task.t.data_ptr);
}

static void update_audio(void) {
    // Update audio at the ARM7's request
    if (audio_state == 0) {
        // Update the audio logic at 30 Hz
        if ((audio_step = (audio_step + 1) & 7) == 0) {
            update_game_sound();
            gAudioFrameCount += 2;
            gAudioRandom = ((gAudioRandom + gAudioFrameCount) * gAudioFrameCount);
        }

        // Update the sequences at 240 Hz
        process_sequences(0);
    } else if (audio_state == 1) {
        // Disable audio
        for (int i = 0; i < 16; i++) {
            gNotes[i].enabled = false;
        }
        audio_state = 2;
    }

    // Tell the ARM7 it can go ahead
    IPC_SendSync(0);
}

int main(void) {
    static u64 pool[0x165000 / sizeof(u64)];
    main_pool_init(pool, pool + sizeof(pool) / sizeof(pool[0]));
    gEffectsMemoryPool = mem_pool_init(0x4000, MEMORY_POOL_LEFT);

    renderer_init();

#ifdef LIBFAT
    if (!fatInitDefault()) {
        printf("Failed to initialize libfat!\n");
    }
#endif

    audio_init();
    sound_init();

    // Set up audio on the ARM9 side
    irqSet(IRQ_IPC_SYNC, update_audio);
    irqEnable(IRQ_IPC_SYNC);

    // Give the ARM7 a pointer to the audio data
    fifoSendValue32(FIFO_USER_01, (u32)gNotes);

    // Run the game
    thread5_game_loop(NULL);

    return 0;
}
