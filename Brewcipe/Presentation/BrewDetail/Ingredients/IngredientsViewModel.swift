//
//  IngredientsViewModel.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 17/06/22.
//

import SwiftCollections

class IngredientsViewModel {
    private let ingredients: Ingredients
   
    let title = "Ingredients"
    
    var numberOfSections: Int {
        return ingredients.keys.count
    }
    
    
    init(ingredients: Ingredients) {
        self.ingredients = ingredients
    }

    func title(forSection section: Int) -> String {
        keyAndValue(forSection: section).key.capitalized
    }
    
    /// Value of OrderedDictionary can be a string or an array
    func numberOfRows(forSection section: Int) -> Int {
        let value = keyAndValue(forSection: section).value
        
        if let value = valueIsArray(value) {
            return value.count
        }
        
        if let _ = valueIsString(value) {
            return 1
        }
        
        return 0
    }
    
    func title(forIndex index: Int, inSection section: Int) -> String {
        let value = keyAndValue(forSection: section).value
        
        if let value = valueIsArray(value), let name = valueIsString(value[index]["name"]) {
            return name
        }
        
        if let value = valueIsString(value) {
            return value
        }
        
        return ""
    }
    
    func subtitle(forIndex index: Int, inSection section: Int) -> String {
        let value = keyAndValue(forSection: section).value
        
        if let value = valueIsArray(value),
            let amountDict = valueIsDictionary(value[index]["amount"]),
            let amount = amountDict.keyAndValueConcatenated()
        {
            return amount
        }
        
        return ""
    }
    
    // MARK: - private
    
    private func valueIsDictionary(_ value: Any?) -> [Double : String]? {
        return value as? [Double: String]
    }
    
    private func valueIsArray(_ value: Any?) -> [[String : Any]]? {
        return value as? Array<[String: Any]>
    }
    
    private func valueIsString(_ value: Any?) -> String? {
        return value as? String
    }
    
    private func keyAndValue(forSection section: Int) -> (key: String, value: Any?) {
        let key = ingredients.keys[section]
        let value = ingredients[key]
        
        return (key, value)
    }
    
}
