//
//  IngredientsViewController.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 6/06/22.
//

import UIKit

class IngredientsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private(set) var viewModel: IngredientsViewModel?        
    
    convenience init(viewModel: IngredientsViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewModel?.title
        
        tableView.register(UINib(nibName: IngredientCell.ingredientCellClassName, bundle: nil), forCellReuseIdentifier: IngredientCell.ingredientCellClassName)
    }
    
    // MARK: - private
    private func configure(_ cell: IngredientCell, for indexPath: IndexPath) {
        guard let viewModel = viewModel else {
            fatalError("ViewModel not set")
        }
        let row = indexPath.row
        let section = indexPath.section
        
        cell.configure(title: viewModel.title(forIndex: row, inSection: section),
                       subtitle: viewModel.subtitle(forIndex: row, inSection: section))
    }
}

extension IngredientsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.numberOfSections ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows(forSection: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IngredientCell.ingredientCellClassName) as? IngredientCell else {
            fatalError("Ingredient cell was not found")
        }
        configure(cell, for: indexPath)
        return cell
    }
}

extension IngredientsViewController: UITableViewDelegate {
    
}
