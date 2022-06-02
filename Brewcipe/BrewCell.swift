//
//  BrewCell.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 2/06/22.
//

import UIKit

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
