//
// EAGLView.m — CAEAGLLayer + EAGLContext. The game renderer is
// fixed-function GLES 1.1 (SGX535); ES2 contexts reject those calls, so the
// context is always ES1. Framebuffer/renderbuffer setup has to wait until
// the layer is on screen (the drawable doesn't exist before that), so it is
// attempted from createContext and retried from layoutSubviews.
// Pre-ROM renders a clear color; in game mode the display-link tick calls
// into produce_one_frame (Fast3D executor → gfx_ios_gles1.c).
//
#import "EAGLView.h"
#import <QuartzCore/QuartzCore.h>
#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
#import <stdlib.h>
#import <stdio.h>

@implementation SM64EAGLView

+ (Class)layerClass {
    return [CAEAGLLayer class];
}

- (BOOL)createContext {
    // The game renderer (gfx_ios_gles1.c) is fixed-function GLES 1.1, the
    // only rendering path this port has. The SGX535 also supports ES2, but
    // an ES2 context rejects every fixed-function call, so always use ES1
    // (the pre-ROM demo render path below works on the same context type).
    EAGLContext *ctx = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES1];
    _useGLES1 = YES;
    if (ctx == nil) {
        [self writeHeartbeatLine:@"eagl: ES1 context creation FAILED\n"];
        return NO;
    }
    _context = ctx;

    CAEAGLLayer *layer = (CAEAGLLayer *)self.layer;
    layer.opaque = YES;
    layer.drawableProperties = [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithBool:NO], kEAGLDrawablePropertyRetainedBacking,
        kEAGLColorFormatRGB565, kEAGLDrawablePropertyColorFormat, nil];

    // May fail here if the view is not on screen yet; layoutSubviews retries.
    [self setupFramebuffer];
    return YES;
}

- (void)setupFramebuffer {
    if (_context == nil) return;
    [EAGLContext setCurrentContext:_context];
    if (_framebuffer == 0) glGenFramebuffersOES(1, &_framebuffer);
    if (_renderbuffer == 0) glGenRenderbuffersOES(1, &_renderbuffer);
    if (_depthRenderbuffer == 0) glGenRenderbuffersOES(1, &_depthRenderbuffer);
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _framebuffer);
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, _renderbuffer);
    [_context renderbufferStorage:GL_RENDERBUFFER_OES fromDrawable:(CAEAGLLayer *)self.layer];
    glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES,
        GL_RENDERBUFFER_WIDTH_OES, &_backingWidth);
    glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES,
        GL_RENDERBUFFER_HEIGHT_OES, &_backingHeight);
    // The game renderer depth-tests everything and clears the depth buffer
    // each frame (gfx_opengl_start_frame), and its fog / two-texture
    // second passes draw the same triangles again counting on the depth
    // test to confine them. EAGL has no default depth buffer, so one must
    // be allocated and attached explicitly here, or nothing composites
    // correctly (no depth buffering, multi-pass overdraw).
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, _depthRenderbuffer);
    glRenderbufferStorageOES(GL_RENDERBUFFER_OES, GL_DEPTH_COMPONENT16_OES,
        _backingWidth, _backingHeight);
    // The color attachment must be explicitly connected; without this the
    // framebuffer can never be GL_FRAMEBUFFER_COMPLETE_OES.
    glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES,
        GL_RENDERBUFFER_OES, _renderbuffer);
    glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_DEPTH_ATTACHMENT_OES,
        GL_RENDERBUFFER_OES, _depthRenderbuffer);
    GLenum status = glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES);
    if (status != GL_FRAMEBUFFER_COMPLETE_OES) {
        if (_framebufferReady) {
            [self writeHeartbeatLine:[NSString stringWithFormat:
                @"eagl: framebuffer lost 0x%x (%dx%d)\n",
                (unsigned)status, _backingWidth, _backingHeight]];
        }
        _framebufferReady = NO;
        return;
    }
    _framebufferReady = YES;
    glViewport(0, 0, _backingWidth, _backingHeight);
    if (!_loggedFbW || _loggedFbW != _backingWidth || _loggedFbH != _backingHeight) {
        _loggedFbW = _backingWidth;
        _loggedFbH = _backingHeight;
        [self writeHeartbeatLine:[NSString stringWithFormat:
            @"eagl: framebuffer ready %dx%d color+depth\n",
            _backingWidth, _backingHeight]];
    }
}

- (void)startPump {
    [self stopPump];
    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(renderFrame)];
    _displayLink.frameInterval = 2; // 60/2 = 30 Hz on iPad 1
    [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)stopPump {
    [_displayLink invalidate];
    _displayLink = nil;
}

- (void)writeHeartbeatLine:(NSString *)line {
    // Append a line to Documents/sm64ios-heartbeat.log (readable via SSH).
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    if ([paths count] == 0) return;
    NSString *log = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"sm64ios-heartbeat.log"];
    NSFileHandle *fh = [NSFileHandle fileHandleForWritingAtPath:log];
    if (fh == nil) {
        [line writeToFile:log atomically:YES encoding:NSUTF8StringEncoding error:nil];
    } else {
        [fh seekToEndOfFile];
        [fh writeData:[line dataUsingEncoding:NSUTF8StringEncoding]];
        [fh closeFile];
    }
}

