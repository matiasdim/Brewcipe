//
//  BrewDetailViewControllerTests.swift
//  BrewcipeTests
//
//  Created by Matías  Gil Echavarría on 14/06/22.
//

import XCTest
@testable import Brewcipe

class BrewDetailViewControllerTests: XCTestCase {
    
    func test_brewDetailViewController_shouldHaveViewModel() {
        let sut = makeSut(brew: makeBrew())
        
        XCTAssertNotNil(sut.viewModel)
    }
    
    func test_brewDetailViewController_shouldHaveOutletsConnected() {
        let sut = makeSut(brew: makeBrew())

        XCTAssertNotNil(sut.titleLabel)
        XCTAssertNotNil(sut.abvLabel)
        XCTAssertNotNil(sut.ibuLabel)
        XCTAssertNotNil(sut.targetFgLabel)
        XCTAssertNotNil(sut.targetOgLabel)
        XCTAssertNotNil(sut.ebcLabel)
        XCTAssertNotNil(sut.srmLabel)
        XCTAssertNotNil(sut.phLabel)
        XCTAssertNotNil(sut.attenuationLevelLabel)
        XCTAssertNotNil(sut.volumeLabel)
        XCTAssertNotNil(sut.boilVolumeLabel)
    }
    
    func test_brewDetailViewController_shouldHaveBrewNameAsTitle() {
        let sut = makeSut(brew: makeBrew())
        
        XCTAssertEqual(sut.title, "B1")
    }
    
    // MARK: - Helpers
    private func makeSutWithNoViewModel() -> BrewDetailViewController {
        let sut = BrewDetailViewController()
        sut.loadViewIfNeeded()
        return sut
    }
    
    private func makeSut(brew: Brew, selection: @escaping (Int) -> Void = { _ in }) -> BrewDetailViewController {
        let sut = BrewDetailViewController(viewModel: makeViewModel(brew))
        sut.loadViewIfNeeded()
        return sut
    }
    
    private func makeViewModel(_ brew: Brew) -> BrewDetailViewModel {
        return BrewDetailViewModel(brew: brew)
    }
    
    private func makeBrew() -> Brew {
        return Brew(name: "B1",
                    tagline: "T1",
                    imageUrl: "https://dummy.com",
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
                    description: "A description of the brew")
    }

}
