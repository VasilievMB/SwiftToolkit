//
//  SeparatorView.swift
//  SwiftToolkit
//
//  Created by Mikhail on 21/12/2018.
//  Copyright © 2018 Mikhail. All rights reserved.
//

import UIKit

class SeparatorView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    internal func configure() {
        isUserInteractionEnabled = false
        setContentHuggingPriority(.required, for: .horizontal)
        setContentHuggingPriority(.required, for: .vertical)
        setContentCompressionResistancePriority(.required, for: .horizontal)
        setContentCompressionResistancePriority(.required, for: .vertical)
    }

    final var thickness: CGFloat = 1 { // in pixels
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize : CGSize {
        let scale = traitCollection.displayScale
        let pixel = thickness / scale
        return CGSize(width: pixel, height: pixel)
    }
    
}
