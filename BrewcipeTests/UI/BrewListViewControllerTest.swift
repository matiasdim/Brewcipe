//
//  BrewListViewControllerTest.swift
//  BrewcipeTests
//
//  Created by Matías  Gil Echavarría on 1/06/22.
//

import XCTest
@testable import Brewcipe

class BrewListViewControllerTest: XCTestCase {
    private var sut: BrewListViewController!
    
    override func setUp() {
        super.setUp()
        sut = BrewListViewController(viewModel: makeViewModel(makeBrews()))
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_viewController_shouldHaveViewModel() {
        XCTAssertNotNil(sut.viewModel, "viewModel")
    }
    
    func test_tablewView_shouldNotBeNil() {
        XCTAssertNotNil(sut.tableView, "tableView")
    }
    
    func test_brewListViewController_shouldHaveCorrectTitle() {
        XCTAssertEqual(sut.title, "Brews")
    }
    

    func test_tablewViewDelegateAndDataSource_shouldBeSet() {
        XCTAssertNotNil(sut.tableView.delegate, "table delegate")
        XCTAssertNotNil(sut.tableView.dataSource, "table data source")
    }

    func test_tableViewSections_shouldBe1() {
        XCTAssertEqual(sut.tableView.dataSource?.numberOfSections?(in: sut.tableView), 1)
    }

    func test_tableViewRowsNumber_shouldBe3() {
        XCTAssertEqual(numbersOfRows(in: sut.tableView, section: 0), 3)
    }
    
    func test_tableViewRowsNumberWithNoViewModel_shouldBe0() {
        let sut = BrewListViewController()
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(numbersOfRows(in: sut.tableView, section: 0), 0)
    }

    func test_tableViewCell_ShouldBeBrewCell() {
        let brews = makeBrews()
        let sut = BrewListViewController(viewModel: makeViewModel(brews))
        sut.loadViewIfNeeded()

        let cell = cellForRow(in: sut.tableView, indexPath: IndexPath(row: 0, section: 0)) as? BrewCell

        XCTAssertNotNil(cell, "BrewCell Type")
    }

    func test_tableViewCellReuseIdentifier_shoudlBeBrewCell() {
        let cell = cellForRow(in: sut.tableView, indexPath: IndexPath(row: 0, section: 0)) as? BrewCell

        XCTAssertEqual(cell?.reuseIdentifier, "BrewCell")
    }
    
    
    func test_brewCell_shouldHaveOutletsConnected() {
        let cell = cellForRow(in: sut.tableView, indexPath: IndexPath(row: 0, section: 0)) as? BrewCell
        
        XCTAssertNotNil(cell?.nameLabel, "nameLabel")
        XCTAssertNotNil(cell?.taglineLabel, "taglineLabel")
        XCTAssertNotNil(cell?.brewImageView, "brewImageView")
        XCTAssertNotNil(cell?.abvLabel, "abvLabel")
        XCTAssertNotNil(cell?.ibuLabel, "ibuLabel")
        XCTAssertNotNil(cell?.targetFgLabel, "targetFgLabel")
        XCTAssertNotNil(cell?.targetOgLabel, "targetOgLabel")
    }

    func test_tableViewCellForRow0_ShouldCallCellConfiguration() {
        let cell = cellForRow(in: sut.tableView, indexPath: IndexPath(row: 0, section: 0)) as? BrewCell

        XCTAssertEqual(cell?.nameLabel.text, "B1")
        XCTAssertEqual(cell?.taglineLabel.text, "T1")
        XCTAssertNotNil(cell?.brewImageView?.image, "imageView")
        XCTAssertEqual(cell?.abvLabel.text, "3.2")
        XCTAssertEqual(cell?.ibuLabel.text, "250")
        XCTAssertEqual(cell?.targetFgLabel.text, "1010")
        XCTAssertEqual(cell?.targetOgLabel.text, "1044")
    }
    
    func test_tableViewCellForRow0WithNoViewModel_ShouldSetEmptyLabels() {
        let sut = BrewListViewController()
        sut.loadViewIfNeeded()
        let cell = cellForRow(in: sut.tableView, indexPath: IndexPath(row: 0, section: 0)) as? BrewCell
        
        XCTAssertEqual(cell?.nameLabel.text, "")
        XCTAssertEqual(cell?.taglineLabel.text, "")
        XCTAssertEqual(cell?.abvLabel.text, "")
        XCTAssertEqual(cell?.ibuLabel.text, "")
        XCTAssertEqual(cell?.targetFgLabel.text, "")
        XCTAssertEqual(cell?.targetOgLabel.text, "")
    }
    
    func test_brewCellWithInvalidImage_shouldsetDefaultImage() {
        let cell = cellForRow(in: sut.tableView, indexPath: IndexPath(row: 0, section: 0)) as? BrewCell
        
        XCTAssertEqual(cell?.brewImageView.image, UIImage.remove)
    }
    
    func test_brewCellWithValidImage_shouldsetDefaultImage() {
        let cell = cellForRow(in: sut.tableView, indexPath: IndexPath(row: 2, section: 0)) as? BrewCell
        
        XCTAssertNotNil(cell?.brewImageView.image)
        XCTAssertNotEqual(cell?.brewImageView.image, UIImage.remove)
    }

    
    // MARK: - Helpers
    
    private func getImageFromURL(urlString: String) -> UIImage? {
        if let url = URL(string: urlString),
            let data = try? Data(contentsOf: url),
           let image = UIImage(data: data) {
            // Create Image and Update Image View
            return image
        }
        return nil
    }
    
    private func makeViewModel(_ brews: [Brew] = []) -> BrewListViewModel {
        return BrewListViewModel(brews: brews)
    }
    
    private func makeBrews() -> [Brew] {
        return [Brew(name: "B1",
                     tagline: "T1",
                     imageUrl: "https://dummy.com",
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
                     imageUrl: "https://images.punkapi.com/v2/keg.png",
                     abv: 9,
                     ibu: 200,
                     targetFg: 570,
                     targetOg: 800)]
    }
}
