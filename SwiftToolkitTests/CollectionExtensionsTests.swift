//
//  CollectionExgensionsTests.swift
//  SwiftToolkitTests
//
//  Created by Mikhail on 16.03.2022.
//  Copyright © 2022 Mikhail. All rights reserved.
//

import XCTest
@testable import SwiftToolkit

class CollectionExtensionsTests: XCTestCase {

    func testFullRange() throws {
        XCTAssertEqual([1, 2, 3].fullRange, 0..<3)
        XCTAssertTrue([].fullRange.isEmpty)
    }

    func testChunks() throws {
        XCTAssertEqual([0, 1, 2, 3, 4, 5, 6, 7, 8, 9].chunked(by: 4), [[0, 1, 2, 3], [4, 5, 6, 7], [8, 9]])
        XCTAssertEqual([0, 1, 2].chunked(by: 4), [[0, 1, 2]])
        
        let emptyArray: [Int] = []
        XCTAssertEqual(emptyArray.chunked(by: 1), [])
    }

}
