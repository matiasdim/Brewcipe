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

    func test_viewController_shoulHaveViewModel() {
        let sut = IngredientsViewController(viewModel: IngredientsViewModel(ingredients: makeIngredients()))
        
        XCTAssertNotNil(sut.viewModel, "viewModel")
    }
    
    func test_viewControllarTablewView_shouldNotBeNil() {
        let sut = IngredientsViewController(viewModel: IngredientsViewModel(ingredients: makeIngredients()))
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.tableView)
    }
    
    func test_tablewViewDelegateAndDataSource_shouldBeSet() {
        let sut = IngredientsViewController(viewModel: IngredientsViewModel(ingredients: makeIngredients()))
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.tableView.delegate, "table delegate")
        XCTAssertNotNil(sut.tableView.dataSource, "table data source")
    }
    
    func test_viewController_shouldHaveIngredientesTitle() {
        let sut = IngredientsViewController(viewModel: IngredientsViewModel(ingredients: makeIngredients()))
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.title, "Ingredients")
    }
    
    func test_numbersOfSections_shouldBe2() {
        let sut = IngredientsViewController(viewModel: IngredientsViewModel(ingredients: makeIngredients()))
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(numberOfSections(in: sut.tableView), 2)
    }
    
    func test_numbersOfSections_withNoViewModel_shouldBe0() {
        let sut = IngredientsViewController()
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(numberOfSections(in: sut.tableView), 0)
    }
    
    func test_numberOfRowsInSection0_shouldBe1() {
        let sut = IngredientsViewController(viewModel: IngredientsViewModel(ingredients: makeIngredients()))
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(numbersOfRows(in: sut.tableView, section: 0), 1)
    }
    
    func test_numberOfRowsInSection1_shouldBe1() {
        let sut = IngredientsViewController(viewModel: IngredientsViewModel(ingredients: makeIngredients()))
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(numbersOfRows(in: sut.tableView, section: 1), 2)
    }
    
    func test_numberOfRows_withNoViewModel_shouldBe0() {
        let sut = IngredientsViewController()
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(numbersOfRows(in: sut.tableView, section: 0), 0)
    }
    
    // Test
    
    // MARK: - private
    
    private func makeIngredients() -> Ingredients {
        return OrderedDictionary.init(uniqueKeys: ["yeast",
                                                   "malt",],
                                      values: ["Wyeast 1272 - American Ale II™",
                                               [["name": "Pale Ale",
                                                 "amount": [2.2: "kilograms"]],
                                                ["name": "Caramalt",
                                                 "amount": [:]]
                                               ]
                                              ]
        )
    }

}
