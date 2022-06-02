//
//  BrewListTableViewController.swift
//  BrewcipeTests
//
//  Created by Matías  Gil Echavarría on 1/06/22.
//

import XCTest
@testable import Brewcipe

class BrewListTableViewControllerTests: XCTestCase {

    func test_tablewView_shouldNotBeNil() {
        let sut = BrewListTableViewController(viewModel: makeViewModel())
        
        XCTAssertNotNil(sut.tableView)
    }
    
    func test_tablewViewDelegateAndDataSource_shouldBeSet() {
        let sut = BrewListTableViewController(viewModel: makeViewModel())
        
        XCTAssertNotNil(sut.tableView.delegate, "table delegate")
        XCTAssertNotNil(sut.tableView.dataSource, "table data source")
    }
    
    func test_viewModel_shouldNotBeNil() {
        let sut = BrewListTableViewController(viewModel: makeViewModel())
        
        XCTAssertNotNil(sut.viewModel, "view model")
    }
    
    func test_tableViewSections_shouldBe1() {
        let vm = BrewListViewModel(brews: [])
        let sut = BrewListTableViewController(viewModel: vm)
        
        XCTAssertEqual(sut.tableView.dataSource?.numberOfSections?(in: sut.tableView), 1)
    }
    
    func test_tableViewRowsNumber_shouldBe3() {
        let brews = makeBrews()
        let sut = BrewListTableViewController(viewModel: makeViewModel(brews))
        
        XCTAssertEqual(numbersOfRows(in: sut.tableView, section: 0), 3)
    }
    
    func test_tableViewCell_ShouldBeBrewCell() {
        let brews = makeBrews()
        let sut = BrewListTableViewController(viewModel: makeViewModel(brews))
        
        let cell = cellForRow(in: sut.tableView, indexPath: IndexPath(row: 0, section: 0)) as? BrewCell
        
        XCTAssertNotNil(cell, "BrewCell")
    }
    
    func test_tableViewCellForRow0_ShouldCallCellConfiguration() {
        let brews = makeBrews()
        let sut = BrewListTableViewController(viewModel: makeViewModel(brews))

        let cell = cellForRow(in: sut.tableView, indexPath: IndexPath(row: 0, section: 0)) as? BrewCell

        XCTAssertEqual(cell?.nameLabel.text, "B1")
        XCTAssertEqual(cell?.taglineLabel.text, "T1")
        XCTAssertEqual(cell?.abvLabel.text, "3.2")
        XCTAssertEqual(cell?.ibuLabel.text, "250")
        XCTAssertEqual(cell?.targetFgLabel.text, "1010")
        XCTAssertEqual(cell?.targetOgLabel.text, "1044")
    }

    
    // MARK: - Helpers
    private func makeViewModel(_ brews: [Brew] = []) -> BrewListViewModel {
        return BrewListViewModel(brews: brews)
    }
    
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
