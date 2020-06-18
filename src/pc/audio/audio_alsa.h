#ifndef AUDIO_ALSA_H
#define AUDIO_ALSA_H

#ifdef __linux__
extern struct AudioAPI audio_alsa;
#define HAVE_ALSA 1
#else
#define HAVE_ALSA 0
#endif

#endif
