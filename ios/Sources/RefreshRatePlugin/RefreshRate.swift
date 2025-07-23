import Foundation
import QuartzCore
import WebKit

@objc public class RefreshRate: NSObject {
    private var displayLink: CADisplayLink?
    private var originalRange: CAFrameRateRange?

    @objc public func setRefreshRate(hz: Double) {
        guard #available(iOS 15.0, *) else { return }

        // Stop any existing display link
        displayLink?.invalidate()

        // Create new display link
        displayLink = CADisplayLink(target: self, selector: #selector(self.tick))
        
        // Save original range the first time
        if originalRange == nil {
            originalRange = displayLink?.preferredFrameRateRange
        }

        // Set the new preferred refresh rate
        displayLink?.preferredFrameRateRange = CAFrameRateRange(
            minimum: Float(hz),
            maximum: Float(hz),
            preferred: Float(hz)
        )

        // Add to run loop to activate it
        displayLink?.add(to: .main, forMode: .common)
    }

    @objc public func resetRefreshRate() {
        guard #available(iOS 15.0, *) else { return }

        // Invalidate current display link
        displayLink?.invalidate()

        // Restore original frame rate range if we saved it
        if let original = originalRange {
            displayLink = CADisplayLink(target: self, selector: #selector(self.tick))
            displayLink?.preferredFrameRateRange = original
            displayLink?.add(to: .main, forMode: .common)
        }

        // Clear stored values
        originalRange = nil
    }

    // No-op tick method — required for CADisplayLink target
    @objc private func tick() {
        // Intentionally empty
    }
}