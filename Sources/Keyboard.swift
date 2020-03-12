//
//  Keyboard.swift
//  SwiftToolkit
//
//  Created by Mikhail on 12.03.2020.
//  Copyright © 2020 glvrzzz. All rights reserved.
//

import UIKit

public struct Keyboard {
    
    public struct Animation {
        
        let duration: TimeInterval
        let curve: UIView.AnimationOptions
        
        init(userInfo: [AnyHashable : Any]) {
            duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval ?? 0
            if let curveValue = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber {
                curve = UIView.AnimationOptions(rawValue: UInt(curveValue.intValue << 16))
            } else {
                curve = .curveLinear
            }
        }
    }
    
    public struct Info {
        
        let beginFrame: CGRect
        let endFrame: CGRect
        let animation: Keyboard.Animation
        let isLocal: Bool
        
        init(userInfo: [AnyHashable : Any]) {
            beginFrame = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect ?? .null
            endFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .null
            animation = Keyboard.Animation(userInfo: userInfo)
            isLocal = userInfo[UIResponder.keyboardIsLocalUserInfoKey] as? Bool ?? true
        }
    }
    
    public enum Event {
        
        case willShow
        case didShow
        case willHide
        case didHide
        
        var notificationName: NSNotification.Name {
            switch self {
            case .willShow:
                return UIResponder.keyboardWillShowNotification
            case .didShow:
                return UIResponder.keyboardDidShowNotification
            case .willHide:
                return UIResponder.keyboardWillHideNotification
            case .didHide:
                return UIResponder.keyboardDidHideNotification
            }
        }
    }
    
    public class EventObserver {
        typealias Handler = (_ info: Keyboard.Info) -> Void
        
        let event: Event
        private let notificationObserver: NotificationObserver
        
        
        init(event: Event) {
            self.event = event
            self.notificationObserver = NotificationObserver(name: event.notificationName)
        }
        
        func startObserving(_ handler: @escaping Handler) {
            notificationObserver.startObserving { (notification) in
                if let userInfo = (notification as NSNotification).userInfo {
                    let keyboardInfo = Keyboard.Info(userInfo: userInfo)
                    handler(keyboardInfo)
                }
            }
        }
        
        func stopObserving() {
            notificationObserver.stopObserving()
        }
        
        deinit {
            stopObserving()
        }
    }
    
    public class Observer {
        
        typealias Handler = (_ event: Event, _ info: Info) -> Void
        
        private let eventObservers: [EventObserver]
        
        init(events: Set<Event>) {
            assert(!events.isEmpty)
            eventObservers = events.map { EventObserver(event: $0) }
        }
        
        func startObserving(_ handler: @escaping Handler) {
            eventObservers.forEach { (eventObserver) in
                eventObserver.startObserving { (info) in
                    handler(eventObserver.event, info)
                }
            }
        }
        
        func stopObserving() {
            eventObservers.forEach { $0.stopObserving() }
        }
        
        deinit {
            stopObserving()
        }
    }
}


public extension UIView {
    
    class func animateAlongside(keyboardAnimation: Keyboard.Animation,
                                options: UIView.AnimationOptions = [],
                                delay: TimeInterval = 0,
                                animations: @escaping () -> Void,
                                completion: ((_ finished: Bool) -> Void)? = nil) {
        var allOptions: UIView.AnimationOptions = options
        allOptions.formUnion(keyboardAnimation.curve)
        animate(withDuration: keyboardAnimation.duration,
                delay: delay,
                options: allOptions,
                animations: animations,
                completion: completion)
    }
}
