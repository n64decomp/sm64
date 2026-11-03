/*
 * controller_touch_ios.c — ControllerAPI fed by the on-screen N64 pad.
 * N64PadView publishes IosTouchState (IosPadButton* bits); this maps them
 * onto the real N64 OSContPad bits + analog stick, same OR-accumulate
 * contract as the donor keyboard/SDL controllers.
 */
#include <ultra64.h>

#include "controller_api.h"
#include "ios_touch_state.h"

static void touch_ios_init(void) {
}

static void touch_ios_read(OSContPad *pad) {
    IosTouchState st;
    ios_touch_get_state(&st);

    if (st.buttons & IosPadButtonA)      pad->button |= A_BUTTON;
    if (st.buttons & IosPadButtonB)      pad->button |= B_BUTTON;
    if (st.buttons & IosPadButtonZ)      pad->button |= Z_TRIG;
    if (st.buttons & IosPadButtonStart)  pad->button |= START_BUTTON;
    if (st.buttons & IosPadButtonL)      pad->button |= L_TRIG;
    if (st.buttons & IosPadButtonR)      pad->button |= R_TRIG;
    if (st.buttons & IosPadButtonCUp)    pad->button |= U_CBUTTONS;
    if (st.buttons & IosPadButtonCDown)  pad->button |= D_CBUTTONS;
    if (st.buttons & IosPadButtonCLeft)  pad->button |= L_CBUTTONS;
    if (st.buttons & IosPadButtonCRight) pad->button |= R_CBUTTONS;
    if (st.buttons & IosPadButtonDUp)    pad->stick_y = 80;
    if (st.buttons & IosPadButtonDDown)  pad->stick_y = -80;
    if (st.buttons & IosPadButtonDLeft)  pad->stick_x = -80;
    if (st.buttons & IosPadButtonDRight) pad->stick_x = 80;

    // Analog stick overrides D-pad (float -1..1 scaled to N64 range).
    if (st.stick_x != 0.0f || st.stick_y != 0.0f) {
        int sx = (int)(st.stick_x * 80.0f);
        int sy = (int)(st.stick_y * 80.0f);
        if (sx > 127) sx = 127;
        if (sx < -128) sx = -128;
        if (sy > 127) sy = 127;
        if (sy < -128) sy = -128;
        pad->stick_x = (s8)sx;
        pad->stick_y = (s8)sy;
    }
}

struct ControllerAPI controller_touch_ios = {
    touch_ios_init,
    touch_ios_read
};
