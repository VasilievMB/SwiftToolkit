//
//  Comparable+Clamp.swift
//  SwiftToolkit
//
//  Created by Mikhail on 13.03.2020.
//  Copyright © 2020 glvrzzz. All rights reserved.
//

import Foundation

extension Comparable {
    
    func clamped(to limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
    
    mutating func clamp(to limits: ClosedRange<Self>) {
        self = clamped(to: limits)
    }
}
