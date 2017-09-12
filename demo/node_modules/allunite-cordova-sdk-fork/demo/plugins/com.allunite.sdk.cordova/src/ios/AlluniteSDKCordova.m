

#import "AlluniteSDKCordova.h"
#import <Cordova/CDV.h>

#import "AllUniteSdkManager.h"

@implementation AlluniteSDKCordova
    
- (void)pluginInitialize
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidFinishLaunchingNotification:) name:UIApplicationDidFinishLaunchingNotification object:nil];
    }
    
- (void)applicationDidFinishLaunchingNotification:(NSNotification *)notification
    {
        // Put here the code that should be on the AppDelegate.m
        NSLog(@"app launching");
        
        NSString* accountId = @"CordovaDemo";
        NSString* accountKey = @"CA16C4FE98CF47AAB7B56137E9E3D7C1";
        [[AllUniteSdkManager sharedInstance] initializeAllUniteSdkWithAccountId:accountId accountKey:accountKey launchOptions:nil];
    }
    
- (void)initSdk:(CDVInvokedUrlCommand*)command
    {
        NSString* accountId = [command.arguments objectAtIndex:0];
        NSString* accountKey = [command.arguments objectAtIndex:1];
        
        if ( [self isParamEmpty:accountId]
            || [self isParamEmpty:accountKey]) {
            
            CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            return;
        }
        
        //    [[AllUniteSdkManager sharedInstance] initializeAllUniteSdkWithAccountId:accountId accountKey:accountKey launchOptions:nil];
        
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:accountId];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
    
- (void)bindDevice:(CDVInvokedUrlCommand*)command
    {
        AllUniteSdkManager* alluniteSdk = [AllUniteSdkManager sharedInstance];
        [alluniteSdk bindDevice:^(NSError * _Nullable error) {
            if (error != nil) {
                CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                return;
            }
            
            
            [alluniteSdk requestAutorizationStatus:^(CLAuthorizationStatus status) {
                if (status != kCLAuthorizationStatusAuthorizedAlways
                    && status != kCLAuthorizationStatusAuthorizedWhenInUse) {
                    
                    NSLog(@"%@. App don't have permission using CoreLocation", [self TAG]);
                    
                    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                    return;
                }
                
                [alluniteSdk bindDevice:^(NSError * _Nullable error) {
                    if (error != nil) {
                        NSLog(@"%@. Bind failed", [self TAG]);
                        
                        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
                        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                        return;
                    }
                    
                    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                }];
            }];
            
        }];
    }
    
- (void)isBeaconTrackingEnabled:(CDVInvokedUrlCommand*)command
    {
        AllUniteSdkManager* alluniteSdk = [AllUniteSdkManager sharedInstance];
        BOOL trackingEnabled = [alluniteSdk isTrackingBeacons];
        
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsBool:trackingEnabled];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
    
- (void)startBeaconTracking:(CDVInvokedUrlCommand*)command
    {
        AllUniteSdkManager* alluniteSdk = [AllUniteSdkManager sharedInstance];
        [alluniteSdk startTrackingBeacon:^(NSError * _Nullable error) {
            if (error != nil) {
                NSLog(@"%@. Start beacon tracking failed", [self TAG]);
                
                CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                return;
            }
            
            CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            
        } didFindBeacon:^(AllUniteSdkBeaconInfo * _Nonnull beacon) {
        }];
    }
    
- (void)stopBeaconTracking:(CDVInvokedUrlCommand*)command
    {
        AllUniteSdkManager* alluniteSdk = [AllUniteSdkManager sharedInstance];
        [alluniteSdk stopTrackingBeacon];
        
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
    
-(NSString*) TAG {
    return NSStringFromClass([self class]);
}
    
-(BOOL) isParamEmpty: (NSString*) param
    {
        return param == nil || [param length] == 0;
    }
    
    @end
