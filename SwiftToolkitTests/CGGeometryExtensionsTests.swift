//
//  CGGeometryExtensionsTests.swift
//  SwiftToolkitTests
//
//  Created by Mikhail on 16.10.2020.
//  Copyright © 2020 glvrzzz. All rights reserved.
//

import XCTest
@testable import SwiftToolkit


class CGGeometryExtensionsTests: XCTestCase {
    
    private let accuracy: CGFloat = 1e-15

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCGVector() throws {
        let v1 = CGVector(dx: 3, dy: 4)
        XCTAssertEqual(v1.length(), 5)
        
        let v2 = CGVector(dx: 124, dy: 634634)
        let vnorm = v2.normalized()
        XCTAssertEqual(vnorm.angle, v2.angle, accuracy: accuracy)
        XCTAssertEqual(vnorm.lengthSquared(), 1, accuracy: accuracy)
        
        XCTAssertEqual(v1 + v2, CGVector(dx: 127, dy: 634638))
        XCTAssertEqual(v1 * 2, CGVector(dx: 6, dy: 8))
        XCTAssertEqual(v1 * CGVector(dx: -2, dy: 0.5), CGVector(dx: -6, dy: 2))
        XCTAssertEqual(v1 - CGVector(dx: 1, dy: 2), CGVector(dx: 2, dy: 2))
        
        let l = CGVector.lerp(start: .zero, end: CGVector(dx: 9, dy: 12), t: 1.0/3)
        XCTAssertEqual(l, CGVector(dx: 3, dy: 4))
    }

    func testCGPoint() throws {
        let p1 = CGPoint(x: 1, y: 2)
        let p2 = CGPoint(x: 4, y: -2)
        
        XCTAssertEqual(p1.distance(to: p1), 0, accuracy: accuracy)
        XCTAssertEqual(p1.distance(to: p2), p2.distance(to: p1), accuracy: accuracy)
        XCTAssertEqual(p1.distance(to: p2), 5, accuracy: accuracy)
        
        XCTAssertEqual(CGPoint.lerp(start: CGPoint.zero, end: CGPoint(x: 4, y: -2), t: 0.25), CGPoint(x: 1, y: -0.5))
    }
    
    func testCGSize() throws {
        let s1 = CGSize(width: 1, height: 2)
        let s2 = CGSize(width: 5, height: 3)
        let s3 = CGSize(width: 2, height: 3)
        
        XCTAssertEqual(s1.aspectRatio, 0.5)
        XCTAssertEqual(s1 * 2, CGSize(width: 2, height: 4))
        XCTAssertEqual(s1.fitting(s2), CGSize(width: 1.5, height: 3))
        XCTAssertEqual(s1.filling(s2), CGSize(width: 5, height: 10))
        XCTAssertEqual(s1.fitting(s3), CGSize(width: 1.5, height: 3))
        XCTAssertEqual(s1.filling(s3), CGSize(width: 2, height: 4))
        XCTAssertEqual(s1.fitting(s1), s1)
        XCTAssertEqual(s1.filling(s1), s1)
    }
    
    func testCGRect() throws {
        let r1 = CGRect(x: 23452346, y: 34721, width: 6, height: 4)
        let r2 = CGRect(x: 1, y: 2, width: 12, height: 24)
        
        XCTAssertEqual(r1.fitting(r1), r1)
        XCTAssertEqual(r1.filling(r1), r1)
        XCTAssertEqual(r1.fitting(r2), CGRect(x: 1, y: 10, width: 12, height: 8))
        XCTAssertEqual(r1.filling(r2), CGRect(x: -11, y: 2, width: 36, height: 24))
    }

}
