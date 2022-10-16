//
//  AutoLayoutElement+ConstraintEdges.swift
//  SwiftToolkit
//
//  Created by Mikhail on 16.12.2020.
//

import UIKit

extension AutoLayoutElement {
    
    func constraintEdges(to element: AutoLayoutElement) -> [NSLayoutConstraint] {
        return [
            leadingAnchor.constraint(equalTo: element.leadingAnchor),
            trailingAnchor.constraint(equalTo: element.trailingAnchor),
            topAnchor.constraint(equalTo: element.topAnchor),
            bottomAnchor.constraint(equalTo: element.bottomAnchor),
        ]
    }
    
    func constraintEdges(to element: AutoLayoutElement, with insets: UIEdgeInsets) -> [NSLayoutConstraint] {
        return [
            leftAnchor.constraint(equalTo: element.leftAnchor, constant: insets.left),
            element.rightAnchor.constraint(equalTo: rightAnchor, constant: insets.right),
            topAnchor.constraint(equalTo: element.topAnchor, constant: insets.top),
            element.bottomAnchor.constraint(equalTo: bottomAnchor, constant: insets.bottom),
        ]
    }
    
    func constraintEdges(to element: AutoLayoutElement, with insets: NSDirectionalEdgeInsets) -> [NSLayoutConstraint] {
        return [
            leadingAnchor.constraint(equalTo: element.leadingAnchor, constant: insets.leading),
            element.trailingAnchor.constraint(equalTo: trailingAnchor, constant: insets.trailing),
            topAnchor.constraint(equalTo: element.topAnchor, constant: insets.top),
            element.bottomAnchor.constraint(equalTo: bottomAnchor, constant: insets.bottom),
        ]
    }
    
    func constraintEdgesToSystemSpacing(in element: AutoLayoutElement) -> [NSLayoutConstraint] {
        return [
            leadingAnchor.constraint(equalToSystemSpacingAfter: element.leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: element.trailingAnchor, multiplier: 1),
            topAnchor.constraint(equalToSystemSpacingBelow: element.topAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: element.bottomAnchor, multiplier: 1)
        ]
    }
}

