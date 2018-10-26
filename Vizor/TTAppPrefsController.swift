//
//  TTAppPrefsController.swift
//  Vizor
//
//  Created by Gábor Librecz on 2018. 10. 26..
//  Copyright © 2018. Gábor Librecz. All rights reserved.
//

import AppKit

typealias TTAppPrefsController = NSWindowController

extension TTAppPrefsController {
    @objc func swizzledWindowDidLoad() {
        swizzledWindowDidLoad()

        if let textPreferencesTabView = profileTabView.tabViewItem(at: 0).view {
            let isBackgroundOpaqueButton =
                NSButton(preferencesCheckboxWithTitle: "Keep background colors opaque")
            isBackgroundOpaqueButton.setFrameOrigin(NSMakePoint(14, 393))

            isBackgroundOpaqueButton.bind(.value, to: profilesController, withKeyPath:
                [(\TTProfileArrayController.selection)._kvcKeyPathString!,
                 (\TTProfile.isBackgroundOpaque)._kvcKeyPathString!].joined(separator: "."),
                                          options: nil)

            textPreferencesTabView.addSubview(isBackgroundOpaqueButton,
                                              adjustLayoutBy: -23)
        }
    }

    @objc var profilesController: TTProfileArrayController {
        fatalError()
    }

    @objc var profileTabView: NSTabView {
        return value(forKey: "_profileTabView") as! NSTabView
    }
}
