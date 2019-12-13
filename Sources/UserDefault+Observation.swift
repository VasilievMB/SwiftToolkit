//
//  UserDefault+Observation.swift
//  Demo
//
//  Created by Mikhail on 13/12/2019.
//  Copyright © 2019 glvrzzz. All rights reserved.
//

import Foundation

class UserDefaultObserver<Value: PropertyListValue>: NSObject {
    
    typealias Handler = (_ oldValue: Value?, _ newValue: Value?) -> Void
    
    let key: UserDefaultKey
    let defaults: UserDefaults
    private let handler: Handler
    
    init(key: UserDefaultKey,
         defaults: UserDefaults = UserDefaults.standard,
         handler: @escaping Handler) {
        
        assert(!key.rawValue.contains("."), "KVO does not support user defaults keys containing dots")
        
        self.key = key
        self.defaults = defaults
        self.handler = handler
        
        super.init()
        
        addObserver()
    }
    
    private func addObserver() {
        defaults.addObserver(self, forKeyPath: key.rawValue, options: [.old, .new], context: nil)
    }
    
    private func removeObserver() {
        defaults.removeObserver(self, forKeyPath: key.rawValue, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        guard let change = change, keyPath == key.rawValue, object != nil else {
            return
        }
        handler(change[.oldKey] as? Value, change[.newKey] as? Value)
    }
    
    deinit {
        removeObserver()
    }
    
}

extension UserDefault {
    
    typealias Observer = UserDefaultObserver<Value>
    
    func observe(with handler: @escaping Observer.Handler) -> Observer {
        return Observer(key: key, defaults: defaults, handler: handler)
    }
    
}
