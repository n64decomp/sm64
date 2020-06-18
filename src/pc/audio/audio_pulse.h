#ifndef AUDIO_PULSE_H
#define AUDIO_PULSE_H

#ifdef __linux__
extern struct AudioAPI audio_pulse;
#define HAVE_PULSE_AUDIO 1
#else
#define HAVE_PULSE_AUDIO 0
#endif

#endif
