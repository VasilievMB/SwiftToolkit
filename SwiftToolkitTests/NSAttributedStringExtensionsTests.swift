//
//  NSAttributedStringExtensionsTests.swift
//  SwiftToolkitTests
//
//  Created by Mikhail on 14.10.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

import XCTest
@testable import SwiftToolkit

class NSAttributedStringExtensionsTests: XCTestCase {

    func testJoined() throws {
        
        let color0 = UIColor.red
        let color1 = UIColor.green
        let color2 = UIColor.blue
        
        
        let strings = [
            "string0".attributed(with: [ .foregroundColor : color0 ]),
            "string1".attributed(with: [ .foregroundColor : color1 ]),
            "string2".attributed(with: [ .foregroundColor : color2 ]),
        ]
        
        XCTAssertEqual(strings.joined().string, "string0string1string2")
        
        let joinedString = strings.joined(separator: ", ")
        
//                                           0123456789012345678901234
        XCTAssertEqual(joinedString.string, "string0, string1, string2")
        XCTAssertEqual(joinedString.attributes(at: 0, effectiveRange: nil)[NSAttributedString.Key.foregroundColor] as? UIColor, color0)
        XCTAssertEqual(joinedString.attributes(at: 7, effectiveRange: nil)[NSAttributedString.Key.foregroundColor] as? UIColor, color0)
        XCTAssertEqual(joinedString.attributes(at: 8, effectiveRange: nil)[NSAttributedString.Key.foregroundColor] as? UIColor, color0)
        
        XCTAssertEqual(joinedString.attributes(at: 9, effectiveRange: nil)[NSAttributedString.Key.foregroundColor] as? UIColor, color1)
        XCTAssertEqual(joinedString.attributes(at: 16, effectiveRange: nil)[NSAttributedString.Key.foregroundColor] as? UIColor, color1)
        XCTAssertEqual(joinedString.attributes(at: 17, effectiveRange: nil)[NSAttributedString.Key.foregroundColor] as? UIColor, color1)
        
        XCTAssertEqual(joinedString.attributes(at: 18, effectiveRange: nil)[NSAttributedString.Key.foregroundColor] as? UIColor, color2)
        XCTAssertEqual(joinedString.attributes(at: 24, effectiveRange: nil)[NSAttributedString.Key.foregroundColor] as? UIColor, color2)
    }
    
    func testRange() throws {
        
        let emptyString = NSAttributedString()
        XCTAssertEqual(emptyString.fullRange.location, 0)
        XCTAssertEqual(emptyString.fullRange.length, 0)
        
        let string = NSAttributedString(string: "Test")
        XCTAssertEqual(string.fullRange.length, 4)
    }

    func testEndingAttributes() {
        let originalColor = UIColor.black
        let string = NSMutableAttributedString(string: "string", attributes: [ .foregroundColor : originalColor])
        
        XCTAssertEqual(string.endingAttributes?[.foregroundColor] as? UIColor, originalColor)
        
        let endingColor = UIColor.purple
        string.addAttributes([.foregroundColor : endingColor], range: NSRange(location: 5, length: 1))
        
        XCTAssertEqual(string.endingAttributes?[.foregroundColor] as? UIColor, endingColor)
    }
}
