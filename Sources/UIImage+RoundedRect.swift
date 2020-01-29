//
//  UIImage+RoundedRect.swift
//  SwiftToolkit
//
//  Created by Mikhail on 29.01.2020.
//  Copyright © 2020 glvrzzz. All rights reserved.
//

import UIKit

public extension UIImage {
    
    class func roundedRect(fillColor: UIColor, cornerRadius: CGFloat) -> UIImage {
        let size = CGSize(width: 2 * cornerRadius, height: 2 * cornerRadius)
        let rect = CGRect(origin: .zero, size: size)
        let capInsets = UIEdgeInsets(top: cornerRadius, left: cornerRadius, bottom: cornerRadius, right: cornerRadius)
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            fillColor.setFill()
            UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).fill()
        }.resizableImage(withCapInsets: capInsets, resizingMode: .tile)
    }
    
}
