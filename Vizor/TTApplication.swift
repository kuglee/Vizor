//
//  TTApplication.swift
//  Vizor
//
//  Created by Gábor Librecz on 2018. 10. 26..
//  Copyright © 2018. Gábor Librecz. All rights reserved.
//

import AppKit

typealias TTApplication = NSApplication

extension TTApplication {
    @objc func afterApplicationDidFinishLaunching() {
        for windowController in currentWorkspace.windowControllers {
            for tabController in windowController.tabControllers {
                let view = tabController.activePane.view

                view.addObserver(view,
                                 forKeyPath: (\TTView.profile?.BackgroundColorWrapper)._kvcKeyPathString!,
                                 options: [], context: nil)

                view.addObserver(view,
                                 forKeyPath: (\TTView.profile?.isBackgroundOpaque)._kvcKeyPathString!,
                                 options: [], context: nil)
            }
        }
    }

    @objc var currentWorkspace: TTWorkspace {
        fatalError()
    }
}
