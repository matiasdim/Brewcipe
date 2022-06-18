//
//  BrewDetailViewModelTests.swift
//  BrewcipeTests
//
//  Created by Matías  Gil Echavarría on 12/06/22.
//

import XCTest
@testable import Brewcipe
import SwiftCollections

class BrewDetailViewModelTests: XCTestCase {
    private var brew: Brew!
    private var sut: BrewDetailViewModel!
    
    override func setUp() {
        super.setUp()
        brew = makeBrew()
        sut = BrewDetailViewModel(brew: brew)
    }
    
    override func tearDown() {
        brew = nil
        sut = nil
        super.tearDown()
    }

    func test_viewModel_shouldHaveBrewModel() {
        XCTAssertNotNil(sut.brew)
    }
    
    func test_viewModel_shouldProvideBrewNameAsTile() {
        XCTAssertEqual(sut.title, brew.name)
    }
    
    func test_viewModel_shouldProvideBrewAbv() {
        XCTAssertEqual(sut.abv, "3.2")
    }
    
    func test_viewModel_shouldProvideBrewIbu() {
        XCTAssertEqual(sut.ibu, "250")
    }
    
    func test_viewModel_shouldProvideBrewTargetFg() {
        XCTAssertEqual(sut.targetFg, "1010")
    }
    
    func test_viewModel_shouldProvideBrewTargetOg() {
        XCTAssertEqual(sut.targetOg, "1044")
    }
    
    func test_viewModel_shouldProvideBrewEbc() {
        XCTAssertEqual(sut.ebc, "19.5")
    }
    
    func test_viewModel_shouldProvideBrewSrm() {
        XCTAssertEqual(sut.srm, "9.9")
    }
    
    func test_viewModel_shouldProvideBrewPh() {
        XCTAssertEqual(sut.ph, "4.4")
    }
    
    func test_viewModel_shouldProvideBrewAttenuationLevel() {
        XCTAssertEqual(sut.attenuationLevel, "75.6")
    }
    
    func test_viewModel_shouldProvideBrewVolume() {
        XCTAssertEqual(sut.volume, "20.0 litres")
    }
    
    func test_viewModelWithNoKeyAndValueForVolume_shoulreturnNil() {
        sut = BrewDetailViewModel(brew: makeBrewEmptyVolumes())
        XCTAssertNil(sut.volume)
    }
    
    func test_viewModel_shouldProvideBrewBoilVolume() {
        XCTAssertEqual(sut.boilVolume, "25.0 litres")
    }
    
    func test_viewModelWithNoKeyAndValueForBoilVolume_shoulreturnNil() {
        sut = BrewDetailViewModel(brew: makeBrewEmptyVolumes())
        XCTAssertNil(sut.boilVolume)
    }
    
    func test_viewModel_shouldProvideBrewDescription() {
        XCTAssertEqual(sut.description, "A description of the brew")
    }
    
    // MARK: - Helpers
    
    let ingredients: Ingredients = OrderedDictionary.init(uniqueKeys: ["yeast", "another"], values: ["Wyeast 1272 - American Ale II™", "aaa ooo pppp"])
    
    private func makeBrew() -> Brew {
        return Brew(name: "B1",
                    tagline: "T1",
                    imageUrl: "https://images.punkapi.com/v2/keg.png",
                    abv: 3.2,
                    ibu: 250,
                    targetFg: 1010,
                    targetOg: 1044,
                    ebc: 19.5,
                    srm: 9.9,
                    ph: 4.4,
                    attenuationLevel: 75.6,
                    volume: [20: "litres"],
                    boilVolume: [25: "litres"],
                    description: "A description of the brew",
                    ingredients: ingredients)
    }
    
    private func makeBrewEmptyVolumes() -> Brew {
        return Brew(name: "B1",
                    tagline: "T1",
                    imageUrl: "https://images.punkapi.com/v2/keg.png",
                    abv: 3.2,
                    ibu: 250,
                    targetFg: 1010,
                    targetOg: 1044,
                    ebc: 19.5,
                    srm: 9.9,
                    ph: 4.4,
                    attenuationLevel: 75.6,
                    volume: [:],
                    boilVolume: [:],
                    description: "A description of the brew",
                    ingredients: ingredients)
    }
}
