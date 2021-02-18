#include "nds_include.h"

#include "lib/src/osContInternal.h"

s32 osContInit(UNUSED OSMesgQueue *mq, u8 *controllerBits, UNUSED OSContStatus *status) {
    *controllerBits = 1;
    return 0;
}

s32 osContStartReadData(UNUSED OSMesgQueue *mesg) {
    return 0;
}

void osContGetReadData(OSContPad *pad) {
    pad->button = 0;
    pad->stick_x = 0;
    pad->stick_y = 0;

    scanKeys();
    const u32 keys = keysHeld();

    if (keys & KEY_A) {
        pad->button |= A_BUTTON;
    }
    if (keys & KEY_B) {
        pad->button |= B_BUTTON;
    }
    if (keys & KEY_X) {
        pad->button |= U_CBUTTONS;
    }
    if (keys & KEY_Y) {
        pad->button |= D_CBUTTONS;
    }
    if (keys & KEY_START) {
        pad->button |= START_BUTTON;
    }
    if (keys & KEY_L) {
        pad->button |= R_TRIG;
    }
    if (keys & KEY_R) {
        pad->button |= Z_TRIG;
    }

    if (keys & KEY_UP) {
        pad->stick_y = 80;
    }
    if (keys & KEY_DOWN) {
        pad->stick_y = -80;
    }
    if (keys & KEY_LEFT) {
        pad->stick_x = -80;
    }
    if (keys & KEY_RIGHT) {
        pad->stick_x = 80;
    }

    if (keys & KEY_TOUCH) {
        touchPosition pos;
        touchRead(&pos);
        pad->button |= (pos.px < 128) ? L_CBUTTONS : R_CBUTTONS;
    }
}
