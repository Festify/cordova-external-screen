#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>
#import <WebKit/WebKit.h>
#import "ScreenNotificationDelegate.h"

@interface CordovaExternalScreen : CDVPlugin {
}

@property (nonatomic, strong)UIWindow* externalWindow;
@property (nonatomic) ScreenNotificationDelegate* screenNotificationDelegate;
@property (nonatomic, strong) WKWebView* externalWebView;

- (void) registerEvents:(CDVInvokedUrlCommand*)command;
- (void) loadURL:(CDVInvokedUrlCommand*)command;
- (void) hasExternalScreen:(CDVInvokedUrlCommand*)command;

- (bool) hasExternalScreen;
- (WKWebView*) getWebView;

- (void) handleScreenDisconnectNotification:(NSNotification*)aNotification;
@end
