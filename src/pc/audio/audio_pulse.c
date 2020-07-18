#include "../compat.h"

#if defined(__linux__) || defined(__BSD__)

#include <stdio.h>
#include <stdbool.h>
#include <pulse/pulseaudio.h>

#include "macros.h"
#include "audio_api.h"

static struct {
    pa_mainloop *mainloop;
    pa_context *context;
    pa_stream *stream;
    pa_buffer_attr attr;
    bool write_complete;
} pas;

static void pas_context_state_cb(pa_context *c, void *userdata) {
    switch (pa_context_get_state(c)) {
        case PA_CONTEXT_READY:
        case PA_CONTEXT_TERMINATED:
        case PA_CONTEXT_FAILED:
            *((bool *)userdata) = true;
            break;
        default:
            break;
    }
}

static void pas_stream_state_cb(pa_stream *s, void *userdata) {
    switch (pa_stream_get_state(s)) {
        case PA_STREAM_READY:
        case PA_STREAM_FAILED:
        case PA_STREAM_TERMINATED:
            *((bool *)userdata) = true;
            break;
        default:
            break;
    }
}

static void pas_stream_write_cb(UNUSED pa_stream *s, UNUSED size_t length, UNUSED void *userdata) {
    //size_t ws = pa_stream_writable_size(pas.stream);
    //printf("write cb: %d %d\n", (int)length, (int)ws);
}

static bool audio_pulse_init(void) {
    // Create mainloop
    pas.mainloop = pa_mainloop_new();
    if (pas.mainloop == NULL) {
        return false;
    }
    
    // Create context and connect
    pas.context = pa_context_new(pa_mainloop_get_api(pas.mainloop), "Super Mario 64");
    if (pas.context == NULL) {
        goto fail;
    }
    
    bool done = false;
    pa_context_set_state_callback(pas.context, pas_context_state_cb, &done);
    
    if (pa_context_connect(pas.context, NULL, 0, NULL) < 0) {
        goto fail;
    }
    
    while (!done) {
        pa_mainloop_iterate(pas.mainloop, true, NULL);
    }
    pa_context_set_state_callback(pas.context, NULL, NULL);
    if (pa_context_get_state(pas.context) != PA_CONTEXT_READY) {
        goto fail;
    }
    
    // Create stream
    pa_sample_spec ss;
    ss.format = PA_SAMPLE_S16LE;
    ss.rate = 32000;
    ss.channels = 2;
    
    pa_buffer_attr attr;
    attr.maxlength = (1600 + 544 + 528 + 1600) * 4;
    attr.tlength = (528*2 + 544) * 4;
    attr.prebuf = 1500 * 4;
    attr.minreq = 161 * 4;
    attr.fragsize = (uint32_t)-1;
    
    pas.stream = pa_stream_new(pas.context, "mario", &ss, NULL);
    if (pas.stream == NULL) {
        goto fail;
    }
    
    done = false;
    pa_stream_set_state_callback(pas.stream, pas_stream_state_cb, &done);
    pa_stream_set_write_callback(pas.stream, pas_stream_write_cb, NULL);
    if (pa_stream_connect_playback(pas.stream, NULL, &attr, PA_STREAM_ADJUST_LATENCY, NULL, NULL) < 0) {
        goto fail;
    }
    
    while (!done) {
        pa_mainloop_iterate(pas.mainloop, true, NULL);
    }
    pa_stream_set_state_callback(pas.stream, NULL, NULL);
    if (pa_stream_get_state(pas.stream) != PA_STREAM_READY) {
        goto fail;
    }
    
    const pa_buffer_attr *applied_attr = pa_stream_get_buffer_attr(pas.stream);
    printf("maxlength: %u\ntlength: %u\nprebuf: %u\nminreq: %u\nfragsize: %u\n",
           applied_attr->maxlength, applied_attr->tlength, applied_attr->prebuf, applied_attr->minreq, applied_attr->fragsize);
    pas.attr = *applied_attr;
    
    return true;

fail:
    if (pas.stream != NULL) {
        pa_stream_unref(pas.stream);
        pas.stream = NULL;
    }
    if (pas.context != NULL) {
        pa_context_disconnect(pas.context);
        pa_context_unref(pas.context);
        pas.context = NULL;
    }
    if (pas.mainloop != NULL) {
        pa_mainloop_free(pas.mainloop);
        pas.mainloop = NULL;
    }
    return false;
}

static void pas_update_complete(UNUSED pa_stream *stream, UNUSED int success, void *userdata) {
    *(bool *)userdata = true;
}

static void pas_update(void) {
    bool done = false;
    pa_stream_update_timing_info(pas.stream, pas_update_complete, &done);
    while (!done) {
        pa_mainloop_iterate(pas.mainloop, true, NULL);
    }
}

static void pas_write_complete(UNUSED void *p) {
    pas.write_complete = true;
}

static int audio_pulse_buffered(void) {
    if (pas.stream == NULL) {
        return 0;
    }
    pas_update();
    const pa_timing_info *info = pa_stream_get_timing_info(pas.stream);
    if (info == NULL) {
        printf("pa_stream_get_timing_info failed, state is %d\n", pa_stream_get_state(pas.stream));
    }
    /*int diff = info->write_index - info->read_index + (int)(info->sink_usec * 0.128);
    pa_usec_t usec;
    pa_stream_get_time(pas.stream, &usec);
    int32_t t = info->timestamp.tv_sec * 1000000 + info->timestamp.tv_usec - (usec - info->transport_usec);
    static int t0;
    if (t0 == 0) t0 = t;*/
    
    /*int r = pa_mainloop_iterate(pas.mainloop, false, NULL);
    size_t ws = pa_stream_writable_size(pas.stream);
    printf("Writable: %d (%d) %d %d %d %d %llu %d\n", (int)ws, r, (int)(info->write_index - info->read_index), diff, (int)info->sink_usec, (int)info->transport_usec, (unsigned long long)usec, t - t0);*/
    //return (pas.attr.tlength - ws) / 4;
    return (info->write_index - info->read_index) / 4;
}

static int audio_pulse_get_desired_buffered(void) {
    return 1100;
}

static void audio_pulse_play(const uint8_t *buf, size_t len) {
    if (pas.stream == NULL) {
        if (!audio_pulse_init()) {
            return;
        }
    }
    //size_t ws = pa_stream_writable_size(pas.stream);
    size_t ws = pas.attr.maxlength - audio_pulse_buffered() * 4;
    if (ws < len) {
        //printf("Warning: can't write everything: %d vs %d\n", (int)len, (int)ws);
        len = ws;
    }
    if (pa_stream_write(pas.stream, buf, len, pas_write_complete, 0LL, PA_SEEK_RELATIVE) < 0) {
        printf("pa_stream_write failed\n");
        return;
    }
    while (!pas.write_complete) {
        pa_mainloop_iterate(pas.mainloop, true, NULL);
    }
    pas.write_complete = false;
}

struct AudioAPI audio_pulse = {
    audio_pulse_init,
    audio_pulse_buffered,
    audio_pulse_get_desired_buffered,
    audio_pulse_play
};

#endif
