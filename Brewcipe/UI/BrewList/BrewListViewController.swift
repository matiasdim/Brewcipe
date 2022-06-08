//
//  BrewListViewController.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 3/06/22.
//

import Foundation
import UIKit

class BrewListViewController: UIViewController {
        
    @IBOutlet weak var tableView: UITableView!
    
    private(set) var viewModel: BrewListViewModel?
    private var selection: ((Int) -> Void)?
    let brewCellClassName = String(describing: BrewCell.self)
    
    convenience init(viewModel: BrewListViewModel, selection: @escaping (Int) -> Void) {
        self.init()
        self.viewModel = viewModel
        self.selection = selection
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewModel?.listTitle
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: brewCellClassName, bundle: nil), forCellReuseIdentifier: brewCellClassName)
    }
}

extension BrewListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows(in: section) ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: brewCellClassName) as? BrewCell, let viewModel = viewModel else {
            fatalError("Brew cell was not found, or view model notset")
        }
        
        let index = indexPath.row
        cell.configure(name: viewModel.name(for: index),
                       tagline: viewModel.tagline(for: index),
                       abv: viewModel.abv(for: index),
                       ibu: viewModel.ibu(for: index),
                       targetFg: viewModel.targetFg(for: index),
                       targetOg: viewModel.targetOg(for: index),
                       brewImageURL: viewModel.imageUrl(for: index))
        
        return cell
    }
}

extension BrewListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selection?(indexPath.row)
    }
}
