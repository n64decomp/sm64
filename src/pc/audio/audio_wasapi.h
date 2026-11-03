#ifndef AUDIO_WASAPI_H
#define AUDIO_WASAPI_H

#if defined(_WIN32) || defined(_WIN64)
#include "audio_api.h"
extern struct AudioAPI audio_wasapi;
#define HAVE_WASAPI 1
#else
#define HAVE_WASAPI 0
#endif

#endif
