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
