//
//  TTProfile.swift
//  Vizor
//
//  Created by Gábor Librecz on 2018. 10. 26..
//  Copyright © 2018. Gábor Librecz. All rights reserved.
//

import AppKit

typealias TTProfile = NSObject

extension TTProfile {
    @objc func swizzledEffectiveValueForKey(_ key: NSString) -> AnyObject? {
        switch key {
        case "BackgroundColor" where isBackgroundOpaque:
            return backgroundColor?.withAlphaComponent(1)
        case "BackgroundColorWrapper":
            return BackgroundColorWrapper
        case "isBackgroundOpaque":
            return isBackgroundOpaque as AnyObject
        default:
            return swizzledEffectiveValueForKey(key)
        }
    }

    @objc var parentProfile: TTProfile {
        fatalError()
    }

    @objc func scopeValueForKey(_ key: NSString) -> AnyObject? {
        fatalError()
    }

    @objc var BackgroundColorWrapper: NSColor? {
        get {
            return backgroundColor
        }
        set {
            backgroundColor = newValue
        }
    }

    @objc var backgroundColor: NSColor? {
        get {
            return (scopeValueForKey("BackgroundColor")
                ?? parentProfile.scopeValueForKey("BackgroundColor")) as? NSColor
        }
        set {
            setValue(newValue, forUndefinedKey: "BackgroundColor")
        }
    }

    @objc var isBackgroundOpaque: Bool {
        get {
            return scopeValueForKey("isBackgroundOpaque") as? Bool ?? false
        }
        set {
            setValue(newValue, forUndefinedKey: "isBackgroundOpaque")
        }
    }
}
