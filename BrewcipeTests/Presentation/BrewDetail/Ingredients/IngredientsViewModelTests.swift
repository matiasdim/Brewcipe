//
//  IngredientsViewModelTests.swift
//  BrewcipeTests
//
//  Created by Matías  Gil Echavarría on 17/06/22.
//

import XCTest
@testable import Brewcipe
import SwiftCollections

class IngredientsViewModelTests: XCTestCase {

    func test_shouldHaveIngredientsModel() {
        let sut = TestbleIngredientsViewModel(ingredients: makeIngredients())
        
        XCTAssertNotNil(sut.testableIngredientes)
    }
    
    func test_ingredientsViewModel_shouldProvideTitle() {
        let sut = IngredientsViewModel(ingredients: makeIngredients())
        
        XCTAssertEqual(sut.title, "Ingredients")
    }
    
    func test_ingredientsViewModel_shouldProvideNumberOfSections() {
        let sut = IngredientsViewModel(ingredients: makeIngredients())
        
        XCTAssertEqual(sut.numberOfSections, 3)
    }
    
    func test_ingredientsViewModel_section0_shouldProvideYeastSectionTitleCapitalized() {
        let sut = IngredientsViewModel(ingredients: makeIngredients())
        
        XCTAssertEqual(sut.title(forSection: 0), "Yeast")
    }
    
    func test_ingredientsViewModel_section1_shouldProvideAnotherSectionTitleCapitalized() {
        let sut = IngredientsViewModel(ingredients: makeIngredients())
        
        XCTAssertEqual(sut.title(forSection: 1), "Malt")
    }
    
    func test_ingredientsViewModel_forSection0_shouldProvide1Row() {
        let sut = IngredientsViewModel(ingredients: makeIngredients())
        
        XCTAssertEqual(sut.numberOfRows(forSection: 0), 1)
    }
    
    func test_ingredientsViewModel_forSection1_shouldProvide2Rows() {
        let sut = IngredientsViewModel(ingredients: makeIngredients())
        
        XCTAssertEqual(sut.numberOfRows(forSection: 1), 2)
    }
    
    func test_ingredientsViewModel_forSectionValueDifferentThanArrayOrString_ShouldReturn0Rows() {
        let sut = IngredientsViewModel(ingredients: makeIngredients())
        
        XCTAssertEqual(sut.numberOfRows(forSection: 2), 0)
    }
    
    func test_ingredientsViewModel_forSection0_shouldReturnRowTitle() {
        let sut = IngredientsViewModel(ingredients: makeIngredients())
        
        XCTAssertEqual(sut.title(forIndex: 0, inSection: 0), "Wyeast 1272 - American Ale II™")
    }
    
    func test_ingredientsViewModel_forSection1_shouldReturnRow0Title() {
        let sut = IngredientsViewModel(ingredients: makeIngredients())
        
        XCTAssertEqual(sut.title(forIndex: 0, inSection: 1), "Pale Ale")
    }
    
    func test_ingredientsViewModel_forSection1_shouldReturnRow1Title() {
        let sut = IngredientsViewModel(ingredients: makeIngredients())
        
        XCTAssertEqual(sut.title(forIndex: 1, inSection: 1), "Caramalt")
    }
    
    func test_ingredientsViewModel_forSection3_shouldReturnEmptyRowTitle() {
        let sut = IngredientsViewModel(ingredients: makeIngredients())
        
        XCTAssertEqual(sut.title(forIndex: 0, inSection: 2), "")
    }
    
    func test_ingredientsViewModel_forSection0_shouldReturnEmptyRowSubtitle() {
        let sut = IngredientsViewModel(ingredients: makeIngredients())
        
        XCTAssertEqual(sut.subtitle(forIndex: 0, inSection: 0), "")
    }
    
    func test_ingredientsViewModel_forSection1_shouldReturnRow0Subtitle() {
        let sut = IngredientsViewModel(ingredients: makeIngredients())
        
        XCTAssertEqual(sut.subtitle(forIndex: 0, inSection: 1), "2.2 kilograms")
    }
    
    // MARK: - private
    private func makeIngredients() -> OrderedDictionary<String, Any> {
        return OrderedDictionary.init(uniqueKeys: ["yeast",
                                                   "malt",
                                                   "wrong"],
                                      values: ["Wyeast 1272 - American Ale II™",
                                               [
                                                ["name": "Pale Ale",
                                                 "amount": [2.2: "kilograms"]],
                                                ["name": "Caramalt",
                                                 "amount": [:]]
                                               ],
                                               1
                                              ])
    }
    
    private class TestbleIngredientsViewModel: IngredientsViewModel {
        let testableIngredientes: OrderedDictionary<String, Any>

        override init(ingredients: OrderedDictionary<String, Any>) {
            testableIngredientes = ingredients
            super.init(ingredients: ingredients)
        }
    }

}

