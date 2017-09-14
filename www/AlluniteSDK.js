var AlluniteSDK = {

    initSdk: function(accountId, acountKey, successCallback, errorCallback) {
//        if(device.platform === 'Android') {
//            cordova.exec(successCallback, errorCallback, "AlluniteSDKCordova", "initSdk", [accountId, acountKey]);
//        }
        cordova.exec(successCallback, errorCallback, "AlluniteSDKCordova", "initSdk", [accountId, acountKey]);
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
    }
};

module.exports = AlluniteSDK;
