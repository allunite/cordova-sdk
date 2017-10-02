# Demo project. 
## IOS

1. Add ios platform:
```
cordova platform add ios
```

2. Add plugin to demo (local path):
```
cordova plugin add ./.. --variable ACCOUNT_ID=CordovaDemo --variable ACCOUNT_KEY=CA16C4FE98CF47AAB7B56137E9E3D7C1 --variable URI_SCHEME=all-unite-demo-cordova
```


3. Remove plugin:
```
cordova plugin remove com.allunite.sdk.cordova
```


Application Info.plist. IOS https settings, background mode, Location Service keys

```
<key>NSAppTransportSecurity</key>
<dict>
  <key>NSAllowsArbitraryLoads</key>
  <true/>
  <key>NSExceptionDomains</key>
  <dict>
    <key>sdk-api.allunite.com</key>
    <dict>
      <key>NSIncludesSubdomains</key>
      <true/>
      <key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
      <true/>
    </dict>
  </dict>
</dict>

<key>CFBundleURLTypes</key>
<array>
  <dict>
    <key>CFBundleURLName</key>
    <string>AllUniteSdk</string>
    <key>CFBundleURLSchemes</key>
    <array>
      <string>all-unite-demo-cordova</string>
    </array>
  </dict>
</array>

<key>UIBackgroundModes</key>
<array>
  <string>bluetooth-central</string>
</array>

<key>NSBluetoothPeripheralUsageDescription</key>
<string>Application tracks your position to search nearby shops becon</string>
<key>NSLocationAlwaysUsageDescription</key>
<string>Application tracks your position to search nearby shops</string>
<key>NSLocationUsageDescription</key>
<string>Application tracks your position to search nearby shops</string>

<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>Application tracks your position to search nearby shops becon</string>
<key>NSLocationAlwaysUsageDescription</key>
<string>Application tracks your position to search nearby shops</string>
```
