//
//  TTBackgroundColorWell.swift
//  Vizor
//
//  Created by Gábor Librecz on 2018. 10. 26..
//  Copyright © 2018. Gábor Librecz. All rights reserved.
//

import AppKit

typealias TTBackgroundColorWell = NSColorWell

extension TTBackgroundColorWell {
    @objc func swizzledAwakeFromNib() {
        swizzledAwakeFromNib()

        if let controller =
            infoForBinding(.value)?[.observedObject] as? TTProfileArrayController {
            unbind(.value)
            bind(.value, to: controller, withKeyPath:
                [(\TTProfileArrayController.selection)._kvcKeyPathString!,
                 (\TTProfile.BackgroundColorWrapper)._kvcKeyPathString!].joined(separator: "."), options: nil)
        }
    }
}
