/*
 * audio_ios.m — AudioAPI over AudioUnit RemoteIO (iOS 6 SDK C API).
 * 32000 Hz stereo S16, lock-free single-producer/single-consumer ring:
 * game thread (display link) produces via play(), realtime callback drains.
 */
#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import <libkern/OSAtomic.h>

#include "audio_api.h"

#define IOS_AUDIO_RATE 32000
#define IOS_AUDIO_RING_BYTES (256 * 1024)
// Units match the donor contract (audio_sdl.c): buffered() counts groups of
// 4 bytes (= one stereo S16 frame). Desired ~1100 ~ 34 ms at 32 kHz; the
// play() guard below mirrors audio_sdl's cap to keep latency bounded.
#define IOS_AUDIO_DESIRED 1100
#define IOS_AUDIO_MAX_QUEUED 6000

static uint8_t s_ring[IOS_AUDIO_RING_BYTES];
static volatile int32_t s_write = 0;
static volatile int32_t s_read = 0;
static volatile int s_dropped = 0;
static AudioUnit s_unit = NULL;
static bool s_running = false;

static int ios_audio_available(void) {
    int32_t w = s_write, r = s_read;
    int avail = (int)(w - r);
    if (avail < 0) avail += IOS_AUDIO_RING_BYTES;
    return avail;
}

static OSStatus ios_audio_render(void *inRefCon,
        AudioUnitRenderActionFlags *ioActionFlags,
        const AudioTimeStamp *inTimeStamp,
        UInt32 inBusNumber, UInt32 inNumberFrames,
        AudioBufferList *ioData) {
    UInt8 *out = (UInt8 *)ioData->mBuffers[0].mData;
    UInt32 want = inNumberFrames * 4; // stereo S16
    UInt32 i;
    for (i = 0; i < want; i++) {
        int32_t r = s_read;
        if (r == s_write) {
            out[i] = 0; // underrun: silence
        } else {
            out[i] = s_ring[r];
            r++;
            if (r >= IOS_AUDIO_RING_BYTES) r = 0;
            s_read = r;
        }
    }
    return noErr;
}

static bool audio_ios_init(void) {
    AudioComponentDescription desc;
    AudioComponent comp;
    AudioStreamBasicDescription fmt;
    AURenderCallbackStruct cb;

    if (s_running) return true;

    desc.componentType = kAudioUnitType_Output;
    desc.componentSubType = kAudioUnitSubType_RemoteIO;
    desc.componentManufacturer = kAudioUnitManufacturer_Apple;
    desc.componentFlags = 0;
    desc.componentFlagsMask = 0;

    comp = AudioComponentFindNext(NULL, &desc);
    if (comp == NULL) return false;
    if (AudioComponentInstanceNew(comp, &s_unit) != noErr) return false;

    memset(&fmt, 0, sizeof(fmt));
    fmt.mSampleRate = IOS_AUDIO_RATE;
    fmt.mFormatID = kAudioFormatLinearPCM;
    fmt.mFormatFlags = kAudioFormatFlagIsSignedInteger | kAudioFormatFlagIsPacked;
    fmt.mBytesPerPacket = 4;
    fmt.mFramesPerPacket = 1;
    fmt.mBytesPerFrame = 4;
    fmt.mChannelsPerFrame = 2;
    fmt.mBitsPerChannel = 16;
    if (AudioUnitSetProperty(s_unit, kAudioUnitProperty_StreamFormat,
            kAudioUnitScope_Input, 0, &fmt, sizeof(fmt)) != noErr) {
        AudioComponentInstanceDispose(s_unit);
        s_unit = NULL;
        return false;
    }

    memset(&cb, 0, sizeof(cb));
    cb.inputProc = ios_audio_render;
    if (AudioUnitSetProperty(s_unit, kAudioUnitProperty_SetRenderCallback,
            kAudioUnitScope_Input, 0, &cb, sizeof(cb)) != noErr) {
        AudioComponentInstanceDispose(s_unit);
        s_unit = NULL;
        return false;
    }

    if (AudioOutputUnitStart(s_unit) != noErr) {
        AudioComponentInstanceDispose(s_unit);
        s_unit = NULL;
        return false;
    }

    s_write = 0;
    s_read = 0;
    s_running = true;
    return true;
}

static int audio_ios_buffered(void) {
    // groups of 4 bytes, same as audio_sdl_buffered()
    return ios_audio_available() / 4;
}

static int audio_ios_get_desired_buffered(void) {
    return IOS_AUDIO_DESIRED;
}

static void audio_ios_play(const uint8_t *buf, size_t len) {
    size_t i;
    if (!s_running || buf == NULL) return;
    if (audio_ios_buffered() >= IOS_AUDIO_MAX_QUEUED) {
        return; // queue already deep enough; drop this buffer (as audio_sdl)
    }
    for (i = 0; i < len; i++) {
        int32_t wnext = s_write + 1;
        if (wnext >= IOS_AUDIO_RING_BYTES) wnext = 0;
        if (wnext == s_read) {
            s_dropped++; // ring full: drop newest, never block the game
            return;
        }
        s_ring[s_write] = buf[i];
        s_write = wnext;
    }
}

struct AudioAPI audio_ios = {
    audio_ios_init,
    audio_ios_buffered,
    audio_ios_get_desired_buffered,
    audio_ios_play
};
