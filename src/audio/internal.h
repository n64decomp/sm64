#ifndef AUDIO_INTERNAL_H
#define AUDIO_INTERNAL_H

#include <ultra64.h>

#include "types.h"

#define SEQUENCE_PLAYERS 3
#define LAYERS_MAX       4
#define CHANNELS_MAX     16

#define NO_LAYER ((struct SequenceChannelLayer *)(-1))

#define MUTE_BEHAVIOR_STOP_SCRIPT 0x80 // stop processing sequence/channel scripts
#define MUTE_BEHAVIOR_STOP_NOTES 0x40  // prevent further notes from playing
#define MUTE_BEHAVIOR_SOFTEN 0x20      // lower volume, by default to half

#define SEQUENCE_PLAYER_STATE_0 0
#define SEQUENCE_PLAYER_STATE_FADE_OUT 1
#define SEQUENCE_PLAYER_STATE_2 2
#define SEQUENCE_PLAYER_STATE_3 3
#define SEQUENCE_PLAYER_STATE_4 4

#define NOTE_PRIORITY_DISABLED 0
#define NOTE_PRIORITY_STOPPING 1
#define NOTE_PRIORITY_MIN 2
#define NOTE_PRIORITY_DEFAULT 3

#define TATUMS_PER_BEAT 48

#ifdef VERSION_JP
#define TEMPO_SCALE 1
#else
#define TEMPO_SCALE TATUMS_PER_BEAT
#endif

#ifdef VERSION_JP
#define US_FLOAT(x) x
#else
#define US_FLOAT(x) x ## f
#endif

// Convert u8 or u16 to f32. On JP, this uses a u32->f32 conversion,
// resulting in more bloated codegen, while on US it goes through s32.
// Since u8 and u16 fit losslessly in both, behavior is the same.
#ifdef VERSION_JP
#define FLOAT_CAST(x) (f32) (x)
#else
#define FLOAT_CAST(x) (f32) (s32) (x)
#endif

struct NotePool;

struct AudioListItem
{
    // A node in a circularly linked list. Each node is either a head or an item:
    // - Items can be either detached (prev = NULL), or attached to a list.
    //   'value' points to something of interest.
    // - List heads are always attached; if a list is empty, its head points
    //   to itself. 'count' contains the size of the list.
    // If the list holds notes, 'pool' points back to the pool where it lives.
    // Otherwise, that member is NULL.
    struct AudioListItem *prev;
    struct AudioListItem *next;
    union {
        void *value; // either Note* or SequenceChannelLayer*
        s32 count;
    } u;
    struct NotePool *pool;
}; // size = 0x10

struct NotePool
{
    struct AudioListItem disabled;
    struct AudioListItem decaying;
    struct AudioListItem releasing;
    struct AudioListItem active;
};

struct VibratoState {
    struct SequenceChannel *seqChannel;
    u32 time;
    s8 *curve;
    u8 active;
    u16 rate;
    u16 extent;
    u16 rateChangeTimer;
    u16 extentChangeTimer;
    u16 delay;
}; // size = 0x18

// Pitch sliding by up to one octave in the positive direction. Negative
// direction is "supported" by setting extent to be negative. The code
// exterpolates exponentially in the wrong direction in that case, but that
// doesn't prevent seqplayer from doing it, AFAICT.
struct Portamento {
    u8 mode; // bit 0x80 denotes something; the rest are an index 0-5
    f32 cur;
    f32 speed;
    f32 extent;
}; // size = 0x10

struct AdsrEnvelope {
    s16 delay;
    s16 arg;
}; // size = 0x4

struct AdpcmLoop
{
    u32 start;
    u32 end;
    u32 count;
    u32 pad;
    s16 state[16]; // only exists if count != 0. 8-byte aligned
};

struct AdpcmBook
{
    s32 order;
    s32 npredictors;
    s16 book[1]; // size 8 * order * npredictors. 8-byte aligned
};

struct AudioBankSample
{
    u8 unused;
    u8 loaded;
    u8 *sampleAddr;
    struct AdpcmLoop *loop;
    struct AdpcmBook *book;
    u32 sampleSize; // never read. either 0 or 1 mod 9, depending on padding
};

