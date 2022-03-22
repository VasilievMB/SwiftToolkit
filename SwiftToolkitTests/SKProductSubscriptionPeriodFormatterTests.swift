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

private extension SKProductSubscriptionPeriod {
    
    convenience init(numberOfUnits: Int, unit: SKProduct.PeriodUnit) {
        self.init()
        setValue(NSNumber(value: numberOfUnits), forKey: "numberOfUnits")
        setValue(unit.rawValue, forKey: "unit")
    }
    
}

class SKProductSubscriptionPeriodFormatterTests: XCTestCase {

    func testFormatting() throws {
        let formatter = SKProductSubscriptionPeriodFormatter()
        formatter.calendar?.locale = Locale(identifier: "en_US")
        
        XCTAssertEqual(formatter.string(from: SKProductSubscriptionPeriod(numberOfUnits: 1, unit: .day)), "1 day")
        XCTAssertEqual(formatter.string(from: SKProductSubscriptionPeriod(numberOfUnits: 2, unit: .day)), "2 days")
        XCTAssertEqual(formatter.string(from: SKProductSubscriptionPeriod(numberOfUnits: 1, unit: .week)), "1 week")
        XCTAssertEqual(formatter.string(from: SKProductSubscriptionPeriod(numberOfUnits: 3, unit: .week)), "3 weeks")
        XCTAssertEqual(formatter.string(from: SKProductSubscriptionPeriod(numberOfUnits: 1, unit: .month)), "1 month")
        XCTAssertEqual(formatter.string(from: SKProductSubscriptionPeriod(numberOfUnits: 6, unit: .month)), "6 months")
        XCTAssertEqual(formatter.string(from: SKProductSubscriptionPeriod(numberOfUnits: 1, unit: .year)), "1 year")
        XCTAssertEqual(formatter.string(from: SKProductSubscriptionPeriod(numberOfUnits: 2, unit: .year)), "2 years")
    }

}
