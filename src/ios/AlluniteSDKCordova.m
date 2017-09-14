

#import "AlluniteSDKCordova.h"
#import <Cordova/CDV.h>

#import "AllUniteSdkManager.h"

@implementation AlluniteSDKCordova

- (void)pluginInitialize {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidFinishLaunchingNotification:) name:UIApplicationDidFinishLaunchingNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleOpenURLNotification:) name:CDVPluginHandleOpenURLNotification object:nil];
}

- (void)applicationDidFinishLaunchingNotification:(NSNotification *)notification {
    dispatch_async(dispatch_get_main_queue(), ^{
        
        NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"AlluniteSdkConfig" ofType:@"plist"];
        NSDictionary* contentDict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
        
        NSString* accountId = [contentDict objectForKey:@"accountId"];
        NSString* accountKey = [contentDict objectForKey:@"accountKey"];
        
        if (accountId.length == 0 && accountKey.length == 0) {
            [NSException raise:@"AlluniteSdkConfig.plist" format:@"Missing AlluniteSdkConfig.plist config in app recources"];
        }
        
        [[AllUniteSdkManager sharedInstance] initializeAllUniteSdkWithAccountId:accountId accountKey:accountKey launchOptions:nil];
        
    });
}

- (void)handleOpenURLNotification:(NSNotification *)notification {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSURL* url = notification.object;
        if (url != nil){
            [[AllUniteSdkManager sharedInstance] openUrl:url options:nil];
        }
    });
}


- (void)initSdk:(CDVInvokedUrlCommand*)command {
    
    AllUniteSdkManager* alluniteSdk = [AllUniteSdkManager sharedInstance];
    [alluniteSdk reinitilize:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"%@. Init sdk request failed", [self TAG]);
            
            CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            return;
        }
        
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)isSdkEnabled:(CDVInvokedUrlCommand*)command {
    dispatch_async(dispatch_get_main_queue(), ^{
        AllUniteSdkManager* alluniteSdk = [AllUniteSdkManager sharedInstance];
        BOOL trackingEnabled = [alluniteSdk isSdkEnabled];
        
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:trackingEnabled];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    });
}

- (void)setSdkEnabled:(CDVInvokedUrlCommand*)command {
    dispatch_async(dispatch_get_main_queue(), ^{
        AllUniteSdkManager* alluniteSdk = [AllUniteSdkManager sharedInstance];
        BOOL trackingEnabled = [command.arguments[0] boolValue];
        [alluniteSdk setSdkEnabled:trackingEnabled];
        
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    });
}

- (void)trackWithCategory:(CDVInvokedUrlCommand*)command {
    dispatch_async(dispatch_get_main_queue(), ^{
        AllUniteSdkManager* alluniteSdk = [AllUniteSdkManager sharedInstance];
        NSString* actionCategory = command.arguments[0];
        NSString* actionId = command.arguments[1];
        [alluniteSdk trackWithCategory:actionCategory
                              actionId:actionId
                            completion:^(NSError * _Nullable error) {
                                if (error != nil) {
                                    NSLog(@"%@. Track with category failed", [self TAG]);
                                    
                                    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
                                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                                    return;
                                }
                                
                                CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
                                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                            }];
    });
}


- (void)bindDevice:(CDVInvokedUrlCommand*)command {
    dispatch_async(dispatch_get_main_queue(), ^{
        
        
        AllUniteSdkManager* alluniteSdk = [AllUniteSdkManager sharedInstance];
        
        [alluniteSdk requestAutorizationStatus:^(CLAuthorizationStatus status) {
            
            if (status == kCLAuthorizationStatusNotDetermined) {
                return;
            }
            
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
        
    });
}

- (void)isBeaconTrackingEnabled:(CDVInvokedUrlCommand*)command {
    dispatch_async(dispatch_get_main_queue(), ^{
        AllUniteSdkManager* alluniteSdk = [AllUniteSdkManager sharedInstance];
        BOOL trackingEnabled = [alluniteSdk isTrackingBeacons];
        
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:trackingEnabled];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    });
}

- (void)startBeaconTracking:(CDVInvokedUrlCommand*)command {
    dispatch_async(dispatch_get_main_queue(), ^{
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
    });
}

- (void)stopBeaconTracking:(CDVInvokedUrlCommand*)command {
    dispatch_async(dispatch_get_main_queue(), ^{
        AllUniteSdkManager* alluniteSdk = [AllUniteSdkManager sharedInstance];
        [alluniteSdk stopTrackingBeacon];
        
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    });
}

-(NSString*) TAG {
    return NSStringFromClass([self class]);
}

-(BOOL) isParamEmpty: (NSString*) param {
    return param == nil || [param length] == 0;
}

@end
