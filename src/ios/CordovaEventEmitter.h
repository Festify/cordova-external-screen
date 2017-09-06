#ifndef CordovaEventEmitter_h
#define CordovaEventEmitter_h

#import <Cordova/CDVPlugin.h>

@interface CordovaEventEmitter : NSObject

@property (nonatomic) NSDictionary *codeMatrix;
@property (nonatomic, weak) id <CDVCommandDelegate> commandDelegate;
@property (nonatomic) NSString *eventCallbackId;

+ (instancetype)eventEmitterWithCommandDelegate: (id <CDVCommandDelegate>) commandDelegate;
- (instancetype)initWithCommandDelegate: (id <CDVCommandDelegate>) commandDelegate;
-(void) emit:(NSString *)eventName withData:(NSArray *) data;
-(void) setCallbackId:(NSString *) callbackId;

@end

#endif
