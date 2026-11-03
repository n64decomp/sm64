//
// N64PadView.h — on-screen N64 controller overlay (emulator layout).
// Pre-rasterized elements (one UIImageView per control) so touch handling
// never draws: events only move the knob / swap button images. Feeds struct
// IosPadState used both pre-ROM (demo overlay) and in-game (game core).
//
#import <UIKit/UIKit.h>
#import "ios_touch_state.h"

typedef struct {
    float stickX;   // -1..1
    float stickY;   // -1..1 (up positive)
    unsigned int buttons;
} IosPadState;

@interface N64PadView : UIView {
    IosPadState _state;
    CGPoint _stickCenter;
    CGFloat _stickRadius;
    int _stickTouchId;
    NSMutableDictionary *_buttonTouches;
}
- (IosPadState)padState;
- (void)publish;
// Show a dimmed full-pad demo (pre-ROM) vs gameplay overlay.
- (void)setDemoMode:(BOOL)demo;
@end