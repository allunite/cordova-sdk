package com.allunite.sdk.cordova;

import android.content.Context;
import android.util.Log;

import android.support.v4.app.ActivityCompat;

import com.allunite.sdk.AllUniteSdk;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;

public class AllUniteSDKCordova extends CordovaPlugin {

    @Override
    public void pluginInitialize() {

    }

    public void onStart() {
    if(!isLocationPermissionGranted())
	requestLocationPermission()
    }

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        Log.d("AllUniteSDKCordova", "execute: action = " + action + " # args = " + args.length());

        if (action.equals("initSdk")) {
            String accountId = args.getString(0);
            String acountKey = args.getString(1);
            if (accountId != null && acountKey != null) {
                AllUniteSdk.init(getContext(), accountId, acountKey);
            }
        } else if (action.equals("bindDevice")) {
            String deepLink = args.getString(0);
            if (deepLink != null) {
                AllUniteSdk.bindDevice(getContext(), deepLink);
            }
        } else if (action.equals("isBeaconTrackingEnabled")) {
        } else if (action.equals("startBeaconTracking")) {
        } else if (action.equals("stopBeaconTracking")) {
        } else {
            Log.e("AllUniteSDKCordova", "Unknown action received (action = " + action + ")");
            return false;
        }

        return true;
    }

    private Context getContext() {
        return this.cordova.getActivity().getApplicationContext();
    }

    public boolean isLocationPermissionGranted() {
        return ActivityCompat.checkSelfPermission(getContext(), Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED
                && ActivityCompat.checkSelfPermission(getContext(), Manifest.permission.ACCESS_COARSE_LOCATION) == PackageManager.PERMISSION_GRANTED;
    }

    private void requestLocationPermission() {
        ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.ACCESS_FINE_LOCATION, Manifest.permission.ACCESS_COARSE_LOCATION}, REQUEST_LOCATION_PERMISSION);
    }

    /**
     * Called by the system when the user grants permissions
     *
     * @param requestCode
     * @param permissions
     * @param grantResults
     */
    @Override
    public void onRequestPermissionResult(int requestCode, String[] permissions,
                                          int[] grantResults) throws JSONException {
        StartServicesHelper.startServices(getContext());
    }
}
