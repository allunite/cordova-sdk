package com.allunite.sdk.cordova;

import android.content.Context;
import android.util.Log;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;

public class AllUniteSDKCordova extends CordovaPlugin {

    @Override
    public void pluginInitialize() {

    }

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        Log.d("UbuduSDKCordova", "execute: action = " + action + " # args = " + args.length());

        if (action.equals("bindDevice")) {
            this.getSDKVersion(callbackContext);
        } else if (action.equals("isBeaconTrackingEnabled")) {
            this.getAppNamespace(callbackContext);
        } else if (action.equals("startBeaconTracking")) {
            String appNamespace = args.getString(0);
            this.setAppNamespace(appNamespace, callbackContext);
        } else if (action.equals("stopBeaconTracking")) {
            this.getBaseURL(callbackContext);
        } else {
            Log.e("AllUniteSDKCordova", "Unknown action received (action = " + action + ")");
            return false;
        }

        return true;
    }

    private Context getContext() {
        return this.cordova.getActivity().getApplicationContext();
    }

}