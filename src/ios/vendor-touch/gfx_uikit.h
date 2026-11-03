//
//  gfx_uikit.h
//  sm64ios
//
//  Created by Christian Kosman on 9/21/21.
//

#ifndef gfx_uikit_h
#define gfx_uikit_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "../../ios/native_ui_controller.h"
#if TARGET_OS_IOS
#import "../../ios/ios/ExternalGameViewController.h"
#import "../../ios/ios/TouchControlsViewController.h"
#elif TARGET_OS_TV
#import "../../ios/tvos/RemoteInputController.h"
#import "src/game/game_init.h"
#endif

@interface OverlayView : UIView
- (id)initWithFrame:(CGRect)frame;
- (void)drawRect:(CGRect)rect;
- (BOOL)prefersHomeIndicatorAutoHidden;
@end

#if TARGET_OS_IOS
TouchControlsViewController *tcvc;
#endif
UIViewController *gameViewController;

void gfx_uikit_init(UIViewController *viewControllerPointer);
void setup_external_screen();
void teardown_external_screen();
void gfx_uikit_set_touchscreen_callbacks(void (*down)(void* event), void (*motion)(void* event), void (*up)(void* event));

#if TARGET_OS_TV
void tvos_present_main_menu();
#endif

#endif /* gfx_uikit_h */
