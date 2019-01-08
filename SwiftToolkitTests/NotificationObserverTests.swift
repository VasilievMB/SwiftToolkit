//
//  NotificationObserverTests.swift
//  SwiftToolkitTests
//
//  Created by Mikhail on 22/12/2018.
//  Copyright © 2018 glvrzzz. All rights reserved.
//

import XCTest
@testable import SwiftToolkit

fileprivate let notificationName = NSNotification.Name.init(rawValue: "NotificationObserverTestsNotification")

class NotificationObserverTests: XCTestCase {
    
    let observer = NotificationObserver(name: notificationName)

    override func setUp() {
        
    }

    override func tearDown() {
        
    }

    func testObserving() {
        
        let expectation = XCTestExpectation(description: "notification received")
        observer.startObserving { (notification) in
            expectation.fulfill()
        }
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.1) {
            NotificationCenter.default.post(name: notificationName, object: nil)
        }
        
        wait(for: [expectation], timeout: 0.2)
    }
}
