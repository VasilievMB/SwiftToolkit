//
//  UIColor+RGBA.swift
//  SwiftToolkit
//
//  Created by Mikhail on 12/08/2019.
//  Copyright © 2019 Mikhail. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(rgba: UInt32) {
        assert(rgba <= 0xFFFFFFFF)
        let r = UInt8(rgba >> 24)
        let g = UInt8(rgba >> 16 & 0xFF)
        let b = UInt8(rgba >> 8 & 0xFF)
        let a = UInt8(rgba & 0xFF)
        self.init(r8: r, g8: g, b8: b, a8: a)
    }
    
    convenience init(rgb: UInt32) {
        assert(rgb <= 0xFFFFFF)
        let r = UInt8(rgb >> 16)
        let g = UInt8(rgb >> 8 & 0xFF)
        let b = UInt8(rgb & 0xFF)
        self.init(r8: r, g8: g, b8: b)
    }
    
    convenience init(r8: UInt8, g8: UInt8, b8: UInt8, a8: UInt8 = UInt8.max) {
        let max = CGFloat(UInt8.max)
        self.init(red: CGFloat(r8) / max,
                  green: CGFloat(g8) / max,
                  blue: CGFloat(b8) / max,
                  alpha: CGFloat(a8) / max)
    }
}
