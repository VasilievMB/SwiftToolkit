//
//  UIImage+SolidColor.swift
//  SwiftToolkit
//
//  Created by Mikhail on 29.01.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

import UIKit

public extension UIImage {
    
    class func imageWithSolidColor(_ color: UIColor,
                     size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            color.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }

}
