/*
 * ios_touch_state.h — shared pad state between the UIKit overlay
 * (N64PadView, main thread) and the game core (same thread via the
 * display-link pump, so no locking is needed).
 */
#ifndef IOS_TOUCH_STATE_H
#define IOS_TOUCH_STATE_H

typedef struct {
    float stick_x;   // -1..1
    float stick_y;   // -1..1 (up positive)
    unsigned int buttons; // IosPadButton* bits below
} IosTouchState;

enum {
    IosPadButtonA      = 1 << 0,
    IosPadButtonB      = 1 << 1,
    IosPadButtonZ      = 1 << 2,
    IosPadButtonStart  = 1 << 3,
    IosPadButtonL      = 1 << 4,
    IosPadButtonR      = 1 << 5,
    IosPadButtonCUp    = 1 << 6,
    IosPadButtonCDown  = 1 << 7,
    IosPadButtonCLeft  = 1 << 8,
    IosPadButtonCRight = 1 << 9,
    IosPadButtonDUp    = 1 << 10,
    IosPadButtonDDown  = 1 << 11,
    IosPadButtonDLeft  = 1 << 12,
    IosPadButtonDRight = 1 << 13
};

#ifdef __cplusplus
extern "C" {
#endif

void ios_touch_set_state(float sx, float sy, unsigned int buttons);
void ios_touch_get_state(IosTouchState *out);

#ifdef __cplusplus
}
#endif

#endif