struct AudioBankSound
{
    struct AudioBankSample *sample;
    f32 tuning; // frequency scale factor
}; // size = 0x8

struct Instrument
{
    /*0x00*/ u8 loaded;
    /*0x01*/ u8 normalRangeLo;
    /*0x02*/ u8 normalRangeHi;
    /*0x03*/ u8 releaseRate;
    /*0x04*/ struct AdsrEnvelope *envelope;
    /*0x08*/ struct AudioBankSound lowNotesSound;
    /*0x10*/ struct AudioBankSound normalNotesSound;
    /*0x18*/ struct AudioBankSound highNotesSound;
}; // size = 0x20

struct Drum
{
    u8 releaseRate;
    u8 pan;
    u8 loaded;
    struct AudioBankSound sound;
    struct AdsrEnvelope *envelope;
};

struct AudioBank
{
    struct Drum **drums;
    struct Instrument *instruments[1];
}; // dynamic size

struct CtlEntry
{
    u8 unused;
    u8 numInstruments;
    u8 numDrums;
    struct Instrument **instruments;
    struct Drum **drums;
}; // size = 0xC

struct M64ScriptState {
    u8 *pc;
    u8 *stack[4];
    u8 remLoopIters[4];
    u8 depth;
}; // size = 0x1C

struct SequencePlayer
{
    /*0x000*/ volatile u8 enabled : 1;
    /*0x000*/ u8 finished : 1; // never read
    /*0x000*/ u8 muted : 1;
    /*0x000*/ u8 seqDmaInProgress : 1;
    /*0x000*/ u8 bankDmaInProgress : 1;
    /*0x001*/ s8 seqVariation;
    /*0x002*/ u8 state;
    /*0x003*/ u8 noteAllocPolicy;
    /*0x004*/ u8 muteBehavior;
    /*0x005*/ u8 seqId;
    /*0x006*/ u8 defaultBank[1]; // must be an array to get a comparison
    // to match; other u8's might also be part of that array
    /*0x007*/ u8 loadingBankId;
    /*0x008*/ u8 loadingBankNumInstruments;
    /*0x009*/ u8 loadingBankNumDrums;
    /*0x00A*/ u16 tempo; // beats per minute in JP, tatums per minute in US
    /*0x00C*/ u16 tempoAcc;
    /*0x00E*/ u16 fadeTimer;
    /*0x010*/ s16 transposition;
    /*0x012*/ u16 delay;
    /*0x014*/ u8 *seqData; // buffer of some sort
    /*0x018*/ f32 fadeVolume; // set to 1.0f
    /*0x01C*/ f32 fadeVelocity; // set to 0.0f
    /*0x020*/ f32 volume; // set to 0.0f
    /*0x024*/ f32 muteVolumeScale; // set to 0.5f
    /*     */ u8 pad1[4];
    /*0x02C*/ struct SequenceChannel *channels[CHANNELS_MAX];
    /*0x06C*/ struct M64ScriptState scriptState;
    /*0x088*/ u8 *shortNoteVelocityTable;
    /*0x08C*/ u8 *shortNoteDurationTable;
    /*0x090*/ struct NotePool notePool;
    /*0x0D0*/ OSMesgQueue seqDmaMesgQueue;
    /*0x0E8*/ OSMesg seqDmaMesg;
    /*0x0EC*/ OSIoMesg seqDmaIoMesg;
    /*0x100*/ OSMesgQueue bankDmaMesgQueue;
    /*0x118*/ OSMesg bankDmaMesg;
    /*0x11C*/ OSIoMesg bankDmaIoMesg;
    /*0x130*/ u8 *bankDmaCurrMemAddr;
    /*0x134*/ struct AudioBank *loadingBank;
    /*0x138*/ uintptr_t bankDmaCurrDevAddr;
    /*0x13C*/ ssize_t bankDmaRemaining;
}; // size = 0x140

struct AdsrSettings
{
    u8 releaseRate;
    u16 sustain; // sustain level, 2^16 = max
    struct AdsrEnvelope *envelope;
}; // size = 0x8

struct AdsrState {
    u8 action;
    u8 state;
    s16 initial; // always 0
    s16 target;
    s16 current;
    s16 envIndex;
    s16 delay;
    s16 sustain;
    s16 fadeOutVel;
    s32 velocity;
    s32 currentHiRes;
    s16 *volOut;
    struct AdsrEnvelope *envelope;
}; // size = 0x20

