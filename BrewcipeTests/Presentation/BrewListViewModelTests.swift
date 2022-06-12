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
    private var sut: TestableBrewListViewModel!
    
    override func setUp() {
        super.setUp()
        brews = makeBrews()
        sut = TestableBrewListViewModel(brews: brews)
    }
    
    override func tearDown() {
        brews = nil
        sut = nil
        super.tearDown()
    }

    func test_viewModel_shouldHaveBrewsModel() {
        XCTAssertNotNil(sut.arrayOfBrews)
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
    
    func test_viewModel_shouldReturnImageFromValidURL() {
        let image = sut.brewImage(for: 0)
        
        XCTAssertNotNil(image)
    }
    
    func test_viewModel_invalidImageURL_shouldReturnRemoveImageAsDefault() {
        let image = sut.brewImage(for: 1)
        
        XCTAssertEqual(image, .remove)
    }

    // MARK: - Helpers
    
    private class TestableBrewListViewModel: BrewListViewModel {
        var imageURL: String? = nil
        var arrayOfBrews: [Brew]
        
        override init(brews: [Brew]) {
            arrayOfBrews = brews
            super.init(brews: brews)
        }
        
        
        override func imageUrl(for row: Int) -> String? {
            imageURL = super.imageUrl(for: row)
            
            return imageURL
        }
    }
    
    private func makeBrews() -> [Brew] {        
        return [Brew(name: "B1",
                     tagline: "T1",
                     imageUrl: "https://images.punkapi.com/v2/keg.png",
                     abv: 3.2,
                     ibu: 250,
                     targetFg: 1010,
                     targetOg: 1044,
                     volume: 20),
                Brew(name: "B2",
                     tagline: "T2",
                     imageUrl: nil,
                     abv: 7.2,
                     ibu: 198,
                     targetFg: 190,
                     targetOg: 570,
                     volume: 20),
                Brew(name: "B3",
                     tagline: "T3",
                     imageUrl: "http://dummy3.com",
                     abv: 9,
                     ibu: 200,
                     targetFg: 570,
                     targetOg: 800,
                     volume: 20)]
    }

}
