#import <Cordova/CDV.h>

@interface AlluniteSDKCordova : CDVPlugin
    
- (void)bindDevice:(CDVInvokedUrlCommand*)command;
- (void)isBeaconTrackingEnabled:(CDVInvokedUrlCommand*)command;
- (void)startBeaconTracking:(CDVInvokedUrlCommand*)command;
- (void)stopBeaconTracking:(CDVInvokedUrlCommand*)command;
    
@end
