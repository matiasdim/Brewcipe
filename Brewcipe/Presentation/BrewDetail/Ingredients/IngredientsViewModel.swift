//
//  IngredientsViewModel.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 17/06/22.
//

import SwiftCollections

class IngredientsViewModel {
    private let ingredients: OrderedDictionary<String, Any>
   
    let title = "Ingredients"
    
    var numberOfSections: Int {
        return ingredients.keys.count
    }
    
    
    init(ingredients: OrderedDictionary<String, Any>) {
        self.ingredients = ingredients
    }

    func title(forSection section: Int) -> String {
        keyAndValue(forSection: section).key.capitalized
    }
    
    /// Value of OrderedDictionary can be a string or an array
    func numberOfRows(forSection section: Int) -> Int {
        let value = keyAndValue(forSection: section).value
        
        if let value = value as? Array<[String :Any]> {
            return value.count
        }
        
        if let _ = value as? String {
            return 1
        }
        
        return 0
    }
    
    func title(forIndex index: Int, inSection section: Int) -> String {
        let value = keyAndValue(forSection: section).value
        
        if let value = value as? Array<[String :Any]>, let name = value[index]["name"] as? String {
            return name
        }
        
        if let value = value as? String {
            return value
        }
        
        return ""
    }
    
    func subtitle(forIndex index: Int, inSection section: Int) -> String {
        let value = keyAndValue(forSection: section).value
        
        if let value = value as? Array<[String :Any]>,
            let amountDict = value[index]["amount"] as? [Double: String],
            let amount = amountDict.keyAndValueConcatenated()
        {
            return amount
        }
        
        return ""
    }
    
    // MARK: - private
    
    private func keyAndValue(forSection section: Int) -> (key: String, value: Any?) {
        let key = ingredients.keys[section]
        let value = ingredients[key]
        
        return (key, value)
    }
    
}
