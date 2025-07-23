import Foundation
import QuartzCore

@objc public class RefreshRate: NSObject {
    private var displayLink: CADisplayLink?
    private var originalRange: Any?

    @objc public func setRefreshRate(hz: Double) {
        guard #available(iOS 15.0, *) else { return }

        // Invalidate any existing display link
        displayLink?.invalidate()

        // Create new display link
        let link = CADisplayLink(target: self, selector: #selector(self.tick))

        // Save original range if not already stored
        if originalRange == nil {
            originalRange = link.preferredFrameRateRange
        }

        // Set new desired frame rate range
        link.preferredFrameRateRange = CAFrameRateRange(
            minimum: Float(hz),
            maximum: Float(hz),
            preferred: Float(hz)
        )

        link.add(to: .main, forMode: .common)
        displayLink = link
    }

    @objc public func resetRefreshRate() {
        guard #available(iOS 15.0, *) else { return }

        displayLink?.invalidate()

        // Restore original frame rate range if available
        if let saved = originalRange as? CAFrameRateRange {
            let link = CADisplayLink(target: self, selector: #selector(self.tick))
            link.preferredFrameRateRange = saved
            link.add(to: .main, forMode: .common)
            displayLink = link
        }

        originalRange = nil
    }

    @objc private func tick() {
        // Required by CADisplayLink; intentionally empty
    }
}