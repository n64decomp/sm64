#include "../nds_include.h"

#include "nds_audio.h"

// Better frequency calculation
#undef SOUND_FREQ
#define SOUND_FREQ(n) (-(BUS_CLOCK >> 1) / (n))

static u16 high_freqs;

static u16 calculate_freq(f32 frequency) {
    // Calculate the DS frequency for a note
    u32 freq = frequency * 32000;
    if (freq > 0xFFFF) freq = 0xFFFF;
    return SOUND_FREQ((u16)freq);
}

static u32 calculate_vol_pan(const struct Note *note) {
    // Calculate the DS volume and pan values for a note
    u32 vol = note->targetVolLeft + note->targetVolRight;
    u32 pan = (vol << 13) / note->targetVolLeft;
    vol >>= 8;
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
            if (note->needsInit || ((SCHANNEL_CR(i) & SCHANNEL_ENABLE) && (note->frequency >= 2.0f) != (bool)(high_freqs & BIT(i)))) {
                const struct AudioBankSample *sample = note->sound->sample;
                const u32 loop = (sample->loop->count ? SOUND_REPEAT : SOUND_ONE_SHOT);

                // Ensure the channel is properly reset
                SCHANNEL_CR(i) &= ~SCHANNEL_ENABLE;

                if (note->frequency >= 2.0f && *(u32*)sample->sampleAddr != 0) {
                    // If the frequency is too high, play the downsampled version at half frequency
                    SCHANNEL_SOURCE(i) = (u32)sample->sampleAddr + *(u32*)sample->sampleAddr + 4;
                    SCHANNEL_REPEAT_POINT(i) = sample->loop->start / 2 / sizeof(u32) + 1;
                    SCHANNEL_LENGTH(i) = (sample->loop->end - sample->loop->start) / 2 / sizeof(u32) + 1;
                    SCHANNEL_TIMER(i) = calculate_freq(note->frequency / 2);
                    high_freqs |= BIT(i);
                } else {
                    // Play the normal version at full frequency
                    SCHANNEL_SOURCE(i) = (u32)sample->sampleAddr + 4;
                    SCHANNEL_REPEAT_POINT(i) = sample->loop->start / sizeof(u32) + 1;
                    SCHANNEL_LENGTH(i) = (sample->loop->end - sample->loop->start) / sizeof(u32) + 1;
                    SCHANNEL_TIMER(i) = calculate_freq(note->frequency);
                    high_freqs &= ~BIT(i);
                }

                // Start the channel
                SCHANNEL_CR(i) = SCHANNEL_ENABLE | SOUND_FORMAT_ADPCM | calculate_vol_pan(note) | loop;

                note->needsInit = false;
            } else if (SCHANNEL_CR(i) & SCHANNEL_ENABLE) {
                // Update the parameters of a currently playing note
                SCHANNEL_TIMER(i) = calculate_freq(note->frequency / ((high_freqs & BIT(i)) ? 2 : 1));
                SCHANNEL_CR(i) = (SCHANNEL_CR(i) & ~(SOUND_VOL(127) | SOUND_PAN(127))) | calculate_vol_pan(note);
            }
        } else {
            // Disable the channel if no note should play
            SCHANNEL_CR(i) &= ~SCHANNEL_ENABLE;
        }
    }
}
