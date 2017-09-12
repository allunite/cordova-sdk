var AlluniteSDK = {
    bindDevice: function (accountId, accountKey, successCallback, errorCallback) {
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

/* Demo
 var success = function(message) {
 alert(message);
 }
 
 var failure = function() {
 alert("Error calling");
 }
 
 AlluniteSDK.initSdk("accountId", "acountKey", success, failure);
 */
