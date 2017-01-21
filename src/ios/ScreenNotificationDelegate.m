#import "ScreenNotificationDelegate.h"

@implementation ScreenNotificationDelegate

- (void) handleScreenConnectNotification:(NSNotification*)aNotification {
    [self emit:@"screenconnect" withData: @[]];
}

- (void) handleScreenDisconnectNotification:(NSNotification*)aNotification {
    [self emit:@"screenconnect" withData: @[]];
}

@end
