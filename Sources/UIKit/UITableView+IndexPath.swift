//
//  UITableView+IndexPath.swift
//  SwiftToolkit
//
//  Created by Mikhail on 02.02.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

import UIKit

extension UITableView {

    func indexPath(for view: UIView) -> IndexPath? {
        let viewBoundsCenter = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        let location = view.convert(viewBoundsCenter, to: self)
        return indexPathForRow(at: location)
    }
    
}
