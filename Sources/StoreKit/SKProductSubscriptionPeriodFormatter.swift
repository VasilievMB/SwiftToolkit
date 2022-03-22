//
//  SKProductSubscriptionPeriodFormatter.swift
//  SwiftToolkit
//
//  Created by Mikhail on 15.03.2022.
//  Copyright © 2022 Mikhail. All rights reserved.
//

import StoreKit

public class SKProductSubscriptionPeriodFormatter {
    
    private let dateComponentsFormatter: DateComponentsFormatter
    
    public init() {
        dateComponentsFormatter = DateComponentsFormatter()
        dateComponentsFormatter.allowedUnits = [.day, .weekOfMonth, .month, .year]
        dateComponentsFormatter.maximumUnitCount = 1
        dateComponentsFormatter.allowsFractionalUnits = false
        dateComponentsFormatter.unitsStyle = .full
    }
    
    open var calendar: Calendar? {
        get {
            dateComponentsFormatter.calendar
        }
        set {
            dateComponentsFormatter.calendar = newValue
        }
    }
    
    private func calendarComponent(for unit: SKProduct.PeriodUnit) -> Calendar.Component {
        switch unit {
        case .day:
            return .day
        case .week:
            return .weekOfMonth
        case .month:
            return .month
        case .year:
            return .year
        }
    }
    
    public func string(from subscriptionPeriod: SKProductSubscriptionPeriod) -> String? {
        let component = calendarComponent(for: subscriptionPeriod.unit)
        var dateComponents = DateComponents()
        dateComponents.setValue(subscriptionPeriod.numberOfUnits, for: component)
        return dateComponentsFormatter.string(from: dateComponents)
    }
    
}

extension SKProductSubscriptionPeriod {
    
    public var localizedDescription: String {
        let formatter = SKProductSubscriptionPeriodFormatter()
        return formatter.string(from: self) ?? ""
    }
    
}
