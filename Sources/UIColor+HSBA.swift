//
//  UIColor+HSBA.swift
//  SwiftToolkit
//
//  Created by Mikhail on 13.03.2020.
//  Copyright © 2020 glvrzzz. All rights reserved.
//

import UIKit

extension UIColor {
    
    struct HSBAComponents {
        var hue: CGFloat
        var saturation: CGFloat
        var brightness: CGFloat
        var alpha: CGFloat
        
        init(hue: CGFloat = 0, saturation: CGFloat = 0, brightness: CGFloat = 0, alpha: CGFloat = 0) {
            self.hue = hue
            self.saturation = saturation
            self.brightness = brightness
            self.alpha = alpha
        }
    }
    
    convenience init(hsba components: HSBAComponents) {
        self.init(hue: components.hue,
                  saturation: components.saturation,
                  brightness: components.brightness,
                  alpha: components.alpha)
    }
    
    var hsbaComponents: HSBAComponents? {
        var components = HSBAComponents()
        if getHue(&components.hue,
                  saturation: &components.saturation,
                  brightness: &components.brightness,
                  alpha: &components.alpha) {
            return components
        } else if getWhite(&components.brightness, alpha: &components.alpha) {
            return components
        } else {
            return nil
        }
    }
    
    func withBrightnessComponent(_ brightness: CGFloat) -> UIColor {
        if var components = self.hsbaComponents {
            components.brightness = brightness
            return UIColor(hsba: components)
        } else {
            return self
        }
    }
    
    func withSaturationComponent(_ saturation: CGFloat) -> UIColor {
        if var components = self.hsbaComponents {
            components.saturation = saturation
            return UIColor(hsba: components)
        } else {
            return self
        }
    }
    
    func withBrightnessAdjustment(_ brightnessAdjustment: CGFloat) -> UIColor {
        return self.withHSBAAdjustment(HSBAComponents(brightness: brightnessAdjustment))
    }
    
    func withHSBAAdjustment(_ adjustmentComponents: HSBAComponents) -> UIColor {
        if var components = self.hsbaComponents {
            let componentRange: ClosedRange<CGFloat> = 0...1
            components.hue = (components.hue + adjustmentComponents.hue).clamped(to: componentRange)
            components.saturation = (components.saturation + adjustmentComponents.saturation).clamped(to: componentRange)
            components.brightness = (components.brightness + adjustmentComponents.brightness).clamped(to: componentRange)
            components.alpha = (components.alpha + adjustmentComponents.alpha).clamped(to: componentRange)
            return UIColor(hsba: components)
        } else {
            return self
        }
    }
}


