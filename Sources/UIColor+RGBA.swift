//
//  UIColor+RGBA.swift
//  SwiftToolkit
//
//  Created by Mikhail on 12/08/2019.
//  Copyright © 2019 glvrzzz. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(rgba: UInt32) {
        assert(rgba <= 0xFFFFFFFF)
        let (r, g, b, a): (UInt8, UInt8, UInt8, UInt8) = (
            UInt8(rgba >> 24),
            UInt8(rgba >> 16 & 0xFF),
            UInt8(rgba >> 8 & 0xFF),
            UInt8(rgba & 0xFF)
        )
        self.init(r8: r, g8: g, b8: b, a8: a)
    }
    
    convenience init(rgb: UInt32) {
        assert(rgb <= 0xFFFFFF)
        let (r, g, b): (UInt8, UInt8, UInt8) = (
            UInt8(rgb >> 16),
            UInt8(rgb >> 8 & 0xFF),
            UInt8(rgb & 0xFF)
        )
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
