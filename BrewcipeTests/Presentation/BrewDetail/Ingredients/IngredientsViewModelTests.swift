//
//  IngredientsViewModelTests.swift
//  BrewcipeTests
//
//  Created by Matías  Gil Echavarría on 17/06/22.
//

import XCTest
@testable import Brewcipe

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
        
        XCTAssertEqual(sut.numberOfSections, 2)
    }
    
    func test_ingredientsViewModel_shouldProvideSectionTitle() {
        let sut = IngredientsViewModel(ingredients: makeIngredients())
        
        XCTAssertEqual(sut.title(forSection: 1), "yeast")
    }
    
    // MARK: - private
    private func makeIngredients() -> Ingredients {
        Ingredients(ingredients: ["yeast": "Wyeast 1272 - American Ale II™",
                                  "znother": "aawr lkkf awow"])
    }
    
    private class TestbleIngredientsViewModel: IngredientsViewModel {
        let testableIngredientes: Ingredients

        override init(ingredients: Ingredients) {
            testableIngredientes = ingredients
            super.init(ingredients: ingredients)
        }
    }

}