- (void)renderFrame {
    if (_context == nil) return;
    if (!_framebufferReady) return; // layoutSubviews sets it up once on screen
    if (_gameMode && _gameFrameFn != NULL) {
        if (!_loggedFirstGameFrame) {
            _loggedFirstGameFrame = YES;
            _lastHeartbeatTime = CACurrentMediaTime();
            [self writeHeartbeatLine:@"game mode: entering game frame 1\n"];
        }
        _gameFrameFn();
        _frameCount++;
        // Heartbeat for headless verification: every 300 game frames (~10s
        // at 30Hz) record liveness + measured fps where SSH can see it.
        if ((_frameCount % 300) == 0) {
            NSTimeInterval now = CACurrentMediaTime();
            if (_lastHeartbeatTime > 0.0 && now > _lastHeartbeatTime) {
                double fps = 300.0 / (now - _lastHeartbeatTime);
                [self writeHeartbeatLine:[NSString stringWithFormat:
                    @"game alive frames=%lu fps=%.1f\n", _frameCount, fps]];
            } else {
                [self writeHeartbeatLine:[NSString stringWithFormat:
                    @"game alive frames=%lu\n", _frameCount]];
            }
            _lastHeartbeatTime = now;
        }
        return;
    }
    [EAGLContext setCurrentContext:_context];
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _framebuffer);
    glViewport(0, 0, _backingWidth, _backingHeight);
    glClearColor(0.05f, 0.05f, 0.12f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT);
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, _renderbuffer);
    [_context presentRenderbuffer:GL_RENDERBUFFER_OES];
    _frameCount++;
    // Heartbeat for headless verification: every 300 frames (~10s at 30Hz)
    // record liveness where SSH can see it (app sandbox is readable as root).
    if ((_frameCount % 300) == 0) {
        [self writeHeartbeatLine:[NSString stringWithFormat:@"alive frames=%lu gles1=%d\n",
            _frameCount, _useGLES1 ? 1 : 0]];
    }
}

- (unsigned long)frameCount {
    return _frameCount;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // The CAEAGLLayer only has a drawable once the view is on screen, so
    // (re)create the framebuffer/renderbuffer here (idempotent; also handles
    // resize by re-allocating storage and re-attaching the color buffer).
    [self setupFramebuffer];
}

- (void)setGameMode:(BOOL)game frameFn:(void (*)(void))fn {
    _gameMode = game;
    _gameFrameFn = fn;
}

- (void)makeCurrent {
    if (_context != nil) {
        [EAGLContext setCurrentContext:_context];
        glBindFramebufferOES(GL_FRAMEBUFFER_OES, _framebuffer);
    }
}

- (void)presentFramebuffer {
    if (_context == nil) return;
    [EAGLContext setCurrentContext:_context];
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _framebuffer);
    // Debug: optionally dump the raw framebuffer (see maybeDumpFramebuffer).
    if ((_frameCount % 120) == 0) {
        [self maybeDumpFramebuffer];
    }
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, _renderbuffer);
    [_context presentRenderbuffer:GL_RENDERBUFFER_OES];
}

// Debug aid (flag-file gated): when Documents/ios_framedump.flag exists, write
// the current framebuffer as raw top-down RGBA to Documents/framedump.raw so a
// dev machine can fetch it over SFTP and convert it to PNG. Creating the flag
// costs nothing on normal runs.
- (void)maybeDumpFramebuffer {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    if ([paths count] == 0) return;
    NSString *dir = [paths objectAtIndex:0];
    NSString *flag = [dir stringByAppendingPathComponent:@"ios_framedump.flag"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:flag]) return;
    int w = _backingWidth, h = _backingHeight;
    if (w <= 0 || h <= 0) return;
    unsigned char *px = (unsigned char *)malloc((size_t)w * (size_t)h * 4);
    if (px == NULL) return;
    glReadPixels(0, 0, w, h, GL_RGBA, GL_UNSIGNED_BYTE, px);
    NSString *out = [dir stringByAppendingPathComponent:@"framedump.raw"];
    FILE *f = fopen([out fileSystemRepresentation], "wb");
    if (f != NULL) {
        int y;
        for (y = h - 1; y >= 0; y--) { // GL rows are bottom-up; write top-down
            fwrite(px + (size_t)y * (size_t)w * 4, 1, (size_t)w * 4, f);
        }
        fclose(f);
        [self writeHeartbeatLine:[NSString stringWithFormat:
            @"framedump %dx%d frame=%lu\n", w, h, _frameCount]];
    }
    free(px);
}

- (void)getBackingWidth:(int *)w height:(int *)h {
    if (w) *w = _backingWidth;
    if (h) *h = _backingHeight;
}

static SM64EAGLView *sRegisteredView = nil;

void ios_bridge_register_view(SM64EAGLView *view) {
    sRegisteredView = view;
}

void ios_bridge_present(void) {
    [sRegisteredView presentFramebuffer];
}

void ios_bridge_make_current(void) {
    [sRegisteredView makeCurrent];
}

void ios_bridge_get_dimensions(unsigned int *w, unsigned int *h) {
    int bw = 0, bh = 0;
    [sRegisteredView getBackingWidth:&bw height:&bh];
    if (w) *w = (unsigned int)bw;
    if (h) *h = (unsigned int)bh;
}

void ios_bridge_set_frame_fn(void (*fn)(void)) {
    [sRegisteredView setGameMode:(fn != NULL) frameFn:fn];
}

@end
