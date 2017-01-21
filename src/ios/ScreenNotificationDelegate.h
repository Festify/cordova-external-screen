#ifndef ExternalScreenDelegate_h
#define ExternalScreenDelegate_h

#import "CordovaEventEmitter.h"

@interface ScreenNotificationDelegate : CordovaEventEmitter {

}

- (void) handleScreenConnectNotification:(NSNotification*)aNotification;
- (void) handleScreenDisconnectNotification:(NSNotification*)aNotification;

@end

#endif
