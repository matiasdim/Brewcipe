//
//  BrewListViewControllerTest.swift
//  BrewcipeTests
//
//  Created by Matías  Gil Echavarría on 1/06/22.
//

import XCTest
@testable import Brewcipe

class BrewListViewControllerTest: XCTestCase {
    
    func test_viewController_shouldHaveViewModel() {
        XCTAssertNotNil(makeSut().viewModel, "viewModel")
    }
    
    func test_tablewView_shouldNotBeNil() {
        let sut = makeSut()
        
        XCTAssertNotNil(sut.tableView, "tableView")
    }
    
    func test_brewListViewController_shouldHaveCorrectTitle() {
        let sut = makeSut()
        XCTAssertEqual(sut.title, "Brews")
    }
    

    func test_tablewViewDelegateAndDataSource_shouldBeSet() {
        let sut = makeSut()
        
        XCTAssertNotNil(sut.tableView.delegate, "table delegate")
        XCTAssertNotNil(sut.tableView.dataSource, "table data source")
    }


    func test_tableViewSections_shouldBe1() {
        let sut = makeSut()
        
        XCTAssertEqual(sut.tableView.dataSource?.numberOfSections?(in: sut.tableView), 1)
    }
    
    func test_tablewViewEstimatedRowHeightAt0_shouldBeAutomatic() {
        let sut = makeSut(brews: makeBrews())
        
        XCTAssertEqual(estimatedHeightForRowAt(in: sut.tableView, indexPath: IndexPath(row: 0, section: 0)), UITableView.automaticDimension)
    }

    func test_tableViewRowsNumber_shouldBe3() {
        let sut =  makeSut(brews: makeBrews())

        XCTAssertEqual(numbersOfRows(in: sut.tableView, section: 0), 3)
    }
    
    func test_tableViewRowsNumberWithNoViewModel_shouldBe0() {
        let sut = makeSutWithNoViewModel()
        
        XCTAssertEqual(numbersOfRows(in: sut.tableView, section: 0), 0)
    }

    func test_tableViewCell_ShouldBeBrewCell() {
        let sut =  makeSut(brews: makeBrews())

        let cell = cellForRow(in: sut.tableView, indexPath: IndexPath(row: 0, section: 0)) as? BrewCell

        XCTAssertNotNil(cell, "BrewCell Type")
    }

    func test_tableViewCellReuseIdentifier_shoudlBeBrewCell() {
        let sut = makeSut(brews: makeBrews())
        
        let cell = cellForRow(in: sut.tableView, indexPath: IndexPath(row: 0, section: 0)) as? BrewCell

        XCTAssertEqual(cell?.reuseIdentifier, "BrewCell")
    }
    
    
    func test_brewCell_shouldHaveOutletsConnected() {
        let sut = makeSut(brews: makeBrews())

        let cell = cellForRow(in:sut.tableView, indexPath: IndexPath(row: 0, section: 0)) as? BrewCell
        
        XCTAssertNotNil(cell?.nameLabel, "nameLabel")
        XCTAssertNotNil(cell?.taglineLabel, "taglineLabel")
        XCTAssertNotNil(cell?.brewImageView, "brewImageView")
        XCTAssertNotNil(cell?.abvLabel, "abvLabel")
        XCTAssertNotNil(cell?.ibuLabel, "ibuLabel")
        XCTAssertNotNil(cell?.targetFgLabel, "targetFgLabel")
        XCTAssertNotNil(cell?.targetOgLabel, "targetOgLabel")
    }

    func test_tableViewCellForRow0_ShouldCallCellConfiguration() {
        let sut = makeSut(brews: makeBrews())

        let cell = cellForRow(in: sut.tableView, indexPath: IndexPath(row: 0, section: 0)) as? BrewCell

        XCTAssertEqual(cell?.nameLabel.text, "B1")
        XCTAssertEqual(cell?.taglineLabel.text, "T1")
        XCTAssertNotNil(cell?.brewImageView?.image, "imageView")
        XCTAssertEqual(cell?.abvLabel.text, "3.2")
        XCTAssertEqual(cell?.ibuLabel.text, "250")
        XCTAssertEqual(cell?.targetFgLabel.text, "1010")
        XCTAssertEqual(cell?.targetOgLabel.text, "1044")
    }

    func test_brewCellWithInvalidImage_shouldsetDefaultImage() {
        let sut = makeSut(brews: makeBrews())

        let cell = cellForRow(in: sut.tableView, indexPath: IndexPath(row: 0, section: 0)) as? BrewCell
        
        XCTAssertEqual(cell?.brewImageView.image, UIImage.remove)
    }
    
    func test_brewCellWithValidImage_shouldsetDefaultImage() {
        let sut = makeSut(brews: makeBrews())

        let cell = cellForRow(in: sut.tableView, indexPath: IndexPath(row: 2, section: 0)) as? BrewCell
        
        XCTAssertNotNil(cell?.brewImageView.image)
        XCTAssertNotEqual(cell?.brewImageView.image, UIImage.remove)
    }
    
    func test_didSelectRow0_shouldCallSelectedCallback() {
        var selectionCalled = false
        let sut = makeSut() { _ in
            selectionCalled = true
        }

        didSelectRowAt(in: sut.tableView, indexPath: IndexPath(row: 0, section: 0))

        XCTAssertTrue(selectionCalled, "selectionCalled")
    }

    
    // MARK: - Helpers
    private func makeSutWithNoViewModel() -> BrewListViewController {
        let sut = BrewListViewController()
        sut.loadViewIfNeeded()
        return sut
    }
    
    private func makeSut(brews: [Brew] = [], selection: @escaping (Int) -> Void = { _ in }) -> BrewListViewController {
        let sut = BrewListViewController(viewModel: makeViewModel(brews), selection: selection)
        sut.loadViewIfNeeded()
        return sut
    }
    
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
                     targetOg: 1044,
                     ebc: 19.5,
                     srm: 9.9,
                     ph: 4.4,
                     attenuationLevel: 75.6,
                     volume: [20: "litres"],
                     boilVolume: [25: "litres"],
                     description: "A description of the brew"),
                Brew(name: "B2",
                     tagline: "T2",
                     imageUrl: nil,
                     abv: 7.2,
                     ibu: 198,
                     targetFg: 190,
                     targetOg: 570,
                     ebc: 19.5,
                     srm: 9.9,
                     ph: 4.4,
                     attenuationLevel: 75.6,
                     volume: [20: "litres"],
                     boilVolume: [25: "litres"],
                     description: "A description of the brew"),
                Brew(name: "B3",
                     tagline: "T3",
                     imageUrl: "https://images.punkapi.com/v2/keg.png",
                     abv: 9,
                     ibu: 200,
                     targetFg: 570,
                     targetOg: 800,
                     ebc: 19.5,
                     srm: 9.9,
                     ph: 4.4,
                     attenuationLevel: 75.6,
                     volume: [20: "litres"],
                     boilVolume: [25: "litres"],
                     description: "A description of the brew")]
    }
}
