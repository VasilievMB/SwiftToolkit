//
//  UserDefault.swift
//  Scanner
//
//  Created by Mikhail on 27/07/2018.
//  Copyright © 2018 Mikhail. All rights reserved.
//

import Foundation

struct UserDefaultKey: RawRepresentable {
    let rawValue: String
}

extension UserDefaultKey: ExpressibleByStringLiteral {
    init(stringLiteral: String) {
        rawValue = stringLiteral
    }
}

class UserDefault<Value: PropertyListValue> {
    
    let defaults: UserDefaults
    let key: UserDefaultKey
    let defaultValue: Value
    
    init(key: UserDefaultKey,
         defaultValue: Value,
         defaults: UserDefaults = UserDefaults.standard) {
        self.defaultValue = defaultValue
        self.defaults = defaults
        self.key = key
    }
    
    var isStored: Bool {
        return storedValue != nil
    }
    
    var storedValue: Value? {
        return defaults.object(forKey: key.rawValue) as? Value
    }
        
    var value: Value {
        get {
            if let value = storedValue {
                return value
            } else {
                return defaultValue
            }
        }
        set {
            defaults.set(newValue, forKey: key.rawValue)
        }
    }
    
    func removeValue() {
        defaults.removeObject(forKey: key.rawValue)
    }
    
}
