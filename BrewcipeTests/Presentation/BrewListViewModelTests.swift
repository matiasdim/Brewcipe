//
//  BrewListViewModelTests.swift
//  BrewcipeTests
//
//  Created by Matías  Gil Echavarría on 2/06/22.
//

import XCTest
@testable import Brewcipe

class BrewListViewModelTests: XCTestCase {
    private var brews: [Brew]!
    private var sut: BrewListViewModel!
    
    override func setUp() {
        super.setUp()
        brews = makeBrews()
        sut = BrewListViewModel(brews: brews)
    }
    
    override func tearDown() {
        brews = []
        sut = nil
        super.tearDown()
    }

    func test_viewModel_shouldHaveBrewsModel() {
        XCTAssertNotNil(sut.brews)
    }
    
    func test_viewModel_shouldProvideListTitle() {
        XCTAssertEqual(sut.listTitle, "Brews")
    }

    func test_viewModel_shouldProvideNumbersOfSections() {
        XCTAssertEqual(sut.numberOfSections, 1)
    }
    
    func test_viewModel_shouldProvideNumbersOfRowsPerSection() {
        XCTAssertEqual(sut.numberOfRows(in: 0), brews.count)
    }
    
    func test_viewModel_shouldProvideCellInfoOfEachBrew() {
        brews.indices.forEach { index in
            XCTAssertEqual(sut.name(for: index), brews[index].name)
            XCTAssertEqual(sut.tagline(for: index), brews[index].tagline)
            XCTAssertEqual(sut.imageUrl(for: index), brews[index].imageUrl)
            XCTAssertEqual(sut.abv(for: index), String(brews[index].abv))
            XCTAssertEqual(sut.ibu(for: index), String(brews[index].ibu))
            XCTAssertEqual(sut.targetFg(for: index), String(brews[index].targetFg))
            XCTAssertEqual(sut.targetOg(for: index), String(brews[index].targetOg))
        }
    }

    // MARK: - Helpers
    
    private func makeBrews() -> [Brew] {        
        return [Brew(name: "B1",
                     tagline: "T1",
                     imageUrl: "http://dummy.com",
                     abv: 3.2,
                     ibu: 250,
                     targetFg: 1010,
                     targetOg: 1044),
                Brew(name: "B2",
                     tagline: "T2",
                     imageUrl: nil,
                     abv: 7.2,
                     ibu: 198,
                     targetFg: 190,
                     targetOg: 570),
                Brew(name: "B3",
                     tagline: "T3",
                     imageUrl: "http://dummy3.com",
                     abv: 9,
                     ibu: 200,
                     targetFg: 570,
                     targetOg: 800)]
    }

}
