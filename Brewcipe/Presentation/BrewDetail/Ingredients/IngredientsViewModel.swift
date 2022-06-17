//
//  IngredientsViewModel.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 17/06/22.
//

import SwiftCollections

class IngredientsViewModel {
    private let ingredients: Ingredients
    
    init(ingredients: Ingredients) {
        self.ingredients = ingredients
    }
    
    let title = "Ingredients"
    
    var numberOfSections: Int {
        return ingredients.ingredients.keys.count
    }
    
    func title(forSection section: Int) -> String {
        Array(ingredients.ingredients.keys)[section]
    }
    
}


struct Ingredients {
    let ingredients: OrderedDictionary<String, Any>
}
