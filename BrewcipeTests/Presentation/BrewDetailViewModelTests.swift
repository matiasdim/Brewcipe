//
//  BrewDetailViewModelTests.swift
//  BrewcipeTests
//
//  Created by Matías  Gil Echavarría on 12/06/22.
//

import XCTest
@testable import Brewcipe

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
    
    func test_viewModel_shouldProvideeBrewTargetFg() {
        XCTAssertEqual(sut.targetFg, "1010")
    }
    
    func test_viewModel_shouldProvideeBrewTargetOg() {
        XCTAssertEqual(sut.targetOg, "1044")
    }
    
    func test_viewModel_shouldProvideeBrewVolume() {
        XCTAssertEqual(sut.volume, "20")
    }
    
    // MARK: - Helpers
    
    private func makeBrew() -> Brew {
        return Brew(name: "B1",
                    tagline: "T1",
                    imageUrl: "https://images.punkapi.com/v2/keg.png",
                    abv: 3.2,
                    ibu: 250,
                    targetFg: 1010,
                    targetOg: 1044,
                    volume: 20)
    }
}
