//
//  TTView.swift
//  Vizor
//
//  Created by Gábor Librecz on 2018. 10. 26..
//  Copyright © 2018. Gábor Librecz. All rights reserved.
//

import AppKit

typealias TTView = TTAccessibleView

extension TTView {
    @objc func swizzledInitWithFrame(_ frame: NSRect) -> TTView {
        _ = swizzledInitWithFrame(frame)

        addObserver(self,
                    forKeyPath: (\TTView.profile?.BackgroundColorWrapper)._kvcKeyPathString!,
                    options: [], context: nil)
        addObserver(self,
                    forKeyPath: (\TTView.profile?.isBackgroundOpaque)._kvcKeyPathString!,
                    options: [], context: nil)

        return self
    }

    @objc func swizzledObserveValueForKeyPath(_ keyPath: NSString, of object: Any, change: [NSKeyValueChangeKey: Any], context: UnsafeMutableRawPointer) {
        if keyPath as String == (\TTView.profile?.isBackgroundOpaque)._kvcKeyPathString!
            || keyPath as String == (\TTView.profile?.BackgroundColorWrapper)._kvcKeyPathString!,
            profile != nil {
            updateBackgroundAlpha()

            return
        }

        swizzledObserveValueForKeyPath(keyPath, of: object,
                                       change: change, context: context)
    }

    @objc func swizzledAlphaForBackground() -> CDouble {
        var alphaForBackground = swizzledAlphaForBackground()

        if let BackgroundColorWrapper = profile?.BackgroundColorWrapper {
            alphaForBackground = CDouble(BackgroundColorWrapper.alphaComponent)
        }

        return alphaForBackground
    }

    @objc func updateBackgroundAlpha() {
        fatalError()
    }

    @objc var profile: TTProfile? {
        fatalError()
    }
}
