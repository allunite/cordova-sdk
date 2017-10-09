package com.allunite.sdk.cordova;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.util.Log;

import com.allunite.sdk.AllUniteSdk;
import com.allunite.sdk.callbacks.IActionListener;
import com.allunite.sdk.service.BCService;
import com.allunite.sdk.service.StartServicesHelper;
import com.allunite.sdk.utils.StorageUtils;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;

import java.util.Locale;

public class AllUniteSDKCordova extends CordovaPlugin {

    private static final String TAG = AllUniteSDKCordova.class.getSimpleName();

    private static final int REQUEST_LOCATION = 555;

    private CallbackContext permissionsCallback;

    @Override
    public boolean execute(String action, JSONArray args, final CallbackContext callbackContext) throws JSONException {
        Log.d(TAG, "execute: action = " + action + " # args = " + args.length());

        if (action.equals("initSdk")) {
            AllUniteSdk.init(getContext(), null, null, new IActionListener() {
                @Override
                public void onStart() {
                }

                @Override
                public void onSuccess() {
                    callbackContext.success();
                }

                @Override
                public void onError(Throwable t) {
                    callbackContext
                            .error(String.format(Locale.ENGLISH, "initSdk error %s", t));
                }
            });

        } else if (action.equals("bindDevice")) {
            AllUniteSdk.bindDevice(getContext(), "");
            callbackContext.success();

        } else if (action.equals("setSdkEnabled")) {
            boolean enabled = args.getBoolean(0);
            AllUniteSdk.setSdkEnabled(getContext(), enabled);
            callbackContext.success();

        } else if (action.equals("isSdkEnabled")) {
            callbackContext.success(String.valueOf(StorageUtils.loadBoolean(getContext(), "isEnabled")));

        } else if (action.equals("isDeviceBound")) {
            callbackContext.success(String.valueOf(StorageUtils.loadBoolean(getContext(), "isBound")));

        } else if (action.equals("startBeaconTracking")) {
            StartServicesHelper.startServices(getContext());
            callbackContext.success();

        } else if (action.equals("stopBeaconTracking")) {
            getContext().stopService(new Intent(getContext(), BCService.class));
            callbackContext.success();

        } else if (action.equals("trackWithCategory")) {
            String actionCategory = args.getString(0);
            String actionId = args.getString(1);
            if (actionCategory != null && actionId != null) {
                AllUniteSdk.track(getContext(), actionCategory, actionId);
                callbackContext.success();
            }
        } else if (action.equals("requestLocationPermission")) {
            permissionsCallback = callbackContext;
            checkLocationPermission();
        } else {
            Log.e(TAG, "Unknown action received (action = " + action + ")");
            callbackContext.error("unknown action");
            return false;
        }

        return true;
    }

    private void checkLocationPermission() {
        if (!isLocationPermissionGranted())
            requestLocationPermission();
        else {
            returnRequestPermissionResult(true);
        }
    }

    private Context getContext() {
        return getActivity().getApplicationContext();
    }

    private Activity getActivity() {
        return this.cordova.getActivity();
    }

    private boolean isLocationPermissionGranted() {
        return cordova.hasPermission(Manifest.permission.ACCESS_FINE_LOCATION)
                &&
                cordova.hasPermission(Manifest.permission.ACCESS_COARSE_LOCATION);
    }

    private void requestLocationPermission() {
        cordova.requestPermissions(this, REQUEST_LOCATION,
                new String[]{Manifest.permission.ACCESS_FINE_LOCATION,
                        Manifest.permission.ACCESS_COARSE_LOCATION});

    }

    private void returnRequestPermissionResult(boolean granted) {
        if (permissionsCallback != null && !permissionsCallback.isFinished()) {
            permissionsCallback.success(String.valueOf(granted));
            permissionsCallback = null;
        }
    }

    @Override
    public void onRequestPermissionResult(int requestCode, String[] permissions,
                                          int[] grantResults) throws JSONException {
        Log.e(TAG, "onRequestPermissionResult " + String.valueOf(requestCode));
        switch (requestCode) {
            case REQUEST_LOCATION:
                if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    StartServicesHelper.startServices(getContext());
                    returnRequestPermissionResult(true);
                } else {
                    returnRequestPermissionResult(false);
                }
        }
    }
}






