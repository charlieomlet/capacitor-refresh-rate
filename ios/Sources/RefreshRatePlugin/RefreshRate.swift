import Foundation
import QuartzCore
import WebKit

@objc public class RefreshRate: NSObject {
    private var originalRange: CAFrameRateRange? = nil

    @objc public func setRefreshRate(hz: Double, webView: WKWebView?) {
        DispatchQueue.main.async {
            if #available(iOS 15.0, *), let webView = webView {
                if self.originalRange == nil {
                    self.originalRange = webView.preferredFrameRateRange
                }
                webView.preferredFrameRateRange = CAFrameRateRange(
                    minimum: Float(hz),
                    maximum: Float(hz),
                    preferred: Float(hz)
                )
            }
        }
    }

    @objc public func resetRefreshRate(webView: WKWebView?) {
        DispatchQueue.main.async {
            if #available(iOS 15.0, *), let webView = webView, let original = self.originalRange {
                webView.preferredFrameRateRange = original
                self.originalRange = nil
            }
        }
    }
}