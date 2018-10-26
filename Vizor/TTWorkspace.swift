//
//  TTWorkspace.swift
//  Vizor
//
//  Created by Gábor Librecz on 2018. 10. 26..
//  Copyright © 2018. Gábor Librecz. All rights reserved.
//

import AppKit

typealias TTWorkspace = NSObject

extension TTWorkspace {
    @objc var windowControllers: Array<TTWindowController> {
        fatalError()
    }
}
