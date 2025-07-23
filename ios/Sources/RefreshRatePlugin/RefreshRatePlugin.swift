import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(RefreshRatePlugin)
public class RefreshRatePlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "RefreshRatePlugin"
    public let jsName = "RefreshRate"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "setRefreshRate", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "resetRefreshRate", returnType: CAPPluginReturnPromise)
    ]

    private let implementation = RefreshRate()

    @objc public func setRefreshRate(_ call: CAPPluginCall) {
        let hz = call.getDouble("hz") ?? 60.0
        implementation.setRefreshRate(hz: hz)
        call.resolve()
    }

    @objc public func resetRefreshRate(_ call: CAPPluginCall) {
        implementation.resetRefreshRate()
        call.resolve()
    }
}
