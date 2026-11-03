// Feel free to use it in your port too, but please keep authorship!
// Touch Controls made by: VDavid003
// https://github.com/VDavid003/sm64-port-android
// Modified for iOS
#include <stdlib.h>
#include <stdio.h>

#include <ultra64.h>
#include <PR/ultratypes.h>
#include <PR/gbi.h>

#include "controller_api.h"
#import "controller_touchscreen.h"

#if TARGET_OS_IOS
#include "config.h"
#include "sm64.h"
#include "game/game_init.h"
#include "game/memory.h"
#include "game/segment2.h"
#include "gfx_dimensions.h"
#include "pc/gfx/gfx_pc.h"
#include "pc/gfx/gfx_uikit.h"
#include "../configfile.h"

#import "src/ios/ios/HapticsController.h"
#import "src/ios/FrameController.h"

#define SCREEN_WIDTH_API 1280
#define SCREEN_HEIGHT_API 960
#define SCREEN_ASPECT_API ((0.0 + SCREEN_WIDTH_API)/SCREEN_HEIGHT_API)

#define LEFT_EDGE ((int)floorf(SCREEN_WIDTH_API / 2 - SCREEN_HEIGHT_API / 2 * gfx_current_dimensions.aspect_ratio))
#define RIGHT_EDGE ((int)ceilf(SCREEN_WIDTH_API / 2 + SCREEN_HEIGHT_API / 2 * gfx_current_dimensions.aspect_ratio))

#define CORRECT_TOUCH_X(x) ((x * (RIGHT_EDGE - LEFT_EDGE)) + LEFT_EDGE)
#define CORRECT_TOUCH_Y(y) (y * SCREEN_HEIGHT_API)

#define SCREEN_SCALE [[UIScreen mainScreen] scale]

#define N64_TO_IOS_X(x) ((double)(x - LEFT_EDGE) / (double)(RIGHT_EDGE - LEFT_EDGE) * gfx_current_dimensions.width / SCREEN_SCALE)
#define N64_TO_IOS_Y(y) (((0.0 + y) / SCREEN_HEIGHT_API) * gfx_current_dimensions.height / SCREEN_SCALE)

#define N64_DISTANCE_X(a, b) (N64_TO_IOS_X(a) - N64_TO_IOS_X(b))
#define N64_DISTANCE_Y(a, b) (N64_TO_IOS_Y(a) - N64_TO_IOS_Y(b))

enum ControlElementType {
    Joystick,
    Button
};

struct Position {
    s32 x,y;
};

struct ControlElement {
    char *name;
    enum ControlElementType type;
    int touchID;
    //Joystick
    int joyX, joyY;
    //Button
    int buttonID;
    bool menuButton;
    int slideTouch;
    OverlayImageView *imageView;
};

#include "controller_touchscreen_layouts.inc"

static struct ControlElement *ControlElements = ControlElementsDefault;
static int ControlElementsLength = sizeof(ControlElementsDefault)/sizeof(struct ControlElement);

int joystick_size = 128;

static HapticsController *haptics = nil;

#define TRIGGER_DETECT(size) (((pos.x + size > event->x) && (pos.x < event->x)) && ((pos.y + size > event->y) && (pos.y < event->y)))

#define BUTTON_IMAGE_LIGHT [UIImage imageNamed:@"touch_button"]
#define BUTTON_IMAGE_DARK [UIImage imageNamed:@"touch_button_dark"]

void touch_down(struct TouchEvent* event) {
    CGRect frame;
    for(int i = 0; i < ControlElementsLength; i++) {
        if (ControlElements[i].touchID == 0) {
            frame = ControlElements[i].imageView.frame;
            CGFloat scale = ((float)configTouchUiScale/100.0);
            CGPoint pos = [ControlElements[i].imageView convertPoint:frame.origin toView:tcvc.view];
            if (TRIGGER_DETECT(frame.size.width * scale)) {
                switch (ControlElements[i].type) {
                    case Joystick:
                        joystick_size = frame.size.width*scale;
                        ControlElements[i].touchID = event->touchID;
                        ControlElements[i].joyX = event->x - pos.x + joystick_size/2 - joystick_size;
                        ControlElements[i].joyY = event->y - pos.y + joystick_size/2 - joystick_size;
                        break;
                    case Button:
                        ControlElements[i].touchID = event->touchID;
                        ControlElements[i].imageView.image = BUTTON_IMAGE_DARK;
                        break;
                }
            }
        }
    }
    set_current_input(Touch);
}

