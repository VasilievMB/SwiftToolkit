//
//  NSAttributedString+Extensions.swift
//  Demo
//
//  Created by Mikhail on 24.04.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

import Foundation

public protocol AttributedStringConvertable {
    func asAttributedString() -> NSAttributedString
}

extension String: AttributedStringConvertable {
    
    public func asAttributedString() -> NSAttributedString {
        return NSAttributedString(string: self)
    }
}

extension NSAttributedString: AttributedStringConvertable {
    
    public func asAttributedString() -> NSAttributedString {
        return self
    }
}

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

public extension Array where Element: AttributedStringConvertable {
    
    func joined() -> NSAttributedString {
        return createAttributedStringEnumerating { partialResult, element, _ in
            partialResult.append(element)
        }
    }
    
    func joined(separator: NSAttributedString) -> NSAttributedString {
        return createAttributedStringEnumerating { partialResult, element, isLast in
            partialResult.append(element)
            if !isLast {
                partialResult.append(separator)
            }
        }
    }
    
    func joined(separator: String) -> NSAttributedString {
        return createAttributedStringEnumerating { partialResult, element, isLast in
            partialResult.append(element)
            if !isLast {
                let attributedSeparator = NSAttributedString(string: separator, attributes: element.endingAttributes)
                partialResult.append(attributedSeparator)
            }
        }
    }
    
    private func createAttributedStringEnumerating(
        with body: (_ partialResult: NSMutableAttributedString, _ element: NSAttributedString, _ isLast: Bool) throws -> Void
    ) rethrows -> NSAttributedString {
        
        let result = NSMutableAttributedString()
        result.beginEditing()
        let lastIndex = endIndex - 1
        for (index, element) in enumerated() {
            try body(result, element.asAttributedString(), index == lastIndex)
        }
        result.endEditing()
        return NSAttributedString(attributedString: result)
    }
}
