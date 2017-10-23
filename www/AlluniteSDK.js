var AlluniteSDK = {
    
initSdk: function(successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "AlluniteSDKCordova", "initSdk", []);
},
    
requestLocationPermission: function (authorizationAlgorithm,successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "AlluniteSDKCordova", "requestLocationPermission", [authorizationAlgorithm]);
},
    
isDeviceBound: function (successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "AlluniteSDKCordova", "isDeviceBound", []);
},
    
isSdkEnabled: function (successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "AlluniteSDKCordova", "isSdkEnabled", []);
},
    
setSdkEnabled: function (enabledBool, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "AlluniteSDKCordova", "setSdkEnabled", [enabledBool]);
},
    
trackWithCategory: function (actionCategory, actionId, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "AlluniteSDKCordova", "trackWithCategory", [actionCategory, actionId]);
},
    
bindDevice: function (successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "AlluniteSDKCordova", "bindDevice", []);
},
    
isBeaconTrackingEnabled: function (successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "AlluniteSDKCordova", "isBeaconTrackingEnabled", []);
},
    
startBeaconTracking: function (successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "AlluniteSDKCordova", "startBeaconTracking", []);
},
    
stopBeaconTracking: function (successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "AlluniteSDKCordova", "stopBeaconTracking", []);
},

AuthorizationAlgorithm : {
    always : 1,
    customAlwaysTwoDialog : 500,
}
    
};

module.exports = AlluniteSDK;
