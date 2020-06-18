#ifndef CONTROLLER_API
#define CONTROLLER_API

#include <ultra64.h>

struct ControllerAPI {
    void (*init)(void);
    void (*read)(OSContPad *pad);
};

#endif
