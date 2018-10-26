//
//  NSViewExtension.swift
//  Vizor
//
//  Created by Gábor Librecz on 2018. 10. 26..
//  Copyright © 2018. Gábor Librecz. All rights reserved.
//

import AppKit

extension NSView {
    func addSubview(_ view: NSView, adjustLayoutBy offset: CGFloat) {
        UserDefaults.standard.set(false,
                                  forKey: "NSConstraintBasedLayoutLogUnsatisfiable")

        if offset != 0 {
            for subview in subviews {
                subview.translatesAutoresizingMaskIntoConstraints = true

                if subview.frame.origin.y < view.frame.origin.y {
                    subview.setFrameOrigin(NSMakePoint(subview.frame.origin.x,
                                                       subview.frame.origin.y + offset))
                }
            }
        }

        addSubview(view)
    }
}
