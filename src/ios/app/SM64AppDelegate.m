#import <UIKit/UIKit.h>

/*
 * Smoke-test app delegate: validates the on-device clang/make/ldid build
 * pipeline end to end before the real launcher UI (ROM scan, settings,
 * game view controller) is layered in.
 */
@interface SM64AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow *window;
@end

@implementation SM64AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor blackColor];

    UIViewController *rootController = [[UIViewController alloc] init];
    rootController.view.backgroundColor = [UIColor blackColor];

    UILabel *label = [[UILabel alloc] initWithFrame:rootController.view.bounds];
    label.text = @"SM64 iOS Port build pipeline OK";
    label.textColor = [UIColor greenColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    label.font = [UIFont boldSystemFontOfSize:24];
    [rootController.view addSubview:label];

    self.window.rootViewController = rootController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
