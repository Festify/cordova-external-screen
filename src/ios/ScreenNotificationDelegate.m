#import "ScreenNotificationDelegate.h"

@implementation ScreenNotificationDelegate

- (void) handleScreenConnectNotification:(NSNotification*)aNotification {
    [self emit:@"connect" withData: @[]];
}

- (void) handleScreenDisconnectNotification:(NSNotification*)aNotification {
    [self emit:@"disconnect" withData: @[]];
}

@end
