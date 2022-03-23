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
    
    func testIndicesOfEquatable() {
        XCTAssertEqual([1, 2, 3].indices(of: 4), [])
        XCTAssertEqual([1, 2, 3, 1, 5, 1].indices(of: 1), [0, 3, 5])
    }
    
    func testRemoveEquatable() {
        
        var array = [1, 2, 3, 1, 3, 5]
        
        array.remove(4)
        XCTAssertEqual(array, [1, 2, 3, 1, 3, 5])
        
        array.remove(5)
        XCTAssertEqual(array, [1, 2, 3, 1, 3])
        
        array.remove(1)
        XCTAssertEqual(array, [2, 3, 3])
    }

}
