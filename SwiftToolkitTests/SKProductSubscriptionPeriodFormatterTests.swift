//
//  SKProductSubscriptionPeriodFormatterTests.swift
//  SwiftToolkitTests
//
//  Created by Mikhail on 15.03.2022.
//  Copyright © 2022 Mikhail. All rights reserved.
//

import XCTest
import StoreKit
@testable import SwiftToolkit

class SKProductSubscriptionPeriodFormatterTests: XCTestCase {

    func testFormatting() throws {
        let formatter = SKProductSubscriptionPeriodFormatter()
        
        let string = try XCTUnwrap(formatter.string(from: SKProductSubscriptionPeriod()))
        XCTAssertEqual(string, "0 days")
    }

}
