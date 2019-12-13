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
    
        let separatorView = SeparatorView()
        SeparatorView.appearance().backgroundColor = UIColor.green
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(separatorView)
        
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
        
        
        userDefault.value = 1
        
        observer = userDefault.observe(with: { (old, new) in
            print("value changed from \(String(describing: old)) to \(String(describing: new))")
        })
        
        userDefault.value = 2
        
    }

}

