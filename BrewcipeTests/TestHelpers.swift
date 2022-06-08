//
//  TestHelpers.swift
//  BrewcipeTests
//
//  Created by Matías  Gil Echavarría on 2/06/22.
//

import UIKit

func numbersOfRows(in table: UITableView, section: Int) -> Int? {
    table.dataSource?.tableView(table, numberOfRowsInSection: section)
}

func cellForRow(in table: UITableView, indexPath: IndexPath) -> UITableViewCell? {
    table.dataSource?.tableView(table, cellForRowAt: indexPath)
}

func didSelectRowAt(in table: UITableView, indexPath: IndexPath) {
    table.delegate?.tableView?(table, didSelectRowAt: indexPath)
}

func estimatedHeightForRowAt(in table: UITableView, indexPath: IndexPath) -> CGFloat? {
    table.delegate?.tableView?(table, estimatedHeightForRowAt: indexPath)
}
