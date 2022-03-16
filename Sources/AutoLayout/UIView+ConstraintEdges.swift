//
//  UIView+ConstraintEdges.swift
//  SwiftToolkit
//
//  Created by Mikhail on 16.12.2020.
//

import UIKit

extension UIView {
    
    func constraintEdges(to view: UIView) -> [NSLayoutConstraint] {
        return [
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ]
    }
    
    func constraintEdges(to view: UIView, with insets: UIEdgeInsets) -> [NSLayoutConstraint] {
        return [
            leftAnchor.constraint(equalTo: view.leftAnchor, constant: insets.left),
            view.rightAnchor.constraint(equalTo: rightAnchor, constant: insets.right),
            topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: insets.bottom),
        ]
    }
    
    func constraintEdges(to view: UIView, with insets: NSDirectionalEdgeInsets) -> [NSLayoutConstraint] {
        return [
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.leading),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: insets.trailing),
            topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: insets.bottom),
        ]
    }
    
}

