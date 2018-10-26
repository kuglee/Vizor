//
//  TTTabController.swift
//  Vizor
//
//  Created by Gábor Librecz on 2018. 10. 26..
//  Copyright © 2018. Gábor Librecz. All rights reserved.
//

import Foundation

typealias TTTabController = NSObject

extension TTTabController {
    @objc var activePane: TTAccessibleView {
        fatalError()
    }
}
