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
```
cordova plugin add https://github.com/allunite/cordova-sdk
```
Result: 
Added AllUnite SDK plugin to android|ios platform.

5. Build and Run

### iOS

To only build the app: ```cordova build ios```

To run on an iPhone simulator (won't be able to detect beacons but allows to check that everything runs as expected) ```cordova emulate ios```

To launch the app on a device, plug a device, then ```cordova run ios```

### Android

To only build the app: ```cordova build android```

To run on an Android simulator (won't be able to detect beacons but allows to check that everything runs as expected): ```cordova emulate android```

To launch the app on a device, plug a device, then ```cordova run android```

# IOS cordova project

1. Open cordova ios project in XCode (<projectname>.xcworkspace)
2. Open project manifest file *-Info.plist and set yours description values for keys: ```NSBluetoothPeripheralUsageDescription, NSLocationAlwaysUsageDescription, NSLocationUsageDescription``` 
For key ```CFBundleURLSchemes``` change from default scheme named ```allunite-sdk``` to yours, registered for your accountId and accountKey
3. Find config file ```AlluniteSdkConfig.plist``` in project structure and change values for keys ```accountId``` and ```accountKey``` to yours.
Example for CordovaDemo account:
``` xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>accountId</key>
	<string>CordovaDemo</string>
	<key>accountKey</key>
	<string>CA16C4FE98CF47AAB7B56137E9E3D7C1</string>
</dict>
</plist>
```

# Android cordova project
1. Open cordova Android project in XCode.
2. Open project manifest file.
3. Add intent filter for main activity for listening your deep link:
```
            <intent-filter>
                <action android:name="android.intent.action.VIEW" />

                <category android:name="android.intent.category.DEFAULT" />
                <category android:name="android.intent.category.BROWSABLE" />

                <data
                    android:host="main"
                    android:scheme="all-unite-demo-cordova" />
            </intent-filter>
```
