//
//  IngredientsViewControllerTests.swift
//  BrewcipeTests
//
//  Created by Matías  Gil Echavarría on 17/06/22.
//

import XCTest
@testable import Brewcipe
import SwiftCollections

class IngredientsViewControllerTests: XCTestCase {
    private var sut: IngredientsViewController!
    
    override func setUp() {
        super.setUp()
        sut = IngredientsViewController(viewModel: IngredientsViewModel(ingredients: makeIngredients()))
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_viewController_shoulHaveViewModel() {
        XCTAssertNotNil(sut.viewModel, "viewModel")
    }
    
    func test_viewControllarTablewView_shouldNotBeNil() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func test_tablewViewDelegateAndDataSource_shouldBeSet() {
        XCTAssertNotNil(sut.tableView.delegate, "table delegate")
        XCTAssertNotNil(sut.tableView.dataSource, "table data source")
    }
    
    func test_viewController_shouldHaveIngredientesTitle() {
        XCTAssertEqual(sut.title, "Ingredients")
    }
    
    func test_numbersOfSections_shouldBe2() {
        XCTAssertEqual(numberOfSections(in: sut.tableView), 2)
    }
    
    func test_numbersOfSections_withNoViewModel_shouldBe0() {
        sut = IngredientsViewController()
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(numberOfSections(in: sut.tableView), 0)
    }
    
    func test_numberOfRowsInSection0_shouldBe1() {
        XCTAssertEqual(numbersOfRows(in: sut.tableView, section: 0), 1)
    }
    
    func test_numberOfRowsInSection1_shouldBe1() {
        XCTAssertEqual(numbersOfRows(in: sut.tableView, section: 1), 2)
    }
    
    func test_numberOfRows_withNoViewModel_shouldBe0() {
        sut = IngredientsViewController()
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(numbersOfRows(in: sut.tableView, section: 0), 0)
    }
    
    func test_cellForRowAt_shouldReturnIngredientCell() {
        let cell = cellForRow(in: sut.tableView, indexPath: IndexPath(row: 0, section: 0)) as? IngredientCell
        
        XCTAssertNotNil(cell)
    }
    
    func test_cellForRowAtSection0Row0_shouldConfigureCellWithTitleAndNoSubtitle() {
        let cell = cellForRow(in: sut.tableView, indexPath: IndexPath(row: 0, section: 0)) as? IngredientCell
        
        XCTAssertEqual(cell?.titleLabel.text, "Wyeast 1272 - American Ale II™")
        XCTAssertEqual(cell?.subtitleLabel.text, "")
    }
    
    func test_cellForRowAtSection1Row0_shouldConfigureCellWithTitleAndSubtitle() {
        let cell = cellForRow(in: sut.tableView, indexPath: IndexPath(row: 0, section: 1)) as? IngredientCell
        
        XCTAssertEqual(cell?.titleLabel.text, "Pale Ale")
        XCTAssertEqual(cell?.subtitleLabel.text, "2.2 kilograms")
    }
    
    func test_cellForRowAtSection1Row1_shouldConfigureCellWithTitleAndNoSubtitle() {
        let cell = cellForRow(in: sut.tableView, indexPath: IndexPath(row: 1, section: 1)) as? IngredientCell
        
        XCTAssertEqual(cell?.titleLabel.text, "Caramalt")
        XCTAssertEqual(cell?.subtitleLabel.text, "")
    }
    
    // Test
    
    // MARK: - private
    
    private func makeIngredients() -> Ingredients {
        return OrderedDictionary.init(uniqueKeys: ["yeast", "malt",],
                                      values: ["Wyeast 1272 - American Ale II™",
                                               [["name": "Pale Ale",
                                                 "amount": [2.2: "kilograms"]],
                                                ["name": "Caramalt",
                                                 "amount": [:]]]]
        )
    }

}
