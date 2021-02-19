#if defined(_WIN32) || defined(_WIN64)

#include <windows.h>
#include <xinput.h>

#include <ultra64.h>

#include "controller_api.h"

#define DEADZONE 4960

static void xinput_init(void) {
}

static void xinput_read(OSContPad *pad) {
    for (int i = 0; i < XUSER_MAX_COUNT; i++) {
        XINPUT_STATE state;
        memset(&state, 0, sizeof(XINPUT_STATE));
        if (XInputGetState(i, &state) == ERROR_SUCCESS) {
            XINPUT_GAMEPAD *gp = &state.Gamepad;
            if (gp->wButtons & XINPUT_GAMEPAD_START) pad->button |= START_BUTTON;
            if (gp->wButtons & XINPUT_GAMEPAD_LEFT_SHOULDER) pad->button |= Z_TRIG;
            if (gp->bLeftTrigger > XINPUT_GAMEPAD_TRIGGER_THRESHOLD) pad->button |= Z_TRIG;
            if (gp->wButtons & XINPUT_GAMEPAD_RIGHT_SHOULDER) pad->button |= R_TRIG;
            if (gp->bRightTrigger > XINPUT_GAMEPAD_TRIGGER_THRESHOLD) pad->button |= R_TRIG;
            if (gp->wButtons & XINPUT_GAMEPAD_A) pad->button |= A_BUTTON;
            if (gp->wButtons & XINPUT_GAMEPAD_X) pad->button |= B_BUTTON;
            if (gp->wButtons & XINPUT_GAMEPAD_DPAD_LEFT) pad->button |= L_TRIG;
            if (gp->sThumbRX < -0x4000) pad->button |= L_CBUTTONS;
            if (gp->sThumbRX > 0x4000) pad->button |= R_CBUTTONS;
            if (gp->sThumbRY < -0x4000) pad->button |= D_CBUTTONS;
            if (gp->sThumbRY > 0x4000) pad->button |= U_CBUTTONS;

            uint32_t magnitude_sq = (uint32_t)(gp->sThumbLX * gp->sThumbLX) + (uint32_t)(gp->sThumbLY * gp->sThumbLY);
            if (magnitude_sq > (uint32_t)(DEADZONE * DEADZONE)) {
                // Game expects stick coordinates within -80..80
                // 32768 / 409 = ~80
                pad->stick_x = gp->sThumbLX / 409;
                pad->stick_y = gp->sThumbLY / 409;
            }
            break;
        }
    }
}

struct ControllerAPI controller_xinput = {
    xinput_init,
    xinput_read
};

#endif