void touch_motion(struct TouchEvent* event) {
    CGRect frame;
    for(int i = 0; i < ControlElementsLength; i++) {
        frame = ControlElements[i].imageView.frame;
        CGFloat scale = ((float)configTouchUiScale/100.0);
        CGPoint pos = [ControlElements[i].imageView convertPoint:frame.origin toView:tcvc.view];
        if (ControlElements[i].touchID == event->touchID) {
            switch (ControlElements[i].type) {
                case Joystick:
                    ; //workaround
                    s32 x,y;
                    x = event->x - pos.x + joystick_size/2 - joystick_size;
                    y = event->y - pos.y + joystick_size/2 - joystick_size;
                    if (event->x > pos.x + joystick_size)
                        x = joystick_size/2;
                    if (event->x < pos.x)
                        x = -joystick_size/2;
                    if (event->y > pos.y + joystick_size)
                        y = joystick_size/2;
                    if (event->y < pos.y)
                        y = -joystick_size/2;

                    ControlElements[i].joyX = x;
                    ControlElements[i].joyY = y;
                    break;
                case Button:
                    if (ControlElements[i].slideTouch && !TRIGGER_DETECT(frame.size.width * scale)) {
                        ControlElements[i].slideTouch = 0;
                        ControlElements[i].touchID = 0;
                        ControlElements[i].imageView.image = BUTTON_IMAGE_LIGHT;
                    }
                    break;
            }
        } else {
            switch (ControlElements[i].type) {
                case Joystick:
                    break;
                case Button:
                    if (TRIGGER_DETECT(frame.size.width * scale)) {
                        ControlElements[i].slideTouch = 1;
                        ControlElements[i].touchID = event->touchID;
                        ControlElements[i].imageView.image = BUTTON_IMAGE_DARK;
                    }
                    break;
            }
        }
    }
}

static void handle_touch_up(int i) {//seperated for when the layout changes
    ControlElements[i].touchID = 0;
    switch (ControlElements[i].type) {
        case Joystick:
            ControlElements[i].joyX = 0;
            ControlElements[i].joyY = 0;
            break;
        case Button:
            ControlElements[i].imageView.image = BUTTON_IMAGE_LIGHT;
            break;
    }
}

void touch_up(struct TouchEvent* event) {
    for(int i = 0; i < ControlElementsLength; i++) {
        if (ControlElements[i].touchID == event->touchID)
            handle_touch_up(i);
    }
}

void update_touch_controls(void) {
    struct Position pos;
    for (int i = 0; i < ControlElementsLength; i++) {
        switch (ControlElements[i].type) {
            case Joystick:
                ;
                CGRect bounds = ControlElements[i].imageView.subimage.bounds;
                CGFloat scale = ((float)configTouchUiScale/100.0);
                bounds.origin.x = (ControlElements[i].joyX + joystick_size/4)/scale;
                bounds.origin.y = (ControlElements[i].joyY + joystick_size/4)/scale;
                ControlElements[i].imageView.subimage.frame = bounds;
                break;
            case Button:
                ;
                break;
        }
    }
}

void render_touch_controls(void) {
    [tcvc setTouchControlsHidden:NO];
    if((get_current_input() != Touch || configTouchMode == 1) && configTouchMode != 0) {
        [tcvc setTouchControlsHidden:YES];
        return;
    }
    
    //update_touch_controls();
}

static void touchscreen_init(void) {
    if(hapticsSupported) {
        haptics = [[HapticsController alloc] init];
    }
    [frameController.onScreenRefresh addObject:[NSValue valueWithPointer:update_touch_controls]];
    
    joystick_size = 128 * ((float)configTouchUiScale/100.0);
}

void touchscreen_set_imageviews(NSMutableArray *imageViews) {
    for(int i = 0; i < imageViews.count; i++) {
        for(int j = 0; j < ControlElementsLength; j++) {
            if(((OverlayImageView *)imageViews[i]).buttonTag == ControlElements[j].buttonID) {
                ControlElements[j].imageView = imageViews[i];
            }
        }
    }
}

static void touchscreen_read(OSContPad *pad) {
    for(int i = 0; i < ControlElementsLength; i++) {
        switch (ControlElements[i].type) {
            case Joystick:
                if (ControlElements[i].joyX || ControlElements[i].joyY) {
                    pad->stick_x = (ControlElements[i].joyX + joystick_size/2) * 255 / joystick_size + 128;
                    pad->stick_y = (-ControlElements[i].joyY + joystick_size/2) * 255 / joystick_size + 128; //inverted for some reason
                }
                break;
            case Button:
                if (ControlElements[i].touchID) {
                    if(ControlElements[i].menuButton) {
                        (*menu_button_pressed)();
                    } else {
                        pad->button |= ControlElements[i].buttonID;
                    }
                }
                break;
        }
    }
}

static u32 touchscreen_rawkey(void) { //dunno what this does but I'll skip it for now
    return VK_INVALID;
}

static void touchscreen_rumble_play(float strength, float time) {
    if(configHaptics && hapticsSupported) {
        [haptics rumble:strength duration:(time * 1000.0)];
    }
}

static void touchscreen_rumble_stop() {
    if(configHaptics && hapticsSupported) {
        [haptics rumble:0.0 duration:0.0];
    }
}

static void touchscreen_shutdown(void) {
    if(hapticsSupported) {
        [haptics cleanup];
        [haptics release];
    }
}

struct ControllerAPI controller_touchscreen = {
    0,
    touchscreen_init,
    touchscreen_read,
    touchscreen_rawkey,
    touchscreen_rumble_play,
    touchscreen_rumble_stop,
    NULL,
    touchscreen_shutdown
};
#endif
