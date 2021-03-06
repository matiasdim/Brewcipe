//
//  BrewCell.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 2/06/22.
//

import UIKit

class BrewCell: UITableViewCell {
    static let brewCellClassName = String(describing: BrewCell.self)

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var abvLabel: UILabel!
    @IBOutlet weak var ibuLabel: UILabel!
    @IBOutlet weak var targetFgLabel: UILabel!
    @IBOutlet weak var targetOgLabel: UILabel!
    @IBOutlet weak var brewImageView: UIImageView!
    
    func configure(name: String,
                   tagline: String,
                   abv: String,
                   ibu: String,
                   targetFg: String,
                   targetOg: String,
                   brewImage: UIImage) {
        nameLabel.text = name
        taglineLabel.text = tagline
        abvLabel.text = abv
        ibuLabel.text = ibu
        targetFgLabel.text = targetFg
        targetOgLabel.text = targetOg
        
        brewImageView.image = brewImage
    }
}
