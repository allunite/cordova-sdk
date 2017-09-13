package com.allunite.sdk.cordova;

import android.content.Context;
import android.util.Log;

import com.allunite.sdk.AllUniteSdk;

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

}
