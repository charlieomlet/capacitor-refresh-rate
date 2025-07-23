import Foundation
import QuartzCore
import WebKit

@objc public class RefreshRate: NSObject {
    private var originalRange: Any? = nil

    @objc public func setRefreshRate(hz: Double, webView: WKWebView?) {
        DispatchQueue.main.async {
            guard #available(iOS 15.0, *), let webView = webView else { return }

            let view = webView as UIView
            if self.originalRange == nil {
                self.originalRange = view.preferredFrameRateRange
            }

            view.preferredFrameRateRange = CAFrameRateRange(
                minimum: Float(hz),
                maximum: Float(hz),
                preferred: Float(hz)
            )
        }
    }

    @objc public func resetRefreshRate(webView: WKWebView?) {
        DispatchQueue.main.async {
            guard #available(iOS 15.0, *),
                  let webView = webView,
                  let saved = self.originalRange as? CAFrameRateRange else {
                return
            }

            let view = webView as UIView
            view.preferredFrameRateRange = saved
            self.originalRange = nil
        }
    }
}