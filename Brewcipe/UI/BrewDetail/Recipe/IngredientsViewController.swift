//
//  IngredientsViewController.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 6/06/22.
//

import UIKit

class IngredientsViewController: UIViewController {
    private(set) var recipe: String!
    
    convenience init(recipe: String) {
        self.init()
        self.recipe = recipe
    }
}
