//
// N64PadView.m — touch handling + pre-rendered overlay.
// Layout (landscape, 1024x768 iPad): left analog stick, right A/B cluster,
// C-buttons diamond, Start center, L/R shoulders top, Z under R.
//
// PERFORMANCE (iPad 1 / A4, measured): touch-move events arrive at the
// display rate (up to 60/s). An earlier revision redrew the whole pad with
// CoreGraphics from every touchesMoved — 12 ellipse fills + 10 font-measured
// text draws per event on the main thread — which starved the game loop and
// made the game visibly lag exactly while the stick was moving. Now every
// element is rasterized ONCE at layout time into UIImageViews; touch events
// only move the knob subview and swap button images (CALayer property
// updates: no drawing, no text measurement, no per-event allocations beyond
// touch begin/end bookkeeping). Keep it that way — do NOT reintroduce
// drawRect work on the input path.
//

#import "N64PadView.h"
#import "ios_touch_state.h"
#import <math.h>
#import <string.h>

typedef struct {
    const char *label;
    unsigned int button;
    CGRect rect;
} PadButton;

#define MAX_BUTTONS 14

// Rasterize one ellipse (optionally labeled) into a 1x UIImage.
static UIImage *pad_element_image(CGFloat w, CGFloat h,
                                  CGFloat r, CGFloat g, CGFloat b,
                                  const char *label)
{
    if (w < 1) w = 1;
    if (h < 1) h = 1;
    UIGraphicsBeginImageContext(CGSizeMake(w, h));
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(c, r, g, b, 1.0);
    CGContextFillEllipseInRect(c, CGRectMake(0, 0, w, h));
    if (label != NULL && label[0] != '\0') {
        UIFont *font = [UIFont boldSystemFontOfSize:22];
        NSString *s = [NSString stringWithUTF8String:label];
        CGSize sz = [s sizeWithFont:font];
        CGContextSetRGBFillColor(c, 1, 1, 1, 1);
        [s drawAtPoint:CGPointMake((w - sz.width) / 2, (h - sz.height) / 2)
              withFont:font];
    }
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@implementation N64PadView {
    PadButton _buttons[MAX_BUTTONS];
    int _buttonCount;
    BOOL _demoMode;
    NSMutableArray *_buttonViews;    // UIImageView, parallel to _buttons[]
    NSMutableArray *_buttonNormal;   // UIImage, normal state
    NSMutableArray *_buttonPressed;  // UIImage, pressed state
    UIImageView *_stickBaseView;
    UIImageView *_knobView;
    CGSize _layoutSize;
    BOOL _layoutBuilt;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.opaque = NO;
        self.multipleTouchEnabled = YES;
        _stickTouchId = -1;
        _buttonTouches = [[NSMutableDictionary alloc] init];
        _buttonViews = [[NSMutableArray alloc] init];
        _buttonNormal = [[NSMutableArray alloc] init];
        _buttonPressed = [[NSMutableArray alloc] init];
        _demoMode = YES;
        self.alpha = 0.9;
        memset(&_state, 0, sizeof(_state));
        [self layoutPad:frame.size];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self layoutPad:self.bounds.size];
}

- (void)layoutPad:(CGSize)size {
    if (_layoutBuilt && CGSizeEqualToSize(size, _layoutSize)) {
        return;
    }
    _layoutBuilt = YES;
    _layoutSize = size;

    // Drop previous art (only happens again if the view is resized).
    for (UIImageView *v in _buttonViews) {
        [v removeFromSuperview];
    }
    [_buttonViews removeAllObjects];
    [_buttonNormal removeAllObjects];
    [_buttonPressed removeAllObjects];
    [_stickBaseView removeFromSuperview];
    [_knobView removeFromSuperview];

    CGFloat w = size.width, h = size.height;
    _stickCenter = CGPointMake(w * 0.16, h * 0.60);
    _stickRadius = 64.0;

    // Static stick base; the knob rides on top and is only ever *moved*.
    {
        CGFloat d = _stickRadius * 2;
        _stickBaseView = [[UIImageView alloc] initWithImage:
            pad_element_image(d, d, 0.2, 0.2, 0.2, "")];
        _stickBaseView.frame = CGRectMake(_stickCenter.x - _stickRadius,
            _stickCenter.y - _stickRadius, d, d);
        [self addSubview:_stickBaseView];

        _knobView = [[UIImageView alloc] initWithImage:
            pad_element_image(52, 52, 0.7, 0.7, 0.7, "")];
        [self addSubview:_knobView];
    }

    _buttonCount = 0;
    [self addButton:"A" button:IosPadButtonA
               rect:CGRectMake(w * 0.86, h * 0.52, 64, 64)];
    [self addButton:"B" button:IosPadButtonB
               rect:CGRectMake(w * 0.78, h * 0.64, 64, 64)];
    [self addButton:"S" button:IosPadButtonStart
               rect:CGRectMake(w * 0.47, h * 0.60, 56, 40)];
    [self addButton:"L" button:IosPadButtonL
               rect:CGRectMake(w * 0.04, h * 0.10, 96, 44)];
    [self addButton:"R" button:IosPadButtonR
               rect:CGRectMake(w * 0.86, h * 0.10, 96, 44)];
    [self addButton:"Z" button:IosPadButtonZ
               rect:CGRectMake(w * 0.86, h * 0.22, 96, 44)];
    CGFloat cx = w * 0.68, cy = h * 0.60;
    [self addButton:"^" button:IosPadButtonCUp    rect:CGRectMake(cx - 22, cy - 68, 44, 44)];
    [self addButton:"v" button:IosPadButtonCDown  rect:CGRectMake(cx - 22, cy + 24, 44, 44)];
    [self addButton:"<" button:IosPadButtonCLeft rect:CGRectMake(cx - 68, cy - 22, 44, 44)];
    [self addButton:">" button:IosPadButtonCRight rect:CGRectMake(cx + 24, cy - 22, 44, 44)];

    [self positionKnob];
}

