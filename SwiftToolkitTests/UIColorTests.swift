//
//  UIColorTests.swift
//  SwiftToolkitTests
//
//  Created by Mikhail on 12/08/2019.
//  Copyright © 2019 glvrzzz. All rights reserved.
//

import XCTest
@testable import SwiftToolkit

class UIColorTests: XCTestCase {
    
    private let white = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    private let black = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    private let red = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
    private let green = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
    private let blue = UIColor(red: 0, green: 0, blue: 1, alpha: 1)

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testHexRGB() {
        XCTAssert(UIColor(rgb: 0xFFFFFF) == white)
        XCTAssert(UIColor(rgb: 0xFF0000) == red)
        XCTAssert(UIColor(rgb: 0x00FF00) == green)
        XCTAssert(UIColor(rgb: 0x0000FF) == blue)
        XCTAssert(UIColor(rgb: 0x12FACB) == UIColor(red: 18.0 / 255, green: 250.0 / 255, blue: 203.0 / 255, alpha: 1))
    }

    func testHexRGBA() {
        XCTAssert(UIColor(rgba: 0xFFFFFFFF) == white)
        XCTAssert(UIColor(rgba: 0x00000000) == black)
        XCTAssert(UIColor(rgba: 0xFF0000FF) == red)
        XCTAssert(UIColor(rgba: 0x00FF00FF) == green)
        XCTAssert(UIColor(rgba: 0x0000FFFF) == blue)
        XCTAssert(UIColor(rgba: 0x12FACB3E) == UIColor(red: 18.0 / 255, green: 250.0 / 255, blue: 203.0 / 255, alpha: 62.0 / 255))
    }
    
    func test8BitInitializer() {
        XCTAssert(UIColor(r8: 255, g8: 255, b8: 255, a8: 255) == white)
        XCTAssert(UIColor(r8: 0, g8: 0, b8: 0, a8: 0) == black)
        XCTAssert(UIColor(r8: 255, g8: 255, b8: 255) == white)
        XCTAssert(UIColor(r8: 255, g8: 0, b8: 0) == red)
        XCTAssert(UIColor(r8: 0, g8: 255, b8: 0) == green)
        XCTAssert(UIColor(r8: 0, g8: 0, b8: 255) == blue)
        XCTAssert(UIColor(r8: 123, g8: 12, b8: 65, a8: 128) == UIColor(red: 123.0 / 255, green: 12.0 / 255, blue: 65.0 / 255, alpha: 128.0 / 255))
    }

}
