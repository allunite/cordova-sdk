# AllUnite JavaScript Cordova Api (example)

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
## Detect state sdk
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
## Change State Sdk
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
## Track action
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
## Beacon tracking start
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
## Beacon tracking stop
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
