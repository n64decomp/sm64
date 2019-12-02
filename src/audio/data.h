#ifndef AUDIO_DATA_H
#define AUDIO_DATA_H

#include "internal.h"

#define AUDIO_LOCK_UNINITIALIZED 0
#define AUDIO_LOCK_NOT_LOADING 0x76557364
#define AUDIO_LOCK_LOADING 0x19710515

#define NUMAIBUFFERS 3

// constant .data
extern struct AudioSessionSettings gAudioSessionPresets[18];
extern u16 D_80332388[128]; // unused

extern f32 gPitchBendFrequencyScale[255];
extern f32 gNoteFrequencies[128];

extern u8 gDefaultShortNoteVelocityTable[16];
extern u8 gDefaultShortNoteDurationTable[16];
extern s8 gVibratoCurve[16];
extern struct AdsrEnvelope gDefaultEnvelope[3];

extern s16 *gWaveSamples[4];

extern u16 gHeadsetPanQuantization[10];
extern f32 gHeadsetPanVolume[128];
extern f32 gStereoPanVolume[128];
extern f32 gDefaultPanVolume[128];

extern f32 gVolRampingLhs136[128];
extern f32 gVolRampingRhs136[128];
extern f32 gVolRampingLhs144[128];
extern f32 gVolRampingRhs144[128];
extern f32 gVolRampingLhs128[128];
extern f32 gVolRampingRhs128[128];

// non-constant .data
extern s16 gTatumsPerBeat;
extern s8 gUnusedCount80333EE8;
extern s32 gAudioHeapSize;
extern s32 D_80333EF0; // amount of heap designated to gAudioInitPool, 0x2500
extern volatile s32 gAudioLoadLock;

// .bss
extern struct CtlEntry *gCtlEntries;
extern s32 gAiFrequency;
extern u32 D_80226D68;
extern s32 gMaxAudioCmds;

extern s32 gMaxSimultaneousNotes;
extern s32 gSamplesPerFrameTarget;
extern s32 gMinAiBufferLength;
extern s16 gTempoInternalToExternal;
extern s8 gAudioUpdatesPerFrame; // = 4
extern s8 gSoundMode;

extern volatile s32 gAudioFrameCount;
extern volatile s32 gCurrAudioFrameDmaCount; // number of DMAs performed during this frame

extern s32 gAudioTaskIndex;
extern s32 gCurrAiBufferIndex;

extern u64 *gAudioCmdBuffers[2];
extern u64 *gAudioCmd;

extern struct SPTask *gAudioTask;
extern struct SPTask gAudioTasks[2];

extern u16 *gAiBuffers[NUMAIBUFFERS];
extern s16 gAiBufferLengths[NUMAIBUFFERS];

extern u32 gUnused80226E58[0x10];
extern u16 gUnused80226E98[0x10];

extern u32 gAudioRandom;

#endif /* AUDIO_DATA_H */
