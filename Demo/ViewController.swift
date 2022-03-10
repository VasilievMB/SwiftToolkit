//
//  ViewController.swift
//  SwiftToolkit
//
//  Created by Mikhail on 21/12/2018.
//  Copyright © 2018 Mikhail. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    private let userDefault = UserDefault<Int>(key: "some_key", defaultValue: 0)
    private var observer: UserDefaultObserver<Int>?
            
    override func viewDidLoad() {
        super.viewDidLoad()
    
        addSeparatorView()
        testUserDefault()
        
        let imageView = addRoundedRectImage()
        
        addKeyboardGuide(with: imageView)
    }
    
    private func addKeyboardGuide(with view: UIView) {
        let keyboardGuide = KeyboardLayoutGuide()
        self.view.addLayoutGuide(keyboardGuide)
        view.bottomAnchor.constraint(lessThanOrEqualTo: keyboardGuide.topAnchor, constant: -8).isActive = true
    }
    
    private func addSeparatorView() {
        let separatorView = SeparatorView()
        SeparatorView.appearance().backgroundColor = UIColor.lightGray
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(separatorView)
        
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
    }
    
    @discardableResult
    private func addRoundedRectImage() -> UIImageView {
        let imageView = UIImageView(image: UIImage.roundedRect(fillColor: UIColor.magenta, cornerRadius: 6))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        let bottomConstraint = view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10)
        bottomConstraint.priority = .defaultHigh
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 50),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomConstraint
        ])
        
        return imageView
    }
    
    private func testUserDefault() {
        userDefault.value = 1
        
        observer = userDefault.observe(with: { (old, new) in
            print("value changed from \(String(describing: old)) to \(String(describing: new))")
        })
        
        userDefault.value = 2
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

