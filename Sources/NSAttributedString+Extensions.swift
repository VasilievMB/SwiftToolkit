//
//  NSAttributedString+Extensions.swift
//  Demo
//
//  Created by Mikhail on 24.04.2020.
//  Copyright © 2020 glvrzzz. All rights reserved.
//

import Foundation

typealias StringAttributes = [ NSAttributedString.Key : Any ]

extension String {
    
    func attributed(with attributes: StringAttributes) -> NSAttributedString {
        return NSAttributedString(string: self, attributes: attributes)
    }
    
}

