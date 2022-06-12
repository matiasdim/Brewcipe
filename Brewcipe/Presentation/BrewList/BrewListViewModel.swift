//
//  BrewListViewModel.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 2/06/22.
//

import UIKit

class BrewListViewModel {
    let brews: [Brew]
    
    let listTitle = "Brews"
    let numberOfSections = 1
    
    init(brews: [Brew]) {
        self.brews = brews
    }
    
    func numberOfRows(in section: Int) -> Int {
        return brews.count
    }
    
    func name(for row: Int) -> String {
        return brews[row].name
    }
    
    func tagline(for row: Int) -> String {
        return brews[row].tagline
    }
    
    func abv(for row: Int) -> String {
        return String(brews[row].abv)
    }
    
    func ibu(for row: Int) -> String {
        return String(brews[row].ibu)
    }
    
    func targetFg(for row: Int) -> String {
        return String(brews[row].targetFg)
    }
    
    func targetOg(for row: Int) -> String {
        return String(brews[row].targetOg)
    }
    
    func brewImage(for row: Int) -> UIImage {
        if let src = imageUrl(for: row),
            let url = URL(string: src),
            let data = try? Data(contentsOf: url),
           let image = UIImage(data: data)
        {        
            return image
        }
        
        return .remove
    }
    
    // MARK: - Private
    internal func imageUrl(for row: Int) -> String? {
        return brews[row].imageUrl
    }
}
