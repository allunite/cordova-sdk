var AlluniteSDK = {
    initSdk: function (accountId, accountKey, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "AlluniteSDKCordova", "initSdk", [accountId, accountKey]);
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
