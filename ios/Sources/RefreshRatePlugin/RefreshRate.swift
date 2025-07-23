import Foundation
import QuartzCore
import WebKit

@objc public class RefreshRate: NSObject {
    @objc public func setRefreshRate(hz: Double, webView: WKWebView?) {
        guard #available(iOS 15.0, *), let webView = webView else { return }

        webView.preferredFrameRateRange = CAFrameRateRange(
            minimum: Float(hz),
            maximum: Float(hz),
            preferred: Float(hz)
        )
    }

    @objc public func resetRefreshRate(webView: WKWebView?) {
        guard #available(iOS 15.0, *), let webView = webView else { return }

        webView.preferredFrameRateRange = CAFrameRateRange(
            minimum: 30,
            maximum: 120,
            preferred: 120
        )
    }
}