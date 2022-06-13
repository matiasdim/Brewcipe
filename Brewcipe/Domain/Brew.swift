//
//  Brew.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 1/06/22.
//

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
    let volume: [Int: String]
    let boilVolume: [Int: String]
    let description: String
}
