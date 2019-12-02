#ifndef AUDIO_SYNTHESIS_H
#define AUDIO_SYNTHESIS_H

#include "internal.h"

#define DEFAULT_LEN_1CH 0x140
#define DEFAULT_LEN_2CH 0x280

#define MAX_UPDATES_PER_FRAME 4

struct ReverbRingBufferItem
{
    s16 numSamplesAfterDownsampling;
    s16 chunkLen; // never read
    s16 *toDownsampleLeft;
    s16 *toDownsampleRight; // data pointed to by left and right are adjacent in memory
    s32 startPos; // start pos in ring buffer
    s16 lengths[2]; // first length in ring buffer (max until end) and second length in ring buffer (from pos 0)
}; // size = 0x14

struct SynthesisReverb
{
    u8 resampleFlags;
    u8 useReverb;
    u8 framesLeftToIgnore;
    u8 curFrame;
    u16 reverbGain;
    u16 resampleRate;
    s32 nextRingBufferPos;
    s32 unkC; // never read
    s32 bufSizePerChannel;
    struct
    {
        s16 *left;
        s16 *right;
    } ringBuffer;
    s16 *resampleStateLeft;
    s16 *resampleStateRight;
    s16 *unk24; // never read
    s16 *unk28; // never read
    struct ReverbRingBufferItem items[2][MAX_UPDATES_PER_FRAME];
}; // 0xCC <= size <= 0x100
extern struct SynthesisReverb gSynthesisReverb;

u64 *synthesis_execute(u64 *cmdBuf, s32 *writtenCmds, u16 *aiBuf, s32 bufLen);
void note_init_volume(struct Note *note);
void note_set_vel_pan_reverb(struct Note *note, f32 velocity, f32 pan, u8 reverb);
void note_set_frequency(struct Note *note, f32 frequency);
void note_enable(struct Note *note);
void note_disable(struct Note *note);

#endif /* AUDIO_SYNTHESIS_H */
