//
//  UITableView+AttributedTitle.swift
//  SwiftToolkit
//
//  Created by Mikhail on 02.02.2020.
//  Copyright © 2020 glvrzzz. All rights reserved.
//

import UIKit

extension UITableView {
    
    func configureHeaderFooterView(_ view: UIView, title: String?, attributes: [NSAttributedString.Key : Any]) {
        guard let headerFooterView = view as? UITableViewHeaderFooterView else {
            return
        }
        if let title = title {
            headerFooterView.textLabel?.attributedText = NSAttributedString(string: title, attributes: attributes)
        } else {
            headerFooterView.textLabel?.attributedText = nil
        }
    }
    
    func configureHeaderView(_ view: UIView, inSection section: Int, with attributes: [NSAttributedString.Key : Any]) {
        let title = dataSource?.tableView?(self, titleForHeaderInSection: section)
        configureHeaderFooterView(view, title: title, attributes: attributes)
    }
    
    func configureFooterView(_ view: UIView, inSection section: Int, with attributes: [NSAttributedString.Key : Any]) {
        let title = dataSource?.tableView?(self, titleForFooterInSection: section)
        configureHeaderFooterView(view, title: title, attributes: attributes)
    }
}
