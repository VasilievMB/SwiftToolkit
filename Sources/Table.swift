//
//  Table.swift
//  Demo
//
//  Created by Mikhail on 17/12/2019.
//  Copyright © 2019 glvrzzz. All rights reserved.
//

import UIKit

protocol ViewConfigurator {
    associatedtype View: UIView
    associatedtype Data
    func configure(view: View, with data: Data)
}

protocol TableRow: TableViewCellProviding {
    associatedtype Cell: UITableViewCell
    associatedtype CellConfigurator: ViewConfigurator where CellConfigurator.View == Cell, CellConfigurator.Data == Self
    var cellProvider: TableViewCellProviding { get }
    var cellConfigurator: CellConfigurator { get }
}

extension TableRow {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cellProvider.tableView(tableView, cellForRowAt: indexPath) as! Cell
        cellConfigurator.configure(view: cell, with: self)
        return cell
    }
}

protocol TableSection: TableViewCellProviding {
    func row(at index: Int) -> TableViewCellProviding
    var numberOfRows: Int { get }
}

extension TableSection {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.row(at: indexPath.row)
        return row.tableView(tableView, cellForRowAt: indexPath)
    }
}
