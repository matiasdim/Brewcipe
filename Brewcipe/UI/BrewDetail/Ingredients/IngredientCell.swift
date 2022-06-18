//
//  IngredientCell.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 18/06/22.
//

import UIKit

class IngredientCell: UITableViewCell {
    static let ingredientCellClassName = String(describing: IngredientCell.self)
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    func configure(title: String, subtitle: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
}