- (void)addButton:(const char *)label button:(unsigned int)b rect:(CGRect)rect {
    if (_buttonCount >= MAX_BUTTONS) return;
    _buttons[_buttonCount].label = label;
    _buttons[_buttonCount].button = b;
    _buttons[_buttonCount].rect = rect;

    // Bake both states up front so presses are just an image swap.
    UIImage *normal = pad_element_image(rect.size.width, rect.size.height,
        0.25, 0.25, 0.25, label);
    UIImage *pressed = pad_element_image(rect.size.width, rect.size.height,
        0.9, 0.8, 0.2, label);
    UIImageView *v = [[UIImageView alloc] initWithImage:normal];
    v.frame = rect;
    [self addSubview:v];

    [_buttonViews addObject:v];
    [_buttonNormal addObject:normal];
    [_buttonPressed addObject:pressed];
    _buttonCount++;
}

- (void)setDemoMode:(BOOL)demo {
    _demoMode = demo;
    // Whole-view alpha instead of re-rendering: a layer property change.
    self.alpha = demo ? 0.9 : 0.45;
}

- (IosPadState)padState {
    return _state;
}

- (void)publish {
    ios_touch_set_state(_state.stickX, _state.stickY, _state.buttons);
}

- (int)buttonAtPoint:(CGPoint)p {
    int i;
    for (i = 0; i < _buttonCount; i++) {
        if (CGRectContainsPoint(_buttons[i].rect, p)) return i;
    }
    return -1;
}

- (void)setButtonVisual:(int)bi pressed:(BOOL)pressed {
    if (bi < 0 || bi >= _buttonCount) return;
    UIImageView *v = [_buttonViews objectAtIndex:(NSUInteger)bi];
    v.image = pressed ? [_buttonPressed objectAtIndex:(NSUInteger)bi]
                      : [_buttonNormal objectAtIndex:(NSUInteger)bi];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *t in touches) {
        CGPoint p = [t locationInView:self];
        CGFloat dx = p.x - _stickCenter.x, dy = p.y - _stickCenter.y;
        if (_stickTouchId == -1 && (dx * dx + dy * dy) <= (_stickRadius + 30) * (_stickRadius + 30)) {
            _stickTouchId = (int)(intptr_t)t;
            [self updateStick:p];
            continue;
        }
        int bi = [self buttonAtPoint:p];
        if (bi >= 0) {
            _state.buttons |= _buttons[bi].button;
            [_buttonTouches setObject:[NSNumber numberWithInt:bi]
                               forKey:[NSNumber numberWithInt:(int)(intptr_t)t]];
            [self publish];
            [self setButtonVisual:bi pressed:YES];
        }
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *t in touches) {
        if ((int)(intptr_t)t == _stickTouchId) {
            [self updateStick:[t locationInView:self]];
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self releaseTouches:touches];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [self releaseTouches:touches];
}

- (void)releaseTouches:(NSSet *)touches {
    for (UITouch *t in touches) {
        if ((int)(intptr_t)t == _stickTouchId) {
            _stickTouchId = -1;
            _state.stickX = 0;
            _state.stickY = 0;
            [self positionKnob];
            continue;
        }
        NSNumber *key = [NSNumber numberWithInt:(int)(intptr_t)t];
        NSNumber *bi = [_buttonTouches objectForKey:key];
        if (bi != nil) {
            _state.buttons &= ~_buttons[[bi intValue]].button;
            [_buttonTouches removeObjectForKey:key];
            [self setButtonVisual:[bi intValue] pressed:NO];
        }
    }
    [self publish];
}

- (void)updateStick:(CGPoint)p {
    CGFloat dx = (p.x - _stickCenter.x) / _stickRadius;
    CGFloat dy = (_stickCenter.y - p.y) / _stickRadius;
    CGFloat len = sqrt(dx * dx + dy * dy);
    if (len > 1.0) { dx /= len; dy /= len; }
    _state.stickX = dx;
    _state.stickY = dy;
    [self publish];
    [self positionKnob];
}

- (void)positionKnob {
    // Moving a UIImageView = one CALayer position change. No drawing.
    _knobView.center = CGPointMake(
        _stickCenter.x + _state.stickX * _stickRadius * 0.6,
        _stickCenter.y - _state.stickY * _stickRadius * 0.6);
}

@end
