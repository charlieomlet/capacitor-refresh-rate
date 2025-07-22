package com.omlet.refreshrate;

import android.os.Build;
import android.view.Window;
import android.view.WindowManager;

import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "RefreshRate")
public class RefreshRatePlugin extends Plugin {

    private float originalRate = -1;

    @PluginMethod
    public void setRefreshRate(PluginCall call) {
        double hz = call.getDouble("hz", 60.0);

        getActivity().runOnUiThread(() -> {
            Window window = getActivity().getWindow();
            if (window != null) {
                WindowManager.LayoutParams params = window.getAttributes();
                if (originalRate < 0) {
                    originalRate = params.preferredRefreshRate;
                }
                params.preferredRefreshRate = (float) hz;
                window.setAttributes(params);
            }
            call.resolve();
        });
    }

    @PluginMethod
    public void resetRefreshRate(PluginCall call) {
        getActivity().runOnUiThread(() -> {
            Window window = getActivity().getWindow();
            if (window != null && originalRate > 0) {
                WindowManager.LayoutParams params = window.getAttributes();
                params.preferredRefreshRate = originalRate;
                window.setAttributes(params);
                originalRate = -1;
            }
            call.resolve();
        });
    }
}
