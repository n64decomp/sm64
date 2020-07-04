#if defined(_WIN32) || defined(_WIN64)

#include <stdint.h>
#include <string.h>

#include <windows.h>
#include <wrl/client.h>
#include <objbase.h>
#include <mmdeviceapi.h>
#include <audioclient.h>

#include "audio_api.h"

// These constants are currently missing from the MinGW headers.
#ifndef AUDCLNT_STREAMFLAGS_AUTOCONVERTPCM
# define AUDCLNT_STREAMFLAGS_AUTOCONVERTPCM  0x80000000
#endif
#ifndef AUDCLNT_STREAMFLAGS_SRC_DEFAULT_QUALITY
# define AUDCLNT_STREAMFLAGS_SRC_DEFAULT_QUALITY  0x08000000
#endif

using namespace Microsoft::WRL;

const CLSID CLSID_MMDeviceEnumerator = __uuidof(MMDeviceEnumerator);
const IID IID_IMMDeviceEnumerator = __uuidof(IMMDeviceEnumerator);
const IID IID_IAudioClient = __uuidof(IAudioClient);
const IID IID_IAudioRenderClient = __uuidof(IAudioRenderClient);

static ComPtr<IMMDeviceEnumerator> immdev_enumerator;

static struct WasapiState {
    ComPtr<IMMDevice> device;
    ComPtr<IAudioClient> client;
    ComPtr<IAudioRenderClient> rclient;
    UINT32 buffer_frame_count;
    bool initialized;
    bool started;
} wasapi;

static class NotificationClient : public IMMNotificationClient {
    LONG refcount;
public:
    NotificationClient() : refcount(1) {
    }

    virtual HRESULT STDMETHODCALLTYPE OnDeviceStateChanged(LPCWSTR pwstrDeviceId, DWORD dwNewState) {
        return S_OK;
    }

    virtual HRESULT STDMETHODCALLTYPE OnDeviceAdded(LPCWSTR pwstrDeviceId) {
        return S_OK;
    }

    virtual HRESULT STDMETHODCALLTYPE OnDeviceRemoved(LPCWSTR pwstrDeviceId) {
        return S_OK;
    }

    virtual HRESULT STDMETHODCALLTYPE OnDefaultDeviceChanged(EDataFlow flow, ERole role, LPCWSTR pwstrDefaultDeviceId) {
        if (flow == eRender && role == eConsole) {
            // This callback runs on a separate thread,
            // but it's not important how fast this write takes effect.
            wasapi.initialized = false;
        }
        return S_OK;
    }

    virtual HRESULT STDMETHODCALLTYPE OnPropertyValueChanged(LPCWSTR pwstrDeviceId, const PROPERTYKEY key) {
        return S_OK;
    }

    virtual ULONG STDMETHODCALLTYPE AddRef() {
        return InterlockedIncrement(&refcount);
    }

    virtual ULONG STDMETHODCALLTYPE Release() {
        ULONG rc = InterlockedDecrement(&refcount);
        if (rc == 0) {
            delete this;
        }
        return rc;
    }

    virtual HRESULT STDMETHODCALLTYPE QueryInterface(REFIID riid, VOID **ppvInterface) {
        if (riid == __uuidof(IUnknown)) {
            AddRef();
            *ppvInterface = (IUnknown *)this;
        } else if (riid == __uuidof(IMMNotificationClient)) {
            AddRef();
            *ppvInterface = (IMMNotificationClient *)this;
        } else {
            *ppvInterface = nullptr;
            return E_NOINTERFACE;
        }
        return S_OK;
    }
} notification_client;

static void ThrowIfFailed(HRESULT res) {
    if (FAILED(res)) {
        throw res;
    }
}

bool audio_wasapi_init(void) {
    try {
        ThrowIfFailed(CoCreateInstance(CLSID_MMDeviceEnumerator, nullptr, CLSCTX_ALL, IID_PPV_ARGS(&immdev_enumerator)));
    } catch (HRESULT res) {
        return false;
    }

    ThrowIfFailed(immdev_enumerator->RegisterEndpointNotificationCallback(new NotificationClient()));

    return true;
}

static bool audio_wasapi_setup_stream(void) {
    wasapi = WasapiState();

    try {
        ThrowIfFailed(immdev_enumerator->GetDefaultAudioEndpoint(eRender, eConsole, &wasapi.device));
        ThrowIfFailed(wasapi.device->Activate(IID_IAudioClient, CLSCTX_ALL, nullptr, IID_PPV_ARGS_Helper(&wasapi.client)));

        WAVEFORMATEX desired;
        desired.wFormatTag = WAVE_FORMAT_PCM;
        desired.nChannels = 2;
        desired.nSamplesPerSec = 32000;
        desired.nAvgBytesPerSec = 32000 * 2 * 2;
        desired.nBlockAlign = 4;
        desired.wBitsPerSample = 16;
        desired.cbSize = 0;

        ThrowIfFailed(wasapi.client->Initialize(AUDCLNT_SHAREMODE_SHARED, AUDCLNT_STREAMFLAGS_AUTOCONVERTPCM | AUDCLNT_STREAMFLAGS_SRC_DEFAULT_QUALITY, 2000000, 0, &desired, nullptr));

        ThrowIfFailed(wasapi.client->GetBufferSize(&wasapi.buffer_frame_count));
        ThrowIfFailed(wasapi.client->GetService(IID_PPV_ARGS(&wasapi.rclient)));

        wasapi.started = false;
        wasapi.initialized = true;
    } catch (HRESULT res) {
        wasapi = WasapiState();
        return false;
    }

    return true;
}

static int audio_wasapi_buffered(void) {
    if (!wasapi.initialized) {
        if (!audio_wasapi_setup_stream()) {
            return 0;
        }
    }
    try {
        UINT32 padding;
        ThrowIfFailed(wasapi.client->GetCurrentPadding(&padding));
        return padding;
    } catch (HRESULT res) {
        wasapi = WasapiState();
        return 0;
    }
}

static int audio_wasapi_get_desired_buffered(void) {
    return 1100;
}

//#include <stdio.h>
static void audio_wasapi_play(const uint8_t *buf, size_t len) {
    if (!wasapi.initialized) {
        if (!audio_wasapi_setup_stream()) {
            return;
        }
    }
    try {
        UINT32 frames = len / 4;

        UINT32 padding;
        ThrowIfFailed(wasapi.client->GetCurrentPadding(&padding));
        //printf("%u %u\n", frames, padding);

        UINT32 available = wasapi.buffer_frame_count - padding;
        if (available < frames) {
            frames = available;
        }
        if (available == 0) {
            return;
        }

        BYTE *data;
        ThrowIfFailed(wasapi.rclient->GetBuffer(frames, &data));
        memcpy(data, buf, frames * 4);
        ThrowIfFailed(wasapi.rclient->ReleaseBuffer(frames, 0));

        if (!wasapi.started && padding + frames > 1500) {
            wasapi.started = true;
            ThrowIfFailed(wasapi.client->Start());
        }
    } catch (HRESULT res) {
        wasapi = WasapiState();
    }
}

struct AudioAPI audio_wasapi = {
    audio_wasapi_init,
    audio_wasapi_buffered,
    audio_wasapi_get_desired_buffered,
    audio_wasapi_play
};

#endif
