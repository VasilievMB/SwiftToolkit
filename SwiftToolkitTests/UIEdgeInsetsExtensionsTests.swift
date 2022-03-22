//
//  UIEdgeInsetsExtensionsTests.swift
//  SwiftToolkitTests
//
//  Created by Mikhail on 22.03.2022.
//  Copyright © 2022 Mikhail. All rights reserved.
//

import XCTest
@testable import SwiftToolkit

class UIEdgeInsetsExtensionsTests: XCTestCase {

    func testHorizontal() throws {
        XCTAssertEqual(UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4).horizontal, 6)
    }

    func testVertical() throws {
        XCTAssertEqual(UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4).vertical, 4)
    }
    
    func testUniform() {
        let insets = UIEdgeInsets(uniform: 1)
        XCTAssertEqual(insets.top, 1)
        XCTAssertEqual(insets.left, 1)
        XCTAssertEqual(insets.bottom, 1)
        XCTAssertEqual(insets.right, 1)
    }
    
    func testMultiply() {
        let insets = UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4)
        XCTAssertEqual(insets * 7, UIEdgeInsets(top: 7, left: 14, bottom: 21, right: 28))
    }
    
    func testAddition() {
        let insets1 = UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4)
        let insets2 = UIEdgeInsets(top: 43, left: 72, bottom: 13, right: 66)
        XCTAssertEqual(insets1 + insets2, UIEdgeInsets(top: 44, left: 74, bottom: 16, right: 70))
    }
    
    func testSubtraction() {
        let insets1 = UIEdgeInsets(top: 43, left: 72, bottom: 13, right: 66)
        let insets2 = UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4)
        XCTAssertEqual(insets1 - insets2, UIEdgeInsets(top: 42, left: 70, bottom: 10, right: 62))
    }
    
    func testConvenience() {
        XCTAssertEqual(UIEdgeInsets(top: 1, left: 0, bottom: 0, right: 0), .top(1))
        XCTAssertEqual(UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 0), .left(1))
        XCTAssertEqual(UIEdgeInsets(top: 0, left: 0, bottom: 1, right: 0), .bottom(1))
        XCTAssertEqual(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 1), .right(1))
    }
    
}
