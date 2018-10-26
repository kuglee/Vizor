//
//  TTPane.swift
//  Vizor
//
//  Created by Gábor Librecz on 2018. 10. 26..
//  Copyright © 2018. Gábor Librecz. All rights reserved.
//

import Foundation

typealias TTPane = TTAccessibleView

extension TTPane {
    @objc var view: TTView {
        fatalError()
    }
}
