//
//  NSButtonExtension.swift
//  Vizor
//
//  Created by Gábor Librecz on 2018. 10. 26..
//  Copyright © 2018. Gábor Librecz. All rights reserved.
//

import AppKit

extension NSButton {
    convenience init(preferencesCheckboxWithTitle title: String,
                     target: Any? = nil, action: Selector? = nil) {
        self.init(checkboxWithTitle: title, target: target, action: action)
        font = NSFont.systemFont(ofSize: 11)
        controlSize = .small
    }
}
