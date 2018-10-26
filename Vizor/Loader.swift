//
//  Loader.swift
//  Vizor
//
//  Created by Gábor Librecz on 2018. 10. 26..
//  Copyright © 2018. Gábor Librecz. All rights reserved.
//

import AppKit
import os.log
import Swizzle

@objc class SIMBLPlugin: NSObject {
    class func swizzle() throws {
        try swizzleInstanceMethodObjcString(of: "TTView",
                                            from: "initWithFrame:",
                                            to: #selector(TTView.swizzledInitWithFrame))
        try swizzleInstanceMethodObjcString(of: "TTView",
                                            from: "observeValueForKeyPath:ofObject:change:context:",
                                            to: #selector(TTView.swizzledObserveValueForKeyPath))
        try swizzleInstanceMethodObjcString(of: "TTView",
                                            from: "alphaForBackground",
                                            to: #selector(TTView.swizzledAlphaForBackground))

        try swizzleInstanceMethodObjcString(of: "TTProfile",
                                            from: "effectiveValueForKey:",
                                            to: #selector(TTProfile.swizzledEffectiveValueForKey))

        try swizzleInstanceMethodObjcString(of: "TTAppPrefsController",
                                            from: "windowDidLoad",
                                            to: #selector(TTAppPrefsController.swizzledWindowDidLoad))

        try swizzleInstanceMethodObjcString(of: "TTBackgroundColorWell",
                                            from: "awakeFromNib",
                                            to: #selector(TTBackgroundColorWell.swizzledAwakeFromNib))
    }

    @objc class func initializePlugin() {
        let log = OSLog(subsystem: Bundle(for: self).bundleIdentifier!,
                        category: Bundle(for: self).object(forInfoDictionaryKey: "CFBundleName") as! String)

        os_log("Swizzling \"%@\"...", log: log, Bundle.main.bundleIdentifier!)

        do {
            try swizzle()
        } catch {
            switch error {
            case let SwizzleError.classNotFound(errorMessage):
                os_log("%{public}@", log: log, type: .error, errorMessage)
            case let SwizzleError.methodNotFound(errorMessage):
                os_log("%{public}@", log: log, type: .error, errorMessage)
            default:
                os_log("Unexpected error: %{public}@", log: log, type: .error, error as CVarArg)
            }

            os_log("Could not swizzle \"%@\"!", log: log, type: .error, Bundle.main.bundleIdentifier!)
            return
        }

        os_log("\"%@\" was swizzled successfully!", log: log, Bundle.main.bundleIdentifier!)

        if let TTApplicationClass = NSClassFromString("TTApplication") {
            let currentApp = TTApplicationClass.shared as TTApplication
            currentApp.afterApplicationDidFinishLaunching()
        }
    }
}
