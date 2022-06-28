//
//  BrewDetailViewModel.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 6/06/22.
//

struct BrewDetailViewModel {
    let brew: Brew
    
    var ingredientsButtonTitle = "Ingredients"
    
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
    
    var ebc: String {
        return String(brew.ebc)
    }
    
    var srm: String {
        return String(brew.srm)
    }
   
    var ph: String {
        return String(brew.ph)
    }
    
    var attenuationLevel: String {
        return String(brew.attenuationLevel)
    }
    
    var volume: String? {
        return brew.volume.keyAndValueConcatenated()
    }
    
    var boilVolume: String? {
        return brew.boilVolume.keyAndValueConcatenated()

    }
    
    var description: String {
        return brew.description
    }
    
}
