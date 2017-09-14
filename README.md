# AllUnite Cordova SDK

Cordova plugin for iOS and Android to use AllUnite SDK in a Cordova application.

The plugin is currently in development. As a consequence the plugin API may change without notice until it reaches a stable form.

# Installation procedure

Follow these instructions in order to get started with a fresh Cordova app that runs on iOS and Android and integrates the AllUnite SDK.

1. Install Cordova

If you don't already have Cordova installed then start by installing the Cordova toolchain which is available at http://cordova.apache.org/#download

2. Create a Cordova application

Create a new cordova application if you don't have one
```
cordova create AllUniteDemo com.example.allunite AllUniteDemo
```
Result:
Creating a new cordova project with name "AllUniteDemo" and id "com.example.allunite"

3. Add Android (or|and) ios platform support if desired and not already present
```
cordova platform add android
cordova platform add ios
```
Result: 
Created cordova poject for android and|or ios platform

4. Add the AllUnite SDK plugin to cordova project
'''
cordova plugin add https://github.com/allunite/cordova-sdk
'''
Result: 
Added AllUnite SDK plugin to android|ios platform.
