//
//  NotificationObserver.swift
//  SwiftToolkit
//
//  Created by Mikhail on 21/12/2018.
//  Copyright © 2018 Mikhail. All rights reserved.
//

import Foundation

public class NotificationObserver {
    
    typealias Handler = (Notification) -> Void
    
    let center: NotificationCenter
    let name: NSNotification.Name
    let queue: OperationQueue?
    private var handler: Handler?
    private var observer: NSObjectProtocol?
    
    init(center: NotificationCenter = NotificationCenter.default,
         queue: OperationQueue? = nil,
         name: NSNotification.Name,
         handler: Handler? = nil) {
        
        self.center = center
        self.name = name
        self.handler = handler
        self.queue = queue
        
        startObserving()
    }
    
    var isObserving: Bool {
        return observer != nil
    }
    
    func startObserving() {
        if let handler = handler {
            startObserving(with: handler)
        }
    }
    
    func startObserving(with handler: @escaping Handler) {
        self.handler = handler
        if !isObserving {
            observer = center.addObserver(forName: name,
                                          object: nil,
                                          queue: queue,
                                          using: { [weak self] (notification) in
                                            self?.handler?(notification)
            })
        }
    }
    
    func stopObserving() {
        if let observer = observer {
            center.removeObserver(observer)
            self.observer = nil
        }
    }
    
    deinit {
        stopObserving()
    }
    
}
