//
//  NSAttributedStringExtensionsTests.swift
//  SwiftToolkitTests
//
//  Created by Mikhail on 14.10.2020.
//  Copyright © 2020 glvrzzz. All rights reserved.
//

import XCTest
@testable import SwiftToolkit

class NSAttributedStringExtensionsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testJoined() throws {
        let strings = [
            "string0".attributed(with: [ .foregroundColor : UIColor.red ]),
            "string1".attributed(with: [ .foregroundColor : UIColor.green ]),
            "string2".attributed(with: [ .foregroundColor : UIColor.blue ]),
        ]
        
        XCTAssertEqual(strings.joined().string, "string0string1string2")
        
        let separator = NSAttributedString(string: ", ")
        XCTAssertEqual(strings.joined(separator: separator).string, "string0, string1, string2")
        
        let joinedString = strings.joined(separator: ", ")
        
        XCTAssertEqual(joinedString.string, "string0, string1, string2")
        XCTAssertEqual(joinedString.attributes(at: 7, effectiveRange: nil)[NSAttributedString.Key.foregroundColor] as? UIColor, UIColor.red)
        XCTAssertEqual(joinedString.attributes(at: 8, effectiveRange: nil)[NSAttributedString.Key.foregroundColor] as? UIColor, UIColor.red)
        XCTAssertEqual(joinedString.attributes(at: 16, effectiveRange: nil)[NSAttributedString.Key.foregroundColor] as? UIColor, UIColor.green)
        XCTAssertEqual(joinedString.attributes(at: 17, effectiveRange: nil)[NSAttributedString.Key.foregroundColor] as? UIColor, UIColor.green)
    }
    
    func testRange() throws {
        
        let emptyString = NSAttributedString()
        XCTAssertEqual(emptyString.fullRange.location, 0)
        XCTAssertEqual(emptyString.fullRange.length, 0)
        
        let string = NSAttributedString(string: "Test")
        XCTAssertEqual(string.fullRange.length, 4)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
