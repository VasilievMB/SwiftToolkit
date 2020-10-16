//
//  NSLayoutConstraint+Priority.swift
//  SwiftToolkit
//
//  Created by Mikhail on 16.10.2020.
//  Copyright © 2020 glvrzzz. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    
    @discardableResult
    func prioritized(_ priority: UILayoutPriority) -> NSLayoutConstraint {
        self.priority = priority
        return self
    }
    
}
