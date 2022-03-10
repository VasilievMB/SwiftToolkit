//
//  KeyboardLayoutGuide.swift
//  SwiftToolkit
//
//  Created by Mikhail on 12.03.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

import UIKit

class KeyboardLayoutGuide: UILayoutGuide {
    
    private let keyboardObserver = Keyboard.Observer(events: [.willShow, .willHide])
    private lazy var heightConstraint: NSLayoutConstraint = { [unowned self] in
        return self.heightAnchor.constraint(equalToConstant: 0)
    }()
    
    override var owningView: UIView? {
        didSet {
            if let view = owningView, owningView != oldValue {
                didMove(to: view)
            }
        }
    }
    
    private var lastKeyboardInfo: Keyboard.Info?
    
    private func didMove(to owningView: UIView) {
        
        heightConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: owningView.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: owningView.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: owningView.bottomAnchor),
        ])
        
        if let info = lastKeyboardInfo {
            update(info: info, owningView: owningView, animated: false)
        }
        startObserving()
    }
    
    private func update(info: Keyboard.Info, owningView: UIView, animated: Bool) {
        let guideFrame = owningView.convert(layoutFrame, to: nil)
        let keyboardFrame = info.endFrame
        heightConstraint.constant = max(0, guideFrame.maxY - keyboardFrame.minY)
        
        if animated {
            UIView.animateAlongside(keyboardAnimation: info.animation, animations: {
                owningView.layoutIfNeeded()
            })
        }
    }
    
    private func startObserving() {
        keyboardObserver.startObserving { [weak self] (event, info) in
            self?.handleKeyboard(event: event, info: info)
        }
    }
    
    private func handleKeyboard(event: Keyboard.Event, info: Keyboard.Info) {
        guard let view = owningView else {
            return
        }
        lastKeyboardInfo = info
        update(info: info, owningView: view, animated: true)
    }
}
