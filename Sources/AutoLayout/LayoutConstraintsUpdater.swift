//
//  LayoutConstraintsUpdater.swift
//  SwiftToolkit
//
//  Created by Mikhail on 15.09.2021.
//

import UIKit

class LayoutConstraintsUpdater {
    
    private var activeConstraints: [NSLayoutConstraint]?
    
    func deactivateConstraints() {
        guard let constraints = activeConstraints else {
            return
        }
        NSLayoutConstraint.deactivate(constraints)
        activeConstraints = nil
    }
    
    func updateConstraints(_ constraints: [NSLayoutConstraint]) {
        deactivateConstraints()
        NSLayoutConstraint.activate(constraints)
        activeConstraints = constraints
    }
    
}
