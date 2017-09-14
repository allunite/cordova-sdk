# AllUnite JavaScript Cordova Api

## Init device

```
function initDevice(){
    var success = function(message) {
        alert("success");
    }

    var failure = function() {
        alert("Error calling");
    }
    AlluniteSDK.initSdk("your accountId", "your accountKey", success, failure);
}
```
Parameters "your accountId" and "your accountKey" are ignored in iOS.
## Detect SDK state
```
function isSdkEnabled(){
    var success = function(enabled) {
        alert(enabled); // enabled is true or false
        if(enabled){
            // All api functions are available
        } else {
            // Only func initSdk is enabled
        }
    }

    var failure = function() {
        alert("Error calling");
    }
    AlluniteSDK.isSdkEnabled(success, failure);
}
```
## Change SDK state
```
function setSdkEnabled(){
    var success = function(message) {
        alert("Success");
    }

    var failure = function() {
        alert("Error calling");
    }
    AlluniteSDK.setSdkEnabled(true, success, failure); // true or false param
}
```
## Track custom action
```
function trackWithCategory(){
    var success = function(message) {
        alert("Success");
    }

    var failure = function() {
        alert("Error calling");
    }
    AlluniteSDK.trackWithCategory("action category", "action id", success, failure);
}
```
## Bind device
```
function bindDevice(){
    var success = function(message) {
        alert("Success");
    }

    var failure = function() {
        alert("Error calling");
    }
    AlluniteSDK.bindDevice(success, failure);
}
```
## Start beacon tracking
```
function startTracking(){
    var success = function(message) {
        alert("Success");
    }

    var failure = function() {
        alert("Error calling");
    }
    AlluniteSDK.startBeaconTracking(success, failure);
}
```
## Stop beacon tracking
```
function stopTracking(){
    var success = function(message) {
        alert("Success");
    }

    var failure = function() {
        alert("Error calling");
    }
    AlluniteSDK.stopBeaconTracking(success, failure);
}
```