struct NoteAttributes
{
    s8 reverb;
    f32 freqScale;
    f32 velocity;
    f32 pan;
}; // size = 0x10

struct SequenceChannel
{
    /*0x00*/ u8 enabled : 1;
    /*0x00*/ u8 finished : 1;
    /*0x00*/ u8 stopScript : 1;
    /*0x00*/ u8 stopSomething2 : 1; // sets SequenceChannelLayer.stopSomething
    /*0x00*/ u8 hasInstrument : 1;
    /*0x00*/ u8 stereoHeadsetEffects : 1;
    /*0x00*/ u8 largeNotes : 1; // notes specify duration and velocity
    /*0x00*/ u8 unused : 1; // never read, set to 0
    /*0x01*/ u8 noteAllocPolicy;
    /*0x02*/ u8 muteBehavior;
    /*0x03*/ u8 reverb; // or dry/wet mix
    /*0x04*/ u8 notePriority; // 0-3
    /*0x05*/ u8 bankId;
    /*0x06*/ u8 updatesPerFrameUnused; // never read
    /*0x08*/ u16 vibratoRateStart; // initially 0x800
    /*0x0A*/ u16 vibratoExtentStart;
    /*0x0C*/ u16 vibratoRateTarget; // initially 0x800
    /*0x0E*/ u16 vibratoExtentTarget;
    /*0x10*/ u16 vibratoRateChangeDelay;
    /*0x12*/ u16 vibratoExtentChangeDelay;
    /*0x14*/ u16 vibratoDelay;
    /*0x16*/ u16 delay;
    /*0x18*/ s16 instOrWave; // either 0 (none), instrument index + 1, or
    // 0x80..0x83 for sawtooth/triangle/sine/square waves.
    /*0x1A*/ s16 transposition;
    /*0x1C*/ f32 volumeScale;
    /*0x20*/ f32 volume;
    /*0x24*/ f32 pan;
    /*0x28*/ f32 panChannelWeight; // proportion of pan that comes from the channel (0..1)
    /*0x2C*/ f32 freqScale;
    /*0x30*/ u8 (*dynTable)[][2];
    /*0x34*/ struct Note *noteUnused; // never read
    /*0x38*/ struct SequenceChannelLayer *layerUnused; // never read
    /*0x3C*/ struct Instrument *instrument;
    /*0x40*/ struct SequencePlayer *seqPlayer;
    /*0x44*/ struct SequenceChannelLayer *layers[LAYERS_MAX];
    /*0x54*/ s8 soundScriptIO[8]; // bridge between sound script and audio lib. For player 2,
    // [0] contains enabled, [4] contains sound ID, [5] contains reverb adjustment
    /*0x5C*/ struct M64ScriptState scriptState;
    /*0x78*/ struct AdsrSettings adsr;
    /*0x80*/ struct NotePool notePool;
}; // size = 0xC0

struct SequenceChannelLayer // Maybe SequenceTrack?
{
    /*0x00*/ u8 enabled : 1;
    /*0x00*/ u8 finished : 1;
    /*0x00*/ u8 stopSomething : 1; // ?
    /*0x00*/ u8 continuousNotes : 1; // keep the same note for consecutive notes with the same sound
    /*0x01*/ u8 status;
    /*0x02*/ u8 noteDuration; // set to 0x80
    /*0x03*/ u8 portamentoTargetNote;
    /*0x04*/ struct Portamento portamento;
    /*0x14*/ struct AdsrSettings adsr;
    /*0x1C*/ u16 portamentoTime;
    /*0x1E*/ s16 transposition; // #semitones added to play commands
    // (m64 instruction encoding only allows referring to the limited range
    // 0..0x3f; this makes 0x40..0x7f accessible as well)
    /*0x20*/ f32 freqScale;
    /*0x24*/ f32 velocitySquare;
    /*0x28*/ f32 pan;
    /*0x2C*/ f32 noteVelocity;
    /*0x30*/ f32 notePan;
    /*0x34*/ f32 noteFreqScale;
    /*0x38*/ s16 shortNoteDefaultPlayPercentage;
    /*0x3A*/ s16 playPercentage; // it's not really a percentage...
    /*0x3C*/ s16 delay;
    /*0x3E*/ s16 duration;
    /*0x40*/ s16 delayUnused; // set to 'delay', never read
    /*0x44*/ struct Note *note;
    /*0x48*/ struct Instrument *instrument;
    /*0x4C*/ struct AudioBankSound *sound;
    /*0x50*/ struct SequenceChannel *seqChannel;
    /*0x54*/ struct M64ScriptState scriptState;
    /*0x70*/ struct AudioListItem listItem;
}; // size = 0x80

