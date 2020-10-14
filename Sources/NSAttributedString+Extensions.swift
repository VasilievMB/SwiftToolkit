//
//  NSAttributedString+Extensions.swift
//  Demo
//
//  Created by Mikhail on 24.04.2020.
//  Copyright © 2020 glvrzzz. All rights reserved.
//

import Foundation

public typealias StringAttributes = [ NSAttributedString.Key : Any ]

extension String {
    
    public func attributed(with attributes: StringAttributes) -> NSAttributedString {
        return NSAttributedString(string: self, attributes: attributes)
    }
    
}

extension NSAttributedString {
    
    public var fullRange: NSRange {
        return NSRange(location: 0, length: length)
    }
    
}

extension Array where Self.Element == NSAttributedString {

    public func joined() -> NSAttributedString {
        let result = NSMutableAttributedString()
        result.beginEditing()
        for string in self {
            result.append(string)
        }
        result.endEditing()
        return result
    }
    
    public func joined(separator: NSAttributedString) -> NSAttributedString {
        let result = NSMutableAttributedString()
        result.beginEditing()
        let lastIndex = endIndex - 1
        for (index, string) in enumerated() {
            result.append(string)
            if index != lastIndex {
                result.append(separator)
            }
        }
        result.endEditing()
        return result
    }
    
    public func joined(separator: String) -> NSAttributedString {
        let result = NSMutableAttributedString()
        result.beginEditing()
        let lastIndex = endIndex - 1
        for (index, string) in enumerated() {
            result.append(string)
            if index != lastIndex {
                var endingAttributes: StringAttributes?
                string.enumerateAttributes(in: string.fullRange, options: .reverse) { (attributes, _, stop) in
                    endingAttributes = attributes
                    stop.pointee = true
                }
                let attributedSeparator = NSAttributedString(string: separator, attributes: endingAttributes)
                result.append(attributedSeparator)
            }
        }
        result.endEditing()
        return result
    }
    
}

