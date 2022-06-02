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

class BrewCell: UITableViewCell {
    struct Model{
        let name: String
        let tagLine: String
        let imageURL: String?
        let abv: String
        let ibu: String
        let targetFg: String
        let targetOg: String
    }
    private(set) var nameLabel: UILabel = UILabel()
    private(set) var taglineLabel: UILabel = UILabel()
    private(set) var brewImageView: UIImageView = UIImageView()
    private(set) var abvLabel: UILabel = UILabel()
    private(set) var ibuLabel: UILabel = UILabel()
    private(set) var targetFgLabel: UILabel = UILabel()
    private(set) var targetOgLabel: UILabel = UILabel()
    
    func configure(model: Model) {
        nameLabel.text = model.name
        taglineLabel.text = model.tagLine
        abvLabel.text = model.abv
        ibuLabel.text = model.ibu
        targetFgLabel.text = model.targetFg
        targetOgLabel.text = model.targetOg
        
        guard let imageURL = model.imageURL, let url = getImageURL(from: imageURL) else { return }
        brewImageView.image = UIImage(contentsOfFile: url.path)
    }
    
    private func getImageURL(from src: String) -> URL? {
        URL(string: src)
    }
}
