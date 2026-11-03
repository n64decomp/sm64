//
//  gfx_uikit.m
//  sm64ios
//
//  Created by Christian Kosman on 9/21/21.
//

#include <math.h>
#import <objc/runtime.h>
#import "gfx_uikit.h"

UIViewController *gameViewController;
UIWindow *mainWindow;
#if TARGET_OS_IOS
UIWindow *externalWindow;
#endif

@implementation OverlayView

- (id)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect);
}

@end

void gfx_uikit_init(UIViewController *viewControllerPointer) {
    gameViewController = viewControllerPointer;
    
    mainWindow = [[[UIApplication sharedApplication] delegate] window];
    
#if TARGET_OS_IOS
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    tcvc = [[storyboard instantiateViewControllerWithIdentifier:@"TouchControlsViewController"] retain];
    
    if([[UIScreen screens] count] > 1) {
        setup_external_screen();
    } else {
        [gameViewController.view addSubview:tcvc.view];
    }
    
    [gameViewController setNeedsUpdateOfScreenEdgesDeferringSystemGestures];
#elif TARGET_OS_TV
    RemoteInputController *remoteInput = [[RemoteInputController alloc] initWithTarget:gameViewController];
    [remoteInput.onMenuButtonPressed addObject:[NSValue valueWithPointer:tvos_present_main_menu]];
    [remoteInput.onPlayPauseButtonPressed addObject:[NSValue valueWithPointer:simulate_start_button_press]];
#endif
}

#if TARGET_OS_IOS
void setup_external_screen() {
    [tcvc.view removeFromSuperview];
    mainWindow.rootViewController = tcvc;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ExternalGameViewController *externalVc = [storyboard instantiateViewControllerWithIdentifier:@"ExternalScreen"];
    UIScreen *screen = [UIScreen screens][1];
    externalWindow = [[objc_getClass("SDL_uikitwindow") alloc] initWithFrame:screen.bounds];
    externalWindow.rootViewController = nil;
    externalWindow.rootViewController = externalVc;
    externalWindow.screen = screen;
    externalWindow.screen.overscanCompensation = UIScreenOverscanCompensationScale;
    externalWindow.hidden = NO;
    [externalVc.view addSubview:gameViewController.view];
    gameViewController.view.frame = externalVc.view.bounds;
    gameViewController.view.contentScaleFactor = 1.0;
}

void teardown_external_screen() {
    if(externalWindow != nil) {
        [tcvc.view removeFromSuperview];
        mainWindow.rootViewController = gameViewController;
        [gameViewController.view addSubview:tcvc.view];
        UIScreen *screen = [UIScreen screens][0];
        gameViewController.view.frame = screen.bounds;
        gameViewController.view.contentScaleFactor = screen.scale;
        externalWindow.hidden = YES;
        externalWindow = nil;
    }
}

void gfx_uikit_set_touchscreen_callbacks(void (*down)(void* event), void (*motion)(void* event), void (*up)(void* event)) {
    [tcvc set_touchscreen_callbacks:down motion:motion up:up];
}
#endif

#if TARGET_OS_TV
void tvos_present_main_menu() {
    present_viewcontroller(@"MenuNav", true);
}
#endif
