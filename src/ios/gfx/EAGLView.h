//
// EAGLView.h — GLES render surface for the iPad 1 SGX535. The game renderer
// is fixed-function GLES 1.1, so the EAGL context is always ES1.
// CADisplayLink pump at 30 Hz.
//
#import <UIKit/UIKit.h>

@interface SM64EAGLView : UIView {
    id _context;
    unsigned int _framebuffer;
    unsigned int _renderbuffer;
    unsigned int _depthRenderbuffer;
    int _backingWidth;
    int _backingHeight;
    BOOL _useGLES1;
    BOOL _framebufferReady;
    int _loggedFbW;
    int _loggedFbH;
    CADisplayLink *_displayLink;
    unsigned long _frameCount;
    double _lastHeartbeatTime;
    BOOL _loggedFirstGameFrame;
    BOOL _gameMode;
    void (*_gameFrameFn)(void);
}
- (BOOL)createContext;
- (void)setupFramebuffer;
- (void)startPump;
- (void)stopPump;
- (void)renderFrame;
- (unsigned long)frameCount;
// Game mode: the display-link tick calls gameFrameFn (produce_one_frame)
// instead of clearing; the game stack presents via presentFramebuffer.
- (void)setGameMode:(BOOL)game frameFn:(void (*)(void))fn;
- (void)makeCurrent;
- (void)presentFramebuffer;
- (void)maybeDumpFramebuffer;
- (void)getBackingWidth:(int *)w height:(int *)h;
@end

// C bridge used by the GfxWindowManagerAPI implementation (gfx_ios_wm.m).
#ifdef __cplusplus
extern "C" {
#endif
void ios_bridge_register_view(SM64EAGLView *view);
void ios_bridge_present(void);
void ios_bridge_make_current(void);
void ios_bridge_get_dimensions(unsigned int *w, unsigned int *h);
void ios_bridge_set_frame_fn(void (*fn)(void));
#ifdef __cplusplus
}
#endif
