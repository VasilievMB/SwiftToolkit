//
//  ClampTests.swift
//  SwiftToolkitTests
//
//  Created by Mikhail on 13.03.2020.
//  Copyright © 2020 glvrzzz. All rights reserved.
//

import XCTest
@testable import SwiftToolkit

class ClampTests: XCTestCase {

    func testClamp() {
        let intValue: Int = 10
        
        XCTAssertEqual(intValue.clamped(to: 0...20), 10)
        XCTAssertEqual(intValue.clamped(to: 20...30), 20)
        XCTAssertEqual(intValue.clamped(to: 0...5), 5)
        
        var mutableIntValue: Int = 20
        mutableIntValue.clamp(to: 0...10)
        XCTAssertEqual(mutableIntValue, 10)
        
        mutableIntValue = -10
        mutableIntValue.clamp(to: (-30)...(-20))
        XCTAssertEqual(mutableIntValue, -20)
        
        let floatValue: Float = 4
        XCTAssertEqual(floatValue.clamped(to: 0...Float.pi), Float.pi)
    }
}
