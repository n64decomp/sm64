#include "../nds_include.h"

#include "nds_audio.h"

static u32 calculate_vol_pan(struct Note *note) {
    // Calculate the DS volume and pan values for a note
    u32 vol = (note->targetVolLeft + note->targetVolRight) / 2;
    u32 pan = (vol << 14) / note->targetVolLeft;
    vol >>= 7;
    pan >>= 8;
    if (vol > 127) vol = 127;
    if (pan > 127) pan = 127;
    return SOUND_VOL(vol) | SOUND_PAN(pan);
}

void play_notes(struct Note *notes) {
    // Play notes on the 16 sound channels of the DS
    // The samples are converted to DS ADPCM at compile time, so they can be played directly
    for (int i = 0; i < 16; i++) {
        struct Note *note = &notes[i];

        if (note->enabled && note->sound != NULL) {
            if (note->needsInit) {
                const struct AudioBankSample *sample = note->sound->sample;
                const u32 loop = (sample->loop->count ? SOUND_REPEAT : SOUND_ONE_SHOT);

                // Ensure the channel is properly reset
                SCHANNEL_CR(i) &= ~SCHANNEL_ENABLE;

                // Start playing a note on the current channel
                SCHANNEL_SOURCE(i) = (u32)sample->sampleAddr;
                SCHANNEL_REPEAT_POINT(i) = sample->loop->start / sizeof(u32);
                SCHANNEL_LENGTH(i) = (sample->loop->end - sample->loop->start) / sizeof(u32);
                SCHANNEL_TIMER(i) = SOUND_FREQ((u16)(note->frequency * 32768));
                SCHANNEL_CR(i) = SCHANNEL_ENABLE | SOUND_FORMAT_ADPCM | calculate_vol_pan(note) | loop;

                note->needsInit = false;
            } else if (SCHANNEL_CR(i) & SCHANNEL_ENABLE) {
                // Update the parameters of a currently playing note
                SCHANNEL_TIMER(i) = SOUND_FREQ((u16)(note->frequency * 32768));
                SCHANNEL_CR(i) = (SCHANNEL_CR(i) & ~(SOUND_VOL(127) | SOUND_PAN(127))) | calculate_vol_pan(note);
            }
        } else {
            // Disable the channel if no note should play
            SCHANNEL_CR(i) &= ~SCHANNEL_ENABLE;
        }
    }
}
