//
//  PropertyListValue.swift
//  Demo
//
//  Created by Mikhail on 13/12/2019.
//  Copyright © 2019 glvrzzz. All rights reserved.
//

import Foundation

// The marker protocol
protocol PropertyListValue {}

extension Data: PropertyListValue {}
extension String: PropertyListValue {}
extension Date: PropertyListValue {}
extension Bool: PropertyListValue {}
extension Int: PropertyListValue {}
extension Double: PropertyListValue {}
extension Float: PropertyListValue {}

// Every element must be a property-list type
extension Array: PropertyListValue where Element: PropertyListValue {}
extension Dictionary: PropertyListValue where Key == String, Value: PropertyListValue {}
