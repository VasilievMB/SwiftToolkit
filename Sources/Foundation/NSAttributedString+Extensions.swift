//
//  NSAttributedString+Extensions.swift
//  Demo
//
//  Created by Mikhail on 24.04.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

import Foundation

public extension String {
    
    func attributed(with attributes: NSAttributedString.Attributes) -> NSAttributedString {
        return NSAttributedString(string: self, attributes: attributes)
    }
    
}

public extension NSAttributedString {
    
    typealias Attributes = [ NSAttributedString.Key : Any ]
    
    var fullRange: NSRange {
        return NSRange(location: 0, length: length)
    }
    
    var endingAttributes: Attributes? {
        var endingAttributes: NSAttributedString.Attributes?
        enumerateAttributes(in: fullRange, options: .reverse) { (attributes, _, stop) in
            endingAttributes = attributes
            stop.pointee = true
        }
        return endingAttributes
    }
    
}

public extension Array where Self.Element == NSAttributedString {

    func joined() -> NSAttributedString {
        let result = NSMutableAttributedString()
        result.beginEditing()
        for string in self {
            result.append(string)
        }
        result.endEditing()
        return result
    }
    
    func joined(separator: NSAttributedString) -> NSAttributedString {
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
    
    func joined(separator: String) -> NSAttributedString {
        let result = NSMutableAttributedString()
        result.beginEditing()
        let lastIndex = endIndex - 1
        for (index, string) in enumerated() {
            result.append(string)
            if index != lastIndex {
                let attributedSeparator = NSAttributedString(string: separator, attributes: string.endingAttributes)
                result.append(attributedSeparator)
            }
        }
        result.endEditing()
        return result
    }
    
}

