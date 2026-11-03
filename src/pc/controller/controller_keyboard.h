#ifndef CONTROLLER_KEYBOARD_H
#define CONTROLLER_KEYBOARD_H

#include <stdbool.h>
#include "controller_api.h"

#ifdef __cplusplus
extern "C" {
#endif
bool keyboard_on_key_down(int scancode);
bool keyboard_on_key_up(int scancode);
void keyboard_on_all_keys_up(void);
#ifdef __cplusplus
}
#endif

extern struct ControllerAPI controller_keyboard;

#endif
