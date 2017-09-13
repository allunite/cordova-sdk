ios https settings, background mode, 

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
```
