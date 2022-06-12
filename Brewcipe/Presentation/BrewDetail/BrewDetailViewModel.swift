//
//  BrewDetailViewModel.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 6/06/22.
//

struct BrewDetailViewModel {
    let brew: Brew
    
    var title: String {
        return brew.name
    }
    
    var abv: String {
        return String(brew.abv)
    }
    
    var ibu: String {
        return String(brew.ibu)
    }

    var targetFg: String {
        return String(brew.targetFg)
    }
    
    var targetOg: String {
        return String(brew.targetOg)
    }
    
    var volume: String {
        return String(brew.volume)
    }
}
