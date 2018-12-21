//
//  UserDefault.swift
//  Scanner
//
//  Created by Mikhail on 27/07/2018.
//  Copyright © 2018 glvrzzz. All rights reserved.
//

import Foundation

class UserDefault<T> {
    
    let defaults: UserDefaults
    let key: String
    let defaultValue: T
    var shouldSynchronize: Bool
    
    init(key: String,
         defaultValue: T,
         defaults: UserDefaults = UserDefaults.standard,
         shouldSynchronize: Bool = true) {
        self.defaultValue = defaultValue
        self.defaults = defaults
        self.key = key
        self.shouldSynchronize = shouldSynchronize
    }
    
    var isStored: Bool {
        return storedValue != nil
    }
    
    var storedValue: T? {
        return defaults.object(forKey: key) as? T
    }
    
    private func syncronizeIfNeeded() {
        if shouldSynchronize {
            defaults.synchronize()
        }
    }
    
    var value: T {
        get {
            if let value = storedValue {
                return value
            } else {
                return defaultValue
            }
        }
        set {
            defaults.set(newValue, forKey: key)
            syncronizeIfNeeded()
        }
    }
    
    func removeValue() {
        defaults.removeObject(forKey: key)
        syncronizeIfNeeded()
    }
    
}
