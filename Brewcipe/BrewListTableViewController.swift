//
//  BrewListTableViewController.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 1/06/22.
//

import UIKit

class BrewListTableViewController: UITableViewController {
    
    private(set) var viewModel: BrewListViewModel
    
    init (viewModel: BrewListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(BrewCell.self, forCellReuseIdentifier: String(describing: BrewCell.self))
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BrewCell.self)) as? BrewCell else {
            fatalError("Brew cell was not found")
        }
        let row = indexPath.row
        cell.configure(model: BrewCell.Model(
            name: viewModel.name(for: row),
            tagLine: viewModel.tagline(for: row),
            imageURL: viewModel.imageUrl(for: row),
            abv: viewModel.abv(for: row),
            ibu: viewModel.ibu(for: row),
            targetFg: viewModel.targetFg(for: row),
            targetOg: viewModel.targetOg(for: row)
        ))
        return cell
    }

    // MARK: - Table view delegate
}
