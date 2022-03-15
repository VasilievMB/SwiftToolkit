//
//  UIEdgeInsets+Extensions.swift
//  SwiftToolkit
//
//  Created by Mikhail on 11.01.2021.
//

import UIKit

extension UIEdgeInsets {
    
    public var horizontal: CGFloat {
        return left + right
    }
    
    public var vertical: CGFloat {
        return top + bottom
    }
    
    init(uniform value: CGFloat) {
        self.init(top: value, left: value, bottom: value, right: value)
    }
    
    static func * (insets: UIEdgeInsets, scalar: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: insets.top * scalar,
                            left: insets.left * scalar,
                            bottom: insets.bottom * scalar,
                            right: insets.right * scalar)
    }
    
    static func + (left: UIEdgeInsets, right: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsets(top: left.top + right.top,
                            left: left.left + right.left,
                            bottom: left.bottom + right.bottom,
                            right: left.right + right.right)
    }
    
    static func - (left: UIEdgeInsets, right: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsets(top: left.top - right.top,
                            left: left.left - right.left,
                            bottom: left.bottom - right.bottom,
                            right: left.right - right.right)
    }
    
    static func top(_ value: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: value, left: 0, bottom: 0, right: 0)
    }
    
    static func left(_ value: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: value, bottom: 0, right: 0)
    }
    
    static func bottom(_ value: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: value, right: 0)
    }
    
    static func right(_ value: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: value)
    }
    
}

