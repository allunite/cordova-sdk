package com.allunite.sdk.cordova;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.support.v4.app.ActivityCompat;
import android.util.Log;

import com.allunite.sdk.AllUniteSdk;
import com.allunite.sdk.service.BCService;
import com.allunite.sdk.service.StartServicesHelper;
import com.allunite.sdk.utils.StorageUtils;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;

public class AllUniteSDKCordova extends CordovaPlugin {

    @Override
    public void pluginInitialize() {

    }

    public void onStart() {
        if (!isLocationPermissionGranted())
            requestLocationPermission();
    }

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        Log.d("AllUniteSDKCordova", "execute: action = " + action + " # args = " + args.length());

        if (action.equals("initSdk")) {
            String accountId = args.getString(0);
            String accountKey = args.getString(1);
            if (accountId != null && accountKey != null) {
                AllUniteSdk.init(getContext(), accountId, accountKey);
            }

        } else if (action.equals("bindDevice")) {
            AllUniteSdk.bindDevice(getContext(), "");
           
        } else if (action.equals("setSdkEnabled")) {
           boolean enabled = args.getBoolean(0);
	   AllUniteSdk.setSdkEnabled(getContext(), enabled);

        } else if (action.equals("isSdkEnabled")) {
            return StorageUtils.loadBoolean(getContext(), "isEnabled");

        } else if (action.equals("startBeaconTracking")) {
            StartServicesHelper.startServices(getContext());

        } else if (action.equals("stopBeaconTracking")) {
            getContext().stopService(new Intent(getContext(), BCService.class));

        } else if (action.equals("trackWithCategory")) {
            String actionCategory = args.getString(0);
            String actionId = args.getString(1);
            if (actionCategory != null && actionId != null) {
                AllUniteSdk.track(getContext(), actionCategory, actionId);
            }

        } else {
            Log.e("AllUniteSDKCordova", "Unknown action received (action = " + action + ")");
            return false;
        }

        return true;
    }

    private Context getContext() {
        return getActivity().getApplicationContext();
    }

    private Activity getActivity() {
        return this.cordova.getActivity();
    }

    public boolean isLocationPermissionGranted() {
        return ActivityCompat.checkSelfPermission(getContext(), Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED
                && ActivityCompat.checkSelfPermission(getContext(), Manifest.permission.ACCESS_COARSE_LOCATION) == PackageManager.PERMISSION_GRANTED;
    }

    private void requestLocationPermission() {
        ActivityCompat.requestPermissions(getActivity(), new String[]{Manifest.permission.ACCESS_FINE_LOCATION, Manifest.permission.ACCESS_COARSE_LOCATION}, 123);
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
