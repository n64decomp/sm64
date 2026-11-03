//
// SM64AppDelegate.m — boots straight into the emulator shell:
// EAGL surface + on-screen N64 pad + ROM status. No ROM required.
// When a known-good ROM appears in Documents (iTunes File Sharing),
// the status flips and the game core takes over the pump.
//
#import "SM64AppDelegate.h"
#import "ROMValidator.h"
#import "N64PadView.h"
#import "../gfx/EAGLView.h"
#import "ios_game.h"
#import <unistd.h>

@interface SM64RootViewController : UIViewController <UIActionSheetDelegate> {
    SM64EAGLView *_glView;
    N64PadView *_padView;
    UILabel *_statusLabel;
    UIButton *_romsButton;
}
- (void)refreshROMStatus;
- (void)bootGameWithROM:(SM64RomInfo *)rom;
- (void)appendHeartbeat:(NSString *)line;
@end

@implementation SM64RootViewController

- (void)loadView {
    CGRect bounds = [[UIScreen mainScreen] bounds];
    // iPad 1 runs this game in landscape only. UIScreen.bounds can still
    // report the portrait size at launch time (device flat/asleep), so force
    // the landscape dimensions: the EAGL drawable and thus the game's
    // framebuffer must come up 1024x768.
    CGRect frame = CGRectMake(0, 0, MAX(bounds.size.width, bounds.size.height),
                                    MIN(bounds.size.width, bounds.size.height));
    UIView *root = [[UIView alloc] initWithFrame:frame];
    root.backgroundColor = [UIColor blackColor];

    _glView = [[SM64EAGLView alloc] initWithFrame:frame];
    [root addSubview:_glView];
    ios_bridge_register_view(_glView);

    _padView = [[N64PadView alloc] initWithFrame:frame];
    [_padView setDemoMode:YES];
    [root addSubview:_padView];

    _statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 44)];
    _statusLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
    _statusLabel.textColor = [UIColor whiteColor];
    _statusLabel.textAlignment = NSTextAlignmentCenter;
    _statusLabel.font = [UIFont systemFontOfSize:14];
    [root addSubview:_statusLabel];

    UIButton *roms = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    roms.frame = CGRectMake(frame.size.width - 120, 52, 112, 36);
    [roms setTitle:@"ROMs" forState:UIControlStateNormal];
    [roms addTarget:self action:@selector(showROMs) forControlEvents:UIControlEventTouchUpInside];
    [root addSubview:roms];
    _romsButton = roms;

    self.view = root;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    if ([paths count] > 0) {
        NSString *log = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"sm64ios-heartbeat.log"];
        NSString *line = [NSString stringWithFormat:@"launch %@\n", [NSDate date]];
        [line writeToFile:log atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    if ([_glView createContext]) {
        [_glView startPump];
        if ([paths count] > 0) {
            NSString *log = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"sm64ios-heartbeat.log"];
            NSFileHandle *fh = [NSFileHandle fileHandleForWritingAtPath:log];
            [fh seekToEndOfFile];
            [fh writeData:[@"eagl ok, pump started\n" dataUsingEncoding:NSUTF8StringEncoding]];
            [fh closeFile];
        }
    } else {
        _statusLabel.text = @"EAGL context failed — no GLES on this device?";
    }
    [[NSNotificationCenter defaultCenter] addObserver:self
        selector:@selector(refreshROMStatus)
        name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // Boot only once the view is on screen: the EAGL drawable (and thus the
    // real framebuffer dimensions) only exist after the first layout pass,
    // and gfx_init reads the dimensions during ios_game_init.
    CGRect wb = self.view.window ? self.view.window.bounds : CGRectZero;
    CGRect vb = self.view.bounds;
    [self appendHeartbeat:[NSString stringWithFormat:
        @"ui: window %.0fx%.0f view %.0fx%.0f statusOrientation=%d\n",
        wb.size.width, wb.size.height, vb.size.width, vb.size.height,
        (int)[UIApplication sharedApplication].statusBarOrientation]];
    [self refreshROMStatus];
}

- (void)refreshROMStatus {
    SM64RomInfo *rom = [SM64ROMValidator firstValidROM];
    NSArray *all = [SM64ROMValidator scanDocuments];
    if (rom != nil) {
        [self bootGameWithROM:rom];
    } else if ([all count] > 0) {
        _statusLabel.text = @"ROMs found, but no known SM64 dump — check hashes";
        [_padView setDemoMode:YES];
    } else {
        _statusLabel.text = @"No ROM — add a .z64 via iTunes File Sharing";
        [_padView setDemoMode:YES];
    }
}

- (void)bootGameWithROM:(SM64RomInfo *)rom {
    // Game CWD = Documents so sm64config.txt + sm64_save_file.bin persist
    // next to the ROMs, emulator-style.
    static BOOL booted = NO;
    if (booted) return;
    booted = YES;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    if ([paths count] > 0) {
        chdir([[paths objectAtIndex:0] fileSystemRepresentation]);
    }
    [self appendHeartbeat:[NSString stringWithFormat:@"booting %@\n", [rom displayName]]];
    _statusLabel.text = [@"Booting: " stringByAppendingString:[rom displayName]];
    ios_game_init();
    [self appendHeartbeat:@"game init returned\n"];
    ios_bridge_set_frame_fn(produce_one_frame);
    [_padView setDemoMode:NO];
    _statusLabel.text = [@"Playing: " stringByAppendingString:[rom displayName]];
    [self appendHeartbeat:[NSString stringWithFormat:@"playing %@\n", [rom displayName]]];
    // The game owns the screen now: drop the debug chrome so nothing extra
    // composites over (or overlaps) the framebuffer.
    _statusLabel.hidden = YES;
    _romsButton.hidden = YES;
}

- (void)appendHeartbeat:(NSString *)line {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    if ([paths count] == 0) return;
    NSString *log = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"sm64ios-heartbeat.log"];
    NSFileHandle *fh = [NSFileHandle fileHandleForWritingAtPath:log];
    if (fh == nil) {
        [line writeToFile:log atomically:YES encoding:NSUTF8StringEncoding error:nil];
        return;
    }
    [fh seekToEndOfFile];
    [fh writeData:[line dataUsingEncoding:NSUTF8StringEncoding]];
    [fh closeFile];
}

- (void)showROMs {
    NSArray *all = [SM64ROMValidator scanDocuments];
    NSString *msg = ([all count] == 0)
        ? @"Documents is empty.\nAdd baserom.us.z64 via iTunes File Sharing."
        : [NSString stringWithFormat:@"%d file(s):\n%@",
            [all count],
            [[all valueForKey:@"displayName"] componentsJoinedByString:@"\n"]];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"N64 ROMs"
        message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)o {
    return UIInterfaceOrientationIsLandscape(o);
}

@end

@implementation SM64AppDelegate
@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)opts {
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // iPad 1 + this game: always landscape. Info.plist already restricts the
    // supported orientations, but iOS 6 can still start portrait (device
    // flat/asleep at launch), which would give the game a 768x1024 surface.
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight animated:NO];
    // Full screen: the game view is a fixed 1024x768 framebuffer.
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    SM64RootViewController *root = [[SM64RootViewController alloc] init];
    _window.rootViewController = root;
    [_window makeKeyAndVisible];
    return YES;
}

@end
