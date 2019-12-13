//
//  UserDefaultTests.swift
//  SwiftToolkitTests
//
//  Created by Mikhail on 21/12/2018.
//  Copyright © 2018 glvrzzz. All rights reserved.
//

import XCTest
@testable import SwiftToolkit

fileprivate let defaultValue: Int = 0

class UserDefaultTests: XCTestCase {

    let userDefault = UserDefault<Int>(key: "testKey",
                                       defaultValue: defaultValue)
    private var observer: UserDefaultObserver<Int>?
    
    override func setUp() {
        userDefault.removeValue()
    }

    override func tearDown() {
        observer = nil
        userDefault.removeValue()
    }

    func testInitialState() {
        XCTAssertFalse(userDefault.isStored)
        XCTAssertNil(userDefault.storedValue)
        XCTAssertEqual(userDefault.value, defaultValue)
    }
    
    func testStorage() {
        let value1: Int = 1234
        let value2: Int = 3456
        
        XCTAssertNotEqual(value1, value2)
        
        userDefault.value = value1
        XCTAssertEqual(userDefault.value, value1)
        XCTAssertEqual(userDefault.storedValue, value1)
        
        let anotherDefaults = UserDefaults()
        let anotherUserDefault = UserDefault<Int>.init(key: userDefault.key,
                                                       defaultValue: defaultValue,
                                                       defaults: anotherDefaults)
        userDefault.value = value2
        XCTAssertEqual(userDefault.value, value2)
        XCTAssertEqual(anotherUserDefault.value, value2)
    }
    
    func testRemove() {
        let value: Int = 2345345
        userDefault.value = value
        userDefault.removeValue()
        XCTAssertEqual(userDefault.value, defaultValue)
        XCTAssertFalse(userDefault.isStored)
    }

    func testObservation() {
        
        let oldValue = Int(arc4random())
        let newValue = Int(arc4random())
        
        userDefault.value = oldValue
        
        let expectation = XCTestExpectation(description: "User default value change observed")
        
        observer = userDefault.observe { (old, new) in
            XCTAssertEqual(oldValue, old)
            XCTAssertEqual(newValue, new)
            expectation.fulfill()
        }
        
        self.userDefault.value = newValue
                
        wait(for: [expectation], timeout: 1)
    }
    
}
