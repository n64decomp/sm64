#ifndef AUDIO_API_H
#define AUDIO_API_H

#include <stdbool.h>
#include <stdint.h>
#include <stddef.h>

struct AudioAPI {
    bool (*init)(void);
    int (*buffered)(void);
    int (*get_desired_buffered)(void);
    void (*play)(const uint8_t *buf, size_t len);
};

#endif
