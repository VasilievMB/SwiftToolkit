//
//  ViewController.swift
//  SwiftToolkit
//
//  Created by Mikhail on 21/12/2018.
//  Copyright © 2018 glvrzzz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let userDefault = UserDefault<Int>(key: "some_key",
                                       defaultValue: 0)
    private var observer: UserDefaultObserver<Int>?
        
    override func viewDidLoad() {
        super.viewDidLoad()
    
        addSeparatorView()
        testUserDefault()
        addRoundedRectImage()
    }
    
    private func addSeparatorView() {
        let separatorView = SeparatorView()
        SeparatorView.appearance().backgroundColor = UIColor.green
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(separatorView)
        
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
    }
    
    private func addRoundedRectImage() {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 100, width: 100, height: 44))
        imageView.image = UIImage.roundedRect(fillColor: UIColor.gray, cornerRadius: 6)
        view.addSubview(imageView)
    }
    
    private func testUserDefault() {
        userDefault.value = 1
        
        observer = userDefault.observe(with: { (old, new) in
            print("value changed from \(String(describing: old)) to \(String(describing: new))")
        })
        
        userDefault.value = 2
    }
}

