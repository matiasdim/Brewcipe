//
//  BrewListViewModel.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 2/06/22.
//

struct BrewListViewModel {
    let brews: [Brew]
    let listTitle = "Brews"
    let numberOfSections = 1
    
    func numberOfRows(in section: Int) -> Int {
        return brews.count
    }
    
    func name(for row: Int) -> String {
        return brews[row].name
    }
    
    func tagline(for row: Int) -> String {
        return brews[row].tagline
    }
    
    func imageUrl(for row: Int) -> String? {
        return brews[row].imageUrl
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
}
