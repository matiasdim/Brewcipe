//
//  TestHelpers.swift
//  BrewcipeTests
//
//  Created by Matías  Gil Echavarría on 2/06/22.
//

import UIKit

/// MARK: - Tables

func numbersOfRows(in table: UITableView, section: Int) -> Int? {
    table.dataSource?.tableView(table, numberOfRowsInSection: section)
}

func numberOfSections(in table: UITableView) -> Int? {
    table.dataSource?.numberOfSections?(in: table)
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

/// MARK:  - Buttons

func tap(_ button: UIButton) {
    button.sendActions(for: .touchUpInside)
}
