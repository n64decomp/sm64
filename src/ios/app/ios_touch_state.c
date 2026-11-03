/* Shared touch state storage (game + UI same thread; plain static). */
#include "ios_touch_state.h"
#include <stddef.h>

static IosTouchState s_state = { 0.0f, 0.0f, 0 };

void ios_touch_set_state(float sx, float sy, unsigned int buttons) {
    s_state.stick_x = sx;
    s_state.stick_y = sy;
    s_state.buttons = buttons;
}

void ios_touch_get_state(IosTouchState *out) {
    if (out == NULL) {
        return;
    }
    *out = s_state;
}
