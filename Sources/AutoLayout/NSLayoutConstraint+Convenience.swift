//
//  NSLayoutConstraint+Convenience.swift
//  SwiftToolkit
//
//  Created by Mikhail on 21.06.2021.
//

import UIKit

extension NSLayoutConstraint {
    
    convenience init(_ view1: AutoLayoutElement,
                     _ attribute1: NSLayoutConstraint.Attribute,
                     _ relation: NSLayoutConstraint.Relation = .equal,
                     to view2: AutoLayoutElement?,
                     _ attribute2: NSLayoutConstraint.Attribute? = nil,
                     multiplier: CGFloat = 1,
                     constant: CGFloat = 0) {
        self.init(item: view1,
                  attribute: attribute1,
                  relatedBy: relation,
                  toItem: view2,
                  attribute: attribute2 ?? attribute1,
                  multiplier: multiplier,
                  constant: constant)
    }
    
}

extension AutoLayoutElement {
    
    func constraint(_ attribute: NSLayoutConstraint.Attribute,
                    _ relation: NSLayoutConstraint.Relation = .equal,
                    to anotherView: AutoLayoutElement?,
                    _ anotherViewAttribute: NSLayoutConstraint.Attribute? = nil,
                    multiplier: CGFloat = 1,
                    constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(self,
                                  attribute,
                                  relation,
                                  to: anotherView,
                                  anotherViewAttribute ?? attribute,
                                  multiplier: multiplier,
                                  constant: constant)
    }
    
}
