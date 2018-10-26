//
//  TTWindowController.swift
//  Vizor
//
//  Created by Gábor Librecz on 2018. 10. 26..
//  Copyright © 2018. Gábor Librecz. All rights reserved.
//

import AppKit

typealias TTWindowController = NSWindowController

extension TTWindowController {
    @objc var tabControllers: Array<TTTabController> {
        fatalError()
    }
}
