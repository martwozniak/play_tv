#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import <bitmovin_player/BitmovinPlayer.h> // Import the bitmovin_player package

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self]; // Ensure this line is present
  // Register the player view factory if required by bitmovin_player
  // Example:
  // [BitmovinPlayerViewFactory registerWithRegistrar:[self registrarForPlugin:@"bitmovin_player"]];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end 