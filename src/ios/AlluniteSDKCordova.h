#import <Cordova/CDV.h>

@interface AlluniteSDKCordova : CDVPlugin


- (void)initSdk:(CDVInvokedUrlCommand*)command;
- (void)isSdkEnabled:(CDVInvokedUrlCommand*)command;
- (void)setSdkEnabled:(CDVInvokedUrlCommand*)command;
- (void)trackWithCategory:(CDVInvokedUrlCommand*)command;
- (void)bindDevice:(CDVInvokedUrlCommand*)command;
- (void)isBeaconTrackingEnabled:(CDVInvokedUrlCommand*)command;
- (void)startBeaconTracking:(CDVInvokedUrlCommand*)command;
- (void)stopBeaconTracking:(CDVInvokedUrlCommand*)command;

@end
