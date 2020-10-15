#import "CordovaExternalScreen.h"

@implementation CordovaExternalScreen

- (void)pluginInitialize {
    __weak id <CDVCommandDelegate> _commandDelegate = self.commandDelegate;
    self.screenNotificationDelegate = [ScreenNotificationDelegate eventEmitterWithCommandDelegate: _commandDelegate];
}

- (WKWebView*)getWebView {
    if (!self.externalWebView) {
        UIScreen* externalScreen = [[UIScreen screens] objectAtIndex: 1];
        CGRect screenBounds = externalScreen.bounds;

        self.externalWebView = [[WKWebView alloc] initWithFrame: screenBounds
                                                  configuration: [[WKWebViewConfiguration alloc] init]];
        self.externalWindow = [[UIWindow alloc] initWithFrame: screenBounds];

        self.externalWindow.screen = externalScreen;
        self.externalWindow.clipsToBounds = YES;
        [self.externalWindow addSubview:self.externalWebView];
        [self.externalWindow makeKeyAndVisible];
        self.externalWindow.hidden = NO;
    }

    return self.externalWebView;
}

- (bool) hasExternalScreen {
    return ([[UIScreen screens] count] > 1);
}

- (void) hasExternalScreen:(CDVInvokedUrlCommand*)command {
    CDVPluginResult *result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK
                                                  messageAsBool: [self hasExternalScreen]];

    [self.commandDelegate sendPluginResult: result
                                callbackId: command.callbackId];
}

- (void)loadURL:(CDVInvokedUrlCommand*)command {
    if (![self hasExternalScreen]) {
        CDVPluginResult *result = [CDVPluginResult resultWithStatus: CDVCommandStatus_ERROR
                                                    messageAsString: @"No external screens ¯\\_(ツ)_/¯"];

        [self.commandDelegate sendPluginResult: result callbackId: command.callbackId];
        return;
    }

    NSString *folderString = [@"www/" stringByAppendingFormat:@"%@", [command argumentAtIndex:0]];
    NSString* FILE_PATH = [[[NSBundle mainBundle] resourcePath]
                             stringByAppendingPathComponent:folderString];

    NSString *newString = [FILE_PATH stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSURL* url = [NSURL URLWithString: [@"file://" stringByAppendingFormat:@"%@", newString]];
    NSURLRequest* request = [NSURLRequest requestWithURL: url];
    [[self getWebView] loadRequest: request];

    CDVPluginResult *result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK];

    [self.commandDelegate sendPluginResult: result
                                callbackId: command.callbackId];
}

- (void)registerEventsListener:(CDVInvokedUrlCommand*)command {
    NSNotificationCenter* center = [NSNotificationCenter defaultCenter];

    [self.screenNotificationDelegate setCallbackId: command.callbackId];

    [center addObserver: self.screenNotificationDelegate
               selector: @selector(handleScreenConnectNotification:)
                   name: UIScreenDidConnectNotification
                 object: nil];
    [center addObserver: self.screenNotificationDelegate
               selector: @selector(handleScreenDisconnectNotification:)
                   name: UIScreenDidDisconnectNotification object:nil];

    [center addObserver: self
               selector: @selector(handleScreenDisconnectNotification:)
                   name: UIScreenDidDisconnectNotification object:nil];

    CDVPluginResult *result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK
                                                messageAsString: nil];
    [result setKeepCallbackAsBool: YES];

    [self.commandDelegate sendPluginResult: result
                                callbackId: command.callbackId];
}

- (void) handleScreenDisconnectNotification:(NSNotification*)aNotification {
    if (!self.externalWindow) {
        return;
    }

    self.externalWindow.hidden = YES;
    self.externalWebView = nil;
    self.externalWindow = nil;
}

@end
