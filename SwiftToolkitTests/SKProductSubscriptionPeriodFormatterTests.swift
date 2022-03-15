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
        formatter.calendar?.locale = Locale(identifier: "en_US")
        
        let period = SKProductSubscriptionPeriod()
        XCTAssertEqual(period.numberOfUnits, 0)
        XCTAssertEqual(period.unit, .day)
        
        let string = try XCTUnwrap(formatter.string(from: period))
        XCTAssertEqual(string, "0 days")
    }

}