struct Note
{
    /*0x00*/ u8 enabled : 1;
    /*0x00*/ u8 needsInit : 1;
    /*0x00*/ u8 restart : 1;
    /*0x00*/ u8 finished : 1;
    /*0x00*/ u8 envMixerNeedsInit : 1;
    /*0x00*/ u8 stereoStrongRight : 1;
    /*0x00*/ u8 stereoStrongLeft : 1;
    /*0x00*/ u8 stereoHeadsetEffects : 1;
    /*0x01*/ u8 usesHeadsetPanEffects;
    /*0x02*/ u8 unk2;
    /*0x03*/ u8 sampleDmaIndex;
    /*0x04*/ u8 priority;
    /*0x05*/ u8 sampleCount; // 0, 8, 16, 32 or 64
    /*0x06*/ u8 instOrWave;
    /*0x07*/ u8 bankId;
    /*0x08*/ s16 adsrVolScale;
    /*    */ u8 pad1[2];
    /*0x0C*/ u16 headsetPanRight;
    /*0x0E*/ u16 headsetPanLeft;
    /*0x10*/ u16 prevHeadsetPanRight;
    /*0x12*/ u16 prevHeadsetPanLeft;
    /*0x14*/ s32 samplePosInt;
    /*0x18*/ f32 portamentoFreqScale;
    /*0x1C*/ f32 vibratoFreqScale;
    /*0x20*/ u16 samplePosFrac;
    /*0x24*/ struct AudioBankSound *sound;
    /*0x28*/ struct SequenceChannelLayer *prevParentLayer;
    /*0x2C*/ struct SequenceChannelLayer *parentLayer;
    /*0x30*/ struct SequenceChannelLayer *wantedParentLayer;
    /*0x34*/ struct NoteSynthesisBuffers *synthesisBuffers;
    /*0x38*/ f32 frequency;
    /*0x3C*/ u16 targetVolLeft;
    /*0x3E*/ u16 targetVolRight;
    /*0x40*/ u8 reverb;
    /*0x41*/ u8 unused1; // never read, set to 0x3f
    /*0x44*/ struct NoteAttributes attributes;
    /*0x54*/ struct AdsrState adsr;
    /*0x74*/ struct Portamento portamento;
    /*0x84*/ struct VibratoState vibratoState;
    /*0x9C*/ s16 curVolLeft;
    /*0x9E*/ s16 curVolRight;
    /*0xA0*/ s16 reverbVol;
    /*0xA2*/ s16 unused2; // never read, set to 0
    /*0xA4*/ struct AudioListItem listItem;
    /*    */ u8 pad2[0xc];
}; // size = 0xC0

struct NoteSynthesisBuffers
{
    s16 adpcmdecState[0x10];
    s16 finalResampleState[0x10];
    s16 mixEnvelopeState[0x28];
    s16 panResampleState[0x10];
    s16 panSamplesBuffer[0x20];
    s16 dummyResampleState[0x10];
    s16 samples[0x40];
};

struct AudioSessionSettings
{
    /*0x00*/ u32 frequency;
    /*0x04*/ u8 maxSimultaneousNotes;
    /*0x05*/ u8 reverbDownsampleRate; // always 1
    /*0x06*/ u16 reverbWindowSize;
    /*0x08*/ u16 reverbGain;
    /*0x0A*/ u16 volume;
    /*0x0C*/ u32 persistentSeqMem;
    /*0x10*/ u32 persistentBankMem;
    /*0x14*/ u32 temporarySeqMem;
    /*0x18*/ u32 temporaryBankMem;
}; // size = 0x1C

#endif /* AUDIO_INTERNAL_H */
