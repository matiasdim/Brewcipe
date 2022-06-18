//
//  Brew.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 1/06/22.
//

import SwiftCollections

struct Brew {
    let name: String
    let tagline: String
    let imageUrl: String?
    let abv: Double
    let ibu: Int
    let targetFg: Int
    let targetOg: Int
    let ebc: Double
    let srm: Double
    let ph: Double
    let attenuationLevel: Double
    let volume: [Double: String]
    let boilVolume: [Double: String]
    let description: String
    let ingredients: OrderedDictionary<String, Any>
}
