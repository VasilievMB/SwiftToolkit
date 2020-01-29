//
//  TableReusableViewProviders.swift
//  Demo
//
//  Created by Mikhail on 30/12/2019.
//  Copyright © 2019 glvrzzz. All rights reserved.
//

import UIKit

protocol TableViewCellProviding {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
}

protocol TableViewHeaderFooterProviding {
    func tableView(_ tableView: UITableView, viewInSection section: Int) -> UIView?
}

protocol TableViewReusableViewProviding {
    var reuseIdentifier: String { get }
    func registerView(in tableView: UITableView)
}

protocol TableViewReusableCellProviding: TableViewReusableViewProviding, TableViewCellProviding {
    associatedtype Cell: UITableViewCell
    func tableView(_ tableView: UITableView, reusableCellForRowAt indexPath: IndexPath) -> Cell
}

extension TableViewReusableCellProviding {
    
    func tableView(_ tableView: UITableView, reusableCellForRowAt indexPath: IndexPath) -> Cell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? Cell {
            return cell
        } else {
            fatalError("Incorrect class for cell with reuse identifier: '\(reuseIdentifier)'")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.tableView(tableView, reusableCellForRowAt: indexPath)
    }
}

protocol TableViewReusableHeaderFooterViewProviding: TableViewReusableViewProviding, TableViewHeaderFooterProviding {
    associatedtype View: UITableViewHeaderFooterView
}

extension TableViewReusableHeaderFooterViewProviding {
    func tableView(_ tableView: UITableView, viewInSection section: Int) -> UIView? {
        if let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: reuseIdentifier) as? View {
            return view
        } else {
            fatalError("Incorrect class for reusable view with reuseIdentifier: '\(reuseIdentifier)'")
        }
    }
}

class TableViewReusableViewProvider {
    let reuseIdentifier: String
    init(reuseIdentifier: String) {
        self.reuseIdentifier = reuseIdentifier
    }
}

class TableViewReusableViewNibProvider: TableViewReusableViewProvider {
    
    let nib: UINib
    
    init(reuseIdentifier: String, nibName: String, bundle: Bundle = Bundle.main) {
        self.nib = UINib(nibName: nibName, bundle: bundle)
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    init(reuseIdentifier: String, nib: UINib) {
        self.nib = nib
        super.init(reuseIdentifier: reuseIdentifier)
    }
}

class TableViewCellClassProvider<Cell: UITableViewCell>: TableViewReusableViewProvider, TableViewReusableCellProviding {
    typealias Cell = Cell
    func registerView(in tableView: UITableView) {
        tableView.register(Cell.self, forCellReuseIdentifier: reuseIdentifier)
    }
}

class TableViewCellNibProvider<Cell: UITableViewCell>: TableViewReusableViewNibProvider, TableViewReusableCellProviding {
    typealias Cell = Cell
    
    convenience init(reuseIdentifier: String, bundle: Bundle = Bundle.main) {
        self.init(reuseIdentifier: reuseIdentifier, nibName: "\(Cell.self)", bundle: bundle)
    }
    
    func registerView(in tableView: UITableView) {
        tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
    }
}

class TableViewHeaderFooterClassProvider<View: UITableViewHeaderFooterView>: TableViewReusableViewProvider, TableViewReusableHeaderFooterViewProviding {
    typealias View = View
    func registerView(in tableView: UITableView) {
        tableView.register(View.self, forHeaderFooterViewReuseIdentifier: reuseIdentifier)
    }
}

class TableViewHeaderFooterNibProvider<View: UITableViewHeaderFooterView>: TableViewReusableViewNibProvider, TableViewReusableHeaderFooterViewProviding {
    typealias View = View
    
    convenience init(reuseIdentifier: String, bundle: Bundle = Bundle.main) {
        self.init(reuseIdentifier: reuseIdentifier, nibName: "\(View.self)", bundle: bundle)
    }
    
    func registerView(in tableView: UITableView) {
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: reuseIdentifier)
    }
}
